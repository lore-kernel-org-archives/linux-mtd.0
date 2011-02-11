Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnuPu-0008CA-RO
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:56:15 +0000
Received: by wyf22 with SMTP id 22so2440039wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:56:13 -0800 (PST)
Subject: Re: [PATCH] mtd: fix race in cfi_cmdset_0001 driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:55:04 +0200
Message-ID: <1297436104.2760.45.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stefan Bigler <stefan.bigler@keymile.com>, linux-mtd@lists.infradead.org,
	Michael Cashwell <mboards@prograde.net>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-07 at 17:07 +0100, Joakim Tjernlund wrote:
> As inval_cache_and_wait_for_operation() drop and reclaim the lock
> to invalidate the cache, some other thread may suspend the operation
> before reaching the for(;;) loop. Therefore the loop must start with
> checking the chip->state before reading status from the chip.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
