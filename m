Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHq5I-0001Iu-V5
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 11:22:10 +0000
Received: by mail-wm0-x231.google.com with SMTP id 7so70500179wmo.1
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jun 2017 04:21:48 -0700 (PDT)
Date: Mon, 5 Jun 2017 13:21:45 +0200
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
Message-ID: <20170605112145.GE14675@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-3-git-send-email-pali.rohar@gmail.com>
 <fa265d04-07b4-0ed3-9b51-c2026f7015db@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa265d04-07b4-0ed3-9b51-c2026f7015db@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 02 June 2017 18:13:02 Richard Weinberger wrote:
> Pali,
> 
> Am 02.06.2017 um 17:43 schrieb Pali Rohár:
> > It is needed for creating emulated devices suitable for using in UBI layer
> > and with UBIFS.
> 
> Why?

ubifs depends on write size of nand. And without those parameters as
specified in cover letter I'm unable to mount N900 rootfs image exported
via block2mtd. ubifs reject such image.

-- 
Pali Rohár
pali.rohar@gmail.com
