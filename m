Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf67E-00042u-3D
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 07:37:12 +0000
Received: by fxm19 with SMTP id 19so6880311fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jan 2011 23:36:28 -0800 (PST)
Subject: Re: [PATCH v2 3/3] UBIFS: do not start the commit if there is
	nothing to commit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <1295335817.2470.31.camel@koala>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala>  <4D33FB78.5010208@nokia.com>
	<1295335817.2470.31.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 09:36:25 +0200
Message-ID: <1295336185.2470.33.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Hans J. Koch" <hjk@linutronix.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-18 at 09:30 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> This patch fixes suboptimal UBIFS 'sync_fs()' implementation which causes
> flash I/O even if the file-system is synchronized. E.g., a 'printk()'
> in the MTD erasure function (e.g., 'nand_erase_nand()') can show that
> for every 'sync' shell command UBIFS erases at least one eraseblock.
> 
> So '$ while true; do sync; done' will cause huge amount of flash I/O.
> 
> The reason for this is that UBIFS commits in 'sync_fs()', and starts the
> commit even if there is nothing to commit, e.g., it anyway changes the
> log. This patch adds a check in the 'do_commit()' UBIFS functions which
> prevents the commit if there is nothing to commit.
> 
> Reported-by: Hans J. Koch <hjk@linutronix.de>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Adrian, I've also pushed these 3 patches to ubifs-2.6.git / master.
Could you please validate them?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
