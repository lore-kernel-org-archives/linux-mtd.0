Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JK0Jc-0008MC-NB
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 23:56:38 +0000
Date: Tue, 29 Jan 2008 23:56:15 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Frank <fuzzoli@comcast.net>
Subject: Re: Searchable Archives and Using RAM
Message-ID: <20080129225615.GA32157@lazybastard.org>
References: <479EA68A.2000704@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <479EA68A.2000704@comcast.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 28 January 2008 23:07:38 -0500, Frank wrote:
> 
> I just joined the list as I am looking for information on how to set up 
> MTD to use 2Mb of battery-backed up RAM as a disk.   This will be on an 
> ARM-based SBC that already has MTD NAND drivers loaded.  I think I know 
> where I need to start (CONFIG_MTD_MTDRAM, etc), but have not seen any 
> how-to's yet.   I found a new book from O'Reilly that'll be out in 
> February that looks very promising 
> (http://safari.oreilly.com/0136130550/ch10), but I was wondering if 
> there are any online resources.

Usually phram is the driver of choice for NVRAM.

Jörn

-- 
Linux is more the core point of a concept that surrounds "open source"
which, in turn, is based on a false concept. This concept is that
people actually want to look at source code.
-- Rob Enderle
