Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCGRY-0005f1-4p
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 01:45:49 +0000
Received: by mail-pg0-x241.google.com with SMTP id x23so2921276pgx.3
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 17:45:02 -0800 (PST)
Date: Wed, 30 Nov 2016 17:44:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Frias <sf84@laposte.net>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH v8] mtd: nand: add tango NAND flash controller support
Message-ID: <20161201014459.GK77253@google.com>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B37.5090100@sigmadesigns.com>
 <580F8407.5070706@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <580F8407.5070706@sigmadesigns.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Oct 25, 2016 at 06:10:47PM +0200, Marc Gonzalez wrote:
> This driver supports the NAND Flash controller embedded in recent
> Tango chips, such as SMP8758 and SMP8759.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---

...

> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> new file mode 100644
> index 000000000000..74e39a92771c
> --- /dev/null
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -0,0 +1,654 @@

This driver is being introduced with no copyright or license header. At
least it has an appropriate MODULE_LICENSE().

Can the original author(s) please provide a follow-up patch with one?
Thanks.

> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>

...

> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Sigma Designs");
> +MODULE_DESCRIPTION("Tango4 NAND Flash controller driver");

Brian
