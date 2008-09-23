Received: from mail.slimdevices.com ([67.155.107.5])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KiEYa-0002Dh-SA
	for linux-mtd@lists.infradead.org; Tue, 23 Sep 2008 20:32:25 +0000
Received: from [127.0.0.1] (host217-44-194-36.range217-44.btcentralplus.com
	[217.44.194.36])
	by mail.slimdevices.com (Postfix) with ESMTP id 7FFCDFD800C
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Sep 2008 13:32:22 -0700 (PDT)
Message-ID: <48D9524A.3050300@logitech.com>
Date: Tue, 23 Sep 2008 21:32:10 +0100
From: Richard Titmuss <richard_titmuss@logitech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD-UTILS] Allow an absent 'image' in the ubinize
	configuration.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Some recent changes to ubinize prevent the 'image' parameter from being 
absent in the configuration file. The following patch fixes that.

Signed-off-by: Richard Titmuss <richard.titmuss@logitech.com>

diff --git a/ubi-utils/new-utils/src/ubinize.c 
b/ubi-utils/new-utils/src/ubinize.c
index 5115db3..ebd5aa0 100644
--- a/ubi-utils/new-utils/src/ubinize.c
+++ b/ubi-utils/new-utils/src/ubinize.c
@@ -561,20 +561,22 @@ int main(int argc, char * const argv[])
             goto out_free;
         }
 
-        fd = open(img, O_RDONLY);
-        if (fd == -1) {
-            sys_errmsg("cannot open \"%s\"", img);
-            goto out_free;
-        }
+        if (img) {
+            fd = open(img, O_RDONLY);
+            if (fd == -1) {
+                sys_errmsg("cannot open \"%s\"", img);
+                goto out_free;
+            }
 
-        verbose(args.verbose, "writing volume %d", vi[i].id);
-        verbose(args.verbose, "image file: %s", img);
+            verbose(args.verbose, "writing volume %d", vi[i].id);
+            verbose(args.verbose, "image file: %s", img);
 
-        err = ubigen_write_volume(&ui, &vi[i], args.ec, st.st_size, fd, 
args.out_fd);
-        close(fd);
-        if (err) {
-            errmsg("cannot write volume for section \"%s\"", sname);
-            goto out_free;
+            err = ubigen_write_volume(&ui, &vi[i], args.ec, st.st_size, 
fd, args.out_fd);
+            close(fd);
+            if (err) {
+                errmsg("cannot write volume for section \"%s\"", sname);
+                goto out_free;
+            }
         }
 
         if (args.verbose)
