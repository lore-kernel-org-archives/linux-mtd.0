Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SClW-0007q6-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2002 09:24:02 +0100
Message-Id: <200207100822.g6A8Mln08290@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: add_mtd_partition question
Date: Wed, 10 Jul 2002 09:22:47 +0100
Cc: linux-mtd@lists.infradead.org
References: <200207100723.g6A7Nwf06288@localhost.localdomain> <15331.1026217135@redhat.com> <10107.1026288727@redhat.com>
In-Reply-To: <10107.1026288727@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Please resend after
> 	echo "diff -up"  >> ~/.cvsrc


Index: mtdpart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdpart.c,v
retrieving revision 1.27
diff -u -p -r1.27 mtdpart.c
--- mtdpart.c   8 Mar 2002 16:34:35 -0000       1.27
+++ mtdpart.c   10 Jul 2002 08:22:04 -0000
@@ -70,6 +70,22 @@ static int part_read_oob (struct mtd_inf
                                        len, retlen, buf);
 }

+static int part_read_user_prot_reg (struct mtd_info *mtd, loff_t from, 
size_t len,
+                       size_t *retlen, u_char *buf)
+{
+       struct mtd_part *part = PART(mtd);
+       return part->master->read_user_prot_reg (part->master, from,
+                                       len, retlen, buf);
+}
+
+static int part_read_fact_prot_reg (struct mtd_info *mtd, loff_t from, 
size_t len,
+                       size_t *retlen, u_char *buf)
+{
+       struct mtd_part *part = PART(mtd);
+       return part->master->read_user_prot_reg (part->master, from,
+                                       len, retlen, buf);
+}
+
 static int part_write (struct mtd_info *mtd, loff_t to, size_t len,
                        size_t *retlen, const u_char *buf)
 {
@@ -98,6 +114,14 @@ static int part_write_oob (struct mtd_in
                                        len, retlen, buf);
 }

+static int part_write_user_prot_reg (struct mtd_info *mtd, loff_t from, 
size_t len,
+                       size_t *retlen, u_char *buf)
+{
+       struct mtd_part *part = PART(mtd);
+       return part->master->write_user_prot_reg (part->master, from,
+                                       len, retlen, buf);
+}
+
 static int part_writev (struct mtd_info *mtd,  const struct iovec *vecs,
                         unsigned long count, loff_t to, size_t *retlen)
 {
@@ -226,9 +250,6 @@ int add_mtd_partitions(struct mtd_info *
                slave->mtd.oobsize = master->oobsize;
                slave->mtd.ecctype = master->ecctype;
                slave->mtd.eccsize = master->eccsize;
-               slave->mtd.read_user_prot_reg = master->read_user_prot_reg;
-               slave->mtd.read_fact_prot_reg = master->read_fact_prot_reg;
-               slave->mtd.write_user_prot_reg = master->write_user_prot_reg;

                slave->mtd.name = parts[i].name;
                slave->mtd.bank_size = master->bank_size;
@@ -241,6 +262,12 @@ int add_mtd_partitions(struct mtd_info *
                        slave->mtd.read_oob = part_read_oob;
                if (master->write_oob)
                        slave->mtd.write_oob = part_write_oob;
+               if(master->read_user_prot_reg)
+                       slave->mtd.read_user_prot_reg = 
part_read_user_prot_reg;
+               if(master->read_fact_prot_reg)
+                       slave->mtd.read_fact_prot_reg = 
part_read_fact_prot_reg;
+               if(master->write_user_prot_reg)
+                       slave->mtd.write_user_prot_reg = 
part_write_user_prot_reg;
                if (master->sync)
                        slave->mtd.sync = part_sync;
                if (!i && master->suspend && master->resume) {
