Received: from firewall1.cammail.net ([193.115.249.1] helo=smtp.camcom.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16xqjG-0004dI-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2002 15:48:14 +0100
Date: Wed, 17 Apr 2002 15:47:41 +0100 (BST)
From: Chris Wilson <chris@netservers.co.uk>
To: Andrew Dixon <andrew.dixon@seranoa.com>
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: unresolved symbols in kernel (jffs2.o from CVS)
In-Reply-To: <3CBD85B6.8EF9E122@seranoa.com>
Message-ID: <Pine.LNX.4.44.0204171544050.25058-100000@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Andrew,

I had the exact opposite problem with mtd checked out of CVS today. 
Compiling against a 2.4.18 kernel, I had duplicate zlib_* symbols caused 
by mtd/fs/jffs2/zlib.o. Removing that module from the list of object files 
fixed the problem.

I also fixed various other compile problems relating to crc32.h and some 
macros. Is anyone interested in a patch?

Cheers, Chris.

On Wed, 17 Apr 2002, Andrew Dixon wrote:

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
> 
> I have made a jffs2.o module from the Linux 2.4.16 source and I do not
> get these unresolved symbols.  Has the zlib stuff moved out of jffs2.o
> or something?  I think I remember reading something along these lines on
> the list.
> 
> Anyway, any help that anyone could give me would be greatly appreciated.
> 
> Thanks,
> Andy
>  
> 

-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |
