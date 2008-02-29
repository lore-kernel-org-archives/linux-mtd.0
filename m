Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JV0qw-0007E4-IU
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 08:44:26 +0000
Date: Fri, 29 Feb 2008 09:43:45 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Dimitrios Apostolou <jimis@gmx.net>
Subject: Re: swap file over jffs2 partition
Message-ID: <20080229084345.GA16507@lazybastard.org>
References: <47C772E9.2000000@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47C772E9.2000000@gmx.net>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 February 2008 04:50:17 +0200, Dimitrios Apostolou wrote:
> 
> I intend to build a diskless linux system (root over NFS). Because it
> has 1GB of embedded flash storage, I'm thinking of using this as swap 
> (I've been bitten many times by the problems linux has with *no* 
> swap...). And to avoid wearing out the flash storage too fast, I 'm 
> thinking to format the 1GB partition as JFFS2, and create the swapfile 
> on top of it.
> 
> I'm not so experienced with JFFS and I don't know if it's too heavy for
> the CPU, for swapping. Or if there are other issues I 'll face. What do
> you think about it? Any other ways you 'd propose?
> 
> Sorry for sending this at LKML but jffs-dev mailing list seems to be 
> off. And JFFS is the only in-kernel filesystem that does wear-leveling, 
> right?

Replying in reverse order...

The relevant mailing list is linux-mtd, added to Cc:.  JFFS and JFFS2
are two different things, JFFS is older and was removed from the kernel
not too long ago.

The real fun comes not from CPU usage, but from interactions with the
memory management subsystem.  In a nutshell, JFFS2 may require memory in
order to write data.  When the system is under memory pressure, it needs
JFFS2 to write out pages, which will try to allocate memory.  It is
theoretically possible to deadlock the system in this way.

On the plus side, the write path of JFFS2 is relatively simple and
extremely low-latency.  It shouldn't be too hard to review the code and
handle all problem cases wrt. memory allocations.

One issue that is hard to solve is space reservation.  JFFS2 compresses
data and allows users to write as long as there is space remaining.  It
is possible to swap out data that compresses well, have some other
process fill up the filesystem, then try to swap out data that
compresses badly and get -ENOSPC in return.  As a system administrator
you can prevent others from ever writing to JFFS2 - and you better do!

Jörn

-- 
Joern's library part 5:
http://www.faqs.org/faqs/compression-faq/part2/section-9.html
