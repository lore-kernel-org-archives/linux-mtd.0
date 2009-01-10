Message-ID: <49682F42.8070304@oracle.com>
Date: Fri, 09 Jan 2009 21:16:50 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: mtd/lpddr/qinfo_probe.c needs lpddr_cmds to be compiled
References: <20090110021641.GA26951@orion>
In-Reply-To: <20090110021641.GA26951@orion>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	akorolev@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander Beregalov wrote:
> drivers/built-in.o: In function `lpddr_probe':
> drivers/mtd/lpddr/qinfo_probe.c:215:
> undefined reference to `lpddr_cmdset'
> 
> # CONFIG_MTD_LPDDR is not set
> CONFIG_MTD_QINFO_PROBE=y
> --

This patch has been posted, just needs to be merged (hint):
---


Signed-off-by: Alexey Korolev <akorolev@infradead.org>
---
diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
index acd4ea9..5a401d8 100644
--- a/drivers/mtd/lpddr/Kconfig
+++ b/drivers/mtd/lpddr/Kconfig
@@ -12,6 +12,7 @@ config MTD_LPDDR
 	  DDR memories, intended for battery-operated systems.
 
 config MTD_QINFO_PROBE
+	depends on MTD_LPDDR
 	tristate "Detect flash chips by QINFO probe"
 	help
 	    Device Information for LPDDR chips is offered through the Overlay
