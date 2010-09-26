Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ozpyu-0001mw-LI
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 12:05:25 +0000
Received: by bwz19 with SMTP id 19so3865856bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 05:05:23 -0700 (PDT)
Subject: Re: [PATCH] mtd : add init_size hook for NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
In-Reply-To: <1285328063-7982-1-git-send-email-shijie8@gmail.com>
References: <1285328063-7982-1-git-send-email-shijie8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 26 Sep 2010 15:05:19 +0300
Message-ID: <1285502719.13050.17.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-24 at 19:34 +0800, Huang Shijie wrote:
> Not all the NAND devices have all the information in additional
> id bytes.
> 
> So add a hook in the nand_chip{} is a good method to calculate the
> right value of oobsize, erasesize and so on.
> 
> Without the hook,you will get the wrong value, and you have to hack
> in the ->scan_bbt() to change the wrong value which make the code
> mess.
> 
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c |    6 ++++--
>  include/linux/mtd/nand.h     |    5 +++++
>  2 files changed, 9 insertions(+), 2 deletions(-)

Taken to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
