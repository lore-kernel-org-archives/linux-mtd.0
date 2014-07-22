Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9SYS-00067a-P5
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 05:24:02 +0000
Message-ID: <53CDF537.1040104@huawei.com>
Date: Tue, 22 Jul 2014 13:23:03 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH] ubifs: refactor ubifs_file_mmap()
References: <53CDE6AB.2090703@huawei.com>
In-Reply-To: <53CDE6AB.2090703@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: wangnan0@huawei.com, MTD Maling
 List <linux-mtd@lists.infradead.org>, Hu Jianyang <hujianyang@huawei.com>
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

Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>
---
 fs/ubifs/file.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b5b593c..c7f1af6 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1540,11 +1540,9 @@ static const struct vm_operations_struct ubifs_file_vm_ops = {

 static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	int err;
+	struct address_space *mapping = file->f_mapping;

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
