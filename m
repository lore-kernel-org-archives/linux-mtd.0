Received: from mail-vw0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RUpXl-0005h8-FC
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 00:58:02 +0000
Received: by vbbfs19 with SMTP id fs19so4791023vbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2011 16:57:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322397903.2799.5.camel@phoenix>
References: <1322397903.2799.5.camel@phoenix>
Date: Mon, 28 Nov 2011 08:57:59 +0800
Message-ID: <CAN1soZxz3JGRfGjP-=i1=wT_BAWH0t8cas=59847FfYpXqrnEQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_platform_driver()
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Manuel Lauss <manuel.lauss@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 27, 2011 at 8:45 PM, Axel Lin <axel.lin@gmail.com> wrote:
> This patch converts the drivers in drivers/mtd/* to use the
> module_platform_driver() macro which makes the code smaller and a bit
> simpler.
>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Jiandong Zheng <jdzheng@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Wan ZongShun <mcuos.com@gmail.com>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Jamie Iles <jamie@jamieiles.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Manuel Lauss <manuel.lauss@googlemail.com>
> Cc: Vimal Singh <vimal.newwork@gmail.com>
> Cc: Andres Salomon <dilinger@queued.net>
> Cc: Sukumar Ghorai <s-ghorai@ti.com>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
>
For pxa nand
Acked by: Haojian Zhuang <haojian.zhuang@gmail.com>
