Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wVWb-0008BH-00
	for mtd-list@infradead.org; Thu, 16 Nov 2000 20:20:49 +0000
Received: from ppp0.ocs.com.au ([203.34.97.3] helo=mail.ocs.com.au)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13wVWW-0008B9-00
	for mtd@infradead.org; Thu, 16 Nov 2000 20:20:45 +0000
From: Keith Owens <kaos@ocs.com.au>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: dwmw2@infradead.org (David Woodhouse), mtd@infradead.org
Subject: Re: s/get_module_symbol/inter_module_xxx/ in MTD CVS. 
In-reply-to: Your message of "Thu, 16 Nov 2000 13:21:24 -0000."
             <E13wOyl-0007nM-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Nov 2000 07:20:27 +1100
Message-ID: <4262.974406027@ocs3.ocs-net>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 16 Nov 2000 13:21:24 +0000 (GMT), 
Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
>> Alan - please could you consider Keith's patch for 2.2.next, because its
>> impact is fairly limited - it shouldn't break anything and it's important 
>> for backwards-compatibility of 2.4 drivers. 
>
>If Keith submits it. 

I sent it to you last week.  Here it is again, against 2.2.18-pre21.

Index: 18-pre21.1/kernel/module.c
--- 18-pre21.1/kernel/module.c Fri, 05 May 2000 00:28:16 +1000 kaos (linux-2.2/h/18_module.c 1.1.9.1 644)
+++ 18-pre21.1(w)/kernel/module.c Mon, 13 Nov 2000 22:29:46 +1100 kaos (linux-2.2/h/18_module.c 1.1.9.1 644)
@@ -6,6 +6,8 @@
 #include <linux/smp_lock.h>
 #include <asm/pgtable.h>
 #include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/kmod.h>
 
 /*
  * Originally by Anonymous (as far as I know...)
@@ -14,11 +16,12 @@
  * Heavily modified by Bjorn Ekwall <bj0rn@blox.se> May 1994 (C)
  * Rewritten by Richard Henderson <rth@tamu.edu> Dec 1996
  * Add MOD_INITIALIZING Keith Owens <kaos@ocs.com.au> Nov 1999
+ * Backport inter_module_xxx from 2.4.  Keith Owens <kaos@ocs.com.au> Oct 2000
  *
  * This source is covered by the GNU GPL, the same as all kernel sources.
  */
 
-#ifdef CONFIG_MODULES		/* a *big* #ifdef block... */
+#ifdef CONFIG_MODULES
 
 extern struct module_symbol __start___ksymtab[];
 extern struct module_symbol __stop___ksymtab[];
@@ -47,6 +50,173 @@ static struct module kernel_module =
 };
 
 struct module *module_list = &kernel_module;
