Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1391u7-0002xI-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 09:48:35 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 1391u6-0002xC-00
	for mtd@infradead.org; Mon, 03 Jul 2000 09:48:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <395DE67C.3276DD8@evoserve.com> 
References: <395DE67C.3276DD8@evoserve.com> 
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
Cc: mtd@infradead.org
Subject: Re: problem with modprobe and other questions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Jul 2000 09:52:19 +0100
Message-ID: <6085.962614339@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rogelio@evoserve.com said:
>  I did not apply the put_module_symbol... patch. 
> Should I also apply it? 

Definitely. I tried to do without it, but it was easier to use it.


rogelio@evoserve.com said:
>  What parameters should I give to mknod to access mtd as a char device
> and block device? 

Run the MAKEDEV script in the util directory.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
