Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9KRO-0004sT-Vp
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 14:49:22 +0000
Subject: Re: [PATCH 1/2] Blackfin NFC Driver: remove pointless return value
	in bf5xx_nand_dma_rw
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1243333454-673-1-git-send-email-vapier@gentoo.org>
References: <1243333454-673-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 May 2009 17:46:32 +0300
Message-Id: <1243435592.11172.37.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>,
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

On Tue, 2009-05-26 at 06:24 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Bryan Wu <cooloney@kernel.org>
> ---
>  drivers/mtd/nand/bf5xx_nand.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)

I've taken these 2 patches to my l2-mtd-2.6.git.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
