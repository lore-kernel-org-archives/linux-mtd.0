Received: from demumfd001.nsn-inter.net ([93.183.12.32])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRPVs-0006Ll-MY
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 16:43:01 +0000
Message-ID: <524C4CF5.7060601@nsn.com>
Date: Wed, 02 Oct 2013 18:42:29 +0200
From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: phram: Make phram 64-bit compatible
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd: phram: Make phram 64-bit compatible

phram was 32-bit limited by design. Machines are growing up, but phram
module is still useful. Update it. The patch is bigger than minimum,
because simple_strtoul() is obsolete.

Tested on MIPS64 and compile-tested for PPC (32 bit).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nsn.com>

---
--- linux.orig/drivers/mtd/devices/phram.c
+++ linux/drivers/mtd/devices/phram.c
@@ -94,7 +94,7 @@ static void unregister_devices(void)
 	}
 }

-static int register_device(char *name, unsigned long start, unsigned long len)
+static int register_device(char *name, phys_addr_t start, size_t len)
 {
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
@@ -141,35 +141,35 @@ out0:
 	return ret;
 }

-static int ustrtoul(const char *cp, char **endp, unsigned int base)
+static int parse_num64(uint64_t *num64, char *token)
 {
-	unsigned long result = simple_strtoul(cp, endp, base);
+	size_t len;
+	int shift = 0;
+	int ret;

-	switch (**endp) {
-	case 'G':
-		result *= 1024;
-	case 'M':
-		result *= 1024;
-	case 'k':
-		result *= 1024;
+	len = strlen(token);
 	/* By dwmw2 editorial decree, "ki", "Mi" or "Gi" are to be used. */
-		if ((*endp)[1] == 'i')
-			(*endp) += 2;
+	if (len > 2) {
+		if (token[len - 1] == 'i') {
+			switch (token[len - 2]) {
+			case 'G':
+				shift += 10;
+			case 'M':
+				shift += 10;
+			case 'k':
+				shift += 10;
+				token[len - 2] = 0;
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
 	}
-	return result;
-}
-
-static int parse_num32(uint32_t *num32, const char *token)
-{
-	char *endp;
-	unsigned long n;

-	n = ustrtoul(token, &endp, 0);
-	if (*endp)
-		return -EINVAL;
+	ret = kstrtou64(token, 0, num64);
+	*num64 <<= shift;

-	*num32 = n;
-	return 0;
+	return ret;
 }

 static int parse_name(char **pname, const char *token)
@@ -209,19 +209,19 @@ static inline void kill_final_newline(ch
  * This shall contain the module parameter if any. It is of the form:
  * - phram=<device>,<address>,<size> for module case
  * - phram.phram=<device>,<address>,<size> for built-in case
- * We leave 64 bytes for the device name, 12 for the address and 12 for the
+ * We leave 64 bytes for the device name, 20 for the address and 20 for the
  * size.
  * Example: phram.phram=rootfs,0xa0000000,512Mi
  */
-static __initdata char phram_paramline[64+12+12];
+static __initdata char phram_paramline[64 + 20 + 20];

 static int __init phram_setup(const char *val)
 {
-	char buf[64+12+12], *str = buf;
+	char buf[64 + 20 + 20], *str = buf;
 	char *token[3];
 	char *name;
-	uint32_t start;
-	uint32_t len;
+	uint64_t start;
+	uint64_t len;
 	int i, ret;

 	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
@@ -243,13 +243,13 @@ static int __init phram_setup(const char
 	if (ret)
 		return ret;

-	ret = parse_num32(&start, token[1]);
+	ret = parse_num64(&start, token[1]);
 	if (ret) {
 		kfree(name);
 		parse_err("illegal start address\n");
 	}

-	ret = parse_num32(&len, token[2]);
+	ret = parse_num64(&len, token[2]);
 	if (ret) {
 		kfree(name);
 		parse_err("illegal device length\n");
@@ -257,7 +257,7 @@ static int __init phram_setup(const char

 	ret = register_device(name, start, len);
 	if (!ret)
-		pr_info("%s device: %#x at %#x\n", name, len, start);
+		pr_info("%s device: %#llx at %#llx\n", name, len, start);
 	else
 		kfree(name);
