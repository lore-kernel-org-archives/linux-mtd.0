Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Lu3a-00055W-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 21:35:50 +0000
From: " Brian Michalk" <michalk@awpi.com>
To: <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: fdisk problems 
Date: Thu, 25 Jan 2001 15:19:03 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICCEMOCEAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.30.0101252051460.20287-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hmmmm,
Now I'm getting an error at the bootprompt:
LILLILO may overwrite Extended BIOS data area.

Before I upgraded my slackware I didn't have this problem.  It'sobviously
the EBDA problem.  The funny thing is that the problem goes away if I
disable the DOC.

There is a patch in the archives.  Perhaps I'll try patching LILO.

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
