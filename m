Received: from a.ns.innominate.com ([212.21.76.70] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16xqvE-0004eD-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2002 16:00:36 +0100
Received: from tkeitel by tino with local (Exim 3.34 #1 (Debian))
	id 16xqnr-0000gz-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2002 16:52:59 +0200
Date: Wed, 17 Apr 2002 16:52:59 +0200
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: unresolved symbols in kernel (jffs2.o from CVS)
Message-ID: <20020417145259.GA2662@tino>
References: <3CBD85B6.8EF9E122@seranoa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3CBD85B6.8EF9E122@seranoa.com>
From: Tino Keitel <tino.keitel@innominate.com>
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

On Wed, Apr 17, 2002 at 10:24:54 -0400, Andrew Dixon wrote:
> Hi Everyone,
> 
> I'm trying to compile the latest jffs2 stuff with my 2.4.16 Linux
> kernel.  I'm trying to keep the jffs2 source separate from Linux (who
> wants to track Linux with CVS?) so I'm compiling jffs2 as a modules and
> then insmoding jffs2.o.  I've symlinked linux/fs/jffs2 to mtd/fs/jffs2
> and I've also linked some files from linux/include/linux to
> mtd/include/linux.  I can now do a:
> 	#make modules
> and get a jffs2.o module which I can insmod into my kernel.  The problem
> is that now I get a list of unresolved kernel symbols:
> 
> 	root@wombat7:~#insmod ./jffs2.o 
> 	./jffs2.o: unresolved symbol zlib_inflate
> 	./jffs2.o: unresolved symbol zlib_inflate_workspacesize
> 	./jffs2.o: unresolved symbol zlib_deflate_workspacesize
> 	./jffs2.o: unresolved symbol zlib_inflateInit_
> 	./jffs2.o: unresolved symbol zlib_deflate
> 	./jffs2.o: unresolved symbol zlib_inflateEnd
> 	./jffs2.o: unresolved symbol zlib_deflateInit_
> 	./jffs2.o: unresolved symbol zlib_deflateEnd
> 	root@wombat7:~#grep zlib /proc/ksyms 
> 	root@wombat7:~#

The current CVS of JFFS2 uses the shared zlib that is part of the
2.4.19-preX-acY kernel. There is a patch to provide the shared zlib for older
kernels but it seems like JFFS2 also needs other portions of the new
kernels. I tried it with 2.4.18 and it doesn't work.

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
