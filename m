Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75760C001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToDetFZELnzja2IELHIyPufO+nDGThXYAHr+5Tk7kaM=; b=SRNUQBie5/UXqF
	CsLQ9TfyRBNBL6ZRsAeRIThPtWX6uVjJlu0Sq42emPqlWaA0KMDx+AtuvhcoFYIAGO0TscZcEGlI4
	8a6AghmfFKFNaSdGh/D2SkcLV3VSOXJeuJZBJV02diRpwvJkboGmeGDXZwtu4ele4QdEARnHnEKsb
	2YkXUsDybA2OupHOtIyCf7+9cQ6B+OMDsZsWMr81jDjO5l0cThlA31+ckIR2gdq0loYQPOvbBWRmN
	OvgoTeHtpSG3wwW9aZy5nGHBdAzKT9sMQnZ7Dn0V2A+mp1PyUOM8Qm2338IFVhboabKneaHb1I4M/
	PlddQRe2RwAva6aIuxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObj2-009tMl-0A;
	Wed, 26 Jul 2023 10:26:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qObiy-009tL2-1n;
	Wed, 26 Jul 2023 10:26:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AF2261A40;
	Wed, 26 Jul 2023 10:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDF4C433C7;
	Wed, 26 Jul 2023 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690367190;
	bh=5KYTw7QzTyvtxBFV3dygoBH0PeFk0S7OnkeeUk9b43Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ndKso9yUYsbZwpDHng42ep2CAfco3wLs2OV40nFjqGLYD9AEcWQWsW6ETt5eznwfc
	 cv1pssJER1sswKXyNjOiTQENkKxQk0VK7z2g3ch3Yi2JD1b11x0Zkl0EFgKozkvsxy
	 f1dZ8Uzp9NvZuR0ShQq2ncjDBcvWQLsdpHvv+hCoNZE8CswlcoELNBb87INDiV++T7
	 H3FxOmXTcDxptDoUUj0sqZ+IrTepfzb2qKKeU0koRPwfU0de4m8txUllhzV58rHcVD
	 p+AU8vMVOdefcjxtH+iRA3W4CG6/XXiQ3a2jG5SNH585qxa35MBMZ5O8U7Wt7Y0BFJ
	 4GDCTXheHD02g==
Message-ID: <9b3292b65d3c63c50e671c47ed90304c4a8d1af9.camel@kernel.org>
Subject: Re: [PATCH v6 3/7] tmpfs: bump the mtime/ctime/iversion when page
 becomes writeable
From: Jeff Layton <jlayton@kernel.org>
To: Hugh Dickins <hughd@google.com>
Cc: Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>,  Dominique Martinet <asmadeus@codewreck.org>, Christian
 Schoenebeck <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef
 Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,  Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>,  coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>,
 Gao Xiang <xiang@kernel.org>,  Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,  Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>,  Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>,  Anna Schumaker <anna@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,  Mark Fasheh
 <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>,  Mike Marshall <hubcap@omnibond.com>, Martin
 Brandenburg <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, Steve
 French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie
 Sahlberg <lsahlber@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom
 Talpey <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong"
 <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>, Anthony Iliopoulos
 <ailiop@suse.com>,  v9fs@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org,  linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org,  linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,  cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, linux-xfs@vger.kernel.org
Date: Wed, 26 Jul 2023 06:26:23 -0400
In-Reply-To: <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
	 <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
	 <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_032632_688221_69FE4D54 
X-CRM114-Status: GOOD (  27.96  )
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

On Tue, 2023-07-25 at 18:39 -0700, Hugh Dickins wrote:
> On Tue, 25 Jul 2023, Jeff Layton wrote:
> 
> > Most filesystems that use the pagecache will update the mtime, ctime,
> > and change attribute when a page becomes writeable. Add a page_mkwrite
> > operation for tmpfs and just use it to bump the mtime, ctime and change
> > attribute.
> > 
> > This fixes xfstest generic/080 on tmpfs.
> 
> Huh.  I didn't notice when this one crept into the multigrain series.
> 
> I'm inclined to NAK this patch: at the very least, it does not belong
> in the series, but should be discussed separately.
> 
> Yes, tmpfs does not and never has used page_mkwrite, and gains some
> performance advantage from that.  Nobody has ever asked for this
> change before, or not that I recall.
> 
> Please drop it from the series: and if you feel strongly, or know
> strong reasons why tmpfs suddenly needs to use page_mkwrite now,
> please argue them separately.  To pass generic/080 is not enough.
> 
> Thanks,
> Hugh
> 

Dropped.

This was just something I noticed while testing this series. It stood
out since I was particularly watching for timestamp-related test
failures. I don't feel terribly strongly about it.

Thanks!

> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  mm/shmem.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index b154af49d2df..654d9a585820 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
> >  	return ret;
> >  }
> >  
> > +static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	struct inode *inode = file_inode(vma->vm_file);
> > +
> > +	file_update_time(vma->vm_file);
> > +	inode_inc_iversion(inode);
> > +	return 0;
> > +}
> > +
> >  unsigned long shmem_get_unmapped_area(struct file *file,
> >  				      unsigned long uaddr, unsigned long len,
> >  				      unsigned long pgoff, unsigned long flags)
> > @@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops = {
> >  
> >  static const struct vm_operations_struct shmem_vm_ops = {
> >  	.fault		= shmem_fault,
> > +	.page_mkwrite	= shmem_page_mkwrite,
> >  	.map_pages	= filemap_map_pages,
> >  #ifdef CONFIG_NUMA
> >  	.set_policy     = shmem_set_policy,
> > @@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm_ops = {
> >  
> >  static const struct vm_operations_struct shmem_anon_vm_ops = {
> >  	.fault		= shmem_fault,
> > +	.page_mkwrite	= shmem_page_mkwrite,
> >  	.map_pages	= filemap_map_pages,
> >  #ifdef CONFIG_NUMA
> >  	.set_policy     = shmem_set_policy,
> > 
> > -- 
> > 2.41.0

-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
