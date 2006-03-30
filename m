Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOs3t-00068p-2z
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 03:01:27 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Mar 2006 11:58:51 +0400
Message-ID: <F048F58F304F0040BC3E937DE4E231E701DC3AC2@NNSMSX401>
From: "Belyakov, Alexander" <alexander.belyakov@intel.com>
To: <linux-mtd@lists.infradead.org>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: [PATCH/RFC] CFI: Common polling thread feature
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello again!

As it was promised I have split patch with striping and related stuff
into three parts.

- Striping core itself ([PATCH/RFC] MTD: Striping layer core)
- Thread switching workaround ([PATCH/RFC] CFI: Threads switching issue
fix)
- CFI Common polling thread (this message)

This very message contains thread CFI common polling thread feature
implementation. Please refer to main thread "[PATCH/RFC] MTD: Striping
layer core" to get more about issue and usage cases.

1. PROBLEM
The problem appears as timely thread switching is required. The most
obvious example here is a case of several instances of FFS mounted on
physically independent flash chips trying to work simultaneously.
Another example is striping feature which presented in much details in
mailing thread "[PATCH/RFC] MTD: Striping layer core". Please find
additional information on this issue there.

2. SOLUTION
Common polling thread is presented as a new module in kernel that is
being used by CFI layer. It creates single polling thread removing
rescheduling problem. Polling for operation completion status is being
done in one thread raising semaphore in worker threads on completion.

The suggested CPT solution can be turned on in kernel configuration
file.

3. PATCH
The diff file below is a patch containing Common polling thread feature
(to be applied on MTD snapshot 20060315).

Kind Regards,
Alexander Belyakov



diff -uNr a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2006-03-16
12:46:25.000000000 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-03-16
12:35:51.000000000 +0300
@@ -36,6 +36,10 @@
 #include <linux/mtd/compatmac.h>
 #include <linux/mtd/cfi.h>
=20
+#ifdef CONFIG_MTD_CFI_CPT
+#include <linux/mtd/cfi_cpt.h>
+#endif
+
 /* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
 /* #define CMDSET0001_DISABLE_WRITE_SUSPEND */
=20
@@ -1452,12 +1498,18 @@
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	map_word status, status_OK, write_cmd, datum;
-	unsigned long cmd_adr, timeo;
+	unsigned long cmd_adr, timeo, prog_timeo;
 	int wbufsize, z, ret=3D0, word_gap, words;
 	const struct kvec *vec;
 	unsigned long vec_seek;
+	int datalen =3D len;	/* save it for future use */
+
+#ifdef CONFIG_MTD_CFI_CPT
+	extern struct cpt_thread_info *cpt_info;
+#endif
=20
 	wbufsize =3D cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
+	prog_timeo =3D chip->buffer_write_time * len / wbufsize;
 	adr +=3D chip->start;
 	cmd_adr =3D adr & ~(wbufsize-1);
=20
@@ -1497,12 +1549,16 @@
 	for (;;) {
 		map_write(map, write_cmd, cmd_adr);
=20
+#ifndef CONFIG_MTD_CFI_CPT
 		status =3D map_read(map, cmd_adr);
 		if (map_word_andequal(map, status, status_OK,
status_OK))
 			break;
=20
 		UDELAY(map, chip, cmd_adr, 1);
-
+#else
+		if (!cpt_check_wait(cpt_info, chip, map, cmd_adr,
status_OK, 0))
+			break;
+#endif
 		if (++z > 20) {
 			/* Argh. Not ready for write to buffer */
 			map_word Xstatus;
@@ -1572,9 +1628,11 @@
 	map_write(map, CMD(0xd0), cmd_adr);
 	chip->state =3D FL_WRITING;
=20
-	INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
-				adr, len,
-				chip->buffer_write_time);
+#ifndef CONFIG_MTD_CFI_CPT
+	INVALIDATE_CACHE_UDELAY(map, chip,
+				 cmd_adr, adr,
+				 len,
+				 prog_timeo );
=20
 	timeo =3D jiffies + (HZ/2);
 	z =3D 0;
@@ -1610,14 +1668,28 @@
 		z++;
 		UDELAY(map, chip, cmd_adr, 1);
 	}
