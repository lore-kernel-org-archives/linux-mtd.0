Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ver7u-00030R-8x
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 18:49:51 +0000
Received: by mail-ie0-f169.google.com with SMTP id ar20so4011674iec.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 10:49:29 -0800 (PST)
Date: Fri, 8 Nov 2013 10:49:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: mtdchar: return expected errors on mmap() call
Message-ID: <20131108184924.GD20061@ld-irv-0074.broadcom.com>
References: <1382976495-1250-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382976495-1250-1-git-send-email-vladimir_zapolskiy@mentor.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 28, 2013 at 06:08:15PM +0200, Vladimir Zapolskiy wrote:
> According both to POSIX.1-2008 and Linux Programmer's Manual mmap()
> syscall shouldn't return undocumented ENOSYS, this change replaces
> the errno with more appropriate ENODEV and EACCESS.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>

This looks correct to me. While it is technically an ABI breakage
(somebody could have been relying on our non-standard -ENOSYS??), it is
probably better to match POSIX and the Linux Programmer's Manual, to
keep MTD in line with everyone else.

But David, please speak up if you think this is not the right way to go.

> ---
>  drivers/mtd/mtdchar.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 684bfa3..a4c026e 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -1099,7 +1099,7 @@ static unsigned long mtdchar_get_unmapped_area(struct file *file,
>  		return (unsigned long) -EINVAL;
>  
>  	ret = mtd_get_unmapped_area(mtd, len, offset, flags);
> -	return ret == -EOPNOTSUPP ? -ENOSYS : ret;
> +	return ret == -EOPNOTSUPP ? -ENODEV : ret;
>  }
>  #endif
>  
> @@ -1124,9 +1124,9 @@ static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
>  #endif
>  		return vm_iomap_memory(vma, map->phys, map->size);
>  	}
> -	return -ENOSYS;
> +	return -ENODEV;
>  #else
> -	return vma->vm_flags & VM_SHARED ? 0 : -ENOSYS;
> +	return vma->vm_flags & VM_SHARED ? 0 : -EACCES;
>  #endif
>  }
>  

Pushed to l2-mtd.git. Thanks!

Brian
