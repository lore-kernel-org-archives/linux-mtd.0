Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox15h-00042I-UM
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 17:20:49 +0000
Received: by bwz19 with SMTP id 19so4989545bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 10:20:44 -0700 (PDT)
Subject: Re: [v3 1/3] clean up the legacy interfaces in nandwrite.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Stanley.Miao" <stanley.miao@windriver.com>
In-Reply-To: <1276857173-10848-2-git-send-email-stanley.miao@windriver.com>
References: <1276857173-10848-1-git-send-email-stanley.miao@windriver.com>
	<1276857173-10848-2-git-send-email-stanley.miao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 18 Sep 2010 20:20:40 +0300
Message-ID: <1284830440.1721.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-06-18 at 18:32 +0800, Stanley.Miao wrote:
> The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
> is not enough for many big NAND chips. Therefore, this structure is replaced
> by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
> Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
> 
> Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
> keep compatible with the old linux kernel, a linux version detection function
> is added.
> 
> YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
> "forcejffs2", "forceyaffs" anymore. Now clean them up.
> 
> Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>

I still have this series marked with red in my box, which means "do not
forget about this". But since this stuff is so old and you disappeared,
I am unmarking this.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
