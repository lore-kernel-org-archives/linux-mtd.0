Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWrJa-0001M0-U8
	for linux-mtd@lists.infradead.org; Thu, 29 Mar 2007 05:53:07 -0400
Subject: Re: [PATCH] [JFFS2] Prevent list corruption when handling write errors
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <460B722F.9020604@nokia.com>
References: <460B722F.9020604@nokia.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 29 Mar 2007 11:52:53 +0200
Message-Id: <1175161973.2135.1.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-29 at 11:00 +0300, Adrian Hunter wrote:
> If a write error occurs, the affected block is placed on the
> bad_used_list.  In the case that the write error occured
> when writing summary data the block was also being placed on
> the dirty_list, which caused list corruption and ultimately
> a soft lockup in jffs2_mark_node_obsolete. This fixes that.

I thougth that node obsoleting was disabled when summary is active?

 Jocke
