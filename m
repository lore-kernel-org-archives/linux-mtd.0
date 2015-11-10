Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwEag-0002Fy-Uw
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 19:28:27 +0000
Received: by padfb7 with SMTP id fb7so778992pad.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 11:28:04 -0800 (PST)
From: Saurabh Sengar <saurabh.truth@gmail.com>
To: computersforpeace@gmail.com,
	joe@perches.com
Cc: andy.shevchenko@gmail.com, joern@lazybastard.org, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Saurabh Sengar <saurabh.truth@gmail.com>
Subject: [PATCH] mtd: phram: error handling
Date: Wed, 11 Nov 2015 00:57:55 +0530
Message-Id: <1447183675-4840-1-git-send-email-saurabh.truth@gmail.com>
In-Reply-To: <20151110190343.GR12143@google.com>
References: <20151110190343.GR12143@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Expand parse_err macro with hidden flow in-place.
Remove the now unused parse_err macro.

Miscellanea:

o Use invalid not illegal for error messages

Noticed-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Joe Perches <joe@perches.com>
Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
---
>> I think -EINVAL makes more sense than 1. That
>> could be a subsequent patch, I suppose.

>That means you have to trace all the callers
>to verify that converting 1 to -22 is acceptable.

>Maybe Saurabh wants to do that.

I have checked that function is called only by init and module param,
and I understand in both the cases -EINVAL is a valid return type.
Sorry, I am not able to test the driver, sending the patch as asked above.
Also sorry for the noise I created in first report

 drivers/mtd/devices/phram.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 8b66e52..e39fe5c 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -199,11 +199,6 @@ static inline void kill_final_newline(char *str)
 }
 
 
-#define parse_err(fmt, args...) do {	\
-	pr_err(fmt , ## args);	\
-	return 1;		\
-} while (0)
-
 #ifndef MODULE
 static int phram_init_called;
 /*
@@ -226,8 +221,10 @@ static int phram_setup(const char *val)
 	uint64_t len;
 	int i, ret;
 
-	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
-		parse_err("parameter too long\n");
+	if (strnlen(val, sizeof(buf)) >= sizeof(buf)) {
+		pr_err("parameter too long\n");
+		return -EINVAL;
+	}
 
 	strcpy(str, val);
 	kill_final_newline(str);
@@ -235,11 +232,15 @@ static int phram_setup(const char *val)
 	for (i = 0; i < 3; i++)
 		token[i] = strsep(&str, ",");
 
-	if (str)
-		parse_err("too many arguments\n");
+	if (str) {
+		pr_err("too many arguments\n");
+		return -EINVAL;
+	}
 
-	if (!token[2])
-		parse_err("not enough arguments\n");
+	if (!token[2]) {
+		pr_err("not enough arguments\n");
+		return -EINVAL;
+	}
 
 	ret = parse_name(&name, token[0]);
 	if (ret)
@@ -248,13 +249,15 @@ static int phram_setup(const char *val)
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
 		kfree(name);
-		parse_err("illegal start address\n");
+		pr_err("invalid start address\n");
+		return -EINVAL;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
 		kfree(name);
-		parse_err("illegal device length\n");
+		pr_err("invalid device length\n");
+		return -EINVAL;
 	}
 
 	ret = register_device(name, start, len);
-- 
1.9.1
