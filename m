Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Js2P-0001BL-T4
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 10:43:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: kusdogan@boun.edu.tr
In-Reply-To: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
References: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
Message-Id: <1053855854.2082.3.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Sun, 25 May 2003 10:44:15 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops ERROR : Unable to handle kernel NULL pointer dereference
 at virtual address 00000000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-05-24 at 22:20, kusdogan@boun.edu.tr wrote:
> Hi,
> 
> I patched my 2.4.18 kernel with latest MTD source. Now it crashes in in fucntion 
> add_mtd_device (mtdcore.c). 

> 
>                         DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->nam$                   
>                        /* No need to get a refcount on the module containing
>                            the notifier, since we hold the mtd_table_mutex */
>                         list_for_each(this, &mtd_notifiers) {
>                                 struct mtd_notifier *not = list_entry(this, stru$                                
> 		    not->add(mtd);		<------------- CRASH
>                         }

Thanks for the report. Please could you apply this patch and check what
it prints...

Index: mtdcore.c
===================================================================
RCS file: /home/dwmw2/.mtd-cvs-backup/cvs/mtd/drivers/mtd/mtdcore.c,v
retrieving revision 1.39
diff -u -p -r1.39 mtdcore.c
--- mtdcore.c	21 May 2003 15:15:03 -0000	1.39
+++ mtdcore.c	25 May 2003 09:42:23 -0000
@@ -64,6 +64,7 @@ int add_mtd_device(struct mtd_info *mtd)
 			   the notifier, since we hold the mtd_table_mutex */
 			list_for_each(this, &mtd_notifiers) {
 				struct mtd_notifier *not = list_entry(this, struct mtd_notifier, list);
+				printk("Add %p for notifier at %p\n", not->add, not);
 				not->add(mtd);
 			}
 			
@@ -134,6 +135,11 @@ int del_mtd_device (struct mtd_info *mtd
 void register_mtd_user (struct mtd_notifier *new)
 {
 	int i;
+
+	if (!new->add) { 
+		printk("Notifier at %p has no ->add().\n", new);
+		BUG();
+	}
 
 	down(&mtd_table_mutex);
 



-- 
dwmw2
