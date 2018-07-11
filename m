Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdDHy-00018u-4H
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 11:28:20 +0000
Received: by mail-lf0-x241.google.com with SMTP id l16-v6so20979671lfc.13
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2018 04:27:55 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180711131626.732967be@bbrezillon>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
 <20180709200945.30116-5-boris.brezillon@bootlin.com>
 <20180711131626.732967be@bbrezillon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 11 Jul 2018 13:27:53 +0200
Message-ID: <CAK8P3a1CR_sN2KW4fZjADHrbKyB1ZSi=6+hPAPYoVeAeLGK_3g@mail.gmail.com>
Subject: Re: [PATCH v2 04/24] mtd: rawnand: s3c2410: Allow selection of this
 driver when COMPILE_TEST=y
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 11, 2018 at 1:16 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Mon,  9 Jul 2018 22:09:25 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>
>> It just makes NAND maintainers' life easier by allowing them to
>> compile-test this driver without having ARCH_S3C24XX or ARCH_S3C64XX
>> enabled.
>>
>> We add a dependency on HAS_IOMEM to make sure the driver compiles
>> correctly, and a dependency on !IA64 because the {read,write}s{bwl}()
>> accessors are not defined for this architecture.
>
> I see that SPARC does not define those accessors either. So I guess we
> should add depends on !SPARC.
>
> Arnd, any other way to know when the platform implements
> {read,write}s{bwl}() accessors?

I'd just consider that a bug, and send a patch to fix sparc64 if it's broken.
sparc32 appears to have these, and when Thierry sent the patch
to implement them everywhere[1], he said that he tested sparc64 as
well, so either something regressed since then, or his testing
was incomplete. Either way, the correct answer IMHO would be to
make it work rather than to add infrastructure around the broken
configurations.

      Arnd

[1] https://lwn.net/Articles/604819/
