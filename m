Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FdX7-00043s-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 15:12:09 +0100
Date: Fri, 21 Jul 2000 16:01:02 +0100 (BST)
From: David Woodhouse <dwmw2@alpha1.cygnus.co.uk>
To: Ollie Lho <ollie@sis.com.tw>
cc: David Woodhouse <dwmw2@infradead.org>, Adi Linden <adi@adis.on.ca>,
        Trevor Woolven <trevw@zentropix.com>,
        Matt Hortman <mbhortman@ieee.org>, mtd@infradead.org
Subject: Re: building M-Sys DOC driver as a module
In-Reply-To: <3977A767.EB4AEA86@sis.com.tw>
Message-ID: <Pine.LNX.4.21.0007211557300.22633-100000@alpha1.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 21 Jul 2000, Ollie Lho wrote:

> David,
> 	I think we will have ext2 on NFTL on DoC Millennium configuration
> for LinuxBIOS project so I am also working on revisiting the nftl.c Could
> you please send me your TODO list on NFTL stuff ??

It was posted to the list a while ago. I think it's also on the web site
as part of the main TODO list. Basically, thread the NFTL code and the
DiskOnChip hardware driver, make it handle bad blocks correctly, and
finish ECC. Then fix the remaining bugs :)

I can give a more detailed answer next week when I get home.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
