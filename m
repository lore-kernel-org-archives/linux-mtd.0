Date: Wed, 14 Dec 2016 08:08:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, nicolas.pitre@linaro.org,
 mark.rutland@arm.com, matt@codeblueprint.co.uk, stefan@agner.ch,
 chris.brandt@renesas.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@atmel.com, panand@redhat.com, pawel.moll@arm.com,
 richard@nod.at, linux@armlinux.org.uk, ben@decadent.org.uk,
 vladimir.murzin@arm.com, keescook@chromium.org, arnd@arndb.de,
 labbott@fedoraproject.org, jonathan.austin@arm.com,
 ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 kirill.shutemov@linux.intel.com, js07.lee@samsung.com
Subject: Re: [PATCH v3 1/4] mtd: lart: Rename partition defines to be
 prefixed with PART_
Message-ID: <20161214080836.6149dc42@bbrezillon>
In-Reply-To: <20161209233628.6642-2-f.fainelli@gmail.com>
References: <20161208185933.13749-1-f.fainelli@gmail.com>
 <20161209233628.6642-1-f.fainelli@gmail.com>
 <20161209233628.6642-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri,  9 Dec 2016 15:36:25 -0800
Florian Fainelli <f.fainelli@gmail.com> wrote:

> In preparation for defining KERNEL_START on ARM, rename KERNEL_START to
> PART_KERNEL_START, and to be consistent, do this for all
> partition-related constants.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/devices/lart.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
> index 82bd00af5cc3..268aae45b514 100644
> --- a/drivers/mtd/devices/lart.c
> +++ b/drivers/mtd/devices/lart.c
> @@ -75,18 +75,18 @@ static char module_name[] = "lart";
>  
>  /* blob */
>  #define NUM_BLOB_BLOCKS		FLASH_NUMBLOCKS_16m_PARAM
> -#define BLOB_START			0x00000000
> -#define BLOB_LEN			(NUM_BLOB_BLOCKS * FLASH_BLOCKSIZE_PARAM)
> +#define PART_BLOB_START		0x00000000
> +#define PART_BLOB_LEN		(NUM_BLOB_BLOCKS * FLASH_BLOCKSIZE_PARAM)
>  
>  /* kernel */
>  #define NUM_KERNEL_BLOCKS	7
> -#define KERNEL_START		(BLOB_START + BLOB_LEN)
> -#define KERNEL_LEN			(NUM_KERNEL_BLOCKS * FLASH_BLOCKSIZE_MAIN)
> +#define PART_KERNEL_START	(PART_BLOB_START + PART_BLOB_LEN)
> +#define PART_KERNEL_LEN		(NUM_KERNEL_BLOCKS * FLASH_BLOCKSIZE_MAIN)
>  
>  /* initial ramdisk */
>  #define NUM_INITRD_BLOCKS	24
> -#define INITRD_START		(KERNEL_START + KERNEL_LEN)
> -#define INITRD_LEN			(NUM_INITRD_BLOCKS * FLASH_BLOCKSIZE_MAIN)
> +#define PART_INITRD_START	(PART_KERNEL_START + PART_KERNEL_LEN)
> +#define PART_INITRD_LEN		(NUM_INITRD_BLOCKS * FLASH_BLOCKSIZE_MAIN)
>  
>  /*
>   * See section 4.0 in "3 Volt Fast Boot Block Flash Memory" Intel Datasheet
> @@ -587,20 +587,20 @@ static struct mtd_partition lart_partitions[] = {
>  	/* blob */
>  	{
>  		.name	= "blob",
> -		.offset	= BLOB_START,
> -		.size	= BLOB_LEN,
> +		.offset	= PART_BLOB_START,
> +		.size	= PART_BLOB_LEN,
>  	},
>  	/* kernel */
>  	{
>  		.name	= "kernel",
> -		.offset	= KERNEL_START,		/* MTDPART_OFS_APPEND */
> -		.size	= KERNEL_LEN,
> +		.offset	= PART_KERNEL_START,	/* MTDPART_OFS_APPEND */
> +		.size	= PART_KERNEL_LEN,
>  	},
>  	/* initial ramdisk / file system */
>  	{
>  		.name	= "file system",
> -		.offset	= INITRD_START,		/* MTDPART_OFS_APPEND */
> -		.size	= INITRD_LEN,		/* MTDPART_SIZ_FULL */
> +		.offset	= PART_INITRD_START,	/* MTDPART_OFS_APPEND */
> +		.size	= PART_INITRD_LEN,	/* MTDPART_SIZ_FULL */
>  	}
>  };
>  #define NUM_PARTITIONS ARRAY_SIZE(lart_partitions)
