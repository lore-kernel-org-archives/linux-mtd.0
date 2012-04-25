Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN4Zh-00040D-P3
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 15:56:14 +0000
Message-ID: <4F981E9B.9050602@newsguy.com>
Date: Wed, 25 Apr 2012 08:56:11 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH 0/7] mtd: Change meaning of -EUCLEAN return code on reads
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <20120425112319.GA23701@parrot.com>
In-Reply-To: <20120425112319.GA23701@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/25/2012 04:23 AM, Ivan Djelic wrote:
> 
> Thanks for this new version.
> The whole series of patches looks OK to me, except for one small glitch:
> 'mtd->bitflip_threshold' can be customized by the driver, but in that case it is not
> propagated to the slave partition devices (the same way 'ecc_strength' is propagated).
> Something like this is missing:
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index d6321f6..d518e4d 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -517,6 +517,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  
>         slave->mtd.ecclayout = master->ecclayout;
>         slave->mtd.ecc_strength = master->ecc_strength;
> +       slave->mtd.bitflip_threshold = master->bitflip_threshold;
> +
>         if (master->_block_isbad) {
>                 uint64_t offs = 0;
> 


Yes, you're right.  Without this it breaks if the driver sets bitflip_threshold.


> Apart from that, I was able to run a few tests on a BeagleBoard revC3 with simulated
> bitflips, dropping my own error concealment code in favor of your patch. I did the
> following checks:
>  - when errors_corrected < bitflip_threshold, check that mtd_read() returns 0
>  - when errors_corrected >= bitflip_threshold, check that mtd_read() returns -EUCLEAN
>  - check if driver customization of bitflip_threshold works


I guess I should have performed this test too :)


>  - check if per-partition customization of bitflip_threshold through sysfs works
> Everything worked as expected.


Thanks once again Ivan.  I'll follow up with a new version of the patch set in a
day or too.

Mike
