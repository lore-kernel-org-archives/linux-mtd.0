Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Zbq0-0002Fy-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 17:26:12 +0100
Received: from caja.ldhs.cetuc.puc-rio.br ([139.82.28.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Zbpx-0002FD-00
	for mtd@infradead.org; Thu, 14 Sep 2000 17:26:10 +0100
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: sjhill@cotw.com
Date: Thu, 14 Sep 2000 13:25:05 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: ATTN DOC Developers!
Reply-to: miguel@cetuc.puc-rio.br
CC: mtd@infradead.org
Message-ID: <4D6F1F4C32@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


   Hi Steve,

> I am working with David on some CVS changes as well as a MTD
> system architecture diagram. It was brought to my attention
> that the DOC drivers (2000 and Millenium) are being merged
> into one driver (file). Who is currently responsible for this
> effort? Please reply ASAP. Thanks a bunch.
> 
> -Steve

   I have merged the two drivers into the current CVS as doc2000.c, 
but my resources are scard for testing it (I don't have any Millenium 
here). I also included support for 2Mb and 64Mb nand chips, and 
checked all timing requirements from the m-system specifications. 
All requirements should be ok now, there was some minor 
corrections on the older code, mostly on addressing and chip 
selection.
   BTW, I'm a little busy right now implementing DOC routines on a 
OS less microcontroler, but I'm still waiting for reports on the new 
driver. Please let me know any problem you may have.
   As you may see in some message from last month, there are 
some ideas for changing some MTD/DOC API...we could check it 
with you MTD system architecture diagram. (take a look at "New 
DiskOnChip Driver" and "ECC and multi page read write support" 
messages)


Regards,

Miguel Freitas
Center for Telecommunications Studies
CATHOLIC UNIVERSITY - BRASIL
e-mail: miguel@cetuc.puc-rio.br
phone/fax#:+55-21-540-8854


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
