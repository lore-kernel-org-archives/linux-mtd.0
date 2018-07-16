Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ff65p-0002Ww-Eb
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 16:11:23 +0000
Date: Mon, 16 Jul 2018 18:10:57 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, "Bean Huo" <beanhuo@micron.com>
Subject: Re: [2/3] mtd: rawnand: micron: Disable ECC earlier in the read path
Message-ID: <20180716181057.65d78303@bbrezillon>
In-Reply-To: <a01b89d899504e8596da9e416d22b1f7@svr-chch-ex1.atlnz.lc>
References: <20180703122009.29914-3-boris.brezillon@bootlin.com>
 <a01b89d899504e8596da9e416d22b1f7@svr-chch-ex1.atlnz.lc>
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

On Mon, 16 Jul 2018 09:00:59 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi Boris,
> 
> On 04/07/18 00:20, Boris Brezillon wrote:
> > We are about to support extracting the real number of bitflips for
> > 4-bits ECC when WRITE_RECOMMEND is returned. This requires re-reading
> > the page in raw mode to compare it to the corrected version, and this
> > logic will be placed in micron_nand_on_die_ecc_status_4().
> > 
> > Moving the micron_nand_on_die_ecc_setup() will allow us to disable
> > ECC only once.
> > 
> > As a result, we have to rework the exit path and add an error path
> > where the ECC is disabled.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>  
> 
> As I said on the other thread this appears to cause a problem for me on 
> the MT29F1G08ABAFAWP-ITE setup I have. I notice we're not able to find 
> the BBT, not sure if that is symptom or cause. If I revert this I can 
> successfully mount and access data on the chip.
> 
> Here's some output from dmesg:
> 
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd1
> nand: Micron MT29F1G08ABAGAWP
> nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
> nand: timing mode 5 not acknowledged by the NAND chip
> Bad block table not found for chip 0
> Bad block table not found for chip 0
> Scanning device for bad blocks
> random: fast init done
> Bad block table written to 0x000007fe0000, version 0x01
> Bad block table written to 0x000007fc0000, version 0x01
> 3 fixed-partitions partitions found on MTD device pxa3xx_nand-0
> Creating 3 MTD partitions on "pxa3xx_nand-0":
> 0x000000000000-0x000007000000 : "user"
> 0x000007000000-0x000007800000 : "errlog"
> mtdoops: Attached to MTD device 1
> mtdoops: ready 0, 1
> 0x000007800000-0x000008000000 : "nand-bbt"
> 
> And from my attempt to mount:
> 
> [root@linuxbox ~]# umount /flash && ubiattach -p /dev/mtd0 && mount -t 
> ubifs ubi
> 0:user -o sync /flash
> ubi0: attaching mtd0
> ubi0: scanning is finished
> ubi0 error: ubi_read_volume_table: the layout volume was not found
> ubi0 error: ubi_attach_mtd_dev: failed to attach mtd0, error -22
> ubiattach: error!: cannot attach "/dev/mtd0"
>             error 22 (Invalid argument)
> [root@linuxbox ~]#
> 
> 
> > ---
> >   drivers/mtd/nand/raw/nand_micron.c | 25 ++++++++++++++++---------
> >   1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> > index 63ac98a36ed7..b9cbaf125a98 100644
> > --- a/drivers/mtd/nand/raw/nand_micron.c
> > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > @@ -197,30 +197,37 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
> >   
> >   	ret = nand_read_page_op(chip, page, 0, NULL, 0);
> >   	if (ret)
> > -		goto out;
> > +		goto err_disable_ecc;
> >   
> >   	ret = nand_status_op(chip, &status);
> >   	if (ret)
> > -		goto out;
> > +		goto err_disable_ecc;
> >   
> >   	ret = nand_exit_status_op(chip);
> >   	if (ret)
> > -		goto out;
> > +		goto err_disable_ecc;
> >   
> > -	if (chip->ecc.strength == 4)
> > -		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
> > -	else
> > -		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
> > +	micron_nand_on_die_ecc_setup(chip, false);

Hm, can you try to move the micron_nand_on_die_ecc_setup(chip, false)
call just before nand_exit_status_op()?

> >   
> >   	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
> >   	if (!ret && oob_required)
> >   		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
> >   					false);
> >   
> > -out:
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (chip->ecc.strength == 4)
> > +		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
> > +	else
> > +		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
> > +
> > +	return max_bitflips;
> > +
> > +err_disable_ecc:
> >   	micron_nand_on_die_ecc_setup(chip, false);
> >   
> > -	return ret ? ret : max_bitflips;
> > +	return ret;
> >   }
> >   
> >   static int
> >   
> 
