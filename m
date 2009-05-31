Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MAlSe-0004Th-Ud
	for linux-mtd@lists.infradead.org; Sun, 31 May 2009 13:52:35 +0000
Subject: Re: [PATCH] 3/3 ubi notification API Re: [PATCH] [UBI] [1/3] ubi
	notifications API
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1243625251.4067.29.camel@hp.diimka.lan>
References: <1241018978.20184.33.camel@hp.diimka.lan>
	<1242660138.3238.5.camel@localhost.localdomain>
	<1242661167.3238.10.camel@localhost.localdomain>
	<1243625251.4067.29.camel@hp.diimka.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 31 May 2009 16:52:21 +0300
Message-Id: <1243777941.11172.126.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-29 at 23:27 +0400, dmitry pervushin wrote:
> > I've also created an "experimental" branch in the ubi-2.6.git
> > tree for your convenience:
> > 
> > http://git.infradead.org/ubi-2.6.git?a=shortlog;h=refs/heads/experimental
> > git://git.infradead.org/ubi-2.6.git experimental
> Sorry for late response; I reviewed your changes, and although
> prohibiting of using ubi api from within notifiers does not look very
> amazing to me... but it seems that it is the only robust way. The 3rd
> patch from the serie is inlined below (tested on the stmp378x board as
> well as on nandsim)
> 
> The standalone gluebi support that uses UBI notifications.
> 
> Signed-off-by: Dmitry Pervushin <dpervushin@embeddedalley.com>

Just applied this to
git://git.infradead.org/ubi-2.6.git experimental

and got:

[dedekind@eru ubi-2.6]$ make -j8
scripts/kconfig/conf -s arch/x86/Kconfig
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-x86
  CALL    scripts/checksyscalls.sh
  CHK     include/linux/compile.h
  CC [M]  drivers/mtd/ubi/gluebi.o
drivers/mtd/ubi/gluebi.c: In function ‘ubi_gluebi_notify’:
drivers/mtd/ubi/gluebi.c:444: error: dereferencing pointer to incomplete type
drivers/mtd/ubi/gluebi.c:444: error: dereferencing pointer to incomplete type
drivers/mtd/ubi/gluebi.c:447: error: dereferencing pointer to incomplete type
drivers/mtd/ubi/gluebi.c:450: error: ‘UBI_VOLUME_DELETED’ undeclared (first use in this function)
drivers/mtd/ubi/gluebi.c:450: error: (Each undeclared identifier is reported only once
drivers/mtd/ubi/gluebi.c:450: error: for each function it appears in.)
drivers/mtd/ubi/gluebi.c:451: error: dereferencing pointer to incomplete type
drivers/mtd/ubi/gluebi.c:451: error: dereferencing pointer to incomplete type
drivers/mtd/ubi/gluebi.c:453: error: ‘UBI_VOLUME_CHANGED’ undeclared (first use in this function)
drivers/mtd/ubi/gluebi.c:454: error: dereferencing pointer to incomplete type
drivers/mtd/ubi/gluebi.c:454: error: dereferencing pointer to incomplete type
make[3]: *** [drivers/mtd/ubi/gluebi.o] Error 1
make[2]: *** [drivers/mtd/ubi] Error 2
make[1]: *** [drivers/mtd] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers] Error 2

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
