Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WRRN-0001Zr-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 00:48:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8403E3E24D@srvmail-mtl.ubisoft.qc.ca> 
References: <9A1957CB9FC45A4FA6F35961093ABB8403E3E24D@srvmail-mtl.ubisoft.qc.ca> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: Vipin Malik <Vipin.Malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: Re: Applying MTD to 2.2.x kernel, with more info 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 00:54:02 +0100
Message-ID: <17616.997746842@redhat.com>
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

It _should_ all work in 2.2, even as modules. But I don't test it often. I 
really ought to verify it and fix the bits which break, then feed it to Alan 
for 2.2.next.


pallaire@gameloft.com said:
> 		chipreg.c: In function `do_map_probe':
> 		chipreg.c:67: parse error before `do'

67:	if (!drv && !request_module(name)) {

2.2 defines request_module as do{}while(0) ifndef CONFIG_KMOD. Which is 
broken.

Index: include/linux/kmod.h
===================================================================
RCS file: /inst/cvs/linux/include/linux/kmod.h,v
retrieving revision 1.3
diff -u -r1.3 kmod.h
--- include/linux/kmod.h	2000/12/04 15:09:02	1.3
+++ include/linux/kmod.h	2001/08/13 23:53:05
@@ -13,7 +13,10 @@
 #else
 #include <linux/errno.h>
 
-#define request_module(x) do {} while(0)
+static inline int request_module(const char *name)
+{
+	return -EINVAL;
+}
 static inline int exec_usermodehelper(char *program_path, char *argv[], char *envp[])
 {
         return -EACCES;


--
dwmw2
