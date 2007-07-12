Received: from e33.co.us.ibm.com ([32.97.110.151])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I91Iq-0004LX-Co
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 12:14:07 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6CGC00i014472
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2007 12:12:00 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l6CGBx8O173074
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2007 10:11:59 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6CGBxRf006501
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2007 10:11:59 -0600
Subject: Re: [Patch] drivers/mtd/maps/tqm8xxl.c: Style cleanups
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: WANG Cong <xiyou.wangcong@gmail.com>
In-Reply-To: <20070712150135.GA4102@localhost.localdomain>
References: <20070712150135.GA4102@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 12 Jul 2007 11:11:58 -0500
Message-Id: <1184256718.32199.111.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kirk@hpc.ee.ntu.edu.tw, akpm@osdl.org, dwmw2@infradead.org,
	LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-07-12 at 23:01 +0800, WANG Cong wrote:
> Change C++ style comments into K&R's.
> Cut long lines into pieces.
> 
> This patch is against 2.6.22.1, and can be also applied to
> the last -mm tree.
> 
> Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
> 
> ---
> 
>  tqm8xxl.c |   41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> Index: linux-2.6.22.1/drivers/mtd/maps/tqm8xxl.c
> ===================================================================
> --- a/drivers/mtd/maps/tqm8xxl.c	2007-04-26 11:08:32.000000000 +0800
> +++ b/drivers/mtd/maps/tqm8xxl.c	2007-07-05 00:16:16.000000000 +0800
> @@ -38,7 +38,7 @@
>  #define FLASH_SIZE 0x00800000
>  #define FLASH_BANK_MAX 4
> 
> -// trivial struct to describe partition information
> +/* trivial struct to describe partition information*/

Needs a space at the end.

>  struct mtd_part_def
>  {
>  	int nums;
> @@ -46,7 +46,7 @@
>  	struct mtd_partition* mtd_part;
>  };
> 
> -//static struct mtd_info *mymtd;
> +/*static struct mtd_info *mymtd;*/

Just delete this...

>  static struct mtd_info* mtd_banks[FLASH_BANK_MAX];
>  static struct map_info* map_banks[FLASH_BANK_MAX];
>  static struct mtd_part_def part_banks[FLASH_BANK_MAX];
> @@ -106,7 +106,7 @@
>  	  .name = "jffs",
>  	  .offset = 0x00200000,
>  	  .size = 0x00200000,
> -	  //.size = MTDPART_SIZ_FULL,
> +	  /*.size = MTDPART_SIZ_FULL,*/

Delete it...

>  	}
>  };
>  #endif
> @@ -121,10 +121,11 @@
>  	flash_addr = bd->bi_flashstart;
>  	flash_size = bd->bi_flashsize;
> 
> -	//request maximum flash size address space
> +	/*request maximum flash size address space*/

Spaces needed (repeat for the rest of the ones that don't have spaces
either).

josh
