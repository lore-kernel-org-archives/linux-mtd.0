Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1pf-0008V1-Ou
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:17:29 +0000
Received: by lagu2 with SMTP id u2so773994lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:17:25 -0800 (PST)
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_platform_driver()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Date: Thu, 01 Dec 2011 10:17:22 +0200
In-Reply-To: <1322397903.2799.5.camel@phoenix>
References: <1322397903.2799.5.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322727444.2332.12.camel@koala>
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Manuel Lauss <manuel.lauss@googlemail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-11-27 at 20:45 +0800, Axel Lin wrote:
> This patch converts the drivers in drivers/mtd/* to use the
> module_platform_driver() macro which makes the code smaller and a bit
> simpler.

Pushed to l2-mtd-2.6.git, thanks. However, I got rejects in the
drivers/mtd/nand/au1550nd.c file, so this part was ignored. Please, take
a look at this and send an incremental change. Thanks!

Artem.
