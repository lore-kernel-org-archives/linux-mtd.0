Received: from [64.244.22.242] (helo=mail.seranoa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16xqUK-0004cF-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2002 15:32:48 +0100
Received: from seranoa.com (IDENT:andrew.dixon@[172.16.1.202])
	by mail.seranoa.com (8.11.0/8.11.0) with ESMTP id g3HEkWi11914
	for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2002 10:46:32 -0400
Message-ID: <3CBD85B6.8EF9E122@seranoa.com>
Date: Wed, 17 Apr 2002 10:24:54 -0400
From: Andrew Dixon <andrew.dixon@seranoa.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: unresolved symbols in kernel (jffs2.o from CVS)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi Everyone,

I'm trying to compile the latest jffs2 stuff with my 2.4.16 Linux
kernel.  I'm trying to keep the jffs2 source separate from Linux (who
wants to track Linux with CVS?) so I'm compiling jffs2 as a modules and
then insmoding jffs2.o.  I've symlinked linux/fs/jffs2 to mtd/fs/jffs2
and I've also linked some files from linux/include/linux to
mtd/include/linux.  I can now do a:
	#make modules
and get a jffs2.o module which I can insmod into my kernel.  The problem
is that now I get a list of unresolved kernel symbols:

	root@wombat7:~#insmod ./jffs2.o 
	./jffs2.o: unresolved symbol zlib_inflate
	./jffs2.o: unresolved symbol zlib_inflate_workspacesize
	./jffs2.o: unresolved symbol zlib_deflate_workspacesize
	./jffs2.o: unresolved symbol zlib_inflateInit_
	./jffs2.o: unresolved symbol zlib_deflate
	./jffs2.o: unresolved symbol zlib_inflateEnd
	./jffs2.o: unresolved symbol zlib_deflateInit_
	./jffs2.o: unresolved symbol zlib_deflateEnd
	root@wombat7:~#grep zlib /proc/ksyms 
	root@wombat7:~#

I have made a jffs2.o module from the Linux 2.4.16 source and I do not
get these unresolved symbols.  Has the zlib stuff moved out of jffs2.o
or something?  I think I remember reading something along these lines on
the list.

Anyway, any help that anyone could give me would be greatly appreciated.

Thanks,
Andy
 
-- 
Andrew Dixon
Software Engineer
Seranoa Networks
978.897.3434 x231
