Received: from ip10.savigear.adsl.gxn.net ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18XNBf-0000sK-00
	for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2003 15:04:40 +0000
Received: from spoinky.renegade.org.uk ([192.168.1.2])
	by xerp.secret.org.uk with esmtp (Exim 3.33 #1)
	id 18XNfU-000300-00
	for linux-mtd@lists.infradead.org; Sat, 11 Jan 2003 15:35:28 +0000
Received: from localhost ([127.0.0.1] helo=secret.org.uk)
	by spoinky.renegade.org.uk with esmtp (Exim 3.36 #1 (Debian))
	id 18XNfT-0003Sp-00
	for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2003 15:35:27 +0000
From: Simon Evans <spse@secret.org.uk>
To: linux-mtd@lists.infradead.org
Subject: default readv/writev functions
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 11 Jan 2003 15:35:26 +0000
Message-Id: <E18XNfT-0003Sp-00@spoinky.renegade.org.uk>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I noticed in fs/jffs2/writev.c there is a mtd_fake_writev and a comment
that it should be in the MTD core. Is the following ok to commit?

cheers
si

Index: drivers/mtd/mtdcore.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdcore.c,v
retrieving revision 1.32
diff -u -p -u -r1.32 mtdcore.c
--- drivers/mtd/mtdcore.c	7 Mar 2002 18:38:10 -0000	1.32
+++ drivers/mtd/mtdcore.c	11 Jan 2003 12:28:16 -0000
@@ -203,11 +203,74 @@ struct mtd_info *__get_mtd_device(struct
 	return ret;
 }
 
+
+/* default_mtd_writev - default mtd writev method for MTD devices that
+ *			dont implement their own
+ */
+
+int default_mtd_writev(struct mtd_info *mtd, const struct iovec *vecs,
+		       unsigned long count, loff_t to, size_t *retlen)
+{
+	unsigned long i;
+	size_t totlen = 0, thislen;
+	int ret = 0;
+
+	if(!mtd->write) {
+		ret = -EROFS;
+	} else {
+		for (i=0; i<count; i++) {
+			if (!vecs[i].iov_len)
+				continue;
+			ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
+			totlen += thislen;
+			if (ret || thislen != vecs[i].iov_len)
+				break;
+			to += vecs[i].iov_len;
+		}
+	}
+	if (retlen)
+		*retlen = totlen;
+	return ret;
+}
+
+
+/* default_mtd_readv - default mtd readv method for MTD devices that dont
+ *		       implement their own
+ */
+
+int default_mtd_readv(struct mtd_info *mtd, struct iovec *vecs,
+		      unsigned long count, loff_t from, size_t *retlen)
+{
+	unsigned long i;
+	size_t totlen = 0, thislen;
+	int ret = 0;
+
+	if(!mtd->read) {
+		ret = -EIO;
+	} else {
+		for (i=0; i<count; i++) {
+			if (!vecs[i].iov_len)
+				continue;
+			ret = mtd->read(mtd, from, vecs[i].iov_len, &thislen, vecs[i].iov_base);
+			totlen += thislen;
+			if (ret || thislen != vecs[i].iov_len)
+				break;
+			from += vecs[i].iov_len;
+		}
+	}
+	if (retlen)
+		*retlen = totlen;
+	return ret;
+}
+
+
 EXPORT_SYMBOL(add_mtd_device);
 EXPORT_SYMBOL(del_mtd_device);
 EXPORT_SYMBOL(__get_mtd_device);
 EXPORT_SYMBOL(register_mtd_user);
 EXPORT_SYMBOL(unregister_mtd_user);
+EXPORT_SYMBOL(default_mtd_writev);
+EXPORT_SYMBOL(default_mtd_readv);
 
 /*====================================================================*/
 /* Power management code */
Index: include/linux/mtd/mtd.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/mtd.h,v
retrieving revision 1.37
diff -u -p -u -r1.37 mtd.h
--- include/linux/mtd/mtd.h	19 Nov 2002 01:22:31 -0000	1.37
+++ include/linux/mtd/mtd.h	11 Jan 2003 12:28:17 -0000
@@ -257,6 +257,11 @@ struct mtd_notifier {
 extern void register_mtd_user (struct mtd_notifier *new);
 extern int unregister_mtd_user (struct mtd_notifier *old);
 
+int default_mtd_writev(struct mtd_info *mtd, const struct iovec *vecs,
+		       unsigned long count, loff_t to, size_t *retlen);
+
+int default_mtd_readv(struct mtd_info *mtd, struct iovec *vecs,
+		      unsigned long count, loff_t from, size_t *retlen);
 
 #ifndef MTDC
 #define MTD_ERASE(mtd, args...) (*(mtd->erase))(mtd, args)
