Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4eI9-0004KY-Eh
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 15:23:40 +0000
Date: Tue, 18 Dec 2007 16:18:01 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Limited support of NAND features in MTD.
Message-ID: <20071218151800.GG1741@lazybastard.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 December 2007 15:06:50 +0000, Alexey Korolev wrote:
> > 
> > What does cached read do?
> > 
> Performs cached read operations :)

Who would have thought? :)

> It is a feature of NAND devices. It increases performance if we have 
> request to read sequentally large amount of data from NAND. 

Do you have a little more information on this?  Where does the cache
reside?  How big is it?  Who controls it?  How does it interact with
writes? ...

Possibly the best answer would be a link to a datasheet.

> > Another feature that could become useful would be the on-chip copying.
> > With JFFS2 this is rare, but when doing GC or wear leveling in a fashion
> > that keeps certain alignments intact, it could improve performance.
> >
> Yeah. I know this feature. If I properly understand the real purpose of
> it is mostly related for FTL but could be used for FS as well. 
> You are right it make sense to try it. But I do not know when it will be possible to do 
> this. Usually this feature is called as Internal data move in NAND specs. 

At least I would like to know what the conditions are.  Can the command
copy whole blocks only?  If it can copy single pages, can it copy any
pages or just the Nth page of one block to the Nth page of another?

If any page can be copied to any other page, it should be quite useful
for any non-compressed filesystem.  YAFFS, old LogFS, anything that does
XIP, possibly UBI,...

Jörn

-- 
Joern's library part 7:
http://www.usenix.org/publications/library/proceedings/neworl/full_papers/mckusick.a
