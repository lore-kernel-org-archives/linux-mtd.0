Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq1e5-0002sb-S4
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 10:31:22 +0000
Received: by gxk27 with SMTP id 27so2346023gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 03:31:21 -0700 (PDT)
Subject: Re: [PATCH] mtd/ubi: cleanup and simplify Kconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <201008191728.50871.hartleys@visionengravers.com>
References: <201008191728.50871.hartleys@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 13:30:44 +0300
Message-ID: <1283164244.12995.46.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd <linux-mtd@lists.infradead.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-19 at 17:28 -0700, H Hartley Sweeten wrote:
> Cleanup the Kconfig for UBI by using menuconfig to enable/disable the entire
> driver. Remove the dependency checks for MTD_UBI and MTD_UBI_DEBUG by
> wrapping the options in if/endif blocks and remove any redundant checks.
> Remove all default n since that is the Kconfig default. Change menu "Additional
> UBI debugging messages" into a comment to remove one menu level.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>

Pushed to ubi-2.6.git tree, thanks. There were some conflicts, I fixed
them, and you may verify if you wish. The tree:

http://git.infradead.org/ubi-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
