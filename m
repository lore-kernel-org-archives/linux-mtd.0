Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CjHn-00038i-00
	for mtd-list@infradead.org; Thu, 13 Jul 2000 14:44:19 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13CjHk-00038c-00
	for mtd@infradead.org; Thu, 13 Jul 2000 14:44:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <396DBBB1.A5494318@matrox.com> 
References: <396DBBB1.A5494318@matrox.com>  <21454.963389948@cygnus.co.uk> <20000711212323.21257.qmail@web5302.mail.yahoo.com> <32068.963394509@cygnus.co.uk> 
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>
Cc: MTD Mailing List <mtd@infradead.org>,
  Michael Elizabeth Chastain <mec@shout.net>, David Weinehall <tao@acc.umu.se>
Subject: Re: Config.in 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 13 Jul 2000 14:43:57 +0100
Message-ID: <17260.963495837@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hmmm. Talk to David and Michael.

scote1@matrox.com said:
> Running make xconfig on 2.2.15, I get the following
> drivers/mtd/Config.in: 14: unknown command

> However, make menuconfig doesn't generate any error.  I'm not a kernel
> config specialist so I don't know if define_tristate was introduced in
> 2.3 or why in doesn't work only with xconfig, but this is definitly a
> bug of some sort. 



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
