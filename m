Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P22kq-0003bL-2Z
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 14:08:00 +0000
Received: by bwz19 with SMTP id 19so3763021bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Oct 2010 07:07:59 -0700 (PDT)
Subject: Re: [patch 2/2] jffs2: use cond_resched() instead of yield()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <201010012116.o91LGSlt021122@imap1.linux-foundation.org>
References: <201010012116.o91LGSlt021122@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 02 Oct 2010 17:07:55 +0300
Message-ID: <1286028475.32172.12.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, dedekind@infradead.org, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org, mingo@elte.hu, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-01 at 14:16 -0700, akpm@linux-foundation.org wrote:
> From: Wolfram Sang <w.sang@pengutronix.de>
> 
> yield() has different semantics meanwhile and even causes RT-kernels to
> BUG.  Replace the only appearance left in jffs2.
> 

This patch is also in my l2-mtd-2.6.git tree.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
