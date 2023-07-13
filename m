Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F049C05052
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 23:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVF0oOcwEqsXL9ToXNU03x5ZXb4YBmw60ObfEdHTuts=; b=iITaqnhXxyY9hn
	RdpHyUvj8dJIUWJvNjCoK8tKcQGLxipX1VY3gRz6JS83Y/rxqKXsR66PHy1BL81y3ytWFyYT+temH
	Tj6OBF2Qv7/vuXkzi/+FzbYoGLp/QJJaN2/0RkfRMIIUjc0iMLHThv/b134XkO3tbNnyTEGKxF2Q0
	J8J+/v0CQNTeGZAI67IE9F4pIaiVDYcCHGEag6H/73prFaYC3a/WaJgW53DKXO+k2qfQ1zTWm/n7l
	N/m40ZsOf4euyxF9OSK43GV5WWX3KoupNLwt/ud9W2a9C3qEgZ4yIiUMeQfF7tAAcTrVE9bZuKboe
	iKpBXTbeleJ0VA0oeZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK5JT-004VKI-0C;
	Thu, 13 Jul 2023 23:01:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK5JR-004VIk-0Z;
	Thu, 13 Jul 2023 23:01:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3CDD61B23;
	Thu, 13 Jul 2023 23:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285D7C433B7;
	Thu, 13 Jul 2023 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689289288;
	bh=2uDpIMGQVMt/gC4T/BxJPAgKQID6PeU0gqKfksNKWnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=liyRtyj08RhKgd05d/GbjIK8eAKSM10LdUJBz7UuFOcUyezObweCSPR4L5Jm7d/3+
	 J9oIvEYe6CWGwt55Hx9zbqLwPbb7BBKC8OMsAe7qX+kkwyjZAQBfJ+ADRMrXxSSmW8
	 Xzwhwg78up7SO0XMuFLZ6g+/2Pu108+rBwN7yk/z/7oyzpziWvzwOA3XIxMpCer4y9
	 lDdui9+QJ0qeG2V6Gtk4RHRd2VjBrRFJoqgHMQsHg6pmArcdKXD18EFN0CSdElLHCP
	 iu0JCzqZtl2wBu87Ybj2JDoeOy/UseVuaxAORwjKb983nHW0GT8ewtb0Icu2w+Gl8j
	 yMGVOCivsa/7g==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:52 -0400
Subject: [PATCH v5 3/8] tmpfs: bump the mtime/ctime/iversion when page
 becomes writeable
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-3-9eb795d2ae37@kernel.org>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
In-Reply-To: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
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
Cc: Dave Chinner <david@fromorbit.com>, v9fs@lists.linux.dev, 
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
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIusbBzLs0MybgDecBYC1rFLHPwWpvQ+zecR
 awgGePAm6qJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLgAKCRAADmhBGVaC
 FcSGEACub8Fc5S/WfyUSGxfmCSi3555ycDn+zVKXSPPiQKW1TR9LYRkybKANZmP0XYzYILSUfkU
 ORbNjYimhQNCSxlPeeC40MyHzjga0VRHqurUT8qqaVIVJ0nl+StBd40KLXAljpP3WXM1fGUAjvH
 vqO6pP6I3K3R/4qwCRMhWrNAcqt+qYKWVUUztTablCUbuklzQoblG24U2NK2DUfGepPumyDoeLH
 wYod7Y1kJ92qyEoEOPNjj1+tfqjWvN7+tAsFQwpD+N0sljCCXcg2XWKOgVJBsYaXx5OEbRfi6s3
 ryBXi9Xk0/jA6otq2rUp6HaQyJkl6teNxs+4rz75eCu8rN02oQaqFzL83u3vBt3uPmVA1pHdS8E
 cYZhQx3P7nvLTFlUjA0Rbi4sH0FtHNJd3k1Gzcl8UkDcxVz29S7geHX+Nfj1BSUqKI8uA6NsJuI
 nzON+pBrEdS0RRFHXzAKsdPlG285eEeNPzqWMmCPQ8I0XVLSP4vbJ+WFJhx6uO+c2gz3VEz5rKg
 46OipSdHjwUcz6Ps1TPvZpf/Z2bvpL5yiA+tPHgQX1nrRyMepOjxjN4vJX/dTEcENn7ySGN2vWY
 /RoI7eVxl9z18K25MgUs7+5WZGKkUPepl/96nVkOPQyWbt7euX8Tx6c+OgzD7T9pvDRi9idRO+a
 oNvcYRCw+z4sY9A==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_160129_291216_6BDCCD6F 
X-CRM114-Status: GOOD (  12.69  )
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
