Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgwzK-00021X-DI
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2012 11:52:51 +0000
Message-ID: <1340106762.1936.25.camel@x61.thuisdomein>
Subject: [PATCH] mtd: chips: reorganize Kconfig help on swapping
From: Paul Bolle <pebolle@tiscali.nl>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 19 Jun 2012 13:52:42 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Kconfig help on "Flash cmd/query data swapping" still mentions
LART_ENDIAN_BYTE. That option used to be relevant for setting
CONFIG_MTD_CFI_LART_BIT_SWAP. That option and macro got both removed in
v2.4.11-pre4. So, although LART endianness sounds intriguing, that part
of the help text can be removed.

And, while we're touching this choice, move the help text up one level.
Currently it's available under the "NO" option, while it's relevant for
all three options.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
0) Tested only with "make menuconfig".

1) Triggers a checkpatch warning: "please write a paragraph that
describes the config symbol fully". That's a bit of a false positive
here (also see the comment starting at line 1708 in checkpatch.pl).

 drivers/mtd/chips/Kconfig |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index b1e3c26..e469b01 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -43,9 +43,6 @@ choice
 	prompt "Flash cmd/query data swapping"
 	depends on MTD_CFI_ADV_OPTIONS
 	default MTD_CFI_NOSWAP
-
-config MTD_CFI_NOSWAP
-	bool "NO"
 	---help---
 	  This option defines the way in which the CPU attempts to arrange
 	  data bits when writing the 'magic' commands to the chips. Saying
@@ -55,12 +52,8 @@ config MTD_CFI_NOSWAP
 	  Specific arrangements are possible with the BIG_ENDIAN_BYTE and
 	  LITTLE_ENDIAN_BYTE, if the bytes are reversed.
 
-	  If you have a LART, on which the data (and address) lines were
-	  connected in a fashion which ensured that the nets were as short
-	  as possible, resulting in a bit-shuffling which seems utterly
-	  random to the untrained eye, you need the LART_ENDIAN_BYTE option.
-
-	  Yes, there really exists something sicker than PDP-endian :)
+config MTD_CFI_NOSWAP
+	bool "NO"
 
 config MTD_CFI_BE_BYTE_SWAP
 	bool "BIG_ENDIAN_BYTE"
-- 
1.7.7.6
