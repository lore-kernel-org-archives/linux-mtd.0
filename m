Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Lnzo-00024K-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 15:07:32 +0000
Received: from awpi.com
	([204.241.40.2] helo=sisko.awpi.com ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Lnzm-00024E-00
	for mtd@infradead.org; Thu, 25 Jan 2001 15:07:30 +0000
From: " Brian Michalk" <michalk@awpi.com>
To: "Nicholas Mc Guire" <der.herr@hofr.at>, <mtd@infradead.org>
Subject: RE: mtd from cvs and 2.2.18
Date: Thu, 25 Jan 2001 08:50:11 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICGEMACEAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200101252321.QAA18181@nis.hofr.at>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Thanks.  That's a crucial part of the puzzle.

I installed a 2.4 source tree.  I forgot that MTD was in the distribution,
so when I patched it, something went wrong.
Anyway, starting from a clean distribution was painless.

dmesg reports correctly my two 72Mb DOCs.
I'm now going back through the archives to figure out how to fdisk and
format them.

Sheesh, I knew all this stuff a year ago, but my mind is becoming more like
a sieve.

> -----Original Message-----
> From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
> Of Nicholas Mc Guire
> Sent: Thursday, January 25, 2001 5:22 PM
> To: mtd@infradead.org
> Subject: mtd from cvs and 2.2.18
>
>
>
> Hi !
>
>  someone ask about how to get mtd from cvs to work with 2.2.X .
>
>  patchin.sh puts the links into the linux
>  tree ok , but it does not make the changes
>  to arch/i386/config.in, one must add the line
>
> source drivers/mtd/config.in
>
>  then everything goes fine with make config/menuconfig/xconfig
>
>
> hofrat
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
