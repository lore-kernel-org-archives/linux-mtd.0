Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHq8b-0003Pu-FN
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 11:25:34 +0000
Received: by mail-wm0-x236.google.com with SMTP id 123so22142105wmg.1
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jun 2017 04:25:13 -0700 (PDT)
Date: Mon, 5 Jun 2017 13:25:08 +0200
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
Message-ID: <20170605112508.GF14675@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-3-git-send-email-pali.rohar@gmail.com>
 <fa265d04-07b4-0ed3-9b51-c2026f7015db@nod.at>
 <20170605112145.GE14675@pali>
 <ad488af9-a6c5-7795-87a2-87e610dd2121@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad488af9-a6c5-7795-87a2-87e610dd2121@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 05 June 2017 13:23:22 Richard Weinberger wrote:
> Pali,
> 
> Am 05.06.2017 um 13:21 schrieb Pali Rohár:
> > On Friday 02 June 2017 18:13:02 Richard Weinberger wrote:
> >> Pali,
> >>
> >> Am 02.06.2017 um 17:43 schrieb Pali Rohár:
> >>> It is needed for creating emulated devices suitable for using in UBI layer
> >>> and with UBIFS.
> >>
> >> Why?
> > 
> > ubifs depends on write size of nand. And without those parameters as
> > specified in cover letter I'm unable to mount N900 rootfs image exported
> > via block2mtd. ubifs reject such image.
> 
> Hmm, so you render block2mtd into a semi-NAND chip? :)

Probably you can call it like that. But it is still MTD device...

-- 
Pali Rohár
pali.rohar@gmail.com
