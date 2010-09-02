Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or6US-0004gy-Iz
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 09:53:52 +0000
Received: by yxf34 with SMTP id 34so68779yxf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 02:53:52 -0700 (PDT)
Subject: RE: [PATCH] m25p80: Add support for two new Spansion SPI devices
	(S25FL-K)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Hoyler, Gernot" <Gernot.Hoyler@spansion.com>
In-Reply-To: <D0271AF888369C4C85548462366DB24B8F0EF20E@US2K7EXMBPF1.spansion.com>
References: <4C7E3578.20608@spansion.com> <1283383617.2209.68.camel@brekeke>
	<D0271AF888369C4C85548462366DB24B8F0EF20E@US2K7EXMBPF1.spansion.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 12:53:48 +0300
Message-ID: <1283421228.1748.7.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-02 at 02:41 -0700, Hoyler, Gernot wrote:
> > Would you please, send a patch which is applicable to the current mtd
> > tree: http://git.infradead.org/mtd-2.6.git
> 
> Hmm, it should. If have cloned git://git.infradead.org/mtd-2.6, 
> created a new head, applied and committed my changes to that new head.
> Then I have created the patch via "git format-patch master..head" and 
> (manually) added the signed-off-by line. Also, I have verified that I 
> can apply the patch to the latest master head via "patch -p1 < ...".

Could you please try to save your own e-mail and apply it with git am ?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
