Received: from mxout01.bytecamp.net ([212.204.60.217])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJchR-0001jf-4l
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 10:35:25 +0000
Received: from mail.bytecamp.net (mail.bytecamp.net [212.204.60.9])
 by mxout01.bytecamp.net (Postfix) with ESMTP id 452BF575A24
 for <linux-mtd@lists.infradead.org>; Fri, 18 May 2018 12:26:49 +0200 (CEST)
Subject: Re: [OpenWrt-Devel] OpenWRT mtd tooling vs mtd-utils
To: David Oberhollenzer <goliath@sigma-star.at>,
 Levente <leventelist@gmail.com>, openwrt-devel@lists.openwrt.org
Cc: Richard Weinberger <richard@sigma-star.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <CACwWb3DnyxqTrQF-5UpuU+rUDRGrS2XM8+yQEf45miCbJ5nrpw@mail.gmail.com>
 <967434303.163429.1526634595483.JavaMail.zimbra@sigma-star.at>
 <CACwWb3AVnJOjNW2DE6jn8CR3SRFECP=2mgr-n_rQ-4fNAOd11A@mail.gmail.com>
 <1397936863.163523.1526636992502.JavaMail.zimbra@sigma-star.at>
From: Jo-Philipp Wich <jo@mein.io>
Message-ID: <73497de5-6ea1-2662-2cc1-c5047e29d865@mein.io>
Date: Fri, 18 May 2018 12:26:48 +0200
MIME-Version: 1.0
In-Reply-To: <1397936863.163523.1526636992502.JavaMail.zimbra@sigma-star.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

this was actually my fault. I didn't pay close attention and assumed the
code to be related to the kernel MTD subsystem. Only now after your mail
I realized that it affects the OpenWrt specific formatting utility.

I am very sorry for the confusion caused.


Kind regards,
Jo
