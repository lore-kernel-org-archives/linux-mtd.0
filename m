Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1kno-0005XZ-1K
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 18:57:52 +0000
Received: by mail-fx0-f49.google.com with SMTP id 15so2840686fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Oct 2010 11:57:51 -0700 (PDT)
Subject: Re: [PATCH 4/5] mtd/nand: introduce NAND_CREATE_EMPTY_BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-5-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
	<1285782234-32509-5-git-send-email-bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Oct 2010 21:57:48 +0300
Message-ID: <1285959468.32172.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-29 at 19:43 +0200, Sebastian Andrzej Siewior wrote:
> it will create an empty BBT table without considering vendor's BBT
> information. Vendor's information may be unavailable if the NAND
> controller has a different DATA & OOB layout or if this information is
> allready purged.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

This one does not apply on top of your patch 3/5 v2, could you please
refresh it and resend?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
