Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bdh7-0006ou-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 09:30:45 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20030123015659.422e8179.akpm@digeo.com> 
References: <20030123015659.422e8179.akpm@digeo.com>  <000001c2c287$ffa8eef0$800b040f@bergamot> <15943.1043315303@passion.cambridge.redhat.com> 
To: Andrew Morton <akpm@digeo.com>
Cc: ch@murgatroid.com, fbecker@intrinsyc.com,
    linux-arm-kernel@lists.arm.linux.org.uk,
    linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: 2.5.55-rmk1: user space lossage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 23 Jan 2003 10:01:12 +0000
Message-ID: <17281.1043316072@passion.cambridge.redhat.com>
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

akpm@digeo.com said:
> Linus did it!

> diff -puN mm/filemap.c~generic_file_readonly_mmap-fix mm/filemap.c
> --- 25/mm/filemap.c~generic_file_readonly_mmap-fix	2003-01-23 01:55:41 -0800
> +++ 25-akpm/mm/filemap.c	2003-01-23 01:55:45 -0800
> @@ -1312,7 +1312,6 @@ int generic_file_readonly_mmap(struct fi
>  {
>  	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_WRITE))
> 		return -EINVAL;
> - 	vma->vm_flags &= ~VM_MAYWRITE;
>  	return generic_file_mmap(file, vma);
>  }
>  #else


-  	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_WRITE))
+-  	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_WRITE))
++ 	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))



...?

--
dwmw2
