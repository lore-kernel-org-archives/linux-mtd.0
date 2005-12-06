Received: from mail2.ameuro.de ([195.140.232.8])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjZeT-0005Y6-P4
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 05:02:33 -0500
Received: from mail.alarsen.net (p54AC11E7.dip0.t-ipconnect.de [84.172.17.231])
	by mail2.ameuro.de (Postfix) with ESMTP id 17038358C5AE
	for <linux-mtd@lists.infradead.org>;
	Tue,  6 Dec 2005 10:40:50 +0100 (CET)
Received: from ecxwww1.reanet.de (ecxwww1.alarsen.net [192.168.96.15])
	by mail.alarsen.net (8.13.3/8.13.3/AL/2005-11-26) with ESMTP id
	jB69ef5v023572
	for <linux-mtd@lists.infradead.org>; Tue, 6 Dec 2005 10:40:46 +0100
Date: Tue, 06 Dec 2005 09:40:40 +0000
From: Anders Larsen <al@alarsen.net>
To: linux-mtd@lists.infradead.org
Message-Id: <1133862040l.8661l.0l@ecxwww1.reanet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH][CHIPS] remove obsolete Kconfig options
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[CHIPS] remove obsolete Kconfig options

Remove the obsolete Kconfig options MTD_CFI_AMDSTD_RETRY
and MTD_CFI_AMDSTD_RETRY_MAX
(The code that depended on these was removed in february 2004;
 Config.in was updated accordingly but Kconfig forgotten)

Signed-off-by: Anders Larsen <al@alarsen.net>

---

 drivers/mtd/chips/Kconfig |   21 ---------------------
 1 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index eafa23f..28a976c 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -200,27 +200,6 @@ config MTD_CFI_AMDSTD
 	  provides support for one of those command sets, used on chips
 	  including the AMD Am29LV320.
=20
-config MTD_CFI_AMDSTD_RETRY
-	int "Retry failed commands (erase/program)"
-	depends on MTD_CFI_AMDSTD
-	default "0"
-	help
-	  Some chips, when attached to a shared bus, don't properly filter
-	  bus traffic that is destined to other devices.  This broken
-	  behavior causes erase and program sequences to be aborted when
-	  the sequences are mixed with traffic for other devices.
-
-	  SST49LF040 (and related) chips are know to be broken.
-
-config MTD_CFI_AMDSTD_RETRY_MAX
-	int "Max retries of failed commands (erase/program)"
-	depends on MTD_CFI_AMDSTD_RETRY
-	default "0"
-	help
-	  If you have an SST49LF040 (or related chip) then this value should
-	  be set to at least 1.  This can also be adjusted at driver load
-	  time with the retry_cmd_max module parameter.
-
 config MTD_CFI_STAA
 	tristate "Support for ST (Advanced Architecture) flash chips"
 	depends on MTD_GEN_PROBE
