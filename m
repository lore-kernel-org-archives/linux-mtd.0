Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14MDAB-0002cz-00
	for mtd-list@infradead.org; Fri, 26 Jan 2001 17:59:55 +0000
From: " Brian Michalk" <michalk@awpi.com>
To: <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: fdisk problems 
Date: Fri, 26 Jan 2001 11:41:34 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICEEANCFAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <Pine.LNX.4.30.0101252051460.20287-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I am at a loss.
I can get my 8Mb DOCs to work, but not my 72Mb DOCs.

I have booted into DOS and:
dupdate /win=c800 /s:doc42.exb
dformat /win:c800 /s:doc42.exb

This all went without problems.

When I boot an MTD compiled kernel (no modules) I always get the ECC errors.
I went to my cabinet and pulled out a handfull of 72Mb DOCs, and they all
exhibit the same symptoms.

I recall that at some time in the past, we need needed to write either
zeroes, or FFs to the flash before using it.  Is this still required?
Is there a different .exb file I should be using?

> -----Original Message-----
> From: dwmw2@infradead.org [mailto:dwmw2@infradead.org]
> Sent: Thursday, January 25, 2001 2:57 PM
> To: Brian Michalk
> Cc: mtd@infradead.org
> Subject: RE: fdisk problems
>
>
> On Thu, 25 Jan 2001,  Brian Michalk wrote:
>
> > MTD_READECC(...) < 0
>
> If you define ECC_DEBUG in doc2000.c, I think you'll find it's reporting
> an ECC failure. Before I left work, I managed to reproduce this, as
> M-Systems sent me some 72MiB units a couple of days ago. Unfortunately, I
> don't know _why_ it's reporting the ECC failure.
>
> For now, can you change the code so it ignores that and continues?
>
> You don't have anything valuable on that DiskOnChip at the moment, do
> you?
>
> --
> dwmw2
>
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
