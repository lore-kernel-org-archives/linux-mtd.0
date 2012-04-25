Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SN0L3-0007KI-Dg
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 11:24:50 +0000
Date: Wed, 25 Apr 2012 13:23:19 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 0/7] mtd: Change meaning of -EUCLEAN return code on reads
Message-ID: <20120425112319.GA23701@parrot.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 24, 2012 at 08:18:18PM +0100, Mike Dunn wrote:
> 
> This problem was discussed a while back [1][2][3], and a consensus of sorts was
> reached for a solution, which these patches implement.  The recent addition of
> the mtd api entry functions now make this solution practical (thanks Artem!).  A
> quick description of each patch will provide a synopsis of the set:
> 
> (1) Fix how mtd->ecc_strength is calculated from nand->ecc.strength to reflect
>     the fact that granularity is now at ecc step level (the two values are now
>     the same).
> (2) Fix a couple incorrect nand->ecc.strength values.
> (3) Expose mtd->ecc_strength through sysfs (read-only).
> (4) mtd->bitflip_threshold is added and exposed as read/write through sysfs.
>     The drivers can initialize it, otherwise mtd initializes it to the default
>     value of ecc_strength.  Users can change it through sysfs.
> (5) The nand driver method _read_page() returns max_bitflips to the nand
>     infrastructure code.  This is the maximum number of bitflip corrections that
>     were made on any one region comprising an ecc step.
> (6) Sanity checks added to nand_scan_tail() to ensure that drivers needing to
>     set ecc strength do so.  (This includes all drivers using hardware ecc.)
> (7) Absent a hard error, all drivers' mtd->_read() methods now return
>     max_bitflips to mtd, and mtd_read() makes the decision of whether to return
>     -EUCLEAN or 0. If max_bitflips >= bitflip_threshold, -EUCLEAN is returned.
>     If bitflip_threshold == 0 (no ecc), make no comparison and return 0.
> 
> Of course reviews greatly appreciated.  Thanks!

Hi Mike,

Thanks for this new version.
The whole series of patches looks OK to me, except for one small glitch:
'mtd->bitflip_threshold' can be customized by the driver, but in that case it is not
propagated to the slave partition devices (the same way 'ecc_strength' is propagated).
Something like this is missing:

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d6321f6..d518e4d 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -517,6 +517,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 
        slave->mtd.ecclayout = master->ecclayout;
        slave->mtd.ecc_strength = master->ecc_strength;
+       slave->mtd.bitflip_threshold = master->bitflip_threshold;
+
        if (master->_block_isbad) {
                uint64_t offs = 0;

Apart from that, I was able to run a few tests on a BeagleBoard revC3 with simulated
bitflips, dropping my own error concealment code in favor of your patch. I did the
following checks:
 - when errors_corrected < bitflip_threshold, check that mtd_read() returns 0
 - when errors_corrected >= bitflip_threshold, check that mtd_read() returns -EUCLEAN
 - check if driver customization of bitflip_threshold works
 - check if per-partition customization of bitflip_threshold through sysfs works
Everything worked as expected.

BR,
--
Ivan
