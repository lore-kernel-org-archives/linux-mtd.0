Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcJGB-0005Wj-KJ
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 19:52:42 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH v2] mtd: Make MTD tests cancelable
Date: Sun, 29 Mar 2015 21:52:06 +0200
Message-Id: <1427658726-27068-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I always go nuts when I start an MTD test on a slow device
and have to wait forever until it finishes.
>From the debug output I already know what the issue is but I
have to wait or reset the board hard.
Resetting is often not an option
(remote access, you don't want lose the current state, etc...).

The solution is easy, check for pending signals at key positions
in the code. Using that one can even stop a test by pressing CTRL-C
as insmod/modprobe have SIGINT pending.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
v2: First patch was missing two hunks from my working tree.
    git commit -a vs. git commit ;-\
---
 drivers/mtd/tests/mtd_nandecctest.c |  6 ++++++
 drivers/mtd/tests/mtd_test.h        | 12 ++++++++++++
 drivers/mtd/tests/nandbiterrs.c     |  4 ++++
 drivers/mtd/tests/oobtest.c         | 26 +++++++++++++++++++++-----
 drivers/mtd/tests/pagetest.c        | 10 ++++++++--
 drivers/mtd/tests/readtest.c        |  5 ++++-
 drivers/mtd/tests/speedtest.c       | 36 +++++++++++++++++++++++++++++-------
 drivers/mtd/tests/stresstest.c      |  5 ++++-
 drivers/mtd/tests/subpagetest.c     | 25 ++++++++++++++++++++-----
 drivers/mtd/tests/torturetest.c     | 15 ++++++++++++---
 10 files changed, 120 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index e579f90..7931615 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -9,6 +9,8 @@
 #include <linux/slab.h>
 #include <linux/mtd/nand_ecc.h>
 
+#include "mtd_test.h"
+
 /*
  * Test the implementation for software ECC
  *
@@ -274,6 +276,10 @@ static int nand_ecc_test_run(const size_t size)
 		}
 		pr_info("ok - %s-%zd\n",
 			nand_ecc_test[i].name, size);
+
+		err = mtdtest_relax();
+		if (err)
+			break;
 	}
 error:
 	kfree(error_data);
diff --git a/drivers/mtd/tests/mtd_test.h b/drivers/mtd/tests/mtd_test.h
index f437c77..4b7bee1 100644
--- a/drivers/mtd/tests/mtd_test.h
+++ b/drivers/mtd/tests/mtd_test.h
@@ -1,4 +1,16 @@
 #include <linux/mtd/mtd.h>
+#include <linux/sched.h>
+
+static inline int mtdtest_relax(void)
+{
+	cond_resched();
+	if (signal_pending(current)) {
+		pr_info("aborting test due to pending signal!\n");
+		return -EINTR;
+	}
+
+	return 0;
+}
 
 int mtdtest_erase_eraseblock(struct mtd_info *mtd, unsigned int ebnum);
 int mtdtest_scan_for_bad_eraseblocks(struct mtd_info *mtd, unsigned char *bbt,
diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
index 273f7e5..09a4cca 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -320,6 +320,10 @@ static int overwrite_test(void)
 			break;
 		}
 
+		err = mtdtest_relax();
+		if (err)
+			break;
+
 		opno++;
 	}
 
diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 5e06118..62c7a24 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -112,7 +112,10 @@ static int write_whole_device(void)
 			return err;
 		if (i % 256 == 0)
 			pr_info("written up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			return err;
 	}
 	pr_info("written %u eraseblocks\n", i);
 	return 0;
@@ -310,7 +313,10 @@ static int verify_all_eraseblocks(void)
 			return err;
 		if (i % 256 == 0)
 			pr_info("verified up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			return err;
 	}
 	pr_info("verified %u eraseblocks\n", i);
 	return 0;
@@ -421,7 +427,10 @@ static int __init mtd_oobtest_init(void)
 			goto out;
 		if (i % 256 == 0)
 			pr_info("verified up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("verified %u eraseblocks\n", i);
 
@@ -634,7 +643,11 @@ static int __init mtd_oobtest_init(void)
 				goto out;
 			if (i % 256 == 0)
 				pr_info("written up to eraseblock %u\n", i);
-			cond_resched();
+
+			err = mtdtest_relax();
+			if (err)
+				goto out;
+
 			addr += mtd->writesize;
 		}
 	}
@@ -672,7 +685,10 @@ static int __init mtd_oobtest_init(void)
 		}
 		if (i % 256 == 0)
 			pr_info("verified up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("verified %u eraseblocks\n", i);
 
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 88296e8..ba1890d 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -407,7 +407,10 @@ static int __init mtd_pagetest_init(void)
 			goto out;
 		if (i % 256 == 0)
 			pr_info("written up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("written %u eraseblocks\n", i);
 
@@ -422,7 +425,10 @@ static int __init mtd_pagetest_init(void)
 			goto out;
 		if (i % 256 == 0)
 			pr_info("verified up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("verified %u eraseblocks\n", i);
 
diff --git a/drivers/mtd/tests/readtest.c b/drivers/mtd/tests/readtest.c
index a54cf15..a3196b7 100644
--- a/drivers/mtd/tests/readtest.c
+++ b/drivers/mtd/tests/readtest.c
@@ -190,7 +190,10 @@ static int __init mtd_readtest_init(void)
 			if (!err)
 				err = ret;
 		}
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 
 	if (err)
diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index 5ee9f70..c0cec35 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -269,7 +269,10 @@ static int __init mtd_speedtest_init(void)
 		err = write_eraseblock(i);
 		if (err)
 			goto out;
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	stop_timing();
 	speed = calc_speed();
@@ -284,7 +287,10 @@ static int __init mtd_speedtest_init(void)
 		err = read_eraseblock(i);
 		if (err)
 			goto out;
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	stop_timing();
 	speed = calc_speed();
@@ -303,7 +309,10 @@ static int __init mtd_speedtest_init(void)
 		err = write_eraseblock_by_page(i);
 		if (err)
 			goto out;
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	stop_timing();
 	speed = calc_speed();
@@ -318,7 +327,10 @@ static int __init mtd_speedtest_init(void)
 		err = read_eraseblock_by_page(i);
 		if (err)
 			goto out;
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	stop_timing();
 	speed = calc_speed();
@@ -337,7 +349,10 @@ static int __init mtd_speedtest_init(void)
 		err = write_eraseblock_by_2pages(i);
 		if (err)
 			goto out;
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	stop_timing();
 	speed = calc_speed();
@@ -352,7 +367,10 @@ static int __init mtd_speedtest_init(void)
 		err = read_eraseblock_by_2pages(i);
 		if (err)
 			goto out;
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	stop_timing();
 	speed = calc_speed();
@@ -385,7 +403,11 @@ static int __init mtd_speedtest_init(void)
 			err = multiblock_erase(i, j);
 			if (err)
 				goto out;
-			cond_resched();
+
+			err = mtdtest_relax();
+			if (err)
+				goto out;
+
 			i += j;
 		}
 		stop_timing();
diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index c9d42cc..c4f5a90 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -221,7 +221,10 @@ static int __init mtd_stresstest_init(void)
 		err = do_operation();
 		if (err)
 			goto out;
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("finished, %d operations done\n", op);
 
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index 7b59ef5..3395f84 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -269,7 +269,10 @@ static int verify_all_eraseblocks_ff(void)
 			return err;
 		if (i % 256 == 0)
 			pr_info("verified up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			return err;
 	}
 	pr_info("verified %u eraseblocks\n", i);
 	return 0;
@@ -346,7 +349,10 @@ static int __init mtd_subpagetest_init(void)
 			goto out;
 		if (i % 256 == 0)
 			pr_info("written up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("written %u eraseblocks\n", i);
 
@@ -360,7 +366,10 @@ static int __init mtd_subpagetest_init(void)
 			goto out;
 		if (i % 256 == 0)
 			pr_info("verified up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("verified %u eraseblocks\n", i);
 
@@ -383,7 +392,10 @@ static int __init mtd_subpagetest_init(void)
 			goto out;
 		if (i % 256 == 0)
 			pr_info("written up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("written %u eraseblocks\n", i);
 
@@ -398,7 +410,10 @@ static int __init mtd_subpagetest_init(void)
 			goto out;
 		if (i % 256 == 0)
 			pr_info("verified up to eraseblock %u\n", i);
-		cond_resched();
+
+		err = mtdtest_relax();
+		if (err)
+			goto out;
 	}
 	pr_info("verified %u eraseblocks\n", i);
 
diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index b55bc52..ac290e4 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -279,7 +279,10 @@ static int __init tort_init(void)
 					       " for 0xFF... pattern\n");
 					goto out;
 				}
-				cond_resched();
+
+				err = mtdtest_relax();
+				if (err)
+					goto out;
 			}
 		}
 
@@ -294,7 +297,10 @@ static int __init tort_init(void)
 			err = write_pattern(i, patt);
 			if (err)
 				goto out;
-			cond_resched();
+
+			err = mtdtest_relax();
+			if (err)
+				goto out;
 		}
 
 		/* Verify what we wrote */
@@ -314,7 +320,10 @@ static int __init tort_init(void)
 					       "0x55AA55..." : "0xAA55AA...");
 					goto out;
 				}
-				cond_resched();
+
+				err = mtdtest_relax();
+				if (err)
+					goto out;
 			}
 		}
 
-- 
1.8.4.5
