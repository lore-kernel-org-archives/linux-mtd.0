Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HonwO-0001Xz-66
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 17:55:21 -0400
Date: Thu, 17 May 2007 23:50:58 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070517215057.GH15676@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070516132035.GJ5472@lazybastard.org>
	<464CC209.4060500@cs.helsinki.fi>
	<200705172336.14552.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200705172336.14552.arnd@arndb.de>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 May 2007 23:36:13 +0200, Arnd Bergmann wrote:
> On Thursday 17 May 2007, Pekka Enberg wrote:
> > 
> > So any sane way to enable compression is on per-inode basis which makes 
> > me still wonder why you need per-object compression.
> 
> 1. it doesn't require user interaction, the file system will do the right
> thing most of the time.
> 
> 2. enlarging data is a very bad thing because it makes the behaviour
> of the fs unpredictable. With uncompressed objects, you have a guaranteed
> upper bound on the size.

Correct.  The compression decision is always per-object.  Per-inode is a
hint from userspace that a compression attempt would be futile.

A compression algorithm that compresses any data is provably impossible.
Some data will always cause expansion instead of compression.  Some
algorithms have a well-known upper bound on the expansion, others don't.
So LogFS instead creates its own upper bound by reserving one byte in
the header for the compression type.

And while one bit would suffice as a compressed/uncompressed flag,
having a byte allows to support more than one compression algorithm.
LZO looks promising and is on its way into the kernel.  Others may come
in the future.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
