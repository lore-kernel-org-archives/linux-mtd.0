Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ow8wY-0003T0-Hb
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2010 07:31:43 +0000
Received: by eye22 with SMTP id 22so582881eye.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Sep 2010 00:31:40 -0700 (PDT)
Date: Thu, 16 Sep 2010 11:31:35 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Roy Zang <tie-fei.zang@freescale.com>
Subject: Re: [PATCH 3/3 v3] P4080/mtd: Fix the freescale lbc issue with
	36bit mode
Message-ID: <20100916073135.GA5431@oksana.dev.rtsoft.ru>
References: <1284619284-23614-1-git-send-email-tie-fei.zang@freescale.com>
	<1284619284-23614-2-git-send-email-tie-fei.zang@freescale.com>
	<1284619284-23614-3-git-send-email-tie-fei.zang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1284619284-23614-3-git-send-email-tie-fei.zang@freescale.com>
Cc: B07421@freescale.com, dedekind1@gmail.com, B25806@freescale.com,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 16, 2010 at 02:41:24PM +0800, Roy Zang wrote:
> From: Lan Chunhe-B25806 <b25806@freescale.com>
> 
> When system uses 36bit physical address, res.start is 36bit
> physical address. But the function of in_be32 returns 32bit
> physical address. Then both of them compared each other is
> wrong. So by converting the address of res.start into
> the right format fixes this issue.
> 
> Signed-off-by: Lan Chunhe-B25806 <b25806@freescale.com>
> Signed-off-by: Roy Zang <tie-fei.zang@freescale.com>
> ---
>  arch/powerpc/include/asm/fsl_lbc.h |    1 +
>  arch/powerpc/sysdev/fsl_lbc.c      |   23 ++++++++++++++++++++++-
>  drivers/mtd/nand/fsl_elbc_nand.c   |    2 +-
>  3 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/fsl_lbc.h b/arch/powerpc/include/asm/fsl_lbc.h
> index db94698..5638b1e 100644
> --- a/arch/powerpc/include/asm/fsl_lbc.h
> +++ b/arch/powerpc/include/asm/fsl_lbc.h
> @@ -246,6 +246,7 @@ struct fsl_upm {
>  	int width;
>  };
>  
> +extern unsigned int fsl_lbc_addr(phys_addr_t addr_base);

u32 here.

Other than that, the patch looks good.

Reviewed-by: Anton Vorontsov <cbouatmailru@gmail.com>

Thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
