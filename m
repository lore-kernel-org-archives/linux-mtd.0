Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq1pq-0007II-E3
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 10:43:32 +0000
Received: by yxf34 with SMTP id 34so2354043yxf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 03:43:29 -0700 (PDT)
Subject: Re: [PATCH v3] Fix mtd-utils bugs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ladislav Michl <ladis@linux-mips.org>
In-Reply-To: <20100820130313.GA3558@localhost.localdomain>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
	<20100623151622.GA2771@localhost.localdomain>
	<1282282168.2183.2.camel@brekeke>
	<20100820130313.GA3558@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 13:42:19 +0300
Message-ID: <1283164939.12995.50.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Stanley.Miao" <stanley.miao@windriver.com>, linux-mtd@lists.infradead.org,
	joakim.tjernlund@transmode.se
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 15:03 +0200, Ladislav Michl wrote:
> Here it is based on the top of current git. Updated only, compile tested only...
> 
> Returning from main() instead of using exit() makes code more readable
> and smaller (ARM EABI binary sizes)
> 
>    text    data     bss     dec     hex filename
>   28882     436      44   29362    72b2 flash_eraseall
>   28827     432      44   29303    7277 flash_eraseall.noexit
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  flash_eraseall.c |  193 +++++++++++++++++++++++++------------------------------
>  1 file changed, 89 insertions(+), 104 deletions(-)

Invented a subject line myself (you missed it) and pushed to
mtd-utils.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
