Received: from vs185185.vserver.de ([62.75.185.185] helo=DiningPhilosopher.de)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeU0F-0007LN-NC
 for linux-mtd@lists.infradead.org; Wed, 15 Oct 2014 19:12:56 +0000
Received: from zoidberg (dslb-092-076-003-151.092.076.pools.vodafone-ip.de
 [92.76.3.151])
 by DiningPhilosopher.de (Postfix) with ESMTPSA id B20DEB8303CC
 for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2014 21:12:05 +0200 (CEST)
Date: Wed, 15 Oct 2014 21:12:03 +0200
From: Timo Warns <timo.warns@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd-utils: jffs2dump: XATTR and XREF support for content
 dump
Message-ID: <20141015191203.GA32621@zoidberg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for XATTR and XREF nodes to "dump image content" action of
jffs2dump.

Signed-off-by: Timo Warns <timo.warns@gmail.com>
---
 jffs2dump.c |   64 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/jffs2dump.c b/jffs2dump.c
index 9e13e98..edac2b2 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -285,6 +285,47 @@ void do_dumpcontent (void)
 				p += PAD(je32_to_cpu (node->d.totlen));
 				break;
 
+			case JFFS2_NODETYPE_XATTR:
+				memcpy(name, node->x.data, node->x.name_len);
+				name[node->x.name_len] = '\x00';
+				printf ("%8s Xattr      node at 0x%08zx, totlen 0x%08x, xid   %5d, version %5d, name_len   %3d, name %s\n",
+						obsolete ? "Obsolete" : "",
+						p - data,
+						je32_to_cpu (node->x.totlen),
+						je32_to_cpu (node->x.xid),
+						je32_to_cpu (node->x.version),
+						node->x.name_len,
+						name);
+
+				crc = mtd_crc32 (0, node, sizeof (struct jffs2_raw_xattr) - sizeof (node->x.node_crc));
+				if (crc != je32_to_cpu (node->x.node_crc)) {
+					printf ("Wrong node_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->x.node_crc), crc);
+					p += PAD(je32_to_cpu (node->x.totlen));
+					dirty += PAD(je32_to_cpu (node->x.totlen));
+					continue;
+				}
+
+				crc = mtd_crc32 (0, p + sizeof (struct jffs2_raw_xattr), node->x.name_len + je16_to_cpu (node->x.value_len) + 1);
+				if (crc != je32_to_cpu (node->x.data_crc)) {
+					printf ("Wrong data_crc at  0x%08zx, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->x.data_crc), crc);
+					p += PAD(je32_to_cpu (node->x.totlen));
+					dirty += PAD(je32_to_cpu (node->x.totlen));
+					continue;
+				}
+				p += PAD(je32_to_cpu (node->x.totlen));
+				break;
+
+			case JFFS2_NODETYPE_XREF:
+				printf ("%8s Xref       node at 0x%08zx, totlen 0x%08x, xid   %5d, xseqno  %5d, #ino  %8d\n",
+						obsolete ? "Obsolete" : "",
+						p - data,
+						je32_to_cpu (node->r.totlen),
+						je32_to_cpu (node->r.xid),
+						je32_to_cpu (node->r.xseqno),
+						je32_to_cpu (node->r.ino));
+				p += PAD(je32_to_cpu (node->r.totlen));
+				break;
+
 			case JFFS2_NODETYPE_SUMMARY: {
 
 											 int i;
@@ -359,6 +400,29 @@ void do_dumpcontent (void)
 																						  break;
 																					  }
 
+														 case JFFS2_NODETYPE_XATTR : {
+																						  struct jffs2_sum_xattr_flash *spx;
+																						  spx = sp;
+																						  printf ("%14s Xattr  offset 0x%08x, totlen 0x%08x, version %5d, #xid %8d\n",
+																								  "",
+																								  je32_to_cpu (spx->offset),
+																								  je32_to_cpu (spx->totlen),
+																								  je32_to_cpu (spx->version),
+																								  je32_to_cpu (spx->xid));
+																						  sp += JFFS2_SUMMARY_XATTR_SIZE;
+																						  break;
+																					  }
+
+														 case JFFS2_NODETYPE_XREF : {
+																						  struct jffs2_sum_xref_flash *spr;
+																						  spr = sp;
+																						  printf ("%14s Xref   offset 0x%08x\n",
+																								  "",
+																								  je32_to_cpu (spr->offset));
+																						  sp += JFFS2_SUMMARY_XREF_SIZE;
+																						  break;
+																					  }
+
 														 default :
 																					  printf("Unknown summary node!\n");
 																					  break;
-- 
1.7.10.4
