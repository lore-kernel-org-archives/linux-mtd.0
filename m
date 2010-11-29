Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN554-0002Ss-JW
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 14:51:53 +0000
Received: by fxm19 with SMTP id 19so54198fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Nov 2010 06:51:45 -0800 (PST)
Subject: Re: [PATCH] mtd: mxc_nand: Fix warning on nr_parts unused variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
In-Reply-To: <1290538933-12607-1-git-send-email-fabio.estevam@freescale.com>
References: <1290538933-12607-1-git-send-email-fabio.estevam@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Nov 2010 16:51:27 +0200
Message-ID: <1291042287.2141.12.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-11-23 at 17:02 -0200, Fabio Estevam wrote:
> If CONFIG_MTD_PARTITIONS is not selected, then the following warning is generated:
> 
>   CC      drivers/mtd/nand/mxc_nand.o
> drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_probe':
> drivers/mtd/nand/mxc_nand.c:1014: warning: unused variable 'nr_parts'
> 
> Fix it by marking nr_parts as __maybe_unused.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

I'm curious, do you really use MTD without CONFIG_MTD_PARTITIONS ? Or
you found just random warning? I'm asking because I believed this config
option has to be killed, because it causes more harm in form of mess,
than good.

Anyway, putting this to my l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
