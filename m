Subject: Re: [PATCH] mtdchar: allow mmap() on MTD RAM/ROM char devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1272461137.7750.30.camel@localhost>
References: <1271432507-4280-1-git-send-email-agust@denx.de>
	<1272461137.7750.30.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Apr 2010 16:31:58 +0300
Message-ID: <1272461518.7750.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-04-28 at 16:25 +0300, Artem Bityutskiy wrote:
> On Fri, 2010-04-16 at 17:41 +0200, Anatolij Gustschin wrote:
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > ---
> >  drivers/mtd/mtdchar.c |   29 ++++++++++++++++++++++++++++-
> >  1 files changed, 28 insertions(+), 1 deletions(-)
> > 
> 
> Taken this to l2-mtd-2.6.git / dunno

Removed, because it breaks compilation on my x86_64:

[dedekind@sauron l2-mtd-2.6]\$ make -j8
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC [M]  drivers/mtd/mtdchar.o
  CHK     include/linux/version.h
make[2]: `scripts/unifdef' is up to date.
  Building modules, stage 2.
Kernel: arch/x86/boot/bzImage is ready  (#3)
  MODPOST 1635 modules
ERROR: "phys_mem_access_prot" [drivers/mtd/mtdchar.ko] undefined!
WARNING: modpost: Found 11 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2
[dedekind@sauron l2-mtd-2.6]\$ git 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
