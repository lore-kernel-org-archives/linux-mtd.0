Received: from vs185185.vserver.de ([62.75.185.185] helo=DiningPhilosopher.de)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeU4L-0005Rv-Aq
 for linux-mtd@lists.infradead.org; Wed, 15 Oct 2014 19:17:09 +0000
Received: from zoidberg (dslb-092-076-003-151.092.076.pools.vodafone-ip.de
 [92.76.3.151])
 by DiningPhilosopher.de (Postfix) with ESMTPSA id 6A3E0B8303CC
 for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2014 21:16:24 +0200 (CEST)
Date: Wed, 15 Oct 2014 21:16:22 +0200
From: Timo Warns <timo.warns@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd-utils: jffs2dump: XATTR and XREF support for
 endianess conversion
Message-ID: <20141015191622.GB32621@zoidberg>
References: <20141015191203.GA32621@zoidberg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141015191203.GA32621@zoidberg>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for XATTR and XREF nodes to "convert image endianness" action of
jffs2dump.

Signed-off-by: Timo Warns <timo.warns@gmail.com>
---
 jffs2dump.c |   50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/jffs2dump.c b/jffs2dump.c
index edac2b2..f8b8ac7 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -585,6 +585,39 @@ void do_endianconvert (void)
 				p += PAD(je32_to_cpu (node->d.totlen));
 				break;
 
+			case JFFS2_NODETYPE_XATTR:
+				newnode.x.magic = cnv_e16 (node->x.magic);
+				newnode.x.nodetype = cnv_e16 (node->x.nodetype);
+				newnode.x.totlen = cnv_e32 (node->x.totlen);
+				newnode.x.hdr_crc = cpu_to_e32 (mtd_crc32 (0, &newnode, sizeof (struct jffs2_unknown_node) - 4));
+				newnode.x.xid = cnv_e32 (node->x.xid);
+				newnode.x.version = cnv_e32 (node->x.version);
+				newnode.x.xprefix = node->x.xprefix;
+				newnode.x.name_len = node->x.name_len;
+				newnode.x.value_len = cnv_e16 (node->x.value_len);
+				if (recalccrc)
+					newnode.x.data_crc = cpu_to_e32 (mtd_crc32 (0, p + sizeof (struct jffs2_raw_xattr), node->x.name_len + je16_to_cpu (node->x.value_len) + 1));
+				else
+					newnode.x.data_crc = cnv_e32 (node->x.data_crc);
+				newnode.x.node_crc = cpu_to_e32 (mtd_crc32 (0, &newnode, sizeof (struct jffs2_raw_xattr) - sizeof (newnode.x.node_crc)));
+
+				write (fd, &newnode, sizeof (struct jffs2_raw_xattr));
+				write (fd, p + sizeof (struct jffs2_raw_xattr), PAD (je32_to_cpu (node->d.totlen) -  sizeof (struct jffs2_raw_xattr)));
+				p += PAD(je32_to_cpu (node->x.totlen));
+				break;
+
+			case JFFS2_NODETYPE_XREF:
+				newnode.r.magic = cnv_e16 (node->r.magic);
+				newnode.r.nodetype = cnv_e16 (node->r.nodetype);
+				newnode.r.totlen = cnv_e32 (node->r.totlen);
+				newnode.r.hdr_crc = cpu_to_e32 (mtd_crc32 (0, &newnode, sizeof (struct jffs2_unknown_node) - sizeof (newnode.r.hdr_crc)));
+				newnode.r.ino = cnv_e32 (node->r.ino);
+				newnode.r.xid = cnv_e32 (node->r.xid);
+				newnode.r.xseqno = cnv_e32 (node->r.xseqno);
+				newnode.r.node_crc = cpu_to_e32 (mtd_crc32 (0, &newnode, sizeof (struct jffs2_raw_xref) - sizeof (newnode.r.node_crc)));
+				p += PAD(je32_to_cpu (node->x.totlen));
+				break;
+
 			case JFFS2_NODETYPE_CLEANMARKER:
 			case JFFS2_NODETYPE_PADDING:
 				newnode.u.magic = cnv_e16 (node->u.magic);
@@ -649,6 +682,23 @@ void do_endianconvert (void)
 														  counter += sizeof (struct jffs2_sum_dirent_flash) + fl_ptr->d.nsize;
 														  break;
 
+													  case JFFS2_NODETYPE_XATTR:
+														  fl_ptr->x.nodetype = cnv_e16 (fl_ptr->x.nodetype);
+														  fl_ptr->x.xid = cnv_e32 (fl_ptr->x.xid);
+														  fl_ptr->x.version = cnv_e32 (fl_ptr->x.version);
+														  fl_ptr->x.offset = cnv_e32 (fl_ptr->x.offset);
+														  fl_ptr->x.totlen = cnv_e32 (fl_ptr->x.totlen);
+														  p += sizeof (struct jffs2_sum_xattr_flash);
+														  counter += sizeof (struct jffs2_sum_xattr_flash);
+														  break;
+
+													  case JFFS2_NODETYPE_XREF:
+														  fl_ptr->r.nodetype = cnv_e16 (fl_ptr->r.nodetype);
+														  fl_ptr->r.offset = cnv_e32 (fl_ptr->r.offset);
+														  p += sizeof (struct jffs2_sum_xref_flash);
+														  counter += sizeof (struct jffs2_sum_xref_flash);
+														  break;
+
 													  default :
 														  printf("Unknown node in summary information!!! nodetype(%x)\n", je16_to_cpu (fl_ptr->u.nodetype));
 														  exit(EXIT_FAILURE);
-- 
1.7.10.4
