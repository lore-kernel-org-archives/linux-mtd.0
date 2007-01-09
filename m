Received: from an-out-0708.google.com ([209.85.132.246])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H4SoL-00043E-L2
	for linux-mtd@lists.infradead.org; Tue, 09 Jan 2007 21:03:33 -0500
Received: by an-out-0708.google.com with SMTP id d40so3743194and
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Jan 2007 18:03:27 -0800 (PST)
Date: Wed, 10 Jan 2007 00:54:48 +0900
From: Seongsu Lee <senux@senux.com>
To: Vinit Agnihotri <vinit.agnihotri@calsoftinc.com>
Subject: Re: max size of MTD?
Message-ID: <20070109155448.GA1690@pooky.senux.com>
References: <20070106085957.GA32684@pooky.senux.com>
	<200701081149.l08BnQn5001183@mail.calsofthq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200701081149.l08BnQn5001183@mail.calsofthq.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 08, 2007 at 05:19:25PM +0530, Vinit Agnihotri wrote:
> U have mentioned of creating 1 MTD device of 6GB by mtdconcat. However I am
> curious to know how many mtd devices u've concatenated to make 6GB 
> possible??? I am using mtdramm as test device but I am not able to allocate
> memory over 1GB. So no question of having even more devices to make it above
> 5GB. Can you focus on the same question & help me. How can I allocate more
> memory than 4GB??? Or how can I create 6GB MTD device.
> My current test machine is AMD 64bit opteron with 1GB memory.
> 
> Thanks in advance.
> Vinit.
 
Hi Vinit,

I have 6 physical flash memories in my test embedded board. The size 
of each flash memory is 1GB. The number of flash memory 
to be concatenated is 6. (1GB x 6 -> 6GB) I couldn't find out explicit 
limitation of number of devices to be concatenated by mtdconcat.

After receving your mail, I comfirmed that mtdconcat works at least
8 sub mtd devices. I created 8 mtd device based on RAM. (I mean mtdram.)
And I created a concatenated mtd device with 8 mtdram device.

[root@hybus ~]# cat /proc/mtd
dev:            size   erasesize  name
mtd0: 0000000000040000 00040000 "boot"
mtd1: 0000000000180000 00040000 "kernel"
mtd2: 0000000001e40000 00040000 "rootfs"
mtd3: 0000000000400000 00020000 "mtdram_test_1"
mtd4: 0000000000400000 00020000 "mtdram_test_2"
mtd5: 0000000000400000 00020000 "mtdram_test_3"
mtd6: 0000000000400000 00020000 "mtdram_test_4"
mtd7: 0000000000400000 00020000 "mtdram_test_5"
mtd8: 0000000000400000 00020000 "mtdram_test_6"
mtd9: 0000000000400000 00020000 "mtdram_test_7"
mtd10: 0000000000400000 00020000 "mtdram_test_8"
mtd11: 0000000002000000 00020000 "test_part_0"
[root@hybus ~]# mount -t jffs2 /dev/mtdblock11 /mnt/data11
[root@hybus ~]# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/rom2                30.3M     20.3M      9.9M  67% /
192.168.128.1:/nfs       28.9G     18.1G      9.3G  66% /mnt/nfs
/dev/mtdblock11          32.0M      1.0M     31.0M   3% /mnt/data11
[root@hybus ~]#

I think there is no limitation of number of sub mtd devices in code.
But you may not create more than 15 mtd devices in a system.

Max size of mtd device? I think it's 4GB. (u_int32_t size)

I really hope that my post can help you. 

Follow is a patch to create more than one mtdram device. I
worked linux kernel 2.6.11.

--- linux-2.6.11-test/drivers/mtd/devices/mtdram.c.mtdram_test 2006-11-18 20:14:38.000000000 +0900
+++ linux-2.6.11-test/drivers/mtd/devices/mtdram.c     2007-01-10 00:33:27.000000000 +0900
@@ -108,19 +108,24 @@
   return 0;
 }

+#define NUMRAM (8)
+static struct mtd_info *mtds[NUMRAM];
 static void __exit cleanup_mtdram(void)
 {
-  if (mtd_info) {
-    del_mtd_device(mtd_info);
+  int i;
+  for (i = 0; i < NUMRAM; i++) {
+  if (mtds[i]) {
+    del_mtd_device(mtds[i]);
 #if CONFIG_MTDRAM_TOTAL_SIZE > 0
-    if (mtd_info->priv)
+    if (mtds[i]->priv)
 #if CONFIG_MTDRAM_ABS_POS > 0
-      iounmap(mtd_info->priv);
+      iounmap(mtds[i]->priv);
 #else
-      vfree(mtd_info->priv);
+      vfree(mtds[i]->priv);
 #endif
 #endif
-    kfree(mtd_info);
+    kfree(mtds[i]);
+  }
   }
 }

@@ -186,9 +191,22 @@

 #else /* CONFIG_MTDRAM_ABS_POS > 0 */

+static int test(int n);
 static int __init init_mtdram(void)
 {
+       int i;
+       printk(KERN_INFO "%d mtdram test devices will be created.\n", NUMRAM);
+       for (i = 0; i < NUMRAM; i++) {
+               test(i);
+       }
+       return 0;
+}
+
+#define NAME_LEN (64)
+static int test(int n)
+{
   void *addr;
+  char *name;
   int err;
   /* Allocate some memory */
    mtd_info = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
@@ -204,8 +222,10 @@
     mtd_info = NULL;
     return -ENOMEM;
   }
+  name = (char *)kmalloc(NAME_LEN, GFP_KERNEL);
+  snprintf(name, NAME_LEN - 1, "mtdram_test_%d", n + 1);
   err = mtdram_init_device(mtd_info, addr,
-                           MTDRAM_TOTAL_SIZE, "mtdram test device");
+                           MTDRAM_TOTAL_SIZE, name);
   if (err)
   {
     vfree(addr);
@@ -214,6 +234,7 @@
     return err;
   }
   memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+  mtds[n] = mtd_info;
   return err;
 }
 #endif /* !(CONFIG_MTDRAM_ABS_POS > 0) */

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Seongsu Lee
> Sent: Saturday, January 06, 2007 2:30 PM
> To: linux-mtd@lists.infradead.org
> Subject: Re: max size of MTD?
> 
> On Fri, Jan 05, 2007 at 04:29:41PM +0900, Seongsu Lee wrote:
> > Hi,
> > 
> > What is the max size of a partition that can be used in MTD?
> > I found that the u_int32_t is used for the variable size 
> > in mtd_info. Then, I think 4GB is currently the max size. 
> > Am I right? 
> > 
> > I want to use 6GB flash memory with a partition. How can I 
> > fix it for using more than 4GB? I changed u_int32_t into
> > u_int64_t but it does not work. (kernel oops)
> 
> Hi,
> 
> I changed the type of variable size in structure mtd_info 
> from u_int32_t to u_int64_t. Some code such as printk is
> modified after the change. It works. I tested that 
> mtdconcat can create 6GB MTD device as one device.

-- 
Seongsu's blog - http://www.senux.com/
How do I type "for i in *.dvi do xdvi i done" in a
GUI? (Discussion in comp.os.linux.misc on the
intuitiveness of interfaces.)
