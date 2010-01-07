Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSmCr-0007ez-9U
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 06:50:57 +0000
Subject: Re: [PATCH] [MTD] tests: Fix read, speed and stress tests on NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
In-Reply-To: <1262771298-11320-1-git-send-email-mts.doredevelopment@gmail.com>
References: <1262771298-11320-1-git-send-email-mts.doredevelopment@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Jan 2010 08:50:25 +0200
Message-Id: <1262847025.21915.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-01-06 at 10:48 +0100, Morten Thunberg Svendsen wrote:
> Before using block_isbad() check if mtd->block_isbad() is defined.
> Calculating pgcnt must be done using pgsize defined to 512 on 
> NOR and mtd->writesize for NAND, not using  mtd->writesize directly.
> 
> Previous Patch sendt Dec 16, 2009 did not include check on block_isbad, please ignore
> 
> Signed-off-by: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
> ---
>  drivers/mtd/tests/mtd_readtest.c   |    6 +++++-
>  drivers/mtd/tests/mtd_speedtest.c  |    7 ++++++-
>  drivers/mtd/tests/mtd_stresstest.c |    6 +++++-
>  3 files changed, 16 insertions(+), 3 deletions(-)

Acked-by: Artem Bityutskiy <dedekind@infradead.org>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
