Received: from nz-out-0506.google.com ([64.233.162.232])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hz8cO-0006Cu-H5
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 06:01:25 -0400
Received: by nz-out-0506.google.com with SMTP id s18so824008nze
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Jun 2007 03:01:23 -0700 (PDT)
Message-ID: <9b52d64c0706150301v33006e58h9a86c1f126437e32@mail.gmail.com>
Date: Fri, 15 Jun 2007 15:31:22 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: ubi: Error freeing ubi->vtbl while unloading
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I downloaded latest git & backported ubi to make it work in linux
kernel 2.6.18.3.

Machine details
 AMD opteron 64bit SMP, linux kernel version 2.6.18.3

However while unloading ubi I discovered slab corruption. Ths problem
is as follows.

ubi->vtbl is allocated using vmalloc() in vtbl.c empty_create_lvol(),
but it is freed in build.c with kfree()

Heres a patch that makes a fix

--- build.c	2007-06-07 14:54:49.000000000 +0530
+++ build.c	2007-06-15 15:22:32.000000000 +0530
@@ -369,7 +369,7 @@
 out_wl:
 	ubi_wl_close(ubi);
 out_vtbl:
-	kfree(ubi->vtbl);
+	vfree(ubi->vtbl);
 out_si:
 	ubi_scan_destroy_si(si);
 	return err;
@@ -629,7 +629,7 @@
 out_detach:
 	ubi_eba_close(ubi);
 	ubi_wl_close(ubi);
-	kfree(ubi->vtbl);
+	vfree(ubi->vtbl);
 out_free:
 	kfree(ubi);
 out_mtd:


-- I feel free now
