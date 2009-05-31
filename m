Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MAkfu-00077U-B2
	for linux-mtd@lists.infradead.org; Sun, 31 May 2009 13:02:13 +0000
Subject: Re: [PATCH] NAND: davinci: update clock naming
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Hilman <khilman@deeprootsystems.com>
In-Reply-To: <1243641862-1404-1-git-send-email-khilman@deeprootsystems.com>
References: <1243641862-1404-1-git-send-email-khilman@deeprootsystems.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 31 May 2009 16:01:54 +0300
Message-Id: <1243774914.11172.124.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
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

On Fri, 2009-05-29 at 17:04 -0700, Kevin Hilman wrote:
> DaVinci clock support has been updated in mainline.
> Update clock names accordingly.
> 
> Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>
> ---
>  drivers/mtd/nand/davinci_nand.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)

I've taken this to my l2-mtd-2.6.git. Will also ping dwmw2 about
2.6.30 merging of this patch.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
