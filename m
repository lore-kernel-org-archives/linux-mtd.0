From: Arnd Bergmann <arnd@arndb.de>
To: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: export new mtd_mmap_capabilities
Date: Wed, 28 Jan 2015 16:19:31 +0100
Message-ID: <1900951.4yX9yJNQM5@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Tejun Heo <tj@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The recently added mtd_mmap_capabilities can be used from loadable
modules, in particular romfs, but is not exported, so we get

ERROR: "mtd_mmap_capabilities" [fs/romfs/romfs.ko] undefined!

This adds the missing export.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: b4caecd48005f ("fs: introduce f_op->mmap_capabilities for nommu mmap support")

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1eef3b032f08..de7957681680 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -365,6 +365,7 @@ unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
 		return NOMMU_MAP_COPY;
 	}
 }
+EXPORT_SYMBOL_GPL(mtd_mmap_capabilities);
 #endif
 
 /**
