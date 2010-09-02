Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or7Vj-00032H-Gu
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 10:59:16 +0000
Received: by yxf34 with SMTP id 34so88718yxf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 03:59:14 -0700 (PDT)
Subject: Re: [RFC] jffs2: use cond_resched() instead of yield()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF213EDC22.80E0A084-ONC1257792.0025CB36-C1257792.00268F36@transmode.se>
References: <1283357021-16187-1-git-send-email-w.sang@pengutronix.de>
	<1283366151.2209.21.camel@brekeke>
	<OF213EDC22.80E0A084-ONC1257792.0025CB36-C1257792.00268F36@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 13:59:09 +0300
Message-ID: <1283425149.3085.6.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org, Ingo Molnar <mingo@elte.hu>,
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

On Thu, 2010-09-02 at 09:01 +0200, Joakim Tjernlund wrote:
> At the time cond_resched() was a problem but now I don't know. The erasing
> has moved to the GC thread and been somewhat reworked. I don't know if
> it still needs yield(). Perhaps David can tell?

I think 'yield()' is rather a hack than a real solution.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
