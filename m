Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RzZeM-0007ON-SJ
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2012 20:15:55 +0000
Date: Mon, 20 Feb 2012 21:15:51 +0100 (CET)
From: Joel Reardon <joel@clambassador.com>
To: linux-mtd@lists.infradead.org
Subject: [patch] Move CRC computation to separate function
In-Reply-To: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
Message-ID: <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
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
diff -uprN -X linux-3.2.1-vanilla/Documentation/dontdiff 
linux-3.2.1-vanilla/fs/ubifs/io.c linux-3.2.1-ubifsec/fs/ubifs/io.c
--- linux-3.2.1-vanilla/fs/ubifs/io.c   2012-01-12 20:42:45.000000000 
+0100
+++ linux-3.2.1-ubifsec/fs/ubifs/io.c   2012-02-20 20:17:48.796684293 
+0100
@@ -367,6 +367,18 @@ static unsigned long long next_sqnum(str
  }

  /**
+ * ubifs_set_datanode_crc - writes the crc for a data node to the common
+ * header.
+ * @node: the data node
+ */
+void ubifs_set_datanode_crc(void *node)
+{
+       struct ubifs_ch *ch = (struct ubifs_ch *) node;
+       int len = le32_to_cpu(ch->len);
+       ch->crc = cpu_to_le32(crc32(UBIFS_CRC32_INIT, node + 8, len - 8));
+}
+
+/**
   * ubifs_prepare_node - prepare node to be written to flash.
   * @c: UBIFS file-system description object
   * @node: the node to pad
@@ -379,7 +391,6 @@ static unsigned long long next_sqnum(str
   */
  void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int 
pad)
  {
-       uint32_t crc;
         struct ubifs_ch *ch = node;
         unsigned long long sqnum = next_sqnum(c);

@@ -390,8 +401,7 @@ void ubifs_prepare_node(struct ubifs_inf
         ch->group_type = UBIFS_NO_NODE_GROUP;
         ch->sqnum = cpu_to_le64(sqnum);
         ch->padding[0] = ch->padding[1] = 0;
-       crc = crc32(UBIFS_CRC32_INIT, node + 8, len - 8);
-       ch->crc = cpu_to_le32(crc);
+       ubifs_set_datanode_crc(node);

         if (pad) {
                 len = ALIGN(len, 8);
diff -uprN -X linux-3.2.1-vanilla/Documentation/dontdiff 
linux-3.2.1-vanilla/fs/ubifs/ubifs.h linux-3.2.1-ubifsec/fs/ubifs/ubifs.h
--- linux-3.2.1-vanilla/fs/ubifs/ubifs.h        2012-01-12 
20:42:45.000000000 +0100
+++ linux-3.2.1-ubifsec/fs/ubifs/ubifs.h        2012-02-20 
20:18:17.368685674 +0100
@@ -1489,6 +1489,7 @@ int ubifs_write_node(struct ubifs_info *
                      int offs, int dtype);
  int ubifs_check_node(const struct ubifs_info *c, const void *buf, int 
lnum,
                      int offs, int quiet, int must_chk_crc);
+void ubifs_set_datanode_crc(void *node);
  void ubifs_prepare_node(struct ubifs_info *c, void *buf, int len, int 
pad);
  void ubifs_prep_grp_node(struct ubifs_info *c, void *node, int len, int 
last);
  int ubifs_io_init(struct ubifs_info *c);
