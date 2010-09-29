Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0wJu-0005wx-Tt
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 13:03:40 +0000
Received: by fxm15 with SMTP id 15so517190fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 06:03:38 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: S5PC210 OneNAND support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100929053205.GA13105@july>
References: <20100929053205.GA13105@july>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 16:01:37 +0300
Message-ID: <1285765297.2437.125.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-29 at 14:32 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> S5PC210 has the same OneNAND controller as S5PC110
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mtd/onenand/Kconfig |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
