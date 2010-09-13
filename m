Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov4qK-0001rb-W3
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 08:56:54 +0000
Received: by bwz13 with SMTP id 13so5624992bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 01:56:51 -0700 (PDT)
Subject: Re: [PATCH] mtd: add Broadcom BCM63xx image tag partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201009121553.01374.florian@openwrt.org>
References: <201009121553.01374.florian@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Sep 2010 11:55:25 +0300
Message-ID: <1284368125.27765.180.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-12 at 15:52 +0200, Florian Fainelli wrote:
> This patch adds support for parsing Broadcom BCM63xx image tag format and
> creating MTD partitions accordingly. This driver is a platform_device which
> can be instantiated accordingly by bcm63xx board support code.
> 
> Signed-off-by: Daniel Dickinson <cshore@csolve.net>
> Signed-off-by: Mike Albon <malbon@openwrt.org>
> Signed-off-by: Florian Fainelli <florian@openwrt.org>

Pushed to l2-mtd-2.6.git without my "Signed-off-by", thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
