Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqZqn-0000cW-9p
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 23:02:50 +0000
Received: by vws11 with SMTP id 11so6574049vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 16:02:42 -0700 (PDT)
Subject: Re: [PATCH v2] MTD: OneNAND: Fix loop hang when DMA error at
	Samsung	SoCs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100830234801.GA16862@july>
References: <20100830234801.GA16862@july>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 02:02:35 +0300
Message-ID: <1283295755.2018.36.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-31 at 08:48 +0900, Kyungmin Park wrote:
>  	writel(S5PC110_DMA_TRANS_CMD_TR, base + S5PC110_DMA_TRANS_CMD);
>  
> +	timeout = jiffies + msec_to_jiffies(20);

Are you completely absolutely 100% totally sure 20msecs is enough?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
