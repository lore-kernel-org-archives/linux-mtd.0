Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wxury-0007sG-MI
 for linux-mtd@lists.infradead.org; Fri, 20 Jun 2014 09:12:28 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so2917036pac.11
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jun 2014 02:12:01 -0700 (PDT)
From: Ted Juan <ted.juan@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: devices: elm: fix elm_context_save() and
 elm_context_restore() functions
Date: Fri, 20 Jun 2014 17:11:56 +0800
Message-Id: <1403255516-28413-1-git-send-email-ted.juan@gmail.com>
Cc: Ted Juan <ted.juan@weintek.com>, linux-mtd@lists.infradead.org,
 pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ted Juan <ted.juan@weintek.com>

 These two function's switch case lack the 'break' that make them always return error.


Signed-off-by: Ted Juan <ted.juan@weintek.com>
---
 drivers/mtd/devices/elm.c  |    2 ++
 "toreqq\033\033qq\033\033" |   20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 "toreqq\033\033qq\033\033"

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 7df8694..b4f61c7 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -475,6 +475,7 @@ static int elm_context_save(struct elm_info *info)
 					ELM_SYNDROME_FRAGMENT_1 + offset);
 			regs->elm_syndrome_fragment_0[i] = elm_read_reg(info,
 					ELM_SYNDROME_FRAGMENT_0 + offset);
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -520,6 +521,7 @@ static int elm_context_restore(struct elm_info *info)
 					regs->elm_syndrome_fragment_1[i]);
 			elm_write_reg(info, ELM_SYNDROME_FRAGMENT_0 + offset,
 					regs->elm_syndrome_fragment_0[i]);
+			break;
 		default:
 			return -EINVAL;
 		}
diff --git "a/toreqq\033\033qq\033\033" "b/toreqq\033\033qq\033\033"
new file mode 100644
index 0000000..4a7b35c
--- /dev/null
+++ "b/toreqq\033\033qq\033\033"
@@ -0,0 +1,20 @@
+[1mdiff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c[m
+[1mindex 7df8694..8e6ba6c 100644[m
+[1m--- a/drivers/mtd/devices/elm.c[m
+[1m+++ b/drivers/mtd/devices/elm.c[m
+[36m@@ -475,6 +475,7 @@[m [mstatic int elm_context_save(struct elm_info *info)[m
+ 					ELM_SYNDROME_FRAGMENT_1 + offset);[m
+ 			regs->elm_syndrome_fragment_0[i] = elm_read_reg(info,[m
+ 					ELM_SYNDROME_FRAGMENT_0 + offset);[m
+[32m+[m[32m                        break;[m
+ 		default:[m
+ 			return -EINVAL;[m
+ 		}[m
+[36m@@ -520,6 +521,7 @@[m [mstatic int elm_context_restore(struct elm_info *info)[m
+ 					regs->elm_syndrome_fragment_1[i]);[m
+ 			elm_write_reg(info, ELM_SYNDROME_FRAGMENT_0 + offset,[m
+ 					regs->elm_syndrome_fragment_0[i]);[m
+[32m+[m[32m                        break;[m
+ 		default:[m
+ 			return -EINVAL;[m
+ 		}[m
-- 
1.7.9.5
