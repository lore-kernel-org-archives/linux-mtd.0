Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkHfs-0003a1-Ma
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 05:07:24 -0500
Message-ID: <455AE636.20806@ak.jp.nec.com>
Date: Wed, 15 Nov 2006 19:04:38 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Mkfs.jffs2.c:68:21: sys/acl.h: No such file or directory
References: <5049F8BE55F36348A315EFBE6CF34386980112@sinse301.ap.infineon.com>
	<Pine.LNX.4.64.0611150853370.5230@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0611150853370.5230@lnxricardw.se.axis.com>
Content-Type: multipart/mixed; boundary="------------000703090604010102040505"
Cc: linux-mtd@lists.infradead.org, KokHow.Teh@infineon.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000703090604010102040505
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

>>     I am trying to build mtd-utils-1.0.1 using a mips cross
>> toolchain and I am stumbled at mkfs.jffs2 which includes sys/acl.h and
>> it is not present anywhere in my mips toolchain include directory but it
>> is present in my host /usr/include/sys/acl.h Has anybody encoutered this
>> problem before that you could enlighten me on this?
> 
> We've encountered the same problem. I'll expose my ignorance here and 
> say that all I know is that acl.h is used for some form of access 
> control list feature that has been introduced to mkfs.jffs2, but I don't 
> really know what it is for.

The access control list(ACL) enables higher flexible access control
based on UNIX users and groups than traditional user/group/others model.
'--with-xattr' or '--with-posix-acl' options on mkfs.jffs2 enables to
copy the ACLs associated with any files in host environment into jffs2
image file.
The purpose of this feature is improvement of security in embedded region.

> We didn't need this feature either so I made a patch to optionally 
> remove it from the source, controlled by a #define; it is included as an 
> attachment and in the text below. Don't know if this should really be 
> included in the main stream source. Obviously at least two people have 
> come up against this as a problem.

I don't oppose that you like to make the mkfs.jffs2 configurable.
But it is not certain whether you don't need to enable the ACL feature
_only_, or the whole of xattr feature.

'HAVE_ACL' is misnamed, if you intend to disable the whole of xattr
feature. Or, the scope of disabling is wrong, if you intend to disable
the ACL feature only.
In addition, it is a bit messy to require modifying the source code
to enable or disable xattr feature.

The attached patch enable mkfs.jffs2 to be configurable without any
modification of source code.
You will be able to get mkfs.jffs2 with no xattr support by the following
commands:

% cd mtd-utils
% make WITHOUT_XATTR=1

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------000703090604010102040505
Content-Type: text/x-patch;
 name="mkfs.jffs2-xattr-configurable.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mkfs.jffs2-xattr-configurable.patch"

--- a/Makefile
+++ b/Makefile
@@ -17,6 +17,10 @@ # Remove the trailing slash to make the 
   BUILDDIR := $(CROSS:-=)
 endif
 
+ifeq ($(WITHOUT_XATTR), 1)
+  CFLAGS += -DWITHOUT_XATTR
+endif
+
 RAWTARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	mkfs.jffs ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
 	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite \
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -64,8 +64,10 @@ #include <libgen.h>
 #include <ctype.h>
 #include <time.h>
 #include <getopt.h>
+#ifndef WITHOUT_XATTR
 #include <sys/xattr.h>
 #include <sys/acl.h>
+#endif
 #include <byteswap.h>
 #define crc32 __complete_crap
 #include <zlib.h>
@@ -1030,6 +1032,7 @@ static void write_special_file(struct fi
 	padword();
 }
 
+#ifndef WITHOUT_XATTR
 typedef struct xattr_entry {
 	struct xattr_entry *next;
 	uint32_t xid;
@@ -1259,6 +1262,10 @@ static void write_xattr_entry(struct fil
 	}
 }
 
+#else /* WITHOUT_XATTR */
+#define write_xattr_entry(x)
+#endif
+
 static void recursive_populate_directory(struct filesystem_entry *dir)
 {
 	struct filesystem_entry *e;
@@ -1416,9 +1423,11 @@ static struct option long_options[] = {
 	{"test-compression", 0, NULL, 't'},
 	{"compressor-priority", 1, NULL, 'y'},
 	{"incremental", 1, NULL, 'i'},
+#ifndef WITHOUT_XATTR
 	{"with-xattr", 0, NULL, 1000 },
 	{"with-selinux", 0, NULL, 1001 },
 	{"with-posix-acl", 0, NULL, 1002 },
+#endif
 	{NULL, 0, NULL, 0}
 };
 
@@ -1451,9 +1460,11 @@ static char *helptext =
 "  -q, --squash            Squash permissions and owners making all files be owned by root\n"
 "  -U, --squash-uids       Squash owners making all files be owned by root\n"
 "  -P, --squash-perms      Squash permissions on all files\n"
+#ifndef WITHOUT_XATTR
 "      --with-xattr        stuff all xattr entries into image\n"
 "      --with-selinux      stuff only SELinux Labels into jffs2 image\n"
 "      --with-posix-acl    stuff only POSIX ACL entries into jffs2 image\n"
+#endif
 "  -h, --help              Display this help text\n"
 "  -v, --verbose           Verbose operation\n"
 "  -V, --version           Display version information\n"
@@ -1772,6 +1783,7 @@ int main(int argc, char **argv)
 						  perror_msg_and_die("cannot open (incremental) file");
 					  }
 					  break;
+#ifndef WITHOUT_XATTR
 			case 1000:	/* --with-xattr  */
 					  enable_xattr |= (1 << JFFS2_XPREFIX_USER)
 						  | (1 << JFFS2_XPREFIX_SECURITY)
@@ -1786,6 +1798,7 @@ int main(int argc, char **argv)
 					  enable_xattr |= (1 << JFFS2_XPREFIX_ACL_ACCESS)
 						  | (1 << JFFS2_XPREFIX_ACL_DEFAULT);
 					  break;
+#endif
 		}
 	}
 	if (out_fd == -1) {

--------------000703090604010102040505--
