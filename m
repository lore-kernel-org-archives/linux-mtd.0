Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1u8-0000PG-OW
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:22:05 +0000
Received: by yenq4 with SMTP id q4so1744415yen.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:22:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322727444.2332.12.camel@koala>
References: <1322397903.2799.5.camel@phoenix> <1322727444.2332.12.camel@koala>
From: Manuel Lauss <manuel.lauss@googlemail.com>
Date: Thu, 1 Dec 2011 09:21:22 +0100
Message-ID: <CAOLZvyHmW7joMRbj7OPzmgWVdLr2U0p1P17FdroVmS6skecpAg@mail.gmail.com>
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_platform_driver()
To: dedekind1@gmail.com
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
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Axel Lin <axel.lin@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 1, 2011 at 9:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2011-11-27 at 20:45 +0800, Axel Lin wrote:
>> This patch converts the drivers in drivers/mtd/* to use the
>> module_platform_driver() macro which makes the code smaller and a bit
>> simpler.
>
> Pushed to l2-mtd-2.6.git, thanks. However, I got rejects in the
> drivers/mtd/nand/au1550nd.c file, so this part was ignored. Please, take
> a look at this and send an incremental change. Thanks!

Axel's patch is against a bigger change to au1550nd.c (which introduced the
platform driver in the first place) available in linux-next.

Thanks,
        Manuel
