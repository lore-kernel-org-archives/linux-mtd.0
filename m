Received: from mail-eopbgr40108.outbound.protection.outlook.com
 ([40.107.4.108] helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQhd9-0003ah-Jj
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 21:37:30 +0000
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
From: Peter Rosin <peda@axentia.se>
Subject: On-die ECC support
Message-ID: <45d6eb07-d6f0-1ac1-bd50-ef913a2826d8@axentia.se>
Date: Mon, 9 Jan 2017 22:37:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

AFAICT, on-die ECC support [1] (continues in [2]) was never upstreamed
and the patches no longer applies. I wonder if someone has done the
work to forward port them to recent kernels?

Cheers,
peda

[1] [RFC] On-die ECC support
    http://lists.infradead.org/pipermail/linux-mtd/2015-March/058458.html

    [PATCH 1/3] mtd: nand: Add on-die ECC support
    http://lists.infradead.org/pipermail/linux-mtd/2015-March/058459.html

    [PATCH 2/3] mtd: nand: Add support for raw access when using on-die ECC
    http://lists.infradead.org/pipermail/linux-mtd/2015-March/058457.html

    [PATCH 3/3] mtd: nand: Wire up on-die ECC support
    http://lists.infradead.org/pipermail/linux-mtd/2015-March/058456.html

[2] http://lists.infradead.org/pipermail/linux-mtd/2015-April/058846.html
