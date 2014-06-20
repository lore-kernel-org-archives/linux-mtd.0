Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxvBQ-0007TO-Mi
 for linux-mtd@lists.infradead.org; Fri, 20 Jun 2014 09:32:33 +0000
Received: by mail-pd0-f178.google.com with SMTP id r10so2793821pdi.37
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jun 2014 02:32:11 -0700 (PDT)
From: Ted Juan <ted.juan@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: devices: elm: fix elm_context_save() and
 elm_context_restore() functions
Date: Fri, 20 Jun 2014 17:32:05 +0800
Message-Id: <1403256725-28983-1-git-send-email-ted.juan@gmail.com>
In-Reply-To: <1403255516-28413-1-git-send-email-ted.juan@gmail.com>
References: <1403255516-28413-1-git-send-email-ted.juan@gmail.com>
Cc: Ted Juan <ted.juan@gmail.com>, linux-mtd@lists.infradead.org, pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Sorry, last mail has some error. please drop it.

 These two function's switch case lack the 'break' that make them always return error.

Signed-off-by: Ted Juan <ted.juan@gmail.com>
---
 drivers/mtd/devices/elm.c |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
