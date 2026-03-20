Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5F51099B4C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOQXcOFRlOEj10szPP/zD9TMkBie1PlVlO6PBq+gd/Y=; b=aobMkPH/QktDRi
	nYgJB27SpPQmWuhmtOltry2oF3njnUW0jN+nA+rBfoWyGkMP6qm/5YrxQp2sDeVJXqzmALYGzsEtu
	wIHoXIY1ihScrNDzjPzzEW3TQ5ph2iNHWw0WmNw0w8GJCuikRWNE7VeiciyK2Voq6x20xrv5EjZ+E
	Pr2YPV7G3F2PhcrRtNovNoY0vsnzyYE5OCm5+ePGMe0zP+XScP7er2Pm2oB7oeMXsqs5fcdyOUVwy
	BMHzXgqK/aeovrqDxzXjR20FfYdpK9I0db6zNROJjOumGd2Kvdl9OwPb2+k0Yej2Bv3F1NRMT97yH
	v6+k2/BH+XlXYMK+r3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWX-0000000DjJM-1isb;
	Fri, 20 Mar 2026 22:40:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWD-0000000Dind-0TMO;
	Fri, 20 Mar 2026 22:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rM66s3u7wmcwPYPe7utZHYhtdJOBtDyMhAQiY4qvZlQ=; b=OPs+MhD7EcmvgY4DYQQfsD57cT
	nnovO3RmKoN1HmDM7PE2FKw4wR7eg+z7EaSTnC6gZsyplpLfn+Js9JDGgOBRseoqbjNGMOCHiTZFd
	YSY4uh8+6Ci49g57wu6uuaRI48Gn/NiO76Za8dBQ/E1tWVxLecvdrUq4KsfHqh+lLYk9k/UClYhgP
	7sP4pgBNE2RrgNBiCGuYPPJJ3I5qCoJyKb8XQeu6uf9idSnAhjhve6u0W6JA/uFXMYuNBLz7wcI/E
	TIwf57ZATa40W8c4IkigGuiNbN/jbgwsTDb1nuFpc6hoHbigi0lh4Pjjp7XA2vTsODuTV+P2B1jXC
	NoYAcw+w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iW9-0000000GaY7-1BTb;
	Fri, 20 Mar 2026 22:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F23C14346A;
	Fri, 20 Mar 2026 22:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40593C4CEF7;
	Fri, 20 Mar 2026 22:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774046431;
	bh=Luge2LcM06n2SwdrkjrO2DwOaqu0iDXh4dllLKz3Bdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uMfCOaMYXg1BaHfL5Xiiept3qlEDKI46B8rP4kN9UP55h4jDK25wfAnhFC/1We7RY
	 7pIBQMIzfZ+JcW+sp89HeSHcKoOkzKuqlM1Z6GbtMVDXz5gOjPBu1/u9dwGi0UWGQs
	 kcO5dDATOI1JVWz+A8kCz+3+XJL4Jtf+25Wbtj6TLZWHktMhmLKQPru+RQD/wL4PtB
	 1m2QSDQb/5aZqO7bJUnb9j78yorYoZ1ZZg8/H3TcJJT2t9nAIv6h8wU1i4LQndST9V
	 1WqCNRiMmXHTyTvP+j0shuaa/6nqBB1U9fQs7YoseEpTBNqk29Oqnvdclpa/lcWlXf
	 qbyyCSL6nSnwQ==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v4 09/21] fs: afs: revert mmap_prepare() change
Date: Fri, 20 Mar 2026 22:39:35 +0000
Message-ID: <08804c94e39d9102a3a8fbd12385e8aa079ba1d3.1774045440.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_224034_074002_BF904759 
X-CRM114-Status: GOOD (  15.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Partially reverts commit 9d5403b1036c ("fs: convert most other
generic_file_*mmap() users to .mmap_prepare()").

This is because the .mmap invocation establishes a refcount, but
.mmap_prepare is called at a point where a merge or an allocation failure
might happen after the call, which would leak the refcount increment.

Functionality is being added to permit the use of .mmap_prepare in this
case, but in the interim, we need to fix this.

Fixes: 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to .mmap_prepare()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 fs/afs/file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index f609366fd2ac..74d04af51ff4 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -19,7 +19,7 @@
 #include <trace/events/netfs.h>
 #include "internal.h"
 
-static int afs_file_mmap_prepare(struct vm_area_desc *desc);
+static int afs_file_mmap(struct file *file, struct vm_area_struct *vma);
 
 static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
@@ -35,7 +35,7 @@ const struct file_operations afs_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= afs_file_read_iter,
 	.write_iter	= netfs_file_write_iter,
-	.mmap_prepare	= afs_file_mmap_prepare,
+	.mmap		= afs_file_mmap,
 	.splice_read	= afs_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fsync		= afs_fsync,
@@ -492,16 +492,16 @@ static void afs_drop_open_mmap(struct afs_vnode *vnode)
 /*
  * Handle setting up a memory mapping on an AFS file.
  */
-static int afs_file_mmap_prepare(struct vm_area_desc *desc)
+static int afs_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(desc->file));
+	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 	int ret;
 
 	afs_add_open_mmap(vnode);
 
-	ret = generic_file_mmap_prepare(desc);
+	ret = generic_file_mmap(file, vma);
 	if (ret == 0)
-		desc->vm_ops = &afs_vm_ops;
+		vma->vm_ops = &afs_vm_ops;
 	else
 		afs_drop_open_mmap(vnode);
 	return ret;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
