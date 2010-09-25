Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzSRG-000570-3p
	for linux-mtd@lists.infradead.org; Sat, 25 Sep 2010 10:57:07 +0000
Received: by bwz19 with SMTP id 19so3387338bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Sep 2010 03:57:05 -0700 (PDT)
Subject: Re: [PATCH] nandwrite: Remove redundant 'autoplace' check
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
In-Reply-To: <4C9C6DED.5040200@renesas.com>
References: <4C9C6DED.5040200@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 25 Sep 2010 13:57:01 +0300
Message-ID: <1285412221.13050.6.camel@brekeke>
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

On Fri, 2010-09-24 at 18:22 +0900, Shinya Kuribayashi wrote:
> We're already in 'if (autoplace) { }' block at ths moment.
> 
> Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
> ---

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
