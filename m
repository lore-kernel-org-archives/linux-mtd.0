Received: from imladris.demon.co.uk ([193.237.130.41]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A2Yad-0000c4-63
	for <linux-mtd@lists.infradead.org>; Thu, 25 Sep 2003 17:03:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Cam Mayor <cmayor@iders.ca>
In-Reply-To: <03092510572000.10451@kilauea.iders.ca>
References: <20030925063448.GD25427@pengutronix.de>
	 <03092510572000.10451@kilauea.iders.ca>
Message-Id: <1064507502.3884.52.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Thu, 25 Sep 2003 17:31:43 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Robert Schwebel <robert@schwebel.de>
Subject: Re: mtd utilities
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The only 'official' releases of the kernel code are those which I send
to Marcelo and/or Linus for inclusion in their kernel trees.

There's been no release of the userspace code, and won't be until they
no longer include kernel-private headers. I need to split
linux/mtd/mtd.h into kernel-space and shared-abi parts.

-- 
dwmw2
