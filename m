Received: from cheetah-1-pt.tunnel.tserv4.nyc4.ipv6.he.net
 ([2001:470:1f06:1317::2] helo=cheetah.fastcat.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOulk-0003yI-7y
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 19:29:05 +0000
Date: Wed, 25 Sep 2013 15:25:55 -0400 (EDT)
From: Matthew Gabeler-Lee <fastcat@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nandsim: Allow nandsim to re-use persisted data
Message-ID: <alpine.DEB.2.10.1309251518370.22371@cheetah.fastcat.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd: nandsim: Allow nandsim to re-use persisted data

Add optional (default disabled) module parameter to nandsim to instruct it
to assume that the cache file already has valid data in it.  This allows
data written to the cache file (or device) to be re-used across reloads of
the nandsim module, and thus reboots of the host, in much the same way that
block2mtd allows.

Signed-off-by: Matthew Gabeler-Lee <matthew@beechwoods.com>
---
  drivers/mtd/nand/nandsim.c | 42 ++++++++++++++++++++++++++++++++++++++----
  1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index bdc1d15..65ac60f 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -109,6 +109,7 @@ static unsigned int bitflips = 0;
  static char *gravepages = NULL;
  static unsigned int overridesize = 0;
  static char *cache_file = NULL;
+static uint cache_file_written = 0;
  static unsigned int bbt;
  static unsigned int bch;

@@ -133,6 +134,7 @@ module_param(bitflips,       uint, 0400);
  module_param(gravepages,     charp, 0400);
  module_param(overridesize,   uint, 0400);
  module_param(cache_file,     charp, 0400);
+module_param(cache_file_written, uint, 0400);
  module_param(bbt,	     uint, 0400);
  module_param(bch,	     uint, 0400);

@@ -166,6 +168,7 @@ MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the I
  				 "The size is specified in erase blocks and as the exponent of a power of two"
  				 " e.g. 5 means a size of 32 erase blocks");
  MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of memory");
+MODULE_PARM_DESC(cache_file_written, "Assume any pages in cache file have already been written, use their existing contents");
  MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in data area");
  MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
  				 "be correctable in 512-byte blocks");
@@ -592,6 +595,9 @@ static int alloc_device(struct nandsim *ns)
  			err = -ENOMEM;
  			goto err_close;
  		}
+		if (cache_file_written) {
+			memset(ns->pages_written, 0xFF, ns->geom.pgnum);
+		}
  		ns->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
  		if (!ns->file_buf) {
  			NS_ERR("alloc_device: unable to allocate file buf\n");
@@ -1484,7 +1490,17 @@ static void read_page(struct nandsim *ns, int num)
  			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
  			tx = read_file(ns, ns->cfile, ns->buf.byte, num, pos);
  			if (tx != num) {
-				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				if (ns->pages_written[ns->regs.row] == 0xFF) {
+					NS_WARN("read_page: read error assuming unwritten for page %d ret %ld\n", ns->regs.row, (long)tx);
+					ns->pages_written[ns->regs.row] = 0;
+					memset(ns->buf.byte, 0xFF, num);
+					tx = write_file(ns, ns->cfile, ns->buf.byte, num, pos);
+					if (tx != num) {
+						NS_ERR("read_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+					}
+				} else {
+					NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				}
  				return;
  			}
  			do_bit_flips(ns, num);
@@ -1515,11 +1531,22 @@ static void erase_sector(struct nandsim *ns)
  	int i;

  	if (ns->cfile) {
-		for (i = 0; i < ns->geom.pgsec; i++)
+		loff_t pos;
+		ssize_t tx;
+ 
+		memset(ns->file_buf, 0xff, ns->geom.pgszoob);
+		for (i = 0; i < ns->geom.pgsec; i++) {
  			if (__test_and_clear_bit(ns->regs.row + i,
  						 ns->pages_written)) {
  				NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
+				pos = (loff_t)(ns->regs.row + i) * ns->geom.pgszoob;
+				tx = write_file(ns, ns->cfile, ns->file_buf, ns->geom.pgszoob, pos);
+				if (tx != ns->geom.pgszoob) {
+					NS_ERR("erase_sector: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				}
  			}
+			ns->pages_written[ns->regs.row + i] = 0;
+		}
  		return;
  	}

@@ -1558,8 +1585,15 @@ static int prog_page(struct nandsim *ns, int num)
  			all = 0;
  			tx = read_file(ns, ns->cfile, pg_off, num, off);
  			if (tx != num) {
-				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
-				return -1;
+				if (ns->pages_written[ns->regs.row] == 0xFF) {
+					NS_WARN("prog_page: read error assuming unwritten for page %d ret %ld\n", ns->regs.row, (long)tx);
+					ns->pages_written[ns->regs.row] = 0;
+					all = 1;
+					memset(ns->file_buf, 0xff, ns->geom.pgszoob);
+				} else {
+					NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+					return -1;
+				}
  			}
  		}
  		for (i = 0; i < num; i++)
-- 
1.8.4.rc3
