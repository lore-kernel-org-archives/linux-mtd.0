Received: from packet.digeo.com ([12.110.80.53])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bdlx-0006pr-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 09:35:45 +0000
Received: from digeo-nav01.digeo.com (digeo-nav01.digeo.com [192.168.1.233])
	by packet.digeo.com (8.9.3+Sun/8.9.3) with SMTP id CAA05050
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 02:06:12 -0800 (PST)
Date: Thu, 23 Jan 2003 02:06:27 -0800
From: Andrew Morton <akpm@digeo.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: ch@murgatroid.com, fbecker@intrinsyc.com,
        linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: 2.5.55-rmk1: user space lossage
Message-Id: <20030123020627.5603a268.akpm@digeo.com>
In-Reply-To: <17281.1043316072@passion.cambridge.redhat.com>
References: <20030123015659.422e8179.akpm@digeo.com>
	<000001c2c287$ffa8eef0$800b040f@bergamot>
	<15943.1043315303@passion.cambridge.redhat.com>
	<17281.1043316072@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

David Woodhouse <dwmw2@infradead.org> wrote:
>
> 
> 
> -  	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_WRITE))
> +-  	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_WRITE))
> ++ 	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))

Yup.



We cannot clear VM_MAYWRITE in there - it turns writeable MAP_PRIVATE
mappings into readonly ones.

So change it back to the 2.4 form - disallow a writeable MAP_SHARED mapping
against filesystems which do no implement ->writepage().


 filemap.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff -puN mm/filemap.c~generic_file_readonly_mmap-fix mm/filemap.c
--- 25/mm/filemap.c~generic_file_readonly_mmap-fix	2003-01-23 01:55:41.000000000 -0800
+++ 25-akpm/mm/filemap.c	2003-01-23 02:04:05.000000000 -0800
@@ -1308,11 +1308,13 @@ int generic_file_mmap(struct file * file
 	return 0;
 }
 
+/*
+ * This is for filesystems which do not implement ->writepage.
+ */
 int generic_file_readonly_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_WRITE))
+	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
 		return -EINVAL;
-	vma->vm_flags &= ~VM_MAYWRITE;
 	return generic_file_mmap(file, vma);
 }
 #else

_
