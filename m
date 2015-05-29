From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: use cfi-util in jedecprobe
Date: Fri, 29 May 2015 10:39:28 +0200
Message-ID: <7230287.A5AxNMN3qP@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Denys Vlasenko <dvlasenk@redhat.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A recent change to move cfi helper functions out of line
is causing build errors when cfi-util is a loadable module
and jedecprobe is built-in:

drivers/built-in.o: In function `jedec_reset':
(.text+0x140694): undefined reference to `cfi_send_gen_cmd'
drivers/built-in.o: In function `jedec_probe_chip':
(.text+0x140794): undefined reference to `cfi_build_cmd_addr'

This adds a 'select' for the module containing these functions
from the jedecprobe code, to ensure it is always reachable.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 4612c715a6ea6 ("mtd: cfi: deinline large functions")

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 6f20977f8cf6..63b6b536b044 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -16,6 +16,7 @@ config MTD_CFI
 config MTD_JEDECPROBE
 	tristate "Detect non-CFI AMD/JEDEC-compatible flash chips"
 	select MTD_GEN_PROBE
+	select MTD_CFI_UTIL
 	help
 	  This option enables JEDEC-style probing of flash chips which are not
 	  compatible with the Common Flash Interface, but will use the common
