Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Coltk-0003Lr-Be
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 12:03:11 -0500
Date: Wed, 12 Jan 2005 18:02:56 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jared Hulbert <jaredeh@gmail.com>
Message-ID: <20050112170256.GF25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce050112084111ef438c@mail.gmail.com>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 08:41:04 -0800, Jared Hulbert wrote:
> 
> Clarification on NOR technology.  Remember that the ability to run
> code XIP is effectively a requirement for a NOR chip.  This means no
> read errors can leave the chip.  I don't see this changing in the
> foreseeable future.  Any read errors that do occur would probably be
> caused by a failed/incomplete program.

Correct.  That requirement comes mostly from having to program the
memory controller before being able to use DRAM.  After the early
boot, it's just nice to have.

> We probably do want to be able to easily retire, reprogram, and/or
> test those blocks/pages that get read errors.  That would have to be
> done in the filesystem and the chip driver needs to be able report a
> read error occured.
> 
> Any chance of being able store special files XIP in JFFS3? 
> Uncompressed aligned page sized chunks, etc.

Would this actually be an advantage?  Last time I looked, it was
cheaper to use more DRAM.  Most DSL routers I see advertised have a
1:4 or 1:8 ratio of NOR:DRAM, so it looks as if the prices haven't
changed much.

Jörn

-- 
Correctness comes second.
Features come third.
Performance comes last.
Maintainability is needed for all of them.
