Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq1r9-0008Ps-2a
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 10:44:56 +0000
Received: by yxf34 with SMTP id 34so2354310yxf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 03:44:50 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: Samsung MLC - new OOB sizes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1282326643-9598-1-git-send-email-norris@broadcom.com>
References: <1282326643-9598-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 13:44:16 +0300
Message-ID: <1283165056.12995.51.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tilman@code-monkey.de, David Woodhouse <dwmw2@infradead.org>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 10:50 -0700, Brian Norris wrote:
> There are some additions to the detection scheme used by Samsung
> MLC NAND. These simple changes to support the 400- and 436-byte OOB
> are found in the following data sheet:
> 
> Samsung K9GBG08U0M (p.40)
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>
> ---
>  drivers/mtd/nand/nand_base.c |   17 +++++++++++++++--
>  1 files changed, 15 insertions(+), 2 deletions(-)

Thanks, pushed to l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
