Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eRGku-0005py-Ic
 for linux-mtd@lists.infradead.org; Tue, 19 Dec 2017 12:12:48 +0000
Date: Tue, 19 Dec 2017 13:11:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH -next v3 1/2] mtd: nand: toshiba: Retrieve ECC
 requirements from extended ID
Message-ID: <20171219131158.26afa9a7@bbrezillon>
In-Reply-To: <20171219125624.58e3e8f8@bbrezillon>
References: <1512569098-30038-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <1512569098-30038-2-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20171206160805.2435094b@bbrezillon>
 <3e11d966-0801-96f2-8417-194b36a0b775@toshiba.co.jp>
 <20171219125624.58e3e8f8@bbrezillon>
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

On Tue, 19 Dec 2017 12:56:24 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Tue, 19 Dec 2017 20:42:36 +0900
> KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
> 
> > On 2017/12/07 0:08, Boris Brezillon wrote:  
> > > On Wed,  6 Dec 2017 23:04:57 +0900
> > > KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
> > >     
> > >> This patch enables support to read the ECC strength and size from the
> > >> NAND flash using Toshiba Memory SLC NAND extended-ID. This patch is
> > >> based on the information of the 6th ID byte of the Toshiba Memory SLC
> > >> NAND.
> > >>
> > >> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> > >> ---
> > >>  drivers/mtd/nand/nand_toshiba.c | 28 ++++++++++++++++++++++++++++
> > >>  1 file changed, 28 insertions(+)
> > >>
> > >> diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
> > >> index 57df857..c2c141b 100644
> > >> --- a/drivers/mtd/nand/nand_toshiba.c
> > >> +++ b/drivers/mtd/nand/nand_toshiba.c
> > >> @@ -35,6 +35,34 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
> > >>  	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
> > >>  	    !(chip->id.data[4] & 0x80) /* !BENAND */)
> > >>  		mtd->oobsize = 32 * mtd->writesize >> 9;
> > >> +
> > >> +	/*
> > >> +	 * Extract ECC requirements from 6th id byte.
> > >> +	 * For Toshiba SLC, ecc requrements are as follows:
> > >> +	 *  - 43nm: 1 bit ECC for each 512Byte is required.
> > >> +	 *  - 32nm: 4 bit ECC for each 512Byte is required.
> > >> +	 *  - 24nm: 8 bit ECC for each 512Byte is required.
> > >> +	 */
> > >> +	if (chip->id.len >= 6 && nand_is_slc(chip)) {
> > >> +		chip->ecc_step_ds = 512;
> > >> +		switch (chip->id.data[5] & 0x7) {
> > >> +		case 0x4:
> > >> +			chip->ecc_strength_ds = 1;
> > >> +			break;
> > >> +		case 0x5:
> > >> +			chip->ecc_strength_ds = 4;
> > >> +			break;
> > >> +		case 0x6:
> > >> +			chip->ecc_strength_ds = 8;
> > >> +			break;
> > >> +		default:
> > >> +			WARN(1, "Could not get ECC info");
> > >> +			chip->ecc_step_ds = 0;
> > >> +			break;
> > >> +		}
> > >> +	} else if (chip->id.len < 6 && nand_is_slc(chip)) {
> > >> +		WARN(1, "Could not get ECC info, 6th nand id byte does not exist.");    
> > > 
> > > I'm pretty sure you have old NAND chips that do not have 6bytes ids
> > > (see the table here [1]), and printing a huge backtrace in this case is
> > > probably not what you want.
> > > 
> > > If you're okay with dropping this else block, I'll do the change when
> > > applying, no need to send a new version.    
> > 
> > Some controllers may have limitation in reading ids beyond 5 bytes, 
> > considering such scenario we think it is better to keep this warning.
> > However if you feel huge backtrace is an issue, how about we using pr_warn() instead?
> >   
> 
> Toshiba NANDs with an id smaller than 6 bytes exist, so no, we should
> not complain at all. If the controller is broken and can't read the 8 id
> bytes the core is asking for, then it should be detected at the core
> level not in the NAND manufacturer driver.

It seems I forgot the link to the NAND table, so here it is [1], and as
you can see, some chips have only 2 id bytes (TC58DVG02A5 is one of
them).

[1]http://www.linux-mtd.infradead.org/nand-data/nanddata.html

> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
