Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kg2HN-00088E-EL
	for linux-mtd@lists.infradead.org; Wed, 17 Sep 2008 19:01:34 +0000
Date: Wed, 17 Sep 2008 12:01:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zev Weiss <zevweiss@gmail.com>
Subject: Re: [PATCH 3/3] [MTD] physmap.c: Add a dummy release function
Message-Id: <20080917120129.f6d3544b.akpm@linux-foundation.org>
In-Reply-To: <48CB5EA4.10907@gmail.com>
References: <48CB5EA4.10907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Subject: [PATCH 3/3] [MTD] physmap.c: Add a dummy release function

Please avoid putting the "MTD" inside the [] characters.  Anything
which is inside [] is supposed to be discarded by the patch-receiving
party.  This is for things like [rfc], [patch 3/12], [2.6.27-rc5], etc.

But we do want the "mtd" text to go all the way through into the
mainline git metadata.

On Fri, 12 Sep 2008 23:33:08 -0700
Zev Weiss <zevweiss@gmail.com> wrote:

> 
> Adding a dummy release function to the physmap device so as to silence a log
> warning on initialization.
> 
> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
> ---
>   drivers/mtd/maps/physmap.c |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 49e2039..73a8d3c 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -277,11 +277,16 @@ static struct resource physmap_flash_resource = {
>   	.flags		= IORESOURCE_MEM,
>   };
> 
> +static void physmap_dummy_release(struct device *dev)
> +{
> +}
> +
>   static struct platform_device physmap_flash = {
>   	.name		= "physmap-flash",
>   	.id		= 0,
>   	.dev		= {
>   		.platform_data	= &physmap_flash_data,
> +		.release	= &physmap_dummy_release,
>   	},
>   	.num_resources	= 1,
>   	.resource	= &physmap_flash_resource,

Nope.  Please see Documentation/kobject.txt - search for the text
"mocked mercilessly".  
