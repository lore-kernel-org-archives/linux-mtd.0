Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9lLT-00024j-Q0
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:46:33 +0000
Date: Mon, 19 Mar 2012 23:46:29 +0100 (CET)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] Move CRC computation to separate function
In-Reply-To: <1330531826.3545.128.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch moves the computation of CRCs for data nodes from
within ubifs_prepare_node to a separate function ubifs_set_datanode_crc,
which takes a data node, and computes and sets the CRC. This is to avoid
duplication of the CRC computation code in other places where it may be
needed.


Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

---
 fs/ubifs/io.c    |   16 +++++++++++++---
 fs/ubifs/ubifs.h |    1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 9228950..9d39b27 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -367,6 +367,18 @@ static unsigned long long next_sqnum(struct ubifs_info *c)
 }

 /**
+ * ubifs_set_datanode_crc - writes the crc for a data node to the common
+ * header.
+ * @node: the data node
+ */
+void ubifs_set_datanode_crc(void *node)
+{
+	struct ubifs_ch *ch = (struct ubifs_ch *) node;
+	int len = le32_to_cpu(ch->len);
+	ch->crc = cpu_to_le32(crc32(UBIFS_CRC32_INIT, node + 8, len - 8));
+}
+
+/**
  * ubifs_prepare_node - prepare node to be written to flash.
  * @c: UBIFS file-system description object
  * @node: the node to pad
@@ -379,7 +391,6 @@ static unsigned long long next_sqnum(struct ubifs_info *c)
  */
 void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
 {
-	uint32_t crc;
 	struct ubifs_ch *ch = node;
 	unsigned long long sqnum = next_sqnum(c);

@@ -390,8 +401,7 @@ void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
 	ch->group_type = UBIFS_NO_NODE_GROUP;
 	ch->sqnum = cpu_to_le64(sqnum);
 	ch->padding[0] = ch->padding[1] = 0;
-	crc = crc32(UBIFS_CRC32_INIT, node + 8, len - 8);
-	ch->crc = cpu_to_le32(crc);
+	ubifs_set_datanode_crc(node);

 	if (pad) {
 		len = ALIGN(len, 8);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 7c343e1..bfd0798 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1486,6 +1486,7 @@ int ubifs_write_node(struct ubifs_info *c, void *node, int len, int lnum,
 		     int offs, int dtype);
 int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 		     int offs, int quiet, int must_chk_crc);
+void ubifs_set_datanode_crc(void *node);
 void ubifs_prepare_node(struct ubifs_info *c, void *buf, int len, int pad);
 void ubifs_prep_grp_node(struct ubifs_info *c, void *node, int len, int last);
 int ubifs_io_init(struct ubifs_info *c);
-- 
1.7.0.4
