Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XiSS-0001Ll-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 14:15:08 +0100
Date: Thu, 25 Jul 2002 15:14:57 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Hein <ssh@sgi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Integrating new MTD/jffs2 into 2.4.18 kernel
Message-ID: <20020725131457.GA19796@wohnheim.fh-wedel.de>
References: <3D3FEE24.49D26D61@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3D3FEE24.49D26D61@sgi.com>
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

On Thu, 25 July 2002 07:25:08 -0500, Steven Hein wrote:
> I am running on an ARM platform using the 2.4.18 kernel with 2.4.18-rmk7
> patch.  I'm using the MTD NAND flash support, and I'm having problems
> running a jffs2 filesystem on a NAND flash device  (not a root
> filesystem,
> just a writable "scratch" directory).
> 
> Using a snapshot from yesterday, I tried to integrate the jffs2 from
> the snapshot into my kernel.  But there were a few issues:
> - include/linux/crc32.h but expected by the files in fs/jffs2
> - zlib.[ch] were not in the jffs2 dir as they were previously
> 
> I tried fixing these, but still ended up missing the zlib_deflate*
> functions.....
> 
> So my question is:   is there a place I can grab the MTD/jffs2 stuff
> to drop directly into a 2.4.18-rmk7 kernel?   Or, is there a
> procedure somewhere describing how to integrate the latest MTD
> from CVS (especially jffs2) into the latest 2.4.x kernel?

You might want to take a look at a current -ac kernel. I had the same
problems (and more), merging with a modified 2.4.2 kernel. Basically,
whenever there was something missing, I took a look into the -ac
kernel, modified mine accordingly, and went on to the next problem.

My guess is that you need the zlib stuff in the kernel lib, you should
have linux/lib/zlib_inflate and linux/lib/zlib_deflate in your source
plus some modifications in arch/<yours>/config.in, lib/Makefile and
include/linux/zlib.h. Roughly.

Joern
