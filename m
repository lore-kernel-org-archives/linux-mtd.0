Received: from el-out-1112.google.com ([209.85.162.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGx2I-00056b-S8
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 09:17:47 -0400
Received: by el-out-1112.google.com with SMTP id r27so269611ele
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Aug 2007 06:17:45 -0700 (PDT)
Message-ID: <625fc13d0708030617gbf5befbn783498a710681d7f@mail.gmail.com>
Date: Fri, 3 Aug 2007 08:17:44 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd-utils: Disable LZO compression by default
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the recent LZO compression support went into mtd-utils recently,
it was enabled by default.  This means that mkfs.jffs2 will default to
creating images with lzo compression as the default.

Older kernels cannot decompress such images, so lzo should be disabled
by default.  The patch below fixes this.  To enable lzo compression
from now on, simply pass '-X lzo' as an option to mkfs.jffs2.

Signed-off-by: Josh Boyer <jwboyer@gmail.com>

diff --git a/compr_lzo.c b/compr_lzo.c
index c15fd32..fb54600 100644
--- a/compr_lzo.c
+++ b/compr_lzo.c
@@ -85,7 +85,7 @@ static struct jffs2_compressor jffs2_lzo_comp = {
        .compr = JFFS2_COMPR_LZO,
        .compress = &jffs2_lzo_cmpr,
        .decompress = &jffs2_lzo_decompress,
-       .disabled = 0,
+       .disabled = 1,
 };

 int jffs2_lzo_init(void)
