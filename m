Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUMd7-0003Q8-Rt
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 17:01:09 +0000
Received: by bwz14 with SMTP id 14so2449685bwz.30
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Dec 2010 09:01:03 -0800 (PST)
Subject: Re: [PATCH] MTD: NAND: ams-delta: select for built-in by default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
In-Reply-To: <201012151258.16764.jkrzyszt@tis.icnet.pl>
References: <201012151258.16764.jkrzyszt@tis.icnet.pl>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Dec 2010 19:00:53 +0200
Message-ID: <1292778053.13362.7.camel@koala>
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

On Wed, 2010-12-15 at 12:58 +0100, Janusz Krzysztofik wrote:
> Now that the Amstrad Delta NAND driver is converted to a platform driver, 
> which prevents it from interfering with other unrelated hardware in multiple 
> OMAP1 cpu and machine configurations, it can be automatically configured for 
> being built into the kernel if the Amstrad Delta board is also selected.
> 
> Created against linux-2.6.37-rc5.
> 
> Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
