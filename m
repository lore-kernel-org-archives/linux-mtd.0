Received: from mail-qe0-x233.google.com ([2607:f8b0:400d:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEfwr-0005w9-EO
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 13:38:14 +0000
Received: by mail-qe0-f51.google.com with SMTP id cy11so3402684qeb.24
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 06:37:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAXf6LWhMHJHs12CSPaQBA0G2TueQyB7XeYiyrUsDJw4JOP5Dg@mail.gmail.com>
References: <CAAXf6LX44diB36-aFUFh1mcWcgj3X7z1jg-gwpeFyKaROjjaKQ@mail.gmail.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCE1BE2@post.tritech.se>
 <CAAXf6LWhMHJHs12CSPaQBA0G2TueQyB7XeYiyrUsDJw4JOP5Dg@mail.gmail.com>
Date: Wed, 28 Aug 2013 15:37:51 +0200
Message-ID: <CAAXf6LXHOCTN1rCgemFc73svArXjKVBTDwS02SnPLcq+aAeyig@mail.gmail.com>
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

On Wed, Aug 28, 2013 at 2:31 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Wed, Aug 28, 2013 at 12:36 PM, Mats K=E4rrman <Mats.Karrman@tritech.se=
> wrote:
>> Hi Thomas,
>>
>> On Wednesday, August 28, 2013 12:13 PM Thomas De Schampheleire [patrickd=
epinguin@gmail.com] wrote:
>>> Is this a known problem, fixed in a later release?
>>> Could it be just a bad NAND flash?
>>> Could it be a problem with the underlying MTD driver (or my modificatio=
n to it)?
>>
>> I would put my money on the MTD driver.
>> Have you tried running the mtd tests (http://www.linux-mtd.infradead.org=
/doc/general.html#L_mtd_tests)?
>
> Thanks for the tip.
> The readtest went fine, but I'm now getting errors on the pagetest:
>
> [  736.746005] mtd_pagetest: error: verify failed at 0x9ea000
> [  736.814904] mtd_pagetest: error: verify failed at 0x9ea800
> [  736.883804] mtd_pagetest: error: verify failed at 0x9eb000
> [  736.952735] mtd_pagetest: error: verify failed at 0x9eb800
> [...]
>
> I will revert my changes and retest.

Even without my changes, the pagetest fails. Can I safely assume that
pagetest should always work, and that it failing really means a buggy
mtd driver, or can there be other causes?
The current driver is coming from the SoC vendor (Freescale), and in
this 2.6.36.4 kernel release it was not yet accepted upstream (so I'm
still using a patch against vanilla)

Thanks,
Thomas

>
> Best regards,
> Thomas
