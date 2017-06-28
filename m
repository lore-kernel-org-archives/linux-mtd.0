Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQKNi-00028W-9j
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 21:20:16 +0000
Received: by mail-vk0-x242.google.com with SMTP id 82so4569178vki.0
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 14:19:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170624231025.23292-1-zajec5@gmail.com>
References: <20170624231025.23292-1-zajec5@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 28 Jun 2017 23:19:31 +0200
Message-ID: <CAOiHx=kkOfQpj-aUdck25WDQQkpwxRh8CDJAmP=ymSMm02K_Vg@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] mtd: partitions: add of_match_table parser matching
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 25 June 2017 at 01:10, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> From: Brian Norris <computersforpeace@gmail.com>
>
> Partition parsers can now provide an of_match_table to enable
> flash<-->parser matching via device tree.
>
> This support is currently limited to built-in parsers as it uses
> request_module() and friends. This should be sufficient for most cases
> though as compiling parsers as modules isn't a common choice.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

I gave this and Rafa=C5=82's recent patches a spin and split out
bcm63xxpart's imagetag parsing into its own parser as a partition
parser assigned to the imagetag partition, then added an
of_match_table to bcm63xxpart, and it worked beautifully:

[    1.111302] m25p80 spi1.0: s25fl129p1 (16384 Kbytes)
[    1.117222] bcm63xxpart: Partition 0 is CFE offset 0 and length 10000
[    1.127313] bcm63xxpart: Partition 1 is nvram offset ff0000 and length 1=
0000
[    1.134604] bcm63xxpart: Partition 2 is linux offset 10000 and length fe=
0000
[    1.141927] 3 bcm63xxpart partitions found on MTD device spi1.0
[    1.148032] Creating 3 MTD partitions on "spi1.0":
[    1.152945] 0x000000000000-0x000000010000 : "CFE"
[    1.161004] 0x000000ff0000-0x000001000000 : "nvram"
[    1.169777] 0x000000010000-0x000000ff0000 : "linux"
[    1.179489] parser_bcm63xx_imagetag: rootfs: CFE image tag found at
0x0 with version 6, board type 96328avng
[    1.189671] parser_bcm63xx_imagetag: Partition 0 is kernel offset
100 and length 151f52
[    1.197902] parser_bcm63xx_imagetag: Partition 1 is rootfs offset
152052 and length e8dfae
[    1.206405] parser_bcm63xx_imagetag: Spare partition is offset
350004 and length c8fffc
[    1.214738] 2 bcm63xx-imagetag partitions found on MTD device linux
[    1.221201] Creating 2 MTD partitions on "linux":
[    1.226032] 0x000000000100-0x000000152052 : "kernel"
[    1.234445] 0x000000152052-0x000000fe0000 : "rootfs"

Things I did:
1) having just the compatible for bcm63xxpart: bcm63xxpart was used.
2) bcm63xxpart, then fixed-partitions as two compatible strings:
bcm63xxpart was used.
3) fixed-partitons, then bcm63xxpart: ofpart was used.
4) non-existent compatible, then fixed-partitons: ofpart was used.

then I ran out of ideas to test.

I guess this might be enough for a

Tested-by: Jonas Gorski <jonas.gorski@gmail.com>


Regards
Jonas