+
+#endif	/* CONFIG_MODULES */
+
+/* inter_module functions are always available, even when the kernel is
+ * compiled without modules.  Consumers of inter_module_xxx routines
+ * will always work, even when both are built into the kernel, this
+ * approach removes lots of #ifdefs in mainline code.
+ */
+
+static struct list_head ime_list = LIST_HEAD_INIT(ime_list);
+static spinlock_t ime_lock = SPIN_LOCK_UNLOCKED;
+static int kmalloc_failed;
+
+/**
+ * inter_module_register - register a new set of inter module data.
+ * @im_name: an arbitrary string to identify the data, must be unique
+ * @owner: module that is registering the data, always use THIS_MODULE
+ * @userdata: pointer to arbitrary userdata to be registered
+ *
+ * Description: Check that the im_name has not already been registered,
+ * complain if it has.  For new data, add it to the inter_module_entry
+ * list.
+ */
+void inter_module_register(const char *im_name, struct module *owner, const void *userdata)
+{
+	struct list_head *tmp;
+	struct inter_module_entry *ime, *ime_new;
+
+	if (!(ime_new = kmalloc(sizeof(*ime), GFP_KERNEL))) {
+		/* Overloaded kernel, not fatal */
+		printk(KERN_ERR
+			"Aiee, inter_module_register: cannot kmalloc entry for '%s'\n",
+			im_name);
+		kmalloc_failed = 1;
+		return;
+	}
+	memset(ime_new, 0, sizeof(*ime_new));
+	ime_new->im_name = im_name;
+	ime_new->owner = owner;
+	ime_new->userdata = userdata;
+
+	spin_lock(&ime_lock);
+	list_for_each(tmp, &ime_list) {
+		ime = list_entry(tmp, struct inter_module_entry, list);
+		if (strcmp(ime->im_name, im_name) == 0) {
+			spin_unlock(&ime_lock);
+			kfree(ime_new);
+			/* Program logic error, fatal */
+			panic("inter_module_register: duplicate im_name '%s'", im_name);
+		}
+	}
+	list_add(&(ime_new->list), &ime_list);
+	spin_unlock(&ime_lock);
+}
+
+/**
+ * inter_module_unregister - unregister a set of inter module data.
+ * @im_name: an arbitrary string to identify the data, must be unique
+ *
+ * Description: Check that the im_name has been registered, complain if
+ * it has not.  For existing data, remove it from the
+ * inter_module_entry list.
+ */
+void inter_module_unregister(const char *im_name)
+{
+	struct list_head *tmp;
+	struct inter_module_entry *ime;
+
+	spin_lock(&ime_lock);
+	list_for_each(tmp, &ime_list) {
+		ime = list_entry(tmp, struct inter_module_entry, list);
+		if (strcmp(ime->im_name, im_name) == 0) {
+			list_del(&(ime->list));
+			spin_unlock(&ime_lock);
+			kfree(ime);
+			return;
+		}
+	}
+	spin_unlock(&ime_lock);
+	if (kmalloc_failed) {
+		printk(KERN_ERR
+			"inter_module_unregister: no entry for '%s', "
+			"probably caused by previous kmalloc failure\n",
+			im_name);
+		return;
+	}
+	else {
+		/* Program logic error, fatal */
+		panic("inter_module_unregister: no entry for '%s'", im_name);
+	}
+}
+
+/**
+ * inter_module_get - return arbitrary userdata from another module.
+ * @im_name: an arbitrary string to identify the data, must be unique
+ *
+ * Description: If the im_name has not been registered, return NULL.
+ * Try to increment the use count on the owning module, if that fails
+ * then return NULL.  Otherwise return the userdata.
+ */
+const void *inter_module_get(const char *im_name)
+{
+	struct list_head *tmp;
+	struct inter_module_entry *ime;
+	const void *result = NULL;
+
+	spin_lock(&ime_lock);
+	list_for_each(tmp, &ime_list) {
+		ime = list_entry(tmp, struct inter_module_entry, list);
+		if (strcmp(ime->im_name, im_name) == 0) {
+			/* This should be try_inc_use_count but that function is
+			 * not in 2.2 kernels.  I am not opening that can of worms
+			 * for 2.2.  Keith Owens
+			 */
+			__MOD_INC_USE_COUNT(ime->owner);
+			result = ime->userdata;
+			break;
+		}
+	}
+	spin_unlock(&ime_lock);
+	return(result);
+}
+
+/**
+ * inter_module_get_request - im get with automatic request_module.
+ * @im_name: an arbitrary string to identify the data, must be unique
+ * @modname: module that is expected to register im_name
+ *
+ * Description: If inter_module_get fails, do request_module then retry.
+ */
+const void *inter_module_get_request(const char *im_name, const char *modname)
+{
+	const void *result = inter_module_get(im_name);
+	if (!result) {
+		request_module(modname);
+		result = inter_module_get(im_name);
+	}
+	return(result);
+}
+
+/**
+ * inter_module_put - release use of data from another module.
+ * @im_name: an arbitrary string to identify the data, must be unique
+ *
+ * Description: If the im_name has not been registered, complain,
+ * otherwise decrement the use count on the owning module.
+ */
+void inter_module_put(const char *im_name)
+{
+	struct list_head *tmp;
+	struct inter_module_entry *ime;
+
+	spin_lock(&ime_lock);
+	list_for_each(tmp, &ime_list) {
+		ime = list_entry(tmp, struct inter_module_entry, list);
+		if (strcmp(ime->im_name, im_name) == 0) {
+			if (ime->owner)
+				__MOD_DEC_USE_COUNT(ime->owner);
+			spin_unlock(&ime_lock);
+			return;
+		}
+	}
+	spin_unlock(&ime_lock);
+	panic("inter_module_put: no entry for '%s'", im_name);
+}
+
+#if defined(CONFIG_MODULES)	/* The rest of the source */
 
 static long get_mod_name(const char *user_name, char **buf);
 static void put_mod_name(char *buf);
