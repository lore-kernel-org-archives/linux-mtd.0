Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRj1Q-00075i-Go
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 08:42:32 +0000
Subject: Re: =?UTF-8?Q?=E7=AD=94=E5=A4=8D=3A?= ECC & Magic bitmask errors
	with JFFS2 file system on 6.23 kernel for?powerpc
From: Artem Bityutskiy <dedekind@infradead.org>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20090717081802.GA3150@pengutronix.de>
References: <OFCCF65728.700286E7-ON652575F5.00531F58-652575F5.00522500@lntemsys.com>
	<OF394900CB.7ACCAD87-ON482575F6.00056EF5-482575F6.0005A998@zte.com.cn>
	<20090717081802.GA3150@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Jul 2009 11:42:05 +0300
Message-Id: <1247820125.11353.179.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>, liu.yaojin@zte.com.cn,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-17 at 10:18 +0200, Wolfram Sang wrote:
> On Fri, Jul 17, 2009 at 09:00:07AM +0800, liu.yaojin@zte.com.cn wrote:
> > forget it ,because i have the same problem,and nobody answer.
> 
> To get an answer, it usually helps:
> 
> 1) to use a recent kernel
> 2) to use a vanilla kernel
> 
> If this is not possible for you, you should ask the makers of your kernel.

There are also mtd tests in the recent kernels which may be used
to test the flash driver. For ancient kernels this could be
tried: http://git.infradead.org/users/ahunter/nand-tests.git

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
