Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PASgc-0003pa-0T
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 19:26:26 +0000
Received: by gxk25 with SMTP id 25so2586148gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 12:26:24 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: mkfs.ubifs: Fix typo in short options of
	mkfs.ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vivenzio Pagliari <vivenzio.pagliari@gmx.de>
In-Reply-To: <20101025115854.226600@gmx.net>
References: <20101025115854.226600@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 22:26:20 +0300
Message-ID: <1288034780.1865.10.camel@brekeke>
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

On Mon, 2010-10-25 at 13:58 +0200, Vivenzio Pagliari wrote:
> The short option for specifying the count of erase blocks for orphans '-p'
> was not detected due to a typo.
>     
> Signed-off-by: Vivenzio Pagliari <vivenzio.pagliari@gmx.de>
> 
> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> index d83f6bd..bc0817f 100644
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
