From: David Woodhouse <dwmw2@infradead.org>
To: Fadi Nasser <fnasser@TidalNetworks.net>
In-Reply-To: <52BBA75459915749B68F93B604B636CD136C43@neptune.TidalNetworks.net>
References: <52BBA75459915749B68F93B604B636CD136C43@neptune.TidalNetworks.net>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 18:18:55 +0000
Message-Id: <1103653135.6111.109.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Pedro Aguilar <paguilar@junkerhq.net>, linux-mtd@lists.infradead.org,
	jffs-dev@axis.com
Subject: Re: JFFS2 for multi-partition Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-12-21 at 09:51 -0800, Fadi Nasser wrote:
> "mknod /dev/mtdblock1 b 31 0"

Don't. /dev/mtdblock1 should have minor number 1. The offset which JFFS2
sees is the offset within the _partition_ not on the raw device.
-- 
dwmw2
