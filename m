Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUMhl-0003iS-Dw
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 17:05:56 +0000
Received: by bwz14 with SMTP id 14so2451863bwz.30
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Dec 2010 09:05:51 -0800 (PST)
Subject: Re: [PATCH v5 1/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D6x16UxM NOR chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20101217095941.8560.75355.stgit@shiryu>
References: <20101217095941.8560.75355.stgit@shiryu>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Dec 2010 19:05:42 +0200
Message-ID: <1292778342.13362.10.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Matthias Buecher / Germany <mail@maddes.net>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-17 at 10:59 +0100, Guillaume LECERF wrote:
> These chips report CFI v0.0 [1], so extend cfi_fixup_major_minor()
> to patch all Samsung chips from 0.0 to 1.0.
> Discussed and tested by the OpenWRT people [2].
> 
> [1] http://www.samsung.com/global/system/business/semiconductor/product/2007/6/11/NORFlash/64Mbit/K8D6316UTM/ds_K8D6x16UxM_rev16.pdf
> [2] https://dev.openwrt.org/ticket/7348
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> Acked-by: Wolfram Sang <w.sang@pengutronix.de>

Pushed both patches to l2-mtd-2.6.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