-	if (!z) {
+	if (!z && (datalen =3D=3D wbufsize)) {
 		chip->buffer_write_time--;
 		if (!chip->buffer_write_time)
 			chip->buffer_write_time =3D 1;
 	}
-	if (z > 1)
+	if ((z > 1) && (datalen =3D=3D wbufsize))=20
 		chip->buffer_write_time++;
=20
+#else
+	INVALIDATE_CACHED_RANGE(map, adr, len);
+	if(cpt_check_wait(cpt_info, chip, map, cmd_adr, status_OK, 1))
+	{
+	    /* buffer write timeout */
+	    map_write(map, CMD(0x70), cmd_adr);
+	    chip->state =3D FL_STATUS;
+	    xip_enable(map, chip, cmd_adr);
+	    printk(KERN_ERR "%s: buffer write error (status timeout)\n",
map->name);
+	    ret =3D -EIO;
+	    goto out;
+	}
+#endif
+
 	/* Done and happy. */
  	chip->state =3D FL_STATUS;
=20
@@ -1693,10 +1765,6 @@
 				return 0;
 		}
=20
-		/* Be nice and reschedule with the chip in a usable
state for other
-		   processes. */
-		cond_resched();
-
 	} while (len);
=20
 	return 0;
diff -uNr a/drivers/mtd/chips/cfi_cpt.c b/drivers/mtd/chips/cfi_cpt.c
--- a/drivers/mtd/chips/cfi_cpt.c	1970-01-01 03:00:00.000000000
+0300
+++ b/drivers/mtd/chips/cfi_cpt.c	2006-03-16 12:34:38.000000000
+0300
@@ -0,0 +1,344 @@
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/init.h>
+#include <asm/io.h>
+#include <asm/byteorder.h>
+
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/reboot.h>
+#include <linux/mtd/xip.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/compatmac.h>
+#include <linux/mtd/cfi.h>
+
+#include <linux/mtd/cfi_cpt.h>
+
+#define STATIC_PRIO_TO_NICE(a) (((a) - MAX_RT_PRIO - 20))
+
+struct cpt_thread_info *cpt_info;
+
+static void cpt_set_priority(struct cpt_thread_info* info)
+{
+    int oldnice, newnice;
+
+    struct list_head *pos, *qos;
+    struct cpt_chip *chip;
+    struct cpt_check_desc *desc;
+   =20
+    newnice =3D oldnice =3D =
STATIC_PRIO_TO_NICE(info->thread->static_prio);
+
+    /* list all chips and check priority */
+    spin_lock(&info->list_lock);
+    list_for_each(pos, &info->list)
+    {
+        chip =3D list_entry(pos, struct cpt_chip, list);
+	spin_lock(&chip->list_lock);
+	list_for_each(qos, &chip->plist)
+	{
+	    desc =3D list_entry(chip->plist.next, struct cpt_check_desc,
list);
+	    newnice =3D (desc->task_prio < newnice) ? desc->task_prio :
newnice;
+	}
+	spin_unlock(&chip->list_lock);
+    }
+    spin_unlock(&info->list_lock);
+   =20
+    /* new CPT priority should be less than calling thread one */
+    newnice =3D ((newnice + 1) < -20) ? -20 : (newnice + 1);
+   =20
+    if(oldnice !=3D newnice)
+	set_user_nice(info->thread, newnice);
+}
+
+static void cpt_thread(void *arg)
+{
+    struct cpt_thread_info* info =3D (struct cpt_thread_info*)arg;
+=09
+    struct list_head *pos;
+    struct cpt_chip *chip;
+    struct cpt_check_desc *desc;
+   =20
+    map_word status;
+
+    info->thread =3D current;
+    up(&info->cpt_startstop);
+
+    while(info->cpt_cont)
+    {
+	/* wait for check issue */
+	down(&info->cpt_wait);
+=09
+	/* list all chips and check status */
+	spin_lock(&info->list_lock);
+        list_for_each(pos, &info->list)
+        {
+	    chip =3D list_entry(pos, struct cpt_chip, list);
+	    spin_lock(&chip->list_lock);
+	    if(!list_empty(&chip->plist))
+	    {
+		desc =3D list_entry(chip->plist.next, struct
cpt_check_desc, list);
+		if(!desc->timeo)
+		    desc->timeo =3D jiffies + (HZ/2);
+	=09
+#ifndef CONFIG_MTD_XIP
+		if(chip->chip->state !=3D FL_WRITING && desc->wait)
+		{
+		    /* Someone's suspended the write. Do not check
status on this very turn */
+		    desc->timeo =3D jiffies + (HZ / 2);
+		    up(&info->cpt_wait);
+		    continue;
+		}
+#endif
+	=09
+		/* check chip status.
+		 * if OK remove item from chip queue and release
semaphore. */
+		spin_lock(chip->chip->mutex);
+		status =3D map_read(desc->map, desc->cmd_adr);
+		spin_unlock(chip->chip->mutex);
+	=09
+		if(map_word_andequal(desc->map, status, desc->status_OK,
desc->status_OK))
+		{
+		    /* chip has status OK */
+		    desc->success =3D 1;
+		    list_del(&desc->list);
+		    up(&desc->check_semaphore);
+		   =20
+		    cpt_set_priority(info);
+		}
+		else if(!desc->wait)
+		{
+		    /* chip is not ready */
+		    desc->success =3D 0;
+		    list_del(&desc->list);
+		    up(&desc->check_semaphore);
+		   =20
+		    cpt_set_priority(info);
+		}
+		else
+		{
+		    /* check for timeout */
+		    if(time_after(jiffies, desc->timeo))
+		    {
+			printk(KERN_ERR "CPT: timeout (%s)\n",
desc->map->name);
+		=09
+    			desc->success =3D 0;
+			list_del(&desc->list);
+			up(&desc->check_semaphore);
+		   =20
+			cpt_set_priority(info);
+		    }
+		    else
+		    {
+			/* wait one more time */
+			up(&info->cpt_wait);
+		    }
+		}
+	    }
+	    spin_unlock(&chip->list_lock);
+	}
+	spin_unlock(&info->list_lock);
+
+	cond_resched();
+    }
+   =20
+    info->thread =3D NULL;
+    up(&info->cpt_startstop);
+}
+
+
+static int cpt_init_thread(struct cpt_thread_info* info)
+{
+    pid_t pid;
+    int ret =3D 0;
+=09
+    init_MUTEX_LOCKED(&info->cpt_startstop);	/* init start/stop
semaphore */
+	=09
+    info->cpt_cont =3D 1; 			/* set continue thread
flag */
+    init_MUTEX_LOCKED(&info->cpt_wait);		/* init "wait
for data" semaphore */
+=09
+    INIT_LIST_HEAD(&info->list);		/* initialize operation
list head */
+    spin_lock_init(&info->list_lock);		/* init list lock */
+=09
+    pid =3D kernel_thread((int (*)(void *))cpt_thread, info,
CLONE_KERNEL); /* flags (3rd arg) TBD */
+    if (pid < 0)
+    {
+	printk(KERN_ERR "fork failed for CFI common polling thread:
%d\n", -pid);
+	ret =3D pid;
+    }
+    else
+    {
+	/* wait thread started */
+	DEBUG(MTD_DEBUG_LEVEL1, "CPT: write thread has pid %d\n", pid);
+	down(&info->cpt_startstop);
+    }
+
+    return ret;
+}
+
+
+static void cpt_shutdown_thread(struct cpt_thread_info* info)
+{
+    struct list_head *pos_chip, *pos_desc, *p, *q;
+    struct cpt_chip *chip;
+    struct cpt_check_desc *desc;
+
+    if(info->thread)
+    {
+	info->cpt_cont =3D 0;			/* drop thread flag */
+	up(&info->cpt_wait);			/* let the thread
complete */
+	down(&info->cpt_startstop);		/* wait for thread
completion */
+	DEBUG(MTD_DEBUG_LEVEL1, "CPT: common polling thread has been
stopped\n");
+    }
+   =20
+    /* clean queue */
+    spin_lock(&info->list_lock);
+    list_for_each_safe(pos_chip, p, &info->list)
+    {
+        chip =3D list_entry(pos_chip, struct cpt_chip, list);
+        spin_lock(&chip->list_lock);
+	list_for_each_safe(pos_desc, q, &chip->list)
+        {
+    	    desc =3D list_entry(pos_desc, struct cpt_check_desc, list);
+	   =20
+	    /* remove polling request from queue */
+	    desc->success =3D 0;
+	    list_del(&desc->list);
+	    up(&desc->check_semaphore);
+	}
+	spin_unlock(&chip->list_lock);
+=09
+	/* remove chip structure from the queue and deallocate memory */
+	list_del(&chip->list);
+	kfree(chip);
+    }
+    spin_unlock(&info->list_lock);
+   =20
+    DEBUG(MTD_DEBUG_LEVEL1, "CPT: common polling thread queue has been
cleaned\n");
+}
+
+
+/* info - CPT thread structure
+ * chip - chip structure pointer
+ * map - map info structure
+ * cmd_adr - address to write cmd
+ * status_OK - status to be checked against
+ * wait - flag defining wait for status or just single check
+ * =20
+ * returns 0 - success or error otherwise
+ */
+int cpt_check_wait(struct cpt_thread_info* info, struct flchip *chip,
struct map_info *map,=20
+		    unsigned long cmd_adr, map_word status_OK, int wait)
+{
+    struct cpt_check_desc desc;
+    struct list_head *pos_chip;
+    struct cpt_chip *chip_cpt =3D NULL;
+    int chip_found =3D 0;
+    int status =3D 0;
+   =20
+    desc.chip =3D chip;
+    desc.map =3D map;
+    desc.cmd_adr =3D cmd_adr;
+    desc.status_OK =3D status_OK;
+    desc.timeo =3D 0;
+    desc.wait =3D wait;
+   =20
+    /* fill task priority for that task */
+    desc.task_prio =3D STATIC_PRIO_TO_NICE(current->static_prio);
+   =20
+    init_MUTEX_LOCKED(&desc.check_semaphore);
+   =20
+    /* insert element to queue */
+    spin_lock(&info->list_lock);
+    list_for_each(pos_chip, &info->list)
+    {
+        chip_cpt =3D list_entry(pos_chip, struct cpt_chip, list);
+	if(chip_cpt->chip =3D=3D desc.chip)
+	{
+	    chip_found =3D 1;
+	    break;
+	}
+    }
+   =20
+    if(!chip_found)
+    {
+	/* create new chip queue */
+	chip_cpt =3D kmalloc(sizeof(struct cpt_chip), GFP_KERNEL);
+        if(!chip_cpt)
+        {
+	    printk(KERN_ERR "CPT: memory allocation error\n");
+	    return -ENOMEM;
+        }
+	memset(chip_cpt, 0, sizeof(struct cpt_chip));
+=09
+	chip_cpt->chip =3D desc.chip;
+	INIT_LIST_HEAD(&chip_cpt->plist);
+	spin_lock_init(&chip_cpt->list_lock);
+=09
+	/* put chip in queue */
+	list_add_tail(&chip_cpt->list, &info->list);
+    }
+    spin_unlock(&info->list_lock);
+
+    /* add element to existing chip queue */
+    spin_lock(&chip_cpt->list_lock);
+    list_add_tail(&desc.list, &chip_cpt->plist);
+    spin_unlock(&chip_cpt->list_lock);
+   =20
+    /* set new CPT priority if required */
+    if((desc.task_prio + 1) <
STATIC_PRIO_TO_NICE(info->thread->static_prio))
+        cpt_set_priority(info);
+   =20
+    /* unlock chip mutex and wait here */
+    spin_unlock(desc.chip->mutex);
+    up(&info->cpt_wait);		/* let CPT continue */
+    down(&desc.check_semaphore);	/* wait until CPT rise semaphore
*/
+    spin_lock(desc.chip->mutex);
+   =20
+    status =3D desc.success ? 0 : -EIO;
+
+    return status;
+}
+
+static int __init cfi_cpt_init(void)
+{
+    int err;
+   =20
+    cpt_info =3D (struct cpt_thread_info*)kmalloc(sizeof(struct
cpt_thread_info), GFP_KERNEL);
+    if (!cpt_info)
+    {
+	printk(KERN_ERR "CPT: memory allocation error\n");
+	return -ENOMEM;
+    }
+   =20
+    err =3D cpt_init_thread(cpt_info);
+    if(err)
+    {
+	kfree(cpt_info);
+	cpt_info =3D NULL;
+    }
+   =20
+    return err;
+}
+
+static void __exit cfi_cpt_exit(void)
+{
+    if(cpt_info)
+    {
+	cpt_shutdown_thread(cpt_info);
+	kfree(cpt_info);
+    }
+}
+
+EXPORT_SYMBOL(cpt_check_wait);
+
+module_init(cfi_cpt_init);
+module_exit(cfi_cpt_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexander Belyakov <alexander.belyakov@intel.com>, Intel
Corporation");
+MODULE_DESCRIPTION("CFI Common Polling Thread");
diff -uNr a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
--- a/drivers/mtd/chips/Kconfig	2006-03-16 12:46:25.000000000 +0300
+++ b/drivers/mtd/chips/Kconfig	2006-03-16 12:34:38.000000000 +0300
@@ -190,6 +190,13 @@
 	  provides support for one of those command sets, used on Intel
 	  StrataFlash and other parts.
=20
+config MTD_CFI_CPT
+	bool "Common polling thread"
+	depends on MTD_CFI_INTELEXT
+	default n
+	help
+	  Common polling thread for CFI
+
 config MTD_CFI_AMDSTD
 	tristate "Support for AMD/Fujitsu flash chips"
 	depends on MTD_GEN_PROBE
diff -uNr a/drivers/mtd/chips/Makefile b/drivers/mtd/chips/Makefile
--- a/drivers/mtd/chips/Makefile	2006-03-05 22:07:54.000000000
+0300
+++ b/drivers/mtd/chips/Makefile	2006-03-16 12:34:38.000000000
+0300
@@ -24,3 +24,4 @@
 obj-$(CONFIG_MTD_ROM)		+=3D map_rom.o
 obj-$(CONFIG_MTD_SHARP)		+=3D sharp.o
 obj-$(CONFIG_MTD_ABSENT)	+=3D map_absent.o
+obj-$(CONFIG_MTD_CFI_CPT)	+=3D cfi_cpt.o
diff -uNr a/include/linux/mtd/cfi_cpt.h b/include/linux/mtd/cfi_cpt.h
--- a/include/linux/mtd/cfi_cpt.h	1970-01-01 03:00:00.000000000
+0300
+++ b/include/linux/mtd/cfi_cpt.h	2006-03-16 12:34:38.000000000
+0300
@@ -0,0 +1,46 @@
+
+#ifndef __MTD_CFI_CPT_H__
+#define __MTD_CFI_CPT_H__
+
+struct cpt_thread_info {
+    struct task_struct *thread;
+    int cpt_cont;		/* continue flag */
+
+    struct semaphore cpt_startstop; /* thread start/stop semaphore */
+=09
+    /* wait-for-operation semaphore,
+     * up by cpt_check_add,
+     * down by cpt_thread
+     */
+    struct semaphore cpt_wait;
+=09
+    struct list_head list;	/* head of chip list */
+    spinlock_t list_lock;	/* lock to remove race conditions
+				 * while adding/removing chips
+				 * to/from the list */   =20
+};
+
+struct cpt_check_desc {
+    struct list_head list;	/* per chip queue */
+    struct flchip *chip;
+    struct map_info *map;
+    map_word status_OK;
+    unsigned long cmd_adr;
+    unsigned long timeo;	/* timeout */
+    int task_prio;		/* task priority */
+    int wait;			/* if 0 - only one wait loop */
+    struct semaphore check_semaphore;
+    int success;		/* 1 - success, 0 - timeout, etc. */
+};
+
+struct cpt_chip {
+    struct list_head list;
+    struct flchip *chip;
+    struct list_head plist;	/* head of per chip op list */
+    spinlock_t list_lock;
+};
+
+int cpt_check_wait(struct cpt_thread_info* info, struct flchip *chip,
struct map_info *map,=20
+		    unsigned long cmd_adr, map_word status_OK, int
wait);
+
+#endif /* #ifndef __MTD_CFI_CPT_H__ */
