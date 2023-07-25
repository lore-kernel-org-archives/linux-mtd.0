Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B04C04A6A
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVF0oOcwEqsXL9ToXNU03x5ZXb4YBmw60ObfEdHTuts=; b=vUsjp2p9N8lED/
	yIp11h98/VWxowUvg9sEKZHR21hE/Jso+AQN1QjJAN+9IffcE2aVmAo9FiFdQDdxb+aUDE6/B5E9f
	wfMA8BjHewConb87gsnLvXp5KBHF5M16/GhiftUuxAkcUjwPidegXwj9x+hE1Klvt4m/SRY0m5uTE
	mAyRJ6x4/HxxDgTCyO4AzmyEhcpfQ7SJ8KpBvdTu/xnFhP/u+VE3kdX81LzbohhUKgxCzWwx+IZvo
	nGJiN5qXFY11SHKgYdkIO2cZbYaPqZa5E+pT2Ne8nS/ovUCL5seneoIkLPevz4A3v3yojC2kVJjmx
	HhlkWBhA4CnlBym/gsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJVK-007pvP-2j;
	Tue, 25 Jul 2023 14:59:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJVH-007prH-3C;
	Tue, 25 Jul 2023 14:59:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7490661788;
	Tue, 25 Jul 2023 14:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC60C433B6;
	Tue, 25 Jul 2023 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690297150;
	bh=2uDpIMGQVMt/gC4T/BxJPAgKQID6PeU0gqKfksNKWnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n2fO+6f3o9pY7IlFzt0rPNlCPvC97bsCNM+BfmqJUquIMuUUrh8omevU9O4/AHkm1
	 BUhGetnUcCuK1rxWP8h5CviIrVUp9eXO8jpGbYi5hteTH5Xqe5ITh/GzhKNHYCKlZk
	 vlcYpaRegzQJvuY8ntTnypuLjutaWGFpxjpGt7wd4i0rEDrs0fPNKp6yIhyqEEdtAb
	 8/r999SguPHVOPOVMoBGAZsACOuuAASF/w90W4MAecKdLt6gEneLVh/fG/faExs3M6
	 nCO0XjvC7eMTX9Xqd+6QSmh67WMiduueljqyzpsqyRjLawhI4Oj6HHr3+rEmH8yk8G
	 2Ixb9ASBBSh0Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 25 Jul 2023 10:58:16 -0400
Subject: [PATCH v6 3/7] tmpfs: bump the mtime/ctime/iversion when page
 becomes writeable
MIME-Version: 1.0
Message-Id: <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
In-Reply-To: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, 
 Anthony Iliopoulos <ailiop@suse.com>, v9fs@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, 
 linux-xfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=2uDpIMGQVMt/gC4T/BxJPAgKQID6PeU0gqKfksNKWnI=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBkv+MjNDHnc3VpUZs/F8L9rjN3Zof/qnAfmWfPJ
 HHeEPSmh46JAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZL/jIwAKCRAADmhBGVaC
 FcRQEAC4JBQVQ/gYYTowPETQ4WpI/KRmcf8ArByri6vezI/PnnC+6/c78VVo2CeuLvo39NWHvEc
 WjMBGKoIjC/rRO0g9ZTnQyG5xMCVFJm+txy5uj0RrkqVeSajWVGMi40jIG0PKIJonSTnuHRNnvv
 r0qqzIRryKNHPBIqhnaRnVE7lXDmsMo5PQmseWqdieD39P983bSTK3hdLBday25rstPj4a2TwIt
 U65Yd+CzgPnnCD8f/dWD0LThNK7BtgniJDaWOop13mmeXYnImIgU1M8iY29eCS+EPq8YjysZad3
 /bEH2S2nqMnbI/nw3UQ941Rxnnmw6bEPVJnqJAOILyOesX5D82MfHRraU5UCMLp1UUkr/S/iRZf
 +CarYlZ09IaFEzrA5A2xvr7M4KiNkRaOEhxzDIsQnsRlyqq5jSyU3JRapUwrSogBCkWuAMZRIyG
 JCaLNaT6v0B5u06FAdINF6uBlVGTmgb4jdavZFZgdI9vrNqAhU42ctOi+vRusrge9q3OR0LDnTU
 qMHqNtWGe3Hsc2mZEDzSRaXyzcEYKHXBLlXvun2i/eibMafbVx3qIaTbmDNpFzpim2LoIXyGBld
 HgWK8WxTS/Hc2mF2qYRoCmLCYwcXO/X1WknZcNwcoUCIy50fLXiWyW+IvPAQjYx/4uETnI8jV8R
 chM8OWlWlDNeYjA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_075912_129954_EABF5DBD 
X-CRM114-Status: GOOD (  13.50  )
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

Most filesystems that use the pagecache will update the mtime, ctime,
and change attribute when a page becomes writeable. Add a page_mkwrite
operation for tmpfs and just use it to bump the mtime, ctime and change
attribute.

This fixes xfstest generic/080 on tmpfs.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 mm/shmem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index b154af49d2df..654d9a585820 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct inode *inode = file_inode(vma->vm_file);
+
+	file_update_time(vma->vm_file);
+	inode_inc_iversion(inode);
+	return 0;
+}
+
 unsigned long shmem_get_unmapped_area(struct file *file,
 				      unsigned long uaddr, unsigned long len,
 				      unsigned long pgoff, unsigned long flags)
@@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops = {
 
 static const struct vm_operations_struct shmem_vm_ops = {
 	.fault		= shmem_fault,
+	.page_mkwrite	= shmem_page_mkwrite,
 	.map_pages	= filemap_map_pages,
 #ifdef CONFIG_NUMA
 	.set_policy     = shmem_set_policy,
@@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm_ops = {
 
 static const struct vm_operations_struct shmem_anon_vm_ops = {
 	.fault		= shmem_fault,
+	.page_mkwrite	= shmem_page_mkwrite,
 	.map_pages	= filemap_map_pages,
 #ifdef CONFIG_NUMA
 	.set_policy     = shmem_set_policy,

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
