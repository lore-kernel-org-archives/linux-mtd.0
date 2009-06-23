Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MJ3q3-0004CH-Tw
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 11:07:02 +0000
Subject: Re: [PATCH] MTD: OneNAND: multiblock erase support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1245754975-12063-1-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1245754975-12063-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 23 Jun 2009 14:06:33 +0300
Message-Id: <1245755193.9487.53.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-06-23 at 14:02 +0300, Mika Korhonen wrote:
> Add support for multiblock erase command. OneNANDs (excluding Flex-OneNAND)
> are capable of simultaneous erase of up to 64 eraseblocks.
> This changes the erase requests for regions covering multiple eraseblocks
> to be performed using multiblock erase.
> 
> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
> ---
>  drivers/mtd/onenand/omap2.c        |   22 +++-
>  drivers/mtd/onenand/onenand_base.c |  268 ++++++++++++++++++++++++++++-------
>  include/linux/mtd/onenand.h        |    2 +
>  include/linux/mtd/onenand_regs.h   |    2 +
>  4 files changed, 236 insertions(+), 58 deletions(-)

Just out of curiosity, what is your use-case for this?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
