Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14O2Hd-0001n0-00
	for mtd-list@infradead.org; Wed, 31 Jan 2001 18:47:09 +0000
Received: from thor.lineo.com ([204.246.147.11])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14O2Hc-0001mt-00
	for mtd@infradead.org; Wed, 31 Jan 2001 18:47:08 +0000
Message-ID: <3A785DF8.41CBF1A3@Rikers.org>
Date: Wed, 31 Jan 2001 11:48:24 -0700
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: Brian Michalk <michalk@awpi.com>
CC: mtd@infradead.org
Subject: Re: Lilo and device 5d01
References: <NEBBLKIBMLGPAFMHEJICKEIHCFAA.michalk@awpi.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>From "man lilo.conf":

bios=' parameter.

The BIOS numbers your disks 0x80, 0x81, etc. and
it is impossible to decide which Linux disk
corresponds to which BIOS disk (since this depends
on the BIOS setup, and on the type of BIOS), so if
you have an unusual setup you need to state the
correspondence between Linux disks and BIOS
disks. For example, 

disk=/dev/sda
        bios=0x80
disk=/dev/hda
        bios=0x81
Brian Michalk wrote:
> 
> This came up a week or two ago.
> 
> How do I tell Lilo that disk 0x5d01 is really disk 0x80?
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
