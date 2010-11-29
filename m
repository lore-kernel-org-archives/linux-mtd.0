Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN56J-0002Wa-V3
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 14:53:09 +0000
Received: by fxm19 with SMTP id 19so55582fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Nov 2010 06:53:07 -0800 (PST)
Subject: Re: [PATCH] mtd: mtdchar/mtdpart: fix master device identification
	for mtd repartition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1290514637-15869-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1290514637-15869-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Nov 2010 16:53:01 +0200
Message-ID: <1291042381.2141.13.camel@koala>
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

On Tue, 2010-11-23 at 14:17 +0200, Roman Tereshonkov wrote:
> Function mtd_has_master renamed as mtd_is_partition to follow the function logic.
> The patch fixes the problem of checking the right mtd device for partition creation.
> To delete partition checking is not needed here so as it is done in mtd_del_partition.
> By master we consider the mtd device which does not belong to any partition.
> 
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
