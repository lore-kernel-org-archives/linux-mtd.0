Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJnM-0005dK-R7
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:31:47 +0000
Received: by ewy3 with SMTP id 3so227414ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:31:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] mtd: remove printk's for [kv][mz]alloc failures
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307487717-25402-2-git-send-email-computersforpeace@gmail.com>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
	<1307487717-25402-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 17:27:24 +0300
Message-ID: <1307543244.31223.105.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 16:01 -0700, Brian Norris wrote:
> When a memory allocation fails, the kernel will print out a backtrace
> automatically. These print statements are unnecessary.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/cmdlinepart.c         |    3 ---
>  drivers/mtd/inftlcore.c           |    4 +---
>  drivers/mtd/nand/nand_bbt.c       |   13 +++----------
>  drivers/mtd/nand/rtc_from4.c      |    1 -
>  drivers/mtd/nftlcore.c            |    4 +---
>  drivers/mtd/onenand/onenand_bbt.c |    4 +---
>  drivers/mtd/ssfdc.c               |   10 ++--------
>  7 files changed, 8 insertions(+), 31 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
