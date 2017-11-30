Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKLFQ-0007LY-0f
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 09:35:14 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 kernel@pengutronix.de
Subject: Re: UBI using outdated fastmaps
Date: Thu, 30 Nov 2017 10:35:14 +0100
Message-ID: <13270088.zH9gKJllCG@blindfold>
In-Reply-To: <20171130085642.smi3eu2khcrnrvud@pengutronix.de>
References: <20171130085642.smi3eu2khcrnrvud@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha,

Am Donnerstag, 30. November 2017, 09:56:42 CET schrieb Sascha Hauer:
> Hi All,
> 
> We are chasing problems with corrupted UBI volumes here. With an
> excessive load of power cuts we occasionally see UBI corruptions. Most
> of the time we see that a LEB is unmapped although it should really be
> mapped.
> 
> I finally found one place where such corruptions can happen. In
> ubi_update_fastmap() the new fastmap is written. It can happen that
> there is no free PEB to write the fastmap to. In this case the code
> reuses the PEB where the old fastmap is. The critical place is when the
> PEB with the old fastmap is erased but not updated with the new fastmap.
> A power cut here can trick the fastmap attach code to use an outdated
> fastmap during next boot. When during next boot no fastmap is found, the
> code will fall back to scanning and everything is fine. It can, however,
> happen that there is an even older fastmap found which is then used in
> the lack of the more recent one which just got erased.
> 
> It is illegal to erase the PEB with the latest fastmap when there are
> still older fastmaps on the device and this is what happens here.
> 
> The problem can be reproduced relatively easily with the patch below.
> It panics the kernel at the right point after having erased the old
> block, but before it is written again. The ubi.fm_debug parameter during
> next boot will then find inconsistencies in case there is an old fastmap
> on the flash.

*geeez*

> I haven't digged further yet, right now I have no idea how to fix this
> properly.

Upon attach UBI schedules old fastmap PEBs for erasure.
So, before reusing (and therefore erasing) the current anchor PEB we have to
flush all UBI work. The we can erase the anchor. If a power cur happens in 
between, UBI will do a full scan in worst case.

Thanks,
//richard
