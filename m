Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZFqt-0000QU-7V
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 08:01:07 +0000
Received: by mail-pb0-f47.google.com with SMTP id rq2so1805127pbb.6
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 01:00:45 -0700 (PDT)
Date: Thu, 24 Oct 2013 01:00:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH for mtd-utils] flash_erase: check the nand type
Message-ID: <20131024080041.GC9863@norris.computersforpeace.net>
References: <1382594766-27467-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382594766-27467-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 24, 2013 at 02:06:06PM +0800, Huang Shijie wrote:
> Now, the MTD_NANDFLASH stands for SLC nand, and the MTD_MLCNANDFLASH
> stands for the MLC nand.
> 
> This patch checks the right nand type for the MLC and SLC nand.
> And if it is a MLC nand, we do not write cleanmarker for it, only print
> out a message to warn the user.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  flash_erase.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/flash_erase.c b/flash_erase.c
> index 1421cf9..dd75334 100644
> --- a/flash_erase.c
> +++ b/flash_erase.c
> @@ -184,7 +184,8 @@ int main(int argc, char *argv[])
>  
>  	eb_start = start / mtd.eb_size;
>  
> -	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;
> +	isNAND = (mtd.type == MTD_NANDFLASH || mtd.type == MTD_MLCNANDFLASH)
> +			? 1 : 0;

Perhaps you can #include <stdbool.h> and make 'isNAND' into a proper
bool variable? Then this becomes:

	isNAND = mtd.type == MTD_NANDFLASH || mtd.type == MTD_MLCNANDFLASH;

>  
>  	if (jffs2) {
>  		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
> @@ -272,6 +273,12 @@ int main(int argc, char *argv[])
>  
>  		/* write cleanmarker */
>  		if (isNAND) {
> +			if (mtd.type == MTD_MLCNANDFLASH) {
> +				sys_errmsg("%s: we can't write the cleanmarker "
> +					"for the MLC nand.", mtd_device);
> +				continue;
> +			}
> +

This is in a loop. This will print the same message repeatedly if you
are erasing/marking an entire partition. Please test your changes before
sending v2.

You could probably just error out (or warn) like the following.

diff --git a/flash_erase.c b/flash_erase.c
index 1421cf9..0e385e9 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -169,6 +169,9 @@ int main(int argc, char *argv[])
 	if (error)
 		return errmsg("Try `--help' for more information");
 
+	if (jffs2 && mtd.type == MTD_MLCNANDFLASH)
+		return errmsg("JFFS2 cannot support MLC NAND");
+
 	/*
 	 * Locate MTD and prepare for erasure
 	 */

>  			if (mtd_write_oob(mtd_desc, &mtd, fd, (uint64_t)offset + clmpos, clmlen, &cleanmarker) != 0) {
>  				sys_errmsg("%s: MTD writeoob failure", mtd_device);
>  				continue;

Brian
