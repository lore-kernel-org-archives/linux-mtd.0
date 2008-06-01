Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K2rfp-0006bl-Bd
	for linux-mtd@lists.infradead.org; Sun, 01 Jun 2008 17:48:53 +0000
Date: Sun, 1 Jun 2008 19:48:42 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
Message-ID: <20080601174841.GH13094@logfs.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 May 2008 14:08:01 +0100, Alexey Korolev wrote:
> 
> As NAND multiple plane architecture assumes simultaneous write/erase of
> several pages/blocks at the same time, we have to modify page/eraseblock
> sizes and report modified size to upper layers. In other words physical
> erase block size/ page size != reported erase block size/ page size.
> For example if we have dual plane device we have to extend erase block
> size and page size in 2 times. 

Before actually reading the datasheets (just now) I had hoped that
manufacturers would provide us several independent read/write/erase
units per chip and allow software to deal with each plane as if it was a
seperate chip.  _That_ would have been really useful.  And for NOR
flashes, Intel has already shown how to do it.

But hoping for manufacturers to get it right rarely works - it certainly
didn't work in this case.  As it seems, we can either program two planes
in a weird lock-step process or ignore the feature.  And the lock-step
variant isn't useful for much more than doubling/quadrupling the
erasesize and writesize.  With all the disadvantages that brings. :(

Speaking about the disadvantages, if the dual plane feature is
enabled/disabled across reboots and erase size or write size changes,
we're in for a lot of fun from the filesystem size.  F.e. JFFS2 will
experience data loss when erase size isn't stable.

Jörn

-- 
All models are wrong. Some models are useful.
-- George Box
