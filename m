Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6inw-0005DS-Ez
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 11:18:17 +0000
Date: Tue, 27 Apr 2010 13:17:59 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Paolo Minazzi <paolo.minazzi@gmail.com>
Subject: Re: [PATCH 2/2] [MTD] Call bdi_init() and bdi_register()
Message-ID: <20100427111759.GA13859@logfs.org>
References: <20100422203358.GB30749@logfs.org>
	<20100423100532.GN27497@kernel.dk>
	<20100423205518.GB7008@logfs.org>
	<20100426094810.GE27497@kernel.dk>
	<20100426143253.GB4364@logfs.org>
	<20100426143803.GM27497@kernel.dk>
	<20100426144532.GN27497@kernel.dk>
	<20100426163050.GC4364@logfs.org> <20100426163126.GD4364@logfs.org>
	<x2v4aa525de1004270201t9f57f49fv1e9cfbb2d886e4ad@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <x2v4aa525de1004270201t9f57f49fv1e9cfbb2d886e4ad@mail.gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, Jens Axboe <jens.axboe@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 April 2010 11:01:04 +0200, Paolo Minazzi wrote:
> 
> I have tried this patch.
> I have enabled LOGFS, but not mounted partition with it.
> /dev/mtdblock1 is my romfs root partition and it is OK.
> 
> The problem is that init cannot mount my /dev/mtdblock1 romfs root.
> 
> This is the fault :
> Platform: Cirrus Logic EDB9315A Board (ARM920T) Rev A
> Copyright (C) 2000, 2001, 2002, Red Hat, Inc.
>        |----------------------------------------------
> Raw file loaded 0x00080000-0x001dce6b, assumed entry at
> 0x00080000-----------------------------------------------------------
> RedBoot> exec -s 0x00b00000 -r 0x00a00000 -c "root=/dev/mtdblock1
> console=ttyAM console=tty1"--------------------------------
> ENTRY=0xc0008000-------------------------------------------------------------------------------------------------------------
> LENGTH=0x00300000------------------------------------------------------------------------------------------------------------
> BASE_ADDR=0x00080000---------------------------------------------------------------------------------------------------------
> Using base address 0x00080000 and length
> 0x00300000--------------------------------------------------------------------------
> Uncompressing Linux... done, booting the kernel.
> Linux version 2.6.34-rc5 (root@darkstar) (gcc version 3.4.3) #18 Tue
> Apr 27 10:55:55 CEST 2010
> CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
> CPU: VIVT data cache, VIVT instruction cache
> Machine: Cirrus Logic EDB9315A Evaluation Board
> Memory policy: ECC disabled, Data cache writeback
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
> Kernel command line: root=/dev/mtdblock1 console=ttyAM console=tty1

If you add "rootfstype=romfs" to the command line, does the problem
still exist?

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
