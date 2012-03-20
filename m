Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9omg-0001gu-VL
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2012 02:26:51 +0000
Received: by ghbf11 with SMTP id f11so6798727ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2012 19:26:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6E13A53B51111A48A6299DFACA193D4A8612FB@041-DB3MPN1-015.041d.mgd.msft.net>
References: <201203161505.03858.brian.foster@maxim-ic.com>
 <CAN8TOE9FyJ8UJyx3hoaKcqYtie-BrmGJ3SwRgzVjgph=1tow6A@mail.gmail.com>
 <6E13A53B51111A48A6299DFACA193D4A8612FB@041-DB3MPN1-015.041d.mgd.msft.net>
Date: Mon, 19 Mar 2012 19:26:48 -0700
Message-ID: <CAN8TOE90iK2LgsgRgtPJFYfnTtGHiTrTXYcuT_yg5eHYWw-iQA@mail.gmail.com>
Subject: Re: how to support 4096+224 page size with plat_nand ?
From: Brian Norris <computersforpeace@gmail.com>
To: STOTTS Timothy <timothy.stotts@transport.alstom.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 19, 2012 at 7:40 AM, STOTTS Timothy
<timothy.stotts@transport.alstom.com> wrote:
> How can I determine a valid ECC layout for OOB size of 224? A copy-and-pa=
ste of a layout found on the Internet resulted in the driver marking all bl=
ocks as "bad block" on the NAND Flash. (We have additional chips to work wi=
th.) My chip uses software ECC. Does it require BCH?

This depends on your ECC level needed. If you stick with
NAND_ECC_SOFT, then (I think) you get 1-bit (Hamming) ECC. You can
probably just reuse the nand_oob_128 layout for 224. If you need
higher ECC correction, you might need BCH and would switch to
NAND_ECC_SOFT_BCH which I think calculates its own layout.

BTW, BCH is simply an algorithm used for Error Correction. It's
commonly used for anything higher than 1-bit ECC. I'm not very
familiar with software BCH (or software ECC in general).

So you might try just using nand_oob_128 layout by modifying the
`switch (mtd->oobsize) ...' logic. BCH would be a fallback option, or
if you need higher correction.

> My datasheet does not specify ECC as number of OOB bytes per 4096 bytes, =
as such, but rather as a number of bits per a smaller number of bytes. Does=
 that matter?

That's typical. Usually it's measured across a 512-byte or 1024-byte
sector (sometimes adding OOB, giving odd sizes like 512+16=3D528, or
512+28=3D540, etc.).

Brian
