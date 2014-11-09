Date: Sun, 9 Nov 2014 07:23:12 -0500 (EST)
From: Rodrigo Freire <rfreire@redhat.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <1874445287.7454806.1415535792984.JavaMail.zimbra@redhat.com>
In-Reply-To: <2086372266.7454667.1415535533979.JavaMail.zimbra@redhat.com>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
 <2086372266.7454667.1415535533979.JavaMail.zimbra@redhat.com>
Subject: [PATCH v3 3/3] mtd: block2mtd: Removes PAGE_MASK as a index to
 partition size
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Herton Krzesinski <hkrzesin@redhat.com>,
 =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 Felix Fietkau <nbd@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Felix Fietkau <nbd@openwrt.org>

mtd: block2mtd: Removes PAGE_MASK as a index to partition size

PAGE_MASK is no longer needed with the new term.
This patch keeps the device size aligned with the erase_size.

Signed-off-by: Felix Fietkau <nbd@openwrt.org>
Signed-off-by: Rodrigo Freire <rfreire@redhat.com>
Signed-off-by: Herton Krzesinski <herton@redhat.com>
---
V3: Separated on a single patch
--- a/drivers/mtd/devices/block2mtd.c	2014-11-07 17:40:58.688747820 -0200
+++ b/drivers/mtd/devices/block2mtd.c	2014-11-07 17:41:28.054750893 -0200
@@ -291,8 +291,7 @@ static struct block2mtd_dev *add_device(
 		goto err_destroy_mutex;
 
 	dev->mtd.name = name;
-
-	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.size = dev->blkdev->bd_inode->i_size & ~(erase_size - 1);
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = 1;
 	dev->mtd.writebufsize = PAGE_SIZE;
---
1.7.1
