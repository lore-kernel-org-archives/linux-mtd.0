Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135Q3s-0007Cv-00
	for mtd-list@infradead.org; Fri, 23 Jun 2000 10:47:44 +0100
Message-ID: <395332AD.B9247764@auriga.ru>
Date: Fri, 23 Jun 2000 13:49:33 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: garbage collect
References: <3950776D.30AC4B13@auriga.ru>  <Pine.LNX.4.10.10006201614120.7301-100000@impact-pc01.gnk.internal> <30740.961753188@cygnus.co.uk>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> nick@auriga.ru said:
> > bash# mount /dev/mtd0 /mnt
> > Unable to handle kernel NULL pointer dereference at virtual address 0000000c
>
> Cvs update and try again. Version 1.16 of mtdblock.c should fix this. I
> haven't tested it yet, but it was 'obviously broken'.
>
> --
> dwmw2

yes, now it works ok!

Nick.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
