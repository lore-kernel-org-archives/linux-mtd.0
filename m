Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sg0F-00072H-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 14:00:23 +0000
Received: from mail.mobach.nl ([212.136.194.138] helo=servans.mobach.nl)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Sg08-000720-00
	for mtd@infradead.org; Tue, 13 Feb 2001 14:00:16 +0000
Received: from volens.mobach.nl (root@volens.mobach.nl [172.16.21.210])
	by servans.mobach.nl (8.9.3/8.9.3/SuSE Linux 8.9.3-0.1) with ESMTP id PAA20293
	for <mtd@infradead.org>; Tue, 13 Feb 2001 15:00:02 +0100
Received: from mobach.nl (mendel@dolens.mobach.nl [172.16.21.68])
	by volens.mobach.nl (8.9.3/BugBlue/Anti-Spam/Filtered) with ESMTP id NAA02341
	for <mtd@infradead.org>; Tue, 13 Feb 2001 13:07:46 +0100
Message-ID: <3A89239B.B48F51B6@mobach.nl>
Date: Tue, 13 Feb 2001 13:07:55 +0100
From: Mendel Mobach <mendel@mobach.nl>
Reply-To: mendel@mobach.nl
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: booting from doc
References: <0102121712140C.26666@workbox.atlanta.itserve.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Hamm wrote:
> 
> Is anyone booting from disk on chip with LILO.  I've tried several different
> methods but still can't do it.  I'm using lilo 21.6, kernel 2.4.0 with mtd
> modules.  I get the following info when I "fdisk /dev/nftla"
>         DiskOnChip Millennium found at address 0xD0000
>         Cannot calculate an NFTL geometry to match size of 0x7cf0.
>         Using C:999 H:16 S:2 (== 0x7ce0 sects)
I have only DOC 2000 chips, sorry
> 
<snap of dos>
> Also Lilo won't install because it doesn't know how to handle device 5d01.
did you use the mtd-lilo from the cvs tree???
That knows how to handle device 5d01 
(major: 93 minor 01 = /dev/nftl/disc0/part1 with devfs)
if you want my lilo.conf you can get it.

> If you see anyting that might cause a problem or be different than what you are
> doing please let me know.  Thanks
<snap of signature>
Regards

Mendel Mobach
-- 
Mendel Mobach aka BugBlue - mendel@mobach.nl - bugblue@dds.nl
ICQ: 40200278 - IRC: BugBlue (ircnet:#ne2000 undernet:#groningen)
/"\                        |   [Student]           
\ /                        |   [IPv6 tester]
 X  ASCII RIBBON CAMPAIGN  |   [coder]
/ \ AGAINST HTML MAIL      |   [Possible security tester]


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
