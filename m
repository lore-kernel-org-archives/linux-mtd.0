Received: from ie-in-x0229.1e100.net ([2607:f8b0:4001:c03::229]
 helo=mail-ie0-x229.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U55mR-0006sm-1f
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 02:39:35 +0000
Received: by mail-ie0-f169.google.com with SMTP id 13so8758751iea.0
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2013 18:39:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1360597903-10378-1-git-send-email-festevam@gmail.com>
References: <1360597903-10378-1-git-send-email-festevam@gmail.com>
Date: Mon, 11 Feb 2013 23:39:30 -0300
Message-ID: <CALF0-+W=FiQvSchT9Z3DosGvf-r2d20PK9NZDFnYzmtpYi+ieQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Fix sparse warning
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

On Mon, Feb 11, 2013 at 12:51 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Fix the following sparse warning:
>
> drivers/mtd/nand/mxc_nand.c:269:25: warning: duplicate const
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/mxc_nand.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 45204e4..37037cb 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -266,7 +266,7 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
>         }
>  };
>
> -static const char const *part_probes[] = {
> +static const char *part_probes[] = {
>         "cmdlinepart", "RedBoot", "ofpart", NULL };
>

Are you sure checkpatch.pl didn't complain about this patch?
I think it will complain, because it's expecting to see this instead:

  static const char * const part_probes[] = {

And then you'll probably have to cast part_probes to (const char **)
on the mtd_device_parse_register call to remove every warning.

Hope this helps,

-- 
    Ezequiel
