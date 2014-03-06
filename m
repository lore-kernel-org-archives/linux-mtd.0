Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLg1P-0005vV-JA
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 21:40:08 +0000
Received: by mail-ig0-f179.google.com with SMTP id t19so197963igi.0
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 13:39:45 -0800 (PST)
Date: Thu, 6 Mar 2014 13:39:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [RFC PATCH] mtd: allow mmap for ram devices in memory address
 space.
Message-ID: <20140306213941.GB5232@ld-irv-0074>
References: <1394091146-26122-1-git-send-email-phdm@macqel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394091146-26122-1-git-send-email-phdm@macqel.be>
Cc: David Howells <dhowells@redhat.com>, Markus Niebel <list-09@tqsc.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 06, 2014 at 08:32:26AM +0100, Philippe De Muyter wrote:
> Implement mmap for mtd-ram, by using mtd->_get_unmapped_area, as asked by
> an ancient comment, to get the physical address (if any) in memory of the
> mtd device.
> 
> Therefore, mapram_unmapped_area had to be changed to return the physical
> address, not the virtual one, For the NOMMU case, that makes no difference,
> but for the MMU case, this is needed by mapram_unmapped_area to implement mmap.
> 
> Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Markus Niebel <list-09@tqsc.de>
> ---
>  drivers/mtd/chips/map_ram.c |    2 +-
>  drivers/mtd/mtdchar.c       |   12 +++++++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
> index 991c2a1..e93d147 100644
> --- a/drivers/mtd/chips/map_ram.c
> +++ b/drivers/mtd/chips/map_ram.c
> @@ -92,7 +92,7 @@ static unsigned long mapram_unmapped_area(struct mtd_info *mtd,
>  					  unsigned long flags)
>  {
>  	struct map_info *map = mtd->priv;
> -	return (unsigned long) map->virt + offset;
> +	return (unsigned long) map->phys + offset;
>  }
>  
>  static int mapram_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 2147e73..00eac7a 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -1112,13 +1112,23 @@ static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
>  #ifdef CONFIG_MMU
>  	struct mtd_file_info *mfi = file->private_data;
>  	struct mtd_info *mtd = mfi->mtd;
> -	struct map_info *map = mtd->priv;
> +	loff_t offset = vma->vm_pgoff << PAGE_SHIFT;
> +	loff_t len = vma->vm_end - vma->vm_start;
>  
> +	if (offset > mtd->size - len)
> +		return (unsigned long) -EINVAL;

What's the cast doing? This function returns 'int'.

And anyway, you're duplicating the checks that are already in
mtd_get_unmapped_area(). See below.

> +	if (mtd->_get_unmapped_area) {
> +		phys_addr_t start;
> +
> +		start = mtd->_get_unmapped_area(mtd, len, offset, vma->vm_flags);

You should be using mtd_get_unmapped_area(), as the comment below says.
The underscore in front of the function pointer is to prevent people
from using them directly. You can check for -EOPNOTSUPP after calling
mtd_get_unmapped_area().

> +		return vm_iomap_memory(vma, start, len);
> +	}
>          /* This is broken because it assumes the MTD device is map-based
>  	   and that mtd->priv is a valid struct map_info.  It should be
>  	   replaced with something that uses the mtd_get_unmapped_area()
>  	   operation properly. */
>  	if (0 /*mtd->type == MTD_RAM || mtd->type == MTD_ROM*/) {
> +		struct map_info *map = mtd->priv;

You're adding dead code. It's behind an 'if (0)'. Could you perhaps take
a harder look at this code and fix up or kill any cruft?

>  #ifdef pgprot_noncached
>  		if (file->f_flags & O_DSYNC || map->phys >= __pa(high_memory))
>  			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);

Brian
