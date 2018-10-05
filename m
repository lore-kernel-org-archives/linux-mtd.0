Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8KJ0-0002Oq-H7
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 07:13:48 +0000
From: Hou Tao <houtao1@huawei.com>
To: "gregkh@linuxfoundation.org >> Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, Andreas Gruenbacher <agruenba@redhat.com>
CC: David Woodhouse <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <stable@vger.kernel.org>, "houtao1@huawei.com" <houtao1@huawei.com>
Subject: [PATCH 4.4-stable] jffs2: return -ERANGE when xattr buffer is too
 small
Message-ID: <d05f826c-5b68-2409-ac96-01f0885d0617@huawei.com>
Date: Fri, 5 Oct 2018 15:13:20 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg,

The problem had been fixed by 764a5c6b1fa4 ("xattr handlers: Simplify list
operation") in v4.5-rc1, but the modification in that commit may be too much
because it modifies all file-systems which implement xattr, so I create a single
patch for jffs2 to fix the problem. Which one is your preference ?

Hi Andreas,

Could you please help review the patch ?

Thanks,
Tao
---

From: Hou Tao <houtao1@huawei.com>

When a file have multiple xattrs and the passed buffer is
smaller than the required size, jffs2_listxattr() should
return -ERANGE instead of continue, else Oops may occurs
due to memory corruption.

Also remove the unnecessary check ("rc < 0"), because
xhandle->list(...) will not return an error number.

Spotted by generic/377 in xfstests-dev.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/xattr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 4c2c03663533..8e1427762eeb 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1004,12 +1004,14 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
                        rc = xhandle->list(xhandle, dentry, buffer + len,
                                           size - len, xd->xname,
                                           xd->name_len);
+                       if (rc > size - len) {
+                               rc = -ERANGE;
+                               goto out;
+                       }
                } else {
                        rc = xhandle->list(xhandle, dentry, NULL, 0,
                                           xd->xname, xd->name_len);
                }
-               if (rc < 0)
-                       goto out;
                len += rc;
        }
        rc = len;
--
