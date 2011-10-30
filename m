Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKUf2-0002lw-6l
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 12:38:49 +0000
Received: by bkat2 with SMTP id t2so135113bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 05:38:46 -0700 (PDT)
Subject: [PATCH 3/3] Add snappy interface to crypto API
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Sun, 30 Oct 2011 14:38:43 +0200
In-Reply-To: <1319153941-26234-1-git-send-email-andi@firstfloor.org>
References: <1319153941-26234-1-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319978325.2126.35.camel@koala>
Mime-Version: 1.0
Cc: Andi Kleen <ak@linux.intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andi Kleen <ak@linux.intel.com>

Mainly so that ubifs can use it.

Snappy is a better compressor in the same niche as LZO.

Only lightly tested so far. Experiences welcome.

Cc: herbert@gondor.apana.org.au
Cc: dedekind1@gmail.com
Cc: adrian.hunter@intel.com
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 crypto/Kconfig  |    9 +++++
 crypto/Makefile |    1 +
 crypto/snappy.c |   99 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+), 0 deletions(-)
 create mode 100644 crypto/snappy.c

diff --git a/crypto/Kconfig b/crypto/Kconfig
index ae27b753..2c85991 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -823,6 +823,15 @@ config CRYPTO_LZO
 	help
 	  This is the LZO algorithm.
 
+config CRYPTO_SNAPPY
+	tristate "Snappy compression algorithm"
+	select CRYPTO_ALGAPI
+	select SNAPPY
+	help
+	  snappy is a faster alternative to the lzo compression algorithm
+	  with comparable compression. It is very fast on 64bit systems, but also
+	  good on 32bit systems. It especially excels at already compressed data.
+
 comment "Random Number Generation"
 
 config CRYPTO_ANSI_CPRNG
diff --git a/crypto/Makefile b/crypto/Makefile
index ce5a813..cf92f6f 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c.o
 obj-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_LZO) += lzo.o
+obj-$(CONFIG_CRYPTO_SNAPPY) += snappy.o
 obj-$(CONFIG_CRYPTO_RNG2) += rng.o
 obj-$(CONFIG_CRYPTO_RNG2) += krng.o
 obj-$(CONFIG_CRYPTO_ANSI_CPRNG) += ansi_cprng.o
diff --git a/crypto/snappy.c b/crypto/snappy.c
new file mode 100644
index 0000000..2f44d30
--- /dev/null
+++ b/crypto/snappy.c
@@ -0,0 +1,99 @@
+/*
+ * Cryptographic API.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/crypto.h>
+#include <linux/vmalloc.h>
+#include <linux/snappy.h>
+
+struct snappy_ctx {
+	struct snappy_env env;
+};
+
+/* Only needed for compression actually */
+static int snappy_init(struct crypto_tfm *tfm)
+{
+	struct snappy_ctx *ctx = crypto_tfm_ctx(tfm);
+
+	return snappy_init_env(&ctx->env);
+}
+
+static void snappy_exit(struct crypto_tfm *tfm)
+{
+	struct snappy_ctx *ctx = crypto_tfm_ctx(tfm);
+
+	snappy_free_env(&ctx->env);
+}
+
+static int snp_compress(struct crypto_tfm *tfm, const u8 *src,
+			    unsigned int slen, u8 *dst, unsigned int *dlen)
+{
+	struct snappy_ctx *ctx = crypto_tfm_ctx(tfm);
+	size_t olen;
+	int err;
+
+	/* XXXX very pessimistic. check in snappy? */
+	if (*dlen < snappy_max_compressed_length(*dlen))
+		return -EINVAL;
+	err = snappy_compress(&ctx->env, src, slen, dst, &olen);
+	*dlen = olen;
+	return err;
+}
+
+static int snp_decompress(struct crypto_tfm *tfm, const u8 *src,
+			      unsigned int slen, u8 *dst, unsigned int *dlen)
+{
+	size_t ulen;
+
+	if (!snappy_uncompressed_length(src, slen, &ulen))
+		return -EIO;
+	if (*dlen < ulen)
+		return -EINVAL;
+	*dlen = ulen;
+	return snappy_uncompress(src, slen, dst) ? 0 : -EIO;
+}
+
+static struct crypto_alg alg = {
+	.cra_name		= "snappy",
+	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
+	.cra_ctxsize		= sizeof(struct snappy_ctx),
+	.cra_module		= THIS_MODULE,
+	.cra_list		= LIST_HEAD_INIT(alg.cra_list),
+	.cra_init		= snappy_init,
+	.cra_exit		= snappy_exit,
+	.cra_u			= { .compress = {
+	.coa_compress		= snp_compress,
+	.coa_decompress		= snp_decompress } }
+};
+
+static int __init snappy_mod_init(void)
+{
+	return crypto_register_alg(&alg);
+}
+
+static void __exit snappy_mod_fini(void)
+{
+	crypto_unregister_alg(&alg);
+}
+
+module_init(snappy_mod_init);
+module_exit(snappy_mod_fini);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Snappy Compression Algorithm");
-- 
1.7.4.4
