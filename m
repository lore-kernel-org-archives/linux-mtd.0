Received: from
 6.8.a.0.5.b.0.5.9.1.a.c.0.1.d.f.0.0.0.0.a.e.3.0.0.b.8.0.1.0.0.2.ip6.arpa
 ([2001:8b0:3ea:0:fd10:ca19:50b5:a86] helo=h5.dl5rb.org.uk)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWX94-0000SA-AW
 for linux-mtd@lists.infradead.org; Mon, 21 May 2012 18:15:50 +0000
Date: Mon, 21 May 2012 19:15:36 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] MIPS: bcm63xx: kbuild: remove -Werror
Message-ID: <20120521181536.GD15443@linux-mips.org>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
 <1335534510-12573-2-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1335534510-12573-2-git-send-email-dedekind1@gmail.com>
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 27, 2012 at 04:48:30PM +0300, Artem Bityutskiy wrote:

> From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> 
> I cannot build bcm963xx with the standard Kbuild W=1 switch:
> 
> arch/mips/bcm63xx/boards/board_bcm963xx.c: At top level:
> arch/mips/bcm63xx/boards/board_bcm963xx.c:647:5: error: no previous prototype for 'bcm63xx_get_fallback_sprom' [-Werror=missing-prototypes]
> cc1: all warnings being treated as errors
> 
> This patch removes the gcc switch to make W=1 work. Mips is the only
> architecture I know which does not build with W=1 and this upsets my aiaiai
> scripts. And in general, you never know which warnings newer versions of gcc
> will start emiting so having -Werror by default is not the best idea.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  arch/mips/bcm63xx/boards/Makefile |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/bcm63xx/boards/Makefile b/arch/mips/bcm63xx/boards/Makefile
> index 9f64fb4..af07c1a 100644
> --- a/arch/mips/bcm63xx/boards/Makefile
> +++ b/arch/mips/bcm63xx/boards/Makefile
> @@ -1,3 +1 @@
>  obj-$(CONFIG_BOARD_BCM963XX)		+= board_bcm963xx.o
> -
> -ccflags-y := -Werror

There's been a whole bunch of other -Werrors below arch/mips some of
which even were combined with -Wall.  I removed all off them except the
central -Werror in arch/mips/Kbuild.  I'm pondering a better solution
for that one now.

  Ralf
