Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ljewp-0001qV-Ky
	for linux-mtd@lists.infradead.org; Tue, 17 Mar 2009 19:27:41 +0000
Date: Tue, 17 Mar 2009 22:27:35 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Wolfgang Grandegegr <wg@grandegger.com>
Subject: Re: [PATCH 1/4] NAND: FSL-UPM: add multi chip support
Message-ID: <20090317192735.GC4287@oksana.dev.rtsoft.ru>
References: <1237281143-8768-1-git-send-email-wg@grandegger.com>
	<1237281143-8768-2-git-send-email-wg@grandegger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <1237281143-8768-2-git-send-email-wg@grandegger.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 17, 2009 at 10:12:19AM +0100, Wolfgang Grandegegr wrote:
> From: Wolfgang Grandegger <wg@grandegger.com>
> 
> This patch adds support for multi-chip NAND devices to the FSL-UPM
> driver. This requires support for multiple GPIOs for the RNB pins.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  drivers/mtd/nand/fsl_upm.c |   90 +++++++++++++++++++++++++++++++++----------
>  1 files changed, 69 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 7815a40..ca7e85a 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -23,6 +23,8 @@
>  #include <linux/io.h>
>  #include <asm/fsl_lbc.h>
>  
> +#define FSL_UPM_NAND_MAX_CHIPS 4

Is there any reason to hardcode max chips? Some obscure limit in the
UPMs maybe?

Otherwise we'd better allocate the rnb_gpios dynamically, depending
on the num-chips property.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
