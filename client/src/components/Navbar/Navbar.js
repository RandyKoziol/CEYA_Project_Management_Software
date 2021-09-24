import React, {Component} from 'react';
//import {Button} from '../Button';
import {MenuItems} from "./MenuItems";
import {Button} from"../Button"
import './Navbar.css'



class Navbar extends Component{
    state = {clicked: false}

    handleClicked = () =>{
        this.setState({clicked: !this.state.clicked})

    }
    render(){
        return(
            <nav className="NavbarItems">
                <h1 className="navbar-logo">
                    <img src="/images/ceyalogo.png" alt="" id="ceyalogomain"/>
                </h1>


                <div className="menu-icon" onClick={this.handleClicked}>
                    <i className={this.state.clicked ? 'fas fa-times' : 'fas fa-bars'}>

                    </i>
                </div>


                <ul className = {this.state.clicked ? 'nav-menu active' : 'nav-menu'}>
                    {MenuItems.map((item, index) => {
                        return(
                            <li key = {index}>
                                <a className = {item.cName} href={item.url}>
                                {item.title}
                                </a>
                            </li>
                        )
                    })}
                </ul>

                   <button id="MainPageInfoSignup2" class="btn btn--primary btn--medium">Get Started </button>
            </nav>
        );
    }
}

export default Navbar
