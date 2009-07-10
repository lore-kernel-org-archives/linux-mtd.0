Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MP9He-0003Px-Qb
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 06:08:41 +0000
Subject: Re: [PATCH v2 17/18] new ARM SoC support: BCMRing
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Leo (Hao) Chen" <leochen@broadcom.com>
In-Reply-To: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25BA6C1F@SJEXCHCCR02.corp.ad.broadcom.com>
References: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25BA6C1F@SJEXCHCCR02.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Jul 2009 09:08:01 +0300
Message-Id: <1247206081.20721.361.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Scott Branden <sbranden@broadcom.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-03 at 18:45 -0700, Leo (Hao) Chen wrote:
> Hi,
> 
> This is the nand driver for the new bcmring architecture.
> 
> >From d3f98479bf28324a3472f3f637014a28ffef29ab Mon Sep 17 00:00:00 2001
> From: Leo Chen <leochen@broadcom.com>
> Date: Fri, 3 Jul 2009 17:27:16 -0700
> Subject: [PATCH 17/18] bcmring nand driver

Could you please make scripts/checkpatch.pl happy?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
