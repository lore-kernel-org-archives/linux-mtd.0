Received: from www.optixsoft.de ([213.187.73.226])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MTKc-00022C-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 13:24:50 +0000
Date: Thu, 12 Dec 2002 14:54:28 +0100 (MET)
From: Tobias Otto-Adamczak <toa@indakom.de>
To: Geoffroy Stevenne <geof@hellea.com>
cc: <linux-mtd@lists.infradead.org>, <jch@hellea.be>
Subject: Re: bbram access problems
In-Reply-To: <20021212140546.3607a3e0.geof@hellea.com>
Message-ID: <Pine.LNX.4.31.0212121439150.22502-100000@www.optixsoft.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Geoffroy,

> We're trying to use BBRAM on a VersaLogic VSBC-6 m-b.  We use the slram
> driver and the 2.4.18 kernel.  The problem is that we can't acces the
> entire memory of the BBRAM, just the first 64k page.

Where do you know ?

[I just had a quick look into the VSBC-6 manual, for curiosity]
Do you have r/w access to the "Map and Paging Control Register"  where
BBRAM pages are selected ?

> Other problem: we added to our lilo.conf:
> append="slram=BBRAM,0xE0000,+0x10000"

looks okay.

> We can write to the BBRAM but we noticed data corruption (not write
> operation was done) in this address range.  Is there a way to lock this
> memory area?  Is this the right thing to do?

Locking would be an useful idea if you suspect that other processes try
to access it, too. Is this the case ?

> What we need is to mount a filesystem on the entire BBRAM, not just the
> first 64k.

The standard slram driver does only work with a contiguous region of
ram. But you have only a ram window and a some page select bits in an
I/O register. You have to hack the driver code (slram.c), I think. (I am
no expert.)

Regards
Tobias
