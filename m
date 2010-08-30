Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq1kU-0003fJ-HL
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 10:38:02 +0000
Received: by gyg8 with SMTP id 8so2368652gyg.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 03:37:55 -0700 (PDT)
Subject: Re: [PATCH] mtd/chips: cleanup Kconfig dependencies
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <201008191818.21506.hartleys@visionengravers.com>
References: <201008191818.21506.hartleys@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 13:36:33 +0300
Message-ID: <1283164593.12995.47.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, dwmw2@infradead.org,
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

On Thu, 2010-08-19 at 18:18 -0700, H Hartley Sweeten wrote:
> Remove the MTD!=n dependency since that is handled by drivers/mtd/Kconfig.
> Simplify the dependency checks for mtd/chips by using if/endif blocks. Remove
> all default n since that is the Kconfig default.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Pushed to l2-mtd-2.6.git / master, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
