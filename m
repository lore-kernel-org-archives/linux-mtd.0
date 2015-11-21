Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzvzZ-0003CS-8N
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 00:25:27 +0000
Received: by pacdm15 with SMTP id dm15so131186069pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 16:25:04 -0800 (PST)
Date: Fri, 20 Nov 2015 16:25:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-mtd@lists.infradead.org, David Howells <dhowells@redhat.com>,
 Markus Niebel <Markus.Niebel@tqs.de>
Subject: Re: [PATCH v3] mtd: mtdchar: allow mmap for ram devices in memory
 address space.
Message-ID: <20151121002501.GF64635@google.com>
References: <1394189058-12711-1-git-send-email-phdm@macqel.be>
 <1394200479-17168-1-git-send-email-phdm@macqel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394200479-17168-1-git-send-email-phdm@macqel.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case this gets resurrected...

On Fri, Mar 07, 2014 at 02:54:39PM +0100, Philippe De Muyter wrote:
> use mtd_get_unmapped_area, as asked by an ancient comment, to get
> the physical address (if any) in memory of the mtd device.
> 
> Therefore, mapram_unmapped_area had to be changed to return the physical
> address, not the virtual one, For the NOMMU case, that makes no difference,
> but for the MMU case, it is needed by mapram_unmapped_area to implement mmap.
> 
> Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Markus Niebel <Markus.Niebel@tqs.de>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
> v3: avoid duplicating test done by mtd_get_unmapped_area
> 
>  drivers/mtd/chips/map_ram.c |    2 +-
>  drivers/mtd/mtdchar.c       |   24 ++++++++++--------------
>  2 files changed, 11 insertions(+), 15 deletions(-)
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
> index 2147e73..5956246 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -1112,20 +1112,16 @@ static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
>  #ifdef CONFIG_MMU
>  	struct mtd_file_info *mfi = file->private_data;
>  	struct mtd_info *mtd = mfi->mtd;
> -	struct map_info *map = mtd->priv;
> -
> -        /* This is broken because it assumes the MTD device is map-based
> -	   and that mtd->priv is a valid struct map_info.  It should be
> -	   replaced with something that uses the mtd_get_unmapped_area()
> -	   operation properly. */
> -	if (0 /*mtd->type == MTD_RAM || mtd->type == MTD_ROM*/) {
> -#ifdef pgprot_noncached
> -		if (file->f_flags & O_DSYNC || map->phys >= __pa(high_memory))
> -			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -#endif
> -		return vm_iomap_memory(vma, map->phys, map->size);
> -	}
> -	return -ENODEV;
> +	loff_t offset = vma->vm_pgoff << PAGE_SHIFT;
> +	loff_t len = vma->vm_end - vma->vm_start;
> +	phys_addr_t start;
> +
> +	start = mtd_get_unmapped_area(mtd, len, offset, vma->vm_flags);

Hmm, you're storing an 'unsigned long' in 'phys_addr_t', then treating
it as unsigned for the error checking. Is that guaranteed to work right?
Especially if sizeof(phys_addr_t) != sizeof(unsigned long)? e.g., if
phys_addr_t is 64 bits (with PAE?), but unsigned long is 32-bits, we
might see:

	start = mtd_get_unmapped_area(); // -EOPNOTSUPP

But -EOPNOTSUPP in a 32-bit unsigned long is only:

	0xffffffa1

which extends to:

	0x00000000ffffffa1

and doesn't match favorably with '-EOPNOTSUPP' when you compare it
later.

I think it makes more sense for 'start' to either match the return type
of mtd_get_unmapped_area() (i.e., unsigned long), or else just be a
signed type, so we don't have the unsigned/signed comparison issues
below.

Regards,
Brian

> +	if (start == -EOPNOTSUPP)
> +		return -ENODEV;
> +	if (start == -EINVAL)
> +		return -EINVAL;
> +	return vm_iomap_memory(vma, start, len);
>  #else
>  	return vma->vm_flags & VM_SHARED ? 0 : -EACCES;
>  #endif
> -- 
> 1.7.5.3
> 
