Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtOnx-0005wA-Sr
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 17:51:31 +0000
Received: by bwz13 with SMTP id 13so432136bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 10:51:28 -0700 (PDT)
Subject: Re: Partition size limit of UBIFS?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xing Qianqian <xingqq@21com.com>
In-Reply-To: <000001cb4f6c$d2f90af0$78eb20d0$@com>
References: <000001cb4f6c$d2f90af0$78eb20d0$@com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Sep 2010 20:51:23 +0300
Message-ID: <1283968283.7370.5.camel@brekeke>
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

On Wed, 2010-09-08 at 23:45 +0800, Xing Qianqian wrote:
> Hi, All
> 
>   As we know, MTD has partition size limit of 2G.

I think it is much larger now, after we converted offsets and sizes to
64-bit variables.

>  Do you know the size limit
> of UBIFS partition and file size? 

I'm too lazy to look at ubifs-media.h, but all sizes are 64-bit
variables there. But I never tested UBIFS on really large UBI volumes.
Never believe theoretical limits - test.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
