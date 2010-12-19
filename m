Received: from mail-fx0-f48.google.com ([209.85.161.48])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUMff-0003WN-3o
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 17:03:45 +0000
Received: by fxm2 with SMTP id 2so2375589fxm.21
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Dec 2010 09:03:40 -0800 (PST)
Subject: Re: [PATCH] MTD: NAND: ams-delta: drop omap_read/write, use ioremap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
In-Reply-To: <201012151543.46341.jkrzyszt@tis.icnet.pl>
References: <201012151543.46341.jkrzyszt@tis.icnet.pl>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Dec 2010 19:03:33 +0200
Message-ID: <1292778213.13362.9.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-15 at 15:43 +0100, Janusz Krzysztofik wrote:
> There is a common requirement for not using OMAP specific omap_readw() / 
> omap_writew() function calls in drivers/, but replace them with 
> readw() / writew() on ioremap()ped addresses passed from arch/ instead.
> 
> The patch implements this idea for the Amstrad Delta NAND driver. To be 
> able to use the modified driver, the board file is updated with the 
> platform device I/O resource declaration, which is passed from there.
> 
> Created and tested against linux-2.6.37-rc5, on top of recent patch 
> 'MTD: NAND: ams-delta: convert to platform driver'.
> 
> Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
