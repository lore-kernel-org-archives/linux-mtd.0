Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GA5iz-0006yp-4X
	for linux-mtd@lists.infradead.org; Mon, 07 Aug 2006 10:04:58 -0400
Message-ID: <44D748E3.2070708@kaigai.gr.jp>
Date: Mon, 07 Aug 2006 23:06:27 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH] Add the latest xattr support on mtd-utils
References: <44D53DAE.5020803@kaigai.gr.jp>
	<625fc13d0608070419x556292dek44db8bdc53459886@mail.gmail.com>
In-Reply-To: <625fc13d0608070419x556292dek44db8bdc53459886@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------000207040102090804090800"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000207040102090804090800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> KaiGai-san,
> 
> The patch looks good, however could you please resend it with a
> Signed-of-by: line?

OK, I'll resend it with Signed-off-by: line again.

Thanks,

[PAATH] Add 'xseqno' into jffs2_raw_xref on mkfs.jffs2
     Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
               ^^^^^^^^^^^^^^^^^^^ <- Don't mind. I'm working
                                      in my house today. :D

--------------000207040102090804090800
Content-Type: text/plain;
	name="jffs2-xattr-v6.2-04-add-xseqno-on-mtdutils.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="jffs2-xattr-v6.2-04-add-xseqno-on-mtdutils.patch"

diff --git a/include/linux/jffs2.h b/include/linux/jffs2.h
index 2cac60e..8fc99e5 100644
--- a/include/linux/jffs2.h
+++ b/include/linux/jffs2.h
@@ -186,6 +186,7 @@ struct jffs2_raw_xref
 	jint32_t hdr_crc;
 	jint32_t ino;		/* inode number */
 	jint32_t xid;		/* XATTR identifier number */
+	jint32_t xseqno;	/* xref sequencial number */
 	jint32_t node_crc;
 } __attribute__((packed));
 
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index fa4a5f3..c460a7b 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1038,6 +1038,7 @@ typedef struct xattr_entry {
 #define XATTR_BUFFER_SIZE		(64 * 1024)	/* 64KB */
 static uint32_t enable_xattr = 0;
 static uint32_t highest_xid = 0;
+static uint32_t highest_xseqno = 0;
 
 static struct {
 	int xprefix;
@@ -1244,6 +1245,7 @@ static void write_xattr_entry(struct fil
 		ref.hdr_crc = cpu_to_je32(crc32(0, &ref, sizeof(struct jffs2_unknown_node) - 4));
 		ref.ino = cpu_to_je32(e->sb.st_ino);
 		ref.xid = cpu_to_je32(xe->xid);
+		ref.xseqno = cpu_to_je32(highest_xseqno += 2);
 		ref.node_crc = cpu_to_je32(crc32(0, &ref, sizeof(ref) - 4));
 
 		pad_block_if_less_than(sizeof(ref));

--------------000207040102090804090800--
