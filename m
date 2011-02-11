Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pntao-00079O-U5
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:03:27 +0000
Received: by wwb17 with SMTP id 17so2551902wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:03:25 -0800 (PST)
Subject: Re: [PATCH] mtd: fix race in cfi_cmdset_0001 driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:02:16 +0200
Message-ID: <1297432936.2760.24.camel@localhost>
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

Am I right that this patch should be ignored and a new patch will be
created?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
