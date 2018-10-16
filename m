Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCPzc-00069w-N4
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2018 14:06:47 +0000
Subject: Patch "jffs2: return -ERANGE when xattr buffer is too small" has been
 added to the 4.4-stable tree
To: agruenba@redhat.com, dwmw2@infradead.org, gregkh@linuxfoundation.org,
 houtao1@huawei.com, linux-mtd@lists.infradead.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Oct 2018 16:06:19 +0200
In-Reply-To: <20181012060126.33739-1-houtao1@huawei.com>
Message-ID: <1539698779189238@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a note to let you know that I've just added the patch titled

    jffs2: return -ERANGE when xattr buffer is too small

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     jffs2-return-erange-when-xattr-buffer-is-too-small.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From houtao1@huawei.com  Tue Oct 16 15:52:02 2018
From: Hou Tao <houtao1@huawei.com>
Date: Fri, 12 Oct 2018 14:01:26 +0800
Subject: jffs2: return -ERANGE when xattr buffer is too small
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <agruenba@redhat.com>, <dwmw2@infradead.org>, <houtao1@huawei.com>
Message-ID: <20181012060126.33739-1-houtao1@huawei.com>

From: Hou Tao <houtao1@huawei.com>

When a file have multiple xattrs and the passed buffer is
smaller than the required size, jffs2_listxattr() should
return -ERANGE instead of continue, else Oops may occur
due to memory corruption.

Also remove the unnecessary check ("rc < 0"), because
xhandle->list(...) will not return an error number.

Spotted by generic/377 in xfstests-dev.

NB: The problem had been fixed by commit 764a5c6b1fa4 ("xattr
handlers: Simplify list operation") in v4.5-rc1, but the
modification in that commit may be too much because it modifies
all file-systems which implement xattr, so I create a single
patch for jffs2 to fix the problem.

Signed-off-by: Hou Tao <houtao1@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/jffs2/xattr.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1004,12 +1004,14 @@ ssize_t jffs2_listxattr(struct dentry *d
 			rc = xhandle->list(xhandle, dentry, buffer + len,
 					   size - len, xd->xname,
 					   xd->name_len);
+			if (rc > size - len) {
+				rc = -ERANGE;
+				goto out;
+			}
 		} else {
 			rc = xhandle->list(xhandle, dentry, NULL, 0,
 					   xd->xname, xd->name_len);
 		}
-		if (rc < 0)
-			goto out;
 		len += rc;
 	}
 	rc = len;


Patches currently in stable-queue which might be from houtao1@huawei.com are

queue-4.4/jffs2-return-erange-when-xattr-buffer-is-too-small.patch
