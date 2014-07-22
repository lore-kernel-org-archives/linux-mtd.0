Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Ta1-0003ij-Ld
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 06:29:42 +0000
Message-ID: <53CE049B.7050801@huawei.com>
Date: Tue, 22 Jul 2014 14:28:43 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v2] ubifs: refactor ubifs_file_mmap()
References: <1406010548-13996-1-git-send-email-zhenzhang.zhang@huawei.com>
In-Reply-To: <1406010548-13996-1-git-send-email-zhenzhang.zhang@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: wangnan0@huawei.com, MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

generic_file_mmap() set vma->vm_ops = &generic_file_vm_ops,
then ubifs_file_mmap set vma->vm_ops = &ubifs_file_vm_ops.
So it is redundant.
And there is no kind of file does not supply page reading function
in ubifs. The readpage() check up for mmap file in generic_file_mmap()
is not needed.

So remove the call of generic_file_mmap().

Change v1 -> v2:
- deleted the mapping variable
Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>
---
 fs/ubifs/file.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b5b593c..f7b6958 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1540,11 +1540,7 @@ static const struct vm_operations_struct ubifs_file_vm_ops = {

 static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	int err;
-
-	err = generic_file_mmap(file, vma);
-	if (err)
-		return err;
+	file_accessed(file);
 	vma->vm_ops = &ubifs_file_vm_ops;
 	return 0;
 }
-- 
1.8.1.2


.
