Received: from maynard.mail.mindspring.net ([207.69.200.243])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pp2I-000070-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 12:54:58 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Kyle Harris <kharris@nexus-tech.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: 2.5 questions
Date: Fri, 13 Sep 2002 07:50:07 -0400
Cc: linux-mtd@lists.infradead.org
References: <E17pfu5-0001pj-00@granger.mail.mindspring.net> <10485.1031901889@redhat.com>
In-Reply-To: <10485.1031901889@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E17pp24-0003UD-00@maynard.mail.mindspring.net>
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

On Friday 13 September 2002 03:24 am, David Woodhouse wrote:

> kharris@nexus-tech.net said:
> > How do I get the latest code base for 2.5 kernels? I pulled the latest
> > cvs  but it appears this must be for 2.4 since it doesn't compile. Is
> > there a  separate branch for 2.5?
>
> Should do. What breaks? It'll only be cosmetic, surely?

I ran the pathcin.sh script to set this up. Below is first error, which is 
2.4 - 2.5 related (MINOR() and kdev_t stuff).

  arm-linux-gcc -Wp,-MD,./.mtdchar.o.d -D__KERNEL__ 
-I/home/kyle/handheld/homebase/kernel/linux-2.5.30.newmtd/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -Os -fno-strict-aliasing -fno-common -g 
-mapcs -mapcs-32 -D__LINUX_ARM_ARCH__=5 -march=armv4 -Wa,-mxscale  
-mtune=strongarm  -mshort-load-bytes -msoft-float -Wa,-mno-fpu -nostdinc 
-iwithprefix include    -DKBUILD_BASENAME=mtdchar   -c -o mtdchar.o mtdchar.c
mtdchar.c: In function `mtd_open':
mtdchar.c:63: invalid operands to binary &
make[2]: *** [mtdchar.o] Error 1
make[2]: Leaving directory 
`/home/kyle/handheld/homebase/kernel/linux-2.5.30.newmtd/drivers/mtd'
make[1]: *** [mtd] Error 2
make[1]: Leaving directory 
`/home/kyle/handheld/homebase/kernel/linux-2.5.30.newmtd/drivers'
make: *** [drivers] Error 2

>
> > How stable is mtd for 2.5? I'm seeing some very strange behavior where
> > if I  make slight mods to even script files, the files become unusable
> > and cause  the system to hang. I'm running 2.5.30-rmk1-pxa1 with jffs2
> > root fs.
>
> Not expected to break. Not highly tested either. More details please.
> SysRq-T is your friend.

I'm still not entirely sure what's happening. It may be a race condition at 
boot that is breaking something and completely unrelated to the minor changes 
I made to the root fs. I'm not familiar sith SysRq-T. Where do I find more 
about this?

Thanks. Kyle.
