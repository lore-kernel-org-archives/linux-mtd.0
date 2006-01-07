Received: from mail.netroad.ru ([213.24.172.7])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EvD7D-0005IZ-Ex
	for linux-mtd@lists.infradead.org; Sat, 07 Jan 2006 07:24:14 -0500
Received: from mail.netroad.ru (localhost [127.0.0.1])
	by mail.netroad.ru (Postfix) with ESMTP id 24B93149002
	for <linux-mtd@lists.infradead.org>;
	Sat,  7 Jan 2006 15:24:06 +0300 (MSK)
Received: from proxy.netroad.ru (proxy.netroad.ru [213.24.172.2])
	by mail.netroad.ru (Postfix) with ESMTP id 0A0EC148EE9
	for <linux-mtd@lists.infradead.org>;
	Sat,  7 Jan 2006 15:24:06 +0300 (MSK)
Date: Sat, 7 Jan 2006 15:24:05 +0300
From: "Lenar D. Tukhvatullin" <lenar@netroad.ru>
To: linux-mtd@lists.infradead.org
Message-ID: <20060107122405.GB24407@proxy.netroad.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH] MTD: compatmac.h - workaround for touch_softlockup_watchdog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Soft lockups detection" feature was added in 2.6.14 kernel.

In early kernels touch_softlockup_watchdog() is absent,
that causes compilation error of nand_base.c and onenand_base.c

Patch below adds workaround for kernels < 2.6.14:

=================================================================================
--- include/linux/mtd/compatmac.h.old	Mon Nov  7 14:14:54 2005
+++ include/linux/mtd/compatmac.h	Sat Jan  7 04:12:12 2006
@@ -223,6 +223,12 @@
 #define class_destroy(cs) class_simple_destroy((struct class_simple *)cs)
 #endif
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,14)
+static inline void touch_softlockup_watchdog(void)
+{
+}
+#endif
+
 #ifndef list_for_each_entry_safe
 /**
  * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
=================================================================================

--
 Lenar D. Tukhvatullin,
 Ulyanovsk State Technical University
