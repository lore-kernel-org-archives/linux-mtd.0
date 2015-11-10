Received: from smtprelay0183.hostedemail.com ([216.40.44.183]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwDjb-00034V-Pf
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 18:33:36 +0000
Message-ID: <1447180387.2701.68.camel@perches.com>
Subject: [PATCH] mtd: phram: error handling
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>, Saurabh Sengar
 <saurabh.truth@gmail.com>
Cc: andy.shevchenko@gmail.com, joern@lazybastard.org, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2015 10:33:07 -0800
In-Reply-To: <20151110182047.GP12143@google.com>
References: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
 <1447050198-20562-1-git-send-email-saurabh.truth@gmail.com>
 <20151110182047.GP12143@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
---
> Did you notice that
> there's a "return" statement embedded in the parse_err() macro? So there
> was no bug in the first place.

 drivers/mtd/devices/phram.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 8b66e52..d93b85e 100644
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
+		return 1;
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
+		return 1;
+	}
 
-	if (!token[2])
-		parse_err("not enough arguments\n");
+	if (!token[2]) {
+		pr_err("not enough arguments\n");
+		return 1;
+	}
 
 	ret = parse_name(&name, token[0]);
 	if (ret)
@@ -248,13 +249,15 @@ static int phram_setup(const char *val)
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
 		kfree(name);
-		parse_err("illegal start address\n");
+		pr_err("invalid start address\n");
+		return 1;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
 		kfree(name);
-		parse_err("illegal device length\n");
+		pr_err("invalid device length\n");
+		return 1;
 	}
 
 	ret = register_device(name, start, len);
