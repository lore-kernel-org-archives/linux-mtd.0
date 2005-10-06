Received: from mail.glaze.se ([212.209.188.162] helo=rocket.glaze.se)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENcDA-00022V-98
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2005 16:19:41 -0400
From: "Jan Pedersen" <jan.pedersen@glaze.dk>
To: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Date: Thu, 6 Oct 2005 22:19:20 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <20051005132548.GB1290@wohnheim.fh-wedel.de>
Message-Id: <20051006201924.67089376459@rocket.glaze.se>
Cc: linux-mtd@lists.infradead.org
Subject: RE: [patch] cfi: prevent kernel panic with cfi flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hmm.  Is there a good reason to pick (HZ) instead of (HZ/1000 + 1)?
> The latter would be one jiffy more than 1ms, much closer to intended
> value and still always nonzero.

It is not that important what the value is set to. I just checked the
datasheet, and my flash chips have a word write timing of maximum 210 uS
(typical 9 uS). After the 210 uS, dq5 is raised to indicate a write timeout.
This is detected by the sw, so the 1 ms timeout is never reached unless
there is a bug in hw or sw. Assuming that other flash chips have similar
write timings, 1 ms is enough, however, since the kernel panics instead
doing some retry, reaching the timeout means a dead box. Since the timeout
is initialized BEFORE the first poll, and the last time_after() call is done
AFTER the last poll, the actual timeout might be lower than intended if
jiffies ticks just after timeout initialization. So I simply picked the
value HZ.
