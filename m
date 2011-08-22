Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvPft-00011T-Pw
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 08:16:02 +0000
Received: by gyh20 with SMTP id 20so4181866gyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 01:15:59 -0700 (PDT)
Subject: Re: [PATCH] Tools for controling ubiblk
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Mon, 22 Aug 2011 11:17:47 +0300
In-Reply-To: <1313590847-3839-1-git-send-email-david.wagner@free-electrons.com>
References: <1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
	<1313590847-3839-1-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314001072.2644.58.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	linux-embedded <linux-embedded@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I do not think LKML is interested in mtd-utils user-space project
patches, please, do not add lkml to spam it less.

On Wed, 2011-08-17 at 16:20 +0200, David Wagner wrote:
> +#ifndef __UBIBLK_USER_H__
> +#define __UBIBLK_USER_H__
> +
> +#include <linux/types.h>
> +
> +/* Structure to be passed to UBIBLK_IOCADD or IOCDEL ioctl */
> +struct ubiblk_ctrl_req {
> +	__s32 ubi_num;
> +	__s32 vol_id;
> +};
> +
> +/* ioctl commands of the UBI control character device */
> +
> +#define UBIBLK_CTRL_IOC_MAGIC 'O'
> +
> +/* Create a ubiblk device from a UBI volume */
> +#define UBIBLK_IOCADD _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x10, struct ubiblk_ctrl_req)
> +/* Delete a ubiblk device */
> +#define UBIBLK_IOCDEL _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x11, struct ubiblk_ctrl_req)
> +
> +#endif

Please, do not copy kernel headers verbatim, copy the result of "make
headers_install" invoked in the kernel tree.

-- 
Best Regards,
Artem Bityutskiy
