Received: from belize.chezphil.org ([80.68.91.122])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsIBt-0000GU-64
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 08:49:46 -0400
Received: from localhost ([127.0.0.1] helo=chezphil.org)
	by belize.chezphil.org with esmtp (Exim 4.50) id 1HsMmh-00025Z-Tk
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 18:44:03 +0100
To: <linux-mtd@lists.infradead.org>
Date: Sun, 27 May 2007 13:49:42 +0100
Subject: [PATCH] Fix kfree usage in various mtd map remove functions (2nd go)
Message-ID: <1180270182334@dmwebmail.belize.chezphil.org>
MIME-Version: 1.0
Content-Type: text/plain; format="flowed"
From: "Phil Endecott" <spam_from_linux_mtd@chezphil.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The remove() functions in various mtd map drivers were failing to free 
the *_flash_info
structure.

Since mtd drivers are rarely or never used as modules (they typically 
provide root filesystems)
it is unlikely that these code paths have ever been exercised.  It also 
means that this patch
has not been tested by the author.

This patch is against 2.6.21, and supersedes the version that I posted 
on 2007-05-17; that version made an additional incorrect change to the 
usage of release_resource().

Signed-off-by: Phil Endecott <spam_from_linux_mtd_patch <at> chezphil.org>

diff -Nur drivers/mtd/maps.orig/ixp2000.c drivers/mtd/maps/ixp2000.c
--- drivers/mtd/maps.orig/ixp2000.c	2007-05-17 18:56:10.000000000 +0100
+++ drivers/mtd/maps/ixp2000.c	2007-05-27 13:40:36.000000000 +0100
@@ -134,6 +134,8 @@
  		kfree(info->res);
  	}

+	kfree(info);
+
  	if (plat->exit)
  		plat->exit();

diff -Nur drivers/mtd/maps.orig/ixp4xx.c drivers/mtd/maps/ixp4xx.c
--- drivers/mtd/maps.orig/ixp4xx.c	2007-05-17 18:56:10.000000000 +0100
+++ drivers/mtd/maps/ixp4xx.c	2007-05-27 13:41:12.000000000 +0100
@@ -177,6 +177,8 @@
  		kfree(info->res);
  	}

+	kfree(info);
+
  	if (plat->exit)
  		plat->exit();

diff -Nur drivers/mtd/maps.orig/physmap.c drivers/mtd/maps/physmap.c
--- drivers/mtd/maps.orig/physmap.c	2007-05-17 18:56:10.000000000 +0100
+++ drivers/mtd/maps/physmap.c	2007-05-27 13:41:51.000000000 +0100
@@ -69,6 +69,8 @@
  		kfree(info->res);
  	}

+	kfree(info);
+
  	return 0;
  }

diff -Nur drivers/mtd/maps.orig/physmap_of.c drivers/mtd/maps/physmap_of.c
--- drivers/mtd/maps.orig/physmap_of.c	2007-05-17 18:56:10.000000000 +0100
+++ drivers/mtd/maps/physmap_of.c	2007-05-27 13:42:35.000000000 +0100
@@ -112,6 +112,8 @@
  		kfree(info->res);
  	}

+	kfree(info);
+
  	return 0;
  }
