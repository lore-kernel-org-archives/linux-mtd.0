Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UmoQi-0003eT-8p
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 17:01:52 +0000
Date: Wed, 12 Jun 2013 10:01:27 -0700
From: Tony Lindgren <tony@atomide.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v4 2/3] arm: gpmc: Low power transition support
Message-ID: <20130612170126.GI8164@atomide.com>
References: <1371034858-19984-1-git-send-email-pekon@ti.com>
 <1371034858-19984-3-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371034858-19984-3-git-send-email-pekon@ti.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Pekon Gupta <pekon@ti.com> [130612 04:07]:
> From: avinash philip <avinashphilip@ti.com>
> 
> With GPMC converted to platform driver recently, adds low power
> transition support in driver itself.

Applying the first two patches of this series into omap-for-v3.11/gpmc.
Not taking the MTD patch, if it has dependencies to the first two
patches please let me know and also get an ack from Artem if you
want me to take it.

Regards,

Tony
