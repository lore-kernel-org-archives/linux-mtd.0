Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdumc-000168-2L
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 09:54:39 +0000
Received: by mail-wm0-x230.google.com with SMTP id s13-v6so4099205wmc.1
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 02:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACwWb3DnyxqTrQF-5UpuU+rUDRGrS2XM8+yQEf45miCbJ5nrpw@mail.gmail.com>
 <967434303.163429.1526634595483.JavaMail.zimbra@sigma-star.at>
 <CACwWb3AVnJOjNW2DE6jn8CR3SRFECP=2mgr-n_rQ-4fNAOd11A@mail.gmail.com>
 <1397936863.163523.1526636992502.JavaMail.zimbra@sigma-star.at>
 <73497de5-6ea1-2662-2cc1-c5047e29d865@mein.io>
 <351822581.163754.1526642132964.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <351822581.163754.1526642132964.JavaMail.zimbra@sigma-star.at>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 13 Jul 2018 11:54:14 +0200
Message-ID: <CACna6ryBnAxUUVKkCbkbDgCOxPzvE0=AB+w14aPrAyF=jojn4w@mail.gmail.com>
Subject: Re: [OpenWrt-Devel] OpenWRT mtd tooling vs mtd-utils
To: goliath@sigma-star.at
Cc: Jo-Philipp Wich <jo@mein.io>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 linux-mtd@lists.infradead.org, richard@sigma-star.at,
 Lev <leventelist@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 May 2018 at 13:16, David Oberhollenzer <goliath@sigma-star.at> wrote:
> Thanks for the clarification!
>
> Just out of curiosity, is there a specific reason why OpenWRT uses its
> own formatting utility here instead of using the tools from mtd-utils?

It's probably because it includes some features that upstream
developers/maintaners would probably find too hacky.

In OpenWrt's mtd there is support for some magic deadc0de marker,
appending JFFS2 data, handling vendor specific formats like TRX and
Seama.
