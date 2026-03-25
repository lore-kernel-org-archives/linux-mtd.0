Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FEAFEA83B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IceblcH/40zKBLMUOPWSunJj33YjbaIljiHCvibFrpQ=; b=Ec51YuLUlz6pYl
	cpWyvx+pcTi6I1nAQBjkI1nbifY7pDwodkQL1D13Pq8eEcA3rN++JH/djiUqiR9qtt4NOftPA5OIE
	elUW6icX2RwqZe8jMYFh6GKeI7cDffYzT7tlRqWgpo3x4S/W/ZW6d3sYV16wozVN4MJ7y1XcppAUk
	keN8VFPCvHuCfLfuBdbIi7SIIELrmG2FgB1Zelb0WfK8RS3Q/Nzu80tYt3e1rVL9cZncJ6PO7uPbl
	P5g5dlUKyDCWzCecgdv6ekRiFbOO55TXmAY9AbmxT6gNWEHB6dI4iK755b7MfBlE2NmFfIABB4s65
	YDLVQVdOEhdG4CbKuW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LPk-000000038gj-0T99;
	Wed, 25 Mar 2026 10:24:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LPd-000000038dF-3opa;
	Wed, 25 Mar 2026 10:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6302F42B44;
	Wed, 25 Mar 2026 10:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E4BC4CEF7;
	Wed, 25 Mar 2026 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434273;
	bh=p4SW4OpQ2gx0HoB77aBSsnjwhDuxQYBolk+cHDEmzKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rltdof9WVS1oLv7QKy5GNxKTX8mlW2HgTiPkyXeuRV8FNUrkT4uU+tfK1KoQf3TX1
	 xP+TliwzDp1e4MLsTqESjen2eS+wbB81pAShhC6mK28s3pqWxaEs2Mb+IrYppT8eZH
	 TPC02Kd1mT9gqJydmCpD2Qwh0LJu38txLVjjjeMo4FGzB6IPFOWufdRWT40wn8htYz
	 +f7Lm0aCjnia373FFBJqr5enbiSEeSfPNX/qtxpQrXBVpJ+mBWIgTTGoeDmwXCrtrR
	 u/m4V4mFx7bCyD2IP4UzNrOTYy2mol024IH/vOfvsdtvhAH41ttZAmOrAXSl4Ravy0
	 Nyg1aFmIMxaew==
Message-ID: <325b874f-55f5-4e9d-a924-11efa95b8ec8@kernel.org>
Date: Wed, 25 Mar 2026 11:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/21] stm: replace deprecated mmap hook with
 mmap_prepare
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
 <9f3d559a264a83cf45518fcf35cc7ef1d7dfd500.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <9f3d559a264a83cf45518fcf35cc7ef1d7dfd500.1774045440.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_032434_000521_A8F82EE7 
X-CRM114-Status: GOOD (  21.61  )
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
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
> 
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> 
> Also, in order to correctly maintain reference counting, add a
> vm_ops->mapped callback to increment the reference count when successfully
> mapped.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  drivers/hwtracing/stm/core.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 37584e786bb5..f48c6a8a0654 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -666,6 +666,16 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
>  	return count;
>  }
>  
> +static int stm_mmap_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> +			   const struct file *file, void **vm_private_data)
> +{
> +	struct stm_file *stmf = file->private_data;
> +	struct stm_device *stm = stmf->stm;
> +
> +	pm_runtime_get_sync(&stm->dev);
> +	return 0;
> +}
> +
>  static void stm_mmap_open(struct vm_area_struct *vma)
>  {
>  	struct stm_file *stmf = vma->vm_file->private_data;
> @@ -684,12 +694,14 @@ static void stm_mmap_close(struct vm_area_struct *vma)
>  }
>  
>  static const struct vm_operations_struct stm_mmap_vmops = {
> +	.mapped = stm_mmap_mapped,
>  	.open	= stm_mmap_open,
>  	.close	= stm_mmap_close,
>  };
>  
> -static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
> +static int stm_char_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct stm_file *stmf = file->private_data;
>  	struct stm_device *stm = stmf->stm;
>  	unsigned long size, phys;
> @@ -697,10 +709,10 @@ static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (!stm->data->mmio_addr)
>  		return -EOPNOTSUPP;
>  
> -	if (vma->vm_pgoff)
> +	if (desc->pgoff)
>  		return -EINVAL;
>  
> -	size = vma->vm_end - vma->vm_start;
> +	size = vma_desc_size(desc);
>  
>  	if (stmf->output.nr_chans * stm->data->sw_mmiosz != size)
>  		return -EINVAL;
> @@ -712,13 +724,12 @@ static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (!phys)
>  		return -EINVAL;
>  
> -	pm_runtime_get_sync(&stm->dev);
> -
> -	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
> -	vma->vm_ops = &stm_mmap_vmops;
> -	vm_iomap_memory(vma, phys, size);
> +	desc->page_prot = pgprot_noncached(desc->page_prot);
> +	vma_desc_set_flags(desc, VMA_IO_BIT, VMA_DONTEXPAND_BIT,
> +			   VMA_DONTDUMP_BIT);
> +	desc->vm_ops = &stm_mmap_vmops;
>  
> +	mmap_action_simple_ioremap(desc, phys, size);
>  	return 0;
>  }
>  
> @@ -836,7 +847,7 @@ static const struct file_operations stm_fops = {
>  	.open		= stm_char_open,
>  	.release	= stm_char_release,
>  	.write		= stm_char_write,
> -	.mmap		= stm_char_mmap,
> +	.mmap_prepare	= stm_char_mmap_prepare,
>  	.unlocked_ioctl	= stm_char_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
>  };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
