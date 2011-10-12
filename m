Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RE1yC-0002nQ-0C
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2011 16:47:53 +0000
Date: Wed, 12 Oct 2011 18:48:37 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: "Fache, Herve" <h-fache@ti.com>
Subject: Re: Make phram work with kernel cmdline args when built-in
Message-ID: <20111012164837.GA13691@logfs.org>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 October 2011 11:46:08 +0200, Fache, Herve wrote:
> 
> Please find attached a patch that make it possible to use phram built-in
> with a kernel command line argument.
> This is basically the same patch that was applied in 2006 by Villa Herva to
> block2mtd, which saves the argument for later, when kmalloc is available.
> This allows us to put kernel and rootfs into physical RAM and boot without
> any further copy, hence very fast.

Looks good in principle.

> This patch is based on Ville Herva's similar patch to block2mtd.
> 
> Trying to pass kernel command line arguments at boot-time did not work, as
> phram_setup() was called so early that kmalloc() was not functional.
> 
> This patch only saves the option string at the early boot stage, and parses
> it later when init_phram() is called.
> 
> With this patch, I can boot with a statically-compiled phram, and mount a
> ext2 root fs from physical RAM, without the need for a initrd.
> 
> Signed-off-by: Hervé Fache <h-fache@ti.com>
> ---
>  drivers/mtd/devices/phram.c |   44 ++++++++++++++++++++++++++++++++++++++++--
>  1 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 23423bd..6b839f0 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -33,6 +33,10 @@ struct phram_mtd_list {
>  
>  static LIST_HEAD(phram_list);
>  
> +#ifndef MODULE
> +static int phram_init_called;
> +static __initdata char phram_paramline[64+12+12];
> +#endif

What I slightly dislike about this patch is the tiny differences
between Ville Herva's and this one.  In block2mtd those same lines are
added in a different place.  While I don't care much where to put
them, I see some value in having duplicated code stand out as
duplicated code and not have subtle variations all over the place.  So
my preference would be to either change this patch or alternatively
move the code in block2mtd as well.

>  static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
>  {
> @@ -134,7 +138,7 @@ static int register_device(char *name, unsigned long start, unsigned long len)
>  	ret = -EIO;
>  	new->mtd.priv = ioremap(start, len);
>  	if (!new->mtd.priv) {
> -		pr_err("ioremap failed\n");
> +		pr_err("ioremap failed for %ld@0x%lx\n", len, start);
>  		goto out1;
>  	}
>  
> @@ -233,7 +237,7 @@ static inline void kill_final_newline(char *str)
>  	return 1;		\
>  } while (0)
>  
> -static int phram_setup(const char *val, struct kernel_param *kp)
> +static int phram_setup_late(const char *val)
>  {
>  	char buf[64+12+12], *str = buf;
>  	char *token[3];

Same here.  phram_setup_late may be a better name, but it is
inconsistent with block2mtd_setup2.

So while I have no preference for either of the two variants, I would
like to keep the two drivers as similar as possible.  Apart from that
minor thing, nice work!

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
