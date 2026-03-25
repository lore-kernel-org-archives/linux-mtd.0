Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8234BFEA837
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiGmx/0PUayhdjjRD4DrInry1D+KjXiLdisPmBVCit8=; b=MvKZMa9qY+vaRc
	VqVXKW4+l1q2Nebegfq3Yh4sPnTZE6QvLO7x52ufSldtJimwnXF+zcVF4AQE7m6GYEySPIurpQvya
	IZ9vwRXFT6nBzkP8jkQ5lTv6U0Jd7T6K7PX/M7Gwi569rq9ZZPmsPV9QmbcBfZxT30VhPBgESPm6G
	4K6kiNQFKqx2Pe/WpX9kaCPLb5xLROwaXx4uTFjco4L638T+jh95ZUpR3ApsEgeVeGU9YZ4Q1QXAe
	jUDyN40QCvX1MsDwk1iNm9fMl+AQ445cZkV4dUDnWV2z46XFDTrf6CI5+mIa0zwXTb6d8hvPXjl6/
	VKTQkKk5IU9lO+kAsGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KC4-000000030MB-2r0n;
	Wed, 25 Mar 2026 09:06:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KC2-000000030Lu-1mSX;
	Wed, 25 Mar 2026 09:06:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73617600AC;
	Wed, 25 Mar 2026 09:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5A1C4CEF7;
	Wed, 25 Mar 2026 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774429585;
	bh=TGeHJllmZaOU480qUtXeb/jUm42/azepnhJdaLl9P5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B/pXGWqxkc77H/QNjcNN4hXFs+1yWtOO/K6ZlFDqfhgwHp4yHtUXBY1gINF1N/v7H
	 Swoeh/4pl25iEnor6XcK93/xaSpBQCXea/x0tJWaU2vmaO0gQrTCNvrvDCRgFprVKV
	 1KqlwKP+22aqYID5Rc4LF4kA7w+kAFXYTzDiwCQpdMmDJrHF9HDz+HIU9m1OkF3LTb
	 /jwCEhab+UIAPA9vKX7zWI8lclKZJMoZ3e82DcRkAVWva3ZfDqkkW0tKKWs9g8wCY/
	 xPGCmHA6G5g4E8Zs8WC6hluY2t54Kvjz8OpvZWbU1RkOlOvI5O2Nk6MOymHovUB97F
	 cRXNnffbCU5+g==
Message-ID: <e9e9c3a3-26fb-4ca5-af27-158f4860a810@kernel.org>
Date: Wed, 25 Mar 2026 10:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/21] fs: afs: revert mmap_prepare() change
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Ryan Roberts <ryan.roberts@arm.com>
References: <cover.1774045440.git.ljs@kernel.org>
 <08804c94e39d9102a3a8fbd12385e8aa079ba1d3.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <08804c94e39d9102a3a8fbd12385e8aa079ba1d3.1774045440.git.ljs@kernel.org>
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

On 3/20/26 23:39, Lorenzo Stoakes (Oracle) wrote:
> Partially reverts commit 9d5403b1036c ("fs: convert most other
> generic_file_*mmap() users to .mmap_prepare()").
> 
> This is because the .mmap invocation establishes a refcount, but
> .mmap_prepare is called at a point where a merge or an allocation failure
> might happen after the call, which would leak the refcount increment.
> 
> Functionality is being added to permit the use of .mmap_prepare in this
> case, but in the interim, we need to fix this.
> 
> Fixes: 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to .mmap_prepare()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  fs/afs/file.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index f609366fd2ac..74d04af51ff4 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -19,7 +19,7 @@
>  #include <trace/events/netfs.h>
>  #include "internal.h"
>  
> -static int afs_file_mmap_prepare(struct vm_area_desc *desc);
> +static int afs_file_mmap(struct file *file, struct vm_area_struct *vma);
>  
>  static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
>  static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
> @@ -35,7 +35,7 @@ const struct file_operations afs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= afs_file_read_iter,
>  	.write_iter	= netfs_file_write_iter,
> -	.mmap_prepare	= afs_file_mmap_prepare,
> +	.mmap		= afs_file_mmap,
>  	.splice_read	= afs_file_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fsync		= afs_fsync,
> @@ -492,16 +492,16 @@ static void afs_drop_open_mmap(struct afs_vnode *vnode)
>  /*
>   * Handle setting up a memory mapping on an AFS file.
>   */
> -static int afs_file_mmap_prepare(struct vm_area_desc *desc)
> +static int afs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> -	struct afs_vnode *vnode = AFS_FS_I(file_inode(desc->file));
> +	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
>  	int ret;
>  
>  	afs_add_open_mmap(vnode);
>  
> -	ret = generic_file_mmap_prepare(desc);
> +	ret = generic_file_mmap(file, vma);
>  	if (ret == 0)
> -		desc->vm_ops = &afs_vm_ops;
> +		vma->vm_ops = &afs_vm_ops;
>  	else
>  		afs_drop_open_mmap(vnode);
>  	return ret;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
