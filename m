Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJ2EW-0000E5-Vs
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 16:55:51 +0000
Received: by mail-ob0-x22d.google.com with SMTP id py5so64195314obc.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jan 2016 08:55:28 -0800 (PST)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <56951F91.1090101@atmel.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <56951F91.1090101@atmel.com>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 12 Jan 2016 17:55:08 +0100
Message-ID: <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 "Yang, Wenyou" <Wenyou.Yang@atmel.com>, rainyfeeling@outlook.com,
 Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicolas,

2016-01-12 16:45 GMT+01:00 Nicolas Ferre <nicolas.ferre@atmel.com>:
>
> The maintainers for this driver changed very recently, so you'll have to
> includes these names to your CC list:
>
> M:      Wenyou Yang <wenyou.yang@atmel.com>
> M:      Josh Wu <rainyfeeling@outlook.com>

Ok. It might be a good idea to update the MAINTAINERS file, as Josh Wu's atmel
address now bounces, and it is still referenced there.

>
> I also think that Wenyou did some work regarding this support. So you'll
> have to coordinat together.

Is it possible to know what are the developments in progress regarding SAMA5D2
drivers? The github repository does not expose any working trees, and only the
current "stable" trees are visible.

Best regards,
-- 
Romain Izard
