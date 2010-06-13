Subject: Re: [PATCH] ixp4xx: add support for static flash partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20100531162434.GA4599@riccoc20.at.omicron.at>
References: <20100531162434.GA4599@riccoc20.at.omicron.at>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 12:16:06 +0300
Message-ID: <1276420566.19028.184.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Halasa <khc@pm.waw.pl>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-31 at 18:24 +0200, Richard Cochran wrote:
> This patch adds support for static flash partitioning from a platform
> device. Also, we clean up some weirdness where statements were separated
> by commas instead of semicolons. While we are at it, fix some minor bad
> white space, too.
> 
> Signed-off-by: Richard Cochran <richard.cochran@omicron.at>
> ---
>  drivers/mtd/maps/ixp4xx.c |   37 ++++++++++++++++++++++++++++---------
>  1 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
> index 7b05152..5345d11 100644
> --- a/drivers/mtd/maps/ixp4xx.c
> +++ b/drivers/mtd/maps/ixp4xx.c
> @@ -108,7 +108,7 @@ static void ixp4xx_copy_from(struct map_info *map, void *to,
>  
>  	if (from & 1) {
>  		*dest++ = BYTE1(flash_read16(src));
> -                src++;
> +		src++;
>  		--len;
>  	}

Your patch mostly applies, except of this chunk, which was modified
before by

commit 53f2b1c86a1fa1414be93571062ac4c263fa9fbc
Author: Jon Ringle <jon@ringle.org>
Date:   Wed Jan 13 09:36:10 2010 -0500

    mtd: ixp4xx: fix reading from half-word boundary
    
    Fix handling of reads that don't start on a half-word boundary.
    
    Signed-off-by: Jon Ringle <jon@ringle.org>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

I could fix your patch up myself, but I do not know the code, so please,
re-send a patch against the latest mtd-2.6 tree.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
