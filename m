Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jk3Dg-0006Dc-Ow
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 20:18:05 +0000
Message-ID: <47FE7392.2060900@users.sourceforge.net>
Date: Thu, 10 Apr 2008 22:07:46 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: Return values of jffs2_block_check_erase error paths
References: <42739.212.247.11.1.1205350163.squirrel@webmail.sys.kth.se>
In-Reply-To: <42739.212.247.11.1.1205350163.squirrel@webmail.sys.kth.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anders Grafström wrote:
> It looks like the error paths in jffs2_block_check_erase() have wrong return values.
> A block that failed to be erased never gets marked as bad.
> 
> Any comments on this patch?
> 
> Anders
> 
> 
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index a1db918..23e9dd6 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -350,9 +350,11 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
>  			   break;
>  		} while(--retlen);
>  		c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
> -		if (retlen)
> +		if (retlen) {
>  			printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08tx\n",
>  			       *wordebuf, jeb->offset + c->sector_size-retlen*sizeof(*wordebuf));
> +			return -EIO;
> +		}
>  		return 0;
>  	}
>   do_flash_read:
> @@ -373,10 +375,12 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
>  		ret = c->mtd->read(c->mtd, ofs, readlen, &retlen, ebuf);
>  		if (ret) {
>  			printk(KERN_WARNING "Read of newly-erased block at 0x%08x failed: %d. Putting on bad_list\n", ofs, ret);
> +			ret = -EIO;
>  			goto fail;
>  		}
>  		if (retlen != readlen) {
>  			printk(KERN_WARNING "Short read from newly-erased block at 0x%08x. Wanted %d, got %zd\n", ofs, readlen, retlen);
> +			ret = -EIO;
>  			goto fail;
>  		}
>  		for (i=0; i<readlen; i += sizeof(unsigned long)) {
> @@ -385,6 +389,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
>  			if (*datum + 1) {
>  				*bad_offset += i;
>  				printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08x\n", *datum, *bad_offset);
> +				ret = -EIO;
>  				goto fail;
>  			}
>  		}


Nobody looked at this?
This issue caused a corrupt file system.

/Anders
