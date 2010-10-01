Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1lmm-0001tO-4S
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 20:00:54 +0000
Received: by bwz19 with SMTP id 19so3307799bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Oct 2010 13:00:51 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand: introduce NAND_CREATE_EMPTY_BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20101001193737.GA28639@www.tglx.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
	<1285782234-32509-5-git-send-email-bigeasy@linutronix.de>
	<1285959468.32172.2.camel@brekeke> <20101001193737.GA28639@www.tglx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Oct 2010 23:00:48 +0300
Message-ID: <1285963248.32172.11.camel@brekeke>
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

On Fri, 2010-10-01 at 21:37 +0200, Sebastian Andrzej Siewior wrote:
> it will create an empty BBT table without considering vendor's BBT
> information. Vendor's information may be unavailable if the NAND
> controller has a different DATA & OOB layout or this information may be
> allready purged.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Pushed to l2-mtd-2.6.git, and the nandsim patch as well.

git.infradead.org is down now for some reasons, but when it is up, I'll
push my tree out.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
