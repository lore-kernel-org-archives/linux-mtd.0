Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Xg9K-0001yt-00
	for mtd-list@infradead.org; Wed, 22 Mar 2000 08:05:54 +0000
Received: from nsc.netnomics.com
	([209.150.128.114] helo=geneanet.org ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Xg9I-0001yn-00
	for mtd@infradead.org; Wed, 22 Mar 2000 08:05:52 +0000
Message-ID: <38D82A5B.B2E986CC@linux-embedded.com>
Date: Wed, 22 Mar 2000 03:05:15 +0100
From: Sebastien HUET <linuxemb@linux-embedded.com>
MIME-Version: 1.0
To: JaeYong Jeong <trusty0@hotmail.com>
CC: mtd@infradead.org
Subject: Re: Have you ever heard about RAID system composed of flash memory?
References: <20000322013836.59548.qmail@hotmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

JaeYong Jeong a =E9crit :

> RAID is usually composed of hard disks.
> If you know any RAID system made of flash memory or something
> like that, please notice it to me.
> Thanks in advance.

Hi,

Two ways:

1) Use SCSI compatible flash disk ( Sandisk 'offers' some) with Raid
hardware.
2) Use IDE flash disk with kernel Raid.

Bye

Seb
---
http://linux-embedded.com





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
