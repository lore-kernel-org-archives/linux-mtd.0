Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6069C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 01:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhzV1D0EPzarm/HdDvyF1I9Hxzl9qn8BthMkfIL2zAc=; b=AQA0uuID2yveGo
	SPP+qIQozA0tIqlqLgwk4nVR8oULH3o84EWuTbxdx5WdI7HP9Q3ziQu/z9L0Y+Ma1gg5QL4ffGyiy
	kMTCQ9sWHmxYl2QazEsuEJzG4gbDHYdMOAapUK0mNL7BGG2rhfEwR6i0NucAMoGrVHYjgiJkZAXNJ
	o/Q9Wq9KPsiP+KfDqt5d/vN6jeM/wIMNaBs2ZW475l2GrGUPbXruNW2E/F+s7tj2qxOPhDL8zBors
	grV4wRvRlf/lWIN60RSTs2MX3zC7EgKml9g9isU/bW8pVWbkRMCslroVBVW2a39V7NQJBuWEZbsmF
	FLXb1IZsY5a6441bYr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTVA-008rVT-1D;
	Wed, 26 Jul 2023 01:39:44 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTV7-008rTq-1h
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 01:39:43 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-583b019f1cbso49680057b3.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 18:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690335578; x=1690940378;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=;
        b=MZxYT2MdZ0Omg+tGFjNofeHkNy3Qahh2PBaeRGC1CPgAvaobe+CbfQzviGlH2bRGld
         yZXqVlc4rdM7Hn/0uDpIIp7PtuXFyXV1rOEzEcPsa6KfHQ8WsO8NrD1ggf9GGi+atd7F
         nKDBxVEOzhZviRxzmHMsde7z3UqWCZoSc0lNm1akA/R8EHPW9npAKef3Z/pjfCjWQWBN
         xmycegOze/hxSYYenv2HpylIbUfqF9JiHr0gy59wVHZoy8dXEq78uEH7BvhlWGHxnNVM
         Pm/pG6h4Z3mK+EEHLb2xoyIraXRTQQ+dd3MgzFr8XAVX1x101W0eH3RmqvYAcZ2a0tMf
         tMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690335578; x=1690940378;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=;
        b=gzgmF/moZLQIiz38eib79R3VPrSgLvtvQyc9bWRAqdXMAselZIrHM+4WdjxLndZHq0
         V5FJcqlv2wtFFYlgEIMExwtI7Hb0LKsN93MTivl6VFpwkHc7qujPRYfNLRaEVzTPyVLr
         Pzz+xn/jnmEPXf+xNemg7miy62nqTeXknRht5r5bGuodp+HvOy/ZO5Fk46oLZwMHTyn/
         APSrVYKzOFi2EewpTNhiOCW+3D4Z+OJFZ5qFI1Y4jxwWP6n712+4qRGYCi403rd4bgT5
         rCFlfdPB4Zoroxny3ibhweduFF2opo2PiaAdcJ4plXRF7baIBBjfuFWA6h8GwMEQs9Re
         NTOw==
X-Gm-Message-State: ABy/qLYIf2u2aRuP72E2/6rnVy6M1basA+cM6zlPXdhVszuXN8a9x3LJ
	6v6YGBk6tCnKu2G+P0kINfcvMw==
X-Google-Smtp-Source: APBJJlHxqCs0/k9opPHZr1oFjC/IjLn2NWFjtEyuaFY5bDdVyDOg3sTAz2vkUnxY9z5liUX1UEynKA==
X-Received: by 2002:a81:46c3:0:b0:56d:2189:d87a with SMTP id t186-20020a8146c3000000b0056d2189d87amr821699ywa.15.1690335578030;
        Tue, 25 Jul 2023 18:39:38 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id s10-20020a5b044a000000b00c654cc439fesm3165326ybp.52.2023.07.25.18.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 18:39:37 -0700 (PDT)
Date: Tue, 25 Jul 2023 18:39:25 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jeff Layton <jlayton@kernel.org>
cc: Eric Van Hensbergen <ericvh@kernel.org>, 
    Latchesar Ionkov <lucho@ionkov.net>, 
    Dominique Martinet <asmadeus@codewreck.org>, 
    Christian Schoenebeck <linux_oss@crudebyte.com>, 
    David Howells <dhowells@redhat.com>, 
    Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, 
    Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
    Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
    Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
    Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>, 
    Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>, 
    Jeffle Xu <jefflexu@linux.alibaba.com>, 
    Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
    Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
    Andreas Dilger <adilger.kernel@dilger.ca>, 
    Jaegeuk Kim <jaegeuk@kernel.org>, 
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
    "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>, 
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
    linux-xfs@vger.kernel.org
Subject: Re: [PATCH v6 3/7] tmpfs: bump the mtime/ctime/iversion when page
 becomes writeable
In-Reply-To: <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
Message-ID: <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org> <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_183941_565230_FAEB268D 
X-CRM114-Status: GOOD (  25.98  )
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

On Tue, 25 Jul 2023, Jeff Layton wrote:

> Most filesystems that use the pagecache will update the mtime, ctime,
> and change attribute when a page becomes writeable. Add a page_mkwrite
> operation for tmpfs and just use it to bump the mtime, ctime and change
> attribute.
> 
> This fixes xfstest generic/080 on tmpfs.

Huh.  I didn't notice when this one crept into the multigrain series.

I'm inclined to NAK this patch: at the very least, it does not belong
in the series, but should be discussed separately.

Yes, tmpfs does not and never has used page_mkwrite, and gains some
performance advantage from that.  Nobody has ever asked for this
change before, or not that I recall.

Please drop it from the series: and if you feel strongly, or know
strong reasons why tmpfs suddenly needs to use page_mkwrite now,
please argue them separately.  To pass generic/080 is not enough.

Thanks,
Hugh

> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  mm/shmem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b154af49d2df..654d9a585820 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct inode *inode = file_inode(vma->vm_file);
> +
> +	file_update_time(vma->vm_file);
> +	inode_inc_iversion(inode);
> +	return 0;
> +}
> +
>  unsigned long shmem_get_unmapped_area(struct file *file,
>  				      unsigned long uaddr, unsigned long len,
>  				      unsigned long pgoff, unsigned long flags)
> @@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops = {
>  
>  static const struct vm_operations_struct shmem_vm_ops = {
>  	.fault		= shmem_fault,
> +	.page_mkwrite	= shmem_page_mkwrite,
>  	.map_pages	= filemap_map_pages,
>  #ifdef CONFIG_NUMA
>  	.set_policy     = shmem_set_policy,
> @@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm_ops = {
>  
>  static const struct vm_operations_struct shmem_anon_vm_ops = {
>  	.fault		= shmem_fault,
> +	.page_mkwrite	= shmem_page_mkwrite,
>  	.map_pages	= filemap_map_pages,
>  #ifdef CONFIG_NUMA
>  	.set_policy     = shmem_set_policy,
> 
> -- 
> 2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