Index: 18-pre21.1/kernel/ksyms.c
--- 18-pre21.1/kernel/ksyms.c Wed, 08 Nov 2000 11:39:15 +1100 kaos (linux-2.2/h/19_ksyms.c 1.2.1.3.3.1.3.1.1.1.1.5.1.2 644)
+++ 18-pre21.1(w)/kernel/ksyms.c Mon, 13 Nov 2000 22:19:34 +1100 kaos (linux-2.2/h/19_ksyms.c 1.2.1.3.3.1.3.1.1.1.1.5.1.2 644)
@@ -82,6 +82,11 @@ EXPORT_SYMBOL(hotplug_path);
 #ifdef CONFIG_MODULES
 EXPORT_SYMBOL(get_module_symbol);
 #endif
+EXPORT_SYMBOL(inter_module_register);
+EXPORT_SYMBOL(inter_module_unregister);
+EXPORT_SYMBOL(inter_module_get);
+EXPORT_SYMBOL(inter_module_get_request);
+EXPORT_SYMBOL(inter_module_put);
 EXPORT_SYMBOL(get_options);
 
 /* process memory management */
Index: 18-pre21.1/include/linux/module.h
--- 18-pre21.1/include/linux/module.h Tue, 12 Sep 2000 13:37:17 +1100 kaos (linux-2.2/F/51_module.h 1.1.7.2 644)
+++ 18-pre21.1(w)/include/linux/module.h Tue, 14 Nov 2000 00:04:33 +1100 kaos (linux-2.2/F/51_module.h 1.1.7.2 644)
@@ -8,6 +8,7 @@
 #define _LINUX_MODULE_H
 
 #include <linux/config.h>
+#include <linux/list.h>
 
 #ifdef __GENKSYMS__
 #  define _set_ver(sym) sym
@@ -140,6 +141,35 @@ struct module_info
 
 #define __MODULE_STRING_1(x)	#x
 #define __MODULE_STRING(x)	__MODULE_STRING_1(x)
+
+/* Generic inter module communication.
+ *
+ * NOTE: This interface is intended for small amounts of data that are
+ *       passed between two objects and either or both of the objects
+ *       might be compiled as modules.  Do not over use this interface.
+ *
+ *       If more than two objects need to communicate then you probably
+ *       need a specific interface instead of abusing this generic
+ *       interface.  If both objects are *always* built into the kernel
+ *       then a global extern variable is good enough, you do not need
+ *       this interface.
+ *
+ * Keith Owens <kaos@ocs.com.au> 28 Oct 2000.
+ */
+
+#define HAVE_INTER_MODULE
+extern void inter_module_register(const char *, struct module *, const void *);
+extern void inter_module_unregister(const char *);
+extern const void *inter_module_get(const char *);
+extern const void *inter_module_get_request(const char *, const char *);
+extern void inter_module_put(const char *);
+
+struct inter_module_entry {
+       struct list_head list;
+       const char *im_name;
+       struct module *owner;
+       const void *userdata;
+};
 
 /* Find a symbol exported by the kernel or another module */
 #ifndef CONFIG_MODULES
Index: 18-pre21.1/Makefile
--- 18-pre21.1/Makefile Fri, 10 Nov 2000 22:07:33 +1100 kaos (linux-2.2/G/b/14_Makefile 1.3.2.2.1.1.1.5.1.3.6.1.5.1.1.1.1.16.1.6 644)
+++ 18-pre21.1(w)/Makefile Tue, 14 Nov 2000 00:13:18 +1100 kaos (linux-2.2/G/b/14_Makefile 1.3.2.2.1.1.1.5.1.3.6.1.5.1.1.1.1.16.1.6 644)
@@ -241,7 +241,7 @@ vmlinux: $(CONFIGURATION) init/main.o in
 		$(LIBS) \
 		--end-group \
 		-o vmlinux
-	$(NM) vmlinux | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aU] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' | sort > System.map
+	$(NM) vmlinux | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' | sort > System.map
 
 symlinks:
 	rm -f include/asm



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
