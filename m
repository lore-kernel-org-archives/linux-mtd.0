Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJdMQ-00034I-Kk
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 11:15:54 +0000
Date: Fri, 18 May 2018 13:15:32 +0200 (CEST)
From: David Oberhollenzer <goliath@sigma-star.at>
To: Jo-Philipp Wich <jo@mein.io>
Cc: Levente <leventelist@gmail.com>, openwrt-devel@lists.openwrt.org,
 richard <richard@sigma-star.at>, linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <351822581.163754.1526642132964.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <73497de5-6ea1-2662-2cc1-c5047e29d865@mein.io>
References: <CACwWb3DnyxqTrQF-5UpuU+rUDRGrS2XM8+yQEf45miCbJ5nrpw@mail.gmail.com>
 <967434303.163429.1526634595483.JavaMail.zimbra@sigma-star.at>
 <CACwWb3AVnJOjNW2DE6jn8CR3SRFECP=2mgr-n_rQ-4fNAOd11A@mail.gmail.com>
 <1397936863.163523.1526636992502.JavaMail.zimbra@sigma-star.at>
 <73497de5-6ea1-2662-2cc1-c5047e29d865@mein.io>
Subject: Re: [OpenWrt-Devel] OpenWRT mtd tooling vs mtd-utils
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

Thanks for the clarification!

Just out of curiosity, is there a specific reason why OpenWRT uses its
own formatting utility here instead of using the tools from mtd-utils?


----- Original Message -----
From: "Jo-Philipp Wich" <jo@mein.io>
To: "David Oberhollenzer" <goliath@sigma-star.at>, "Levente" <leventelist@gmail.com>, openwrt-devel@lists.openwrt.org
Cc: "richard" <richard@sigma-star.at>, "linux-mtd" <linux-mtd@lists.infradead.org>
Sent: Friday, May 18, 2018 12:26:48 PM
Subject: Re: [OpenWrt-Devel] OpenWRT mtd tooling vs mtd-utils

Hello David,

this was actually my fault. I didn't pay close attention and assumed the
code to be related to the kernel MTD subsystem. Only now after your mail
I realized that it affects the OpenWrt specific formatting utility.

I am very sorry for the confusion caused.


Kind regards,
Jo
