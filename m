Date: Wed, 14 May 2014 17:19:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: cfi: indent some if statements
Message-ID: <20140514141900.GB18082@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Jingoo Han <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The break statements should be indented another tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 6293855..423666b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -961,7 +961,7 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
 			chipnum++;
 
 			if (chipnum >= cfi->numchips)
-			break;
+				break;
 		}
 	}
 
@@ -1170,7 +1170,7 @@ static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 			chipnum++;
 
 			if (chipnum >= cfi->numchips)
-			break;
+				break;
 		}
 	}
 	return 0;
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 08049f6..09c79bd 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -239,7 +239,7 @@ int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
 			chipnum++;
 
 			if (chipnum >= cfi->numchips)
-			break;
+				break;
 		}
 	}
 
