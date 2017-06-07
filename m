Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIWcO-0007iT-Eg
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 08:47:10 +0000
Received: by mail-wr0-x233.google.com with SMTP id g76so2914904wrd.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2017 01:46:46 -0700 (PDT)
Date: Wed, 7 Jun 2017 10:46:42 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mtd: block2mtd: Add support for specifying MTD write
 size and subpage shift
Message-ID: <20170607084642.GG4690@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-3-git-send-email-pali.rohar@gmail.com>
 <fa265d04-07b4-0ed3-9b51-c2026f7015db@nod.at>
 <20170605112145.GE14675@pali>
 <ad488af9-a6c5-7795-87a2-87e610dd2121@nod.at>
 <20170605112508.GF14675@pali>
 <79f3b92f-5be4-8d46-985d-0b38cffd6032@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79f3b92f-5be4-8d46-985d-0b38cffd6032@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 05 June 2017 13:27:18 Richard Weinberger wrote:
> Pali,
> 
> Am 05.06.2017 um 13:25 schrieb Pali Rohár:
> > On Monday 05 June 2017 13:23:22 Richard Weinberger wrote:
> >> Pali,
> >>
> >> Am 05.06.2017 um 13:21 schrieb Pali Rohár:
> >>> On Friday 02 June 2017 18:13:02 Richard Weinberger wrote:
> >>>> Pali,
> >>>>
> >>>> Am 02.06.2017 um 17:43 schrieb Pali Rohár:
> >>>>> It is needed for creating emulated devices suitable for using in UBI layer
> >>>>> and with UBIFS.
> >>>>
> >>>> Why?
> >>>
> >>> ubifs depends on write size of nand. And without those parameters as
> >>> specified in cover letter I'm unable to mount N900 rootfs image exported
> >>> via block2mtd. ubifs reject such image.
> >>
> >> Hmm, so you render block2mtd into a semi-NAND chip? :)
> > 
> > Probably you can call it like that. But it is still MTD device...
> 
> This is what I meant in my other mail.
> You add NAND specific properties but still denote it as MTD_RAM/ROM.
> I'm not sure whether this is a good idea.

Ok, lets wait what other people think.

At least patches like fallback or check should be less problematic and
could be applied separately.

-- 
Pali Rohár
pali.rohar@gmail.com
