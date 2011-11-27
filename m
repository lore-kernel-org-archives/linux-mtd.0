Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RUjLU-0002VW-Sb
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2011 18:20:57 +0000
Received: by yenq4 with SMTP id q4so1898830yen.36
 for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2011 10:20:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322397903.2799.5.camel@phoenix>
References: <1322397903.2799.5.camel@phoenix>
Date: Sun, 27 Nov 2011 10:20:55 -0800
Message-ID: <CAOesGMhA0pwfeHEsrAHYZBbpaXFSO-jF-ZUyrVP48wwPbBGj_A@mail.gmail.com>
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_platform_driver()
From: Olof Johansson <olof@lixom.net>
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
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

On Sun, Nov 27, 2011 at 4:45 AM, Axel Lin <axel.lin@gmail.com> wrote:
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

Acked-by: Olof Johansson <olof@lixom.net>   (pasemi portions)


-Olof
