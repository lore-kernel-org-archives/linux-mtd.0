Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dX5Ef-0006a5-A9
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 12:34:51 +0000
Received: by mail-wr0-x244.google.com with SMTP id w4so1014063wrb.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 05:34:28 -0700 (PDT)
Date: Mon, 17 Jul 2017 14:34:24 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Pavel Machek <pavel@ucw.cz>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mtd: block2mtd: Add support for specifying MTD write
 size and subpage shift
Message-ID: <20170717123424.GD16493@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-3-git-send-email-pali.rohar@gmail.com>
 <fa265d04-07b4-0ed3-9b51-c2026f7015db@nod.at>
 <20170605112145.GE14675@pali>
 <ad488af9-a6c5-7795-87a2-87e610dd2121@nod.at>
 <20170605112508.GF14675@pali>
 <79f3b92f-5be4-8d46-985d-0b38cffd6032@nod.at>
 <20170618100626.GC20211@amd>
 <8440a46a-0ba2-b00f-e55b-d0a0fa9b8aa6@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8440a46a-0ba2-b00f-e55b-d0a0fa9b8aa6@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 18 June 2017 12:11:40 Richard Weinberger wrote:
> Pavel,
> 
> Am 18.06.2017 um 12:06 schrieb Pavel Machek:
> > Hi!
> > 
> >>>>>> Am 02.06.2017 um 17:43 schrieb Pali Rohár:
> >>>>>>> It is needed for creating emulated devices suitable for using in UBI layer
> >>>>>>> and with UBIFS.
> >>>>>>
> >>>>>> Why?
> >>>>>
> >>>>> ubifs depends on write size of nand. And without those parameters as
> >>>>> specified in cover letter I'm unable to mount N900 rootfs image exported
> >>>>> via block2mtd. ubifs reject such image.
> >>>>
> >>>> Hmm, so you render block2mtd into a semi-NAND chip? :)
> >>>
> >>> Probably you can call it like that. But it is still MTD device...
> >>
> >> This is what I meant in my other mail.
> >> You add NAND specific properties but still denote it as MTD_RAM/ROM.
> >> I'm not sure whether this is a good idea.
> > 
> > Can you suggest any other way for Pali to mount rootfs image on his
> > PC?
> 
> Are you my micro manager? ;-)
> 
> As stated in my other mail, we have nandsim and there is work going on
> to allow specifying arbitrary NAND sizes.
> An alternative approach can be found here:
> https://lkml.org/lkml/2016/5/12/296
> 
> Thanks,
> //richard

Back to the this patch series. There are also other patches in this
series. If you at least comment/review other patches if this one is
"problematic"?

-- 
Pali Rohár
pali.rohar@gmail.com
