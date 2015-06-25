From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH V2 0/2] mtd: nandsim: fix error handling
Date: Thu, 25 Jun 2015 00:46:47 +0000
Message-ID: <1435193209-54305-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: richard@nod.at, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

V2:
Resend the patches against l2-mtd/master.

V1:
These 2 patches fix error handling when nandsim initialization fails.

In alloc_device(), if creating slab memory fails, free_device() will try
to destroy the slab memory without checking if it exists.  PATCH 1 fixes
it.

If something goes wrong in init_nandsim(), it calls free_device() before
returning. However, the caller of init_nandsim() - ns_init_module() - also
does the cleanup by calling free_nandsim(). This causes double free. PATCH
2 fixes it.

Thanks,
Sheng

Sheng Yong (2):
  mtd: nandsim: fix free of NULL pointer
  mtd: nandsim: fix double free

 drivers/mtd/nand/nandsim.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

-- 
1.8.3.4
