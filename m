Received: from 81-7-68-229.static.zebra.lt ([81.7.68.229] helo=teltonika.lt)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW4Y8-0005UR-4k
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 07:25:40 +0000
Message-ID: <48AD1860.4040001@teltonika.lt>
Date: Thu, 21 Aug 2008 10:25:20 +0300
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
MIME-Version: 1.0
To: jaredeh@gmail.com
Subject: Re: [PATCH 01/10] AXFS: exporting xip_file_fault() for use with AXFS
References: <48AD00D5.5010904@gmail.com>
In-Reply-To: <48AD00D5.5010904@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
	tim.bird@AM.SONY.COM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> We'll need this for AXFS.  The equivalent function in filemap.c is exported.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> ---
>  include/linux/mm.h |    4 ++++
>  mm/filemap_xip.c   |    3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 72a15dc..2be5c22 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -161,6 +161,10 @@ struct vm_fault {
>  					 */
>  };
>  
> +#ifdef CONFIG_FS_XIP
> +extern int xip_file_fault(struct vm_area_struct *vma, struct vm_fault *vmf);
> +#endif
> +

No need for #ifdef here as this function is compiled and exported in .c
regardless of CONFIG_FS_XIP

>  /*
>   * These are the virtual MM functions - opening of an area, closing and
>   * unmapping it (needed to keep files on disk up-to-date etc), pointer
> diff --git a/mm/filemap_xip.c b/mm/filemap_xip.c
> index 380ab40..ab2f174 100644
> --- a/mm/filemap_xip.c
> +++ b/mm/filemap_xip.c
> @@ -206,7 +206,7 @@ __xip_unmap (struct address_space * mapping,
>   *
>   * This function is derived from filemap_fault, but used for execute in place
>   */
> -static int xip_file_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
> +int xip_file_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
>  {
>  	struct file *file = vma->vm_file;
>  	struct address_space *mapping = file->f_mapping;
> @@ -262,6 +262,7 @@ found:
>  		return 0;
>  	}
>  }
> +EXPORT_SYMBOL_GPL(xip_file_fault);
>  
>  static struct vm_operations_struct xip_file_vm_ops = {
>  	.fault	= xip_file_fault,
> 
