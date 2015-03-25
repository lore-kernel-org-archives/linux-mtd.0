Received: from lb1-smtp-cloud2.xs4all.net ([194.109.24.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yas5l-0006tQ-Vg
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 20:39:58 +0000
Message-ID: <1427315945.10958.48.camel@x220>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
From: Paul Bolle <pebolle@tiscali.nl>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 25 Mar 2015 21:39:05 +0100
In-Reply-To: <1427292151-3835-2-git-send-email-richard@nod.at>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Probably not really the feedback you're hoping for at this moment, this
being an RFC, but I spotted two nits anyway.

On Wed, 2015-03-25 at 15:02 +0100, Richard Weinberger wrote:
> --- /dev/null
> +++ b/drivers/mtd/nand/nand_ondie.c

This file makes git am whine: "new blank line at EOF".

> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

Is this include needed? The code can only be built in. This files also
builds silently without that include. I used the rather hacky
    make EXTRA_CFLAGS="-DCONFIG_MTD_NAND_ECC_ON_DIE" drivers/mtd/nand/nand_ondie.o

to test the build.

> +#include <linux/slab.h>
> +#include <linux/bitops.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_ondie.h>


Paul Bolle
