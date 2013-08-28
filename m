Received: from mail-qc0-x231.google.com ([2607:f8b0:400d:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEev5-0003I8-Gb
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 12:32:20 +0000
Received: by mail-qc0-f177.google.com with SMTP id e1so1474871qcx.22
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 05:31:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCE1BE2@post.tritech.se>
References: <CAAXf6LX44diB36-aFUFh1mcWcgj3X7z1jg-gwpeFyKaROjjaKQ@mail.gmail.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCE1BE2@post.tritech.se>
Date: Wed, 28 Aug 2013 14:31:58 +0200
Message-ID: <CAAXf6LWhMHJHs12CSPaQBA0G2TueQyB7XeYiyrUsDJw4JOP5Dg@mail.gmail.com>
Subject: Re: ubifs: bad node type (255 but expected 6)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: =?ISO-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mats,

On Wed, Aug 28, 2013 at 12:36 PM, Mats K=E4rrman <Mats.Karrman@tritech.se> =
wrote:
> Hi Thomas,
>
> On Wednesday, August 28, 2013 12:13 PM Thomas De Schampheleire [patrickde=
pinguin@gmail.com] wrote:
>> Is this a known problem, fixed in a later release?
>> Could it be just a bad NAND flash?
>> Could it be a problem with the underlying MTD driver (or my modification=
 to it)?
>
> I would put my money on the MTD driver.
> Have you tried running the mtd tests (http://www.linux-mtd.infradead.org/=
doc/general.html#L_mtd_tests)?

Thanks for the tip.
The readtest went fine, but I'm now getting errors on the pagetest:

[  736.746005] mtd_pagetest: error: verify failed at 0x9ea000
[  736.814904] mtd_pagetest: error: verify failed at 0x9ea800
[  736.883804] mtd_pagetest: error: verify failed at 0x9eb000
[  736.952735] mtd_pagetest: error: verify failed at 0x9eb800
[...]

I will revert my changes and retest.

Best regards,
Thomas
