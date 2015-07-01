Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZA922-0004JX-Eo
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 03:49:55 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 3/4] mtd-utils: fix 'new blank line at EOF' problems
Date: Wed, 1 Jul 2015 11:44:16 +0800
Message-ID: <1435722257-13218-3-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1435722257-13218-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1435722257-13218-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 MAKEDEV                             |  1 -
 device_table.txt                    |  1 -
 flashcp.c                           |  1 -
 include/mtd/inftl-user.h            |  2 --
 mtd-utils.spec                      |  1 -
 rfddump.c                           |  1 -
 tests/checkfs/Makefile              |  1 -
 tests/checkfs/README                |  4 ----
 tests/checkfs/comm.c                | 13 -------------
 tests/checkfs/makefiles.c           |  7 -------
 tests/jittertest/filljffs2.sh       |  1 -
 tests/jittertest/plotJittervsFill.c |  4 ----
 tests/ubi-tests/io_update.c         |  1 -
 tests/ubi-tests/mkvol_basic.c       |  1 -
 ubi-utils/LICENSE.libiniparser      |  1 -
 ubi-utils/include/ubiutils-common.h |  1 -
 ubi-utils/ubidetach.c               |  1 -
 17 files changed, 42 deletions(-)

diff --git a/MAKEDEV b/MAKEDEV
index a4141b5..b59e90e 100755
--- a/MAKEDEV
+++ b/MAKEDEV
@@ -39,4 +39,3 @@ for a in `seq 0 16` ; do
 	mknod /dev/mtdr$a c 90 `expr $a + $a + 1`
 	mknod /dev/mtdblock$a b 31 $a
 done
-
diff --git a/device_table.txt b/device_table.txt
index 194fed6..394a62b 100644
--- a/device_table.txt
+++ b/device_table.txt
@@ -126,4 +126,3 @@
 #/dev/sbpcd	b	640	0	0	25	0	0	1	4
 #/dev/mcd	b	640	0	0	23	0	0	0	-
 #/dev/optcd	b	640	0	0	17	0	0	0	-
-
diff --git a/flashcp.c b/flashcp.c
index d58c81b..86334ac 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -387,4 +387,3 @@ int main (int argc,char *argv[])
 
 	exit (EXIT_SUCCESS);
 }
-
diff --git a/include/mtd/inftl-user.h b/include/mtd/inftl-user.h
index 9b1e252..45220ed 100644
--- a/include/mtd/inftl-user.h
+++ b/include/mtd/inftl-user.h
@@ -87,5 +87,3 @@ struct INFTLMediaHeader {
 #define	INFTL_LAST	0x80000000
 
 #endif /* __MTD_INFTL_USER_H__ */
-
-
diff --git a/mtd-utils.spec b/mtd-utils.spec
index 606a6a2..120e00c 100644
--- a/mtd-utils.spec
+++ b/mtd-utils.spec
@@ -37,4 +37,3 @@ rm -rf $RPM_BUILD_ROOT
 %changelog
 * Wed May  5 2004  <dwmw2@infradead.org> - 1.0
 - Initial build.
-
diff --git a/rfddump.c b/rfddump.c
index 1934d93..0375bac 100644
--- a/rfddump.c
+++ b/rfddump.c
@@ -335,4 +335,3 @@ err:
 
 	return 2;
 }
-
diff --git a/tests/checkfs/Makefile b/tests/checkfs/Makefile
index 0a77682..14a83d4 100644
--- a/tests/checkfs/Makefile
+++ b/tests/checkfs/Makefile
@@ -3,4 +3,3 @@ TARGETS = checkfs makefiles
 include ../../common.mk
 
 $(TARGETS): $(addprefix $(BUILDDIR)/, comm.o)
-
diff --git a/tests/checkfs/README b/tests/checkfs/README
index 6b72487..d5b3b87 100644
--- a/tests/checkfs/README
+++ b/tests/checkfs/README
@@ -167,7 +167,3 @@ checkfs is called from the rc.local script file.
 The cycle then repeats till a problem is detected, at which point
 the "ok to power me down" message is not sent and the cycle stops
 waiting for the user to examine the system.
-
-
-
-
diff --git a/tests/checkfs/comm.c b/tests/checkfs/comm.c
index 881a270..c8c457e 100644
--- a/tests/checkfs/comm.c
+++ b/tests/checkfs/comm.c
@@ -49,16 +49,3 @@ int do_pwr_dn(int fd, int cycleCnt)
 
     return 0;
 }
-
-
-
-
-
-
-
-
-
-
-
-
-
diff --git a/tests/checkfs/makefiles.c b/tests/checkfs/makefiles.c
index 662fe86..589280b 100644
--- a/tests/checkfs/makefiles.c
+++ b/tests/checkfs/makefiles.c
@@ -255,10 +255,3 @@ int main(void){
   exit(0);
 
 }/*end main()*/
-
-
-
-
-
-
-
diff --git a/tests/jittertest/filljffs2.sh b/tests/jittertest/filljffs2.sh
index d8c2a83..5d42ab5 100644
--- a/tests/jittertest/filljffs2.sh
+++ b/tests/jittertest/filljffs2.sh
@@ -13,4 +13,3 @@ do
    echo "sleeping $3"
    sleep $3
 done
-
diff --git a/tests/jittertest/plotJittervsFill.c b/tests/jittertest/plotJittervsFill.c
index 9f6c7b3..99e627b 100644
--- a/tests/jittertest/plotJittervsFill.c
+++ b/tests/jittertest/plotJittervsFill.c
@@ -306,7 +306,3 @@ int main(
 
 
 }/* end main() */
-
-
-
-
diff --git a/tests/ubi-tests/io_update.c b/tests/ubi-tests/io_update.c
index 29dd125..28b5570 100644
--- a/tests/ubi-tests/io_update.c
+++ b/tests/ubi-tests/io_update.c
@@ -296,4 +296,3 @@ close:
 	libubi_close(libubi);
 	return 1;
 }
-
diff --git a/tests/ubi-tests/mkvol_basic.c b/tests/ubi-tests/mkvol_basic.c
index cda7241..240f6a2 100644
--- a/tests/ubi-tests/mkvol_basic.c
+++ b/tests/ubi-tests/mkvol_basic.c
@@ -248,4 +248,3 @@ close:
 	libubi_close(libubi);
 	return 1;
 }
-
diff --git a/ubi-utils/LICENSE.libiniparser b/ubi-utils/LICENSE.libiniparser
index dbfa45d..74c125c 100644
--- a/ubi-utils/LICENSE.libiniparser
+++ b/ubi-utils/LICENSE.libiniparser
@@ -18,4 +18,3 @@ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 DEALINGS IN THE SOFTWARE.
-
diff --git a/ubi-utils/include/ubiutils-common.h b/ubi-utils/include/ubiutils-common.h
index 762e21f..9762837 100644
--- a/ubi-utils/include/ubiutils-common.h
+++ b/ubi-utils/include/ubiutils-common.h
@@ -33,4 +33,3 @@ int ubiutils_srand(void);
 #endif
 
 #endif /* !__UBI_UTILS_COMMON_H__ */
-
diff --git a/ubi-utils/ubidetach.c b/ubi-utils/ubidetach.c
index 64b748e..29f721e 100644
--- a/ubi-utils/ubidetach.c
+++ b/ubi-utils/ubidetach.c
@@ -204,4 +204,3 @@ out_libubi:
 	libubi_close(libubi);
 	return -1;
 }
-
-- 
1.8.4.2
