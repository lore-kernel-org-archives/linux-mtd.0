From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: Brian Norris <computersforpeace@gmail.com>, Xander Huff
 <xander.huff@ni.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jeff.westfahl@ni.com" <jeff.westfahl@ni.com>, "jaeden.amero@ni.com"
 <jaeden.amero@ni.com>, "joshc@ni.com" <joshc@ni.com>, Ben Shelton
 <ben.shelton@ni.com>
Subject: RE: [RESEND RESEND RESEND PATCH v2] mtd: nand_bbt: scan for next
 free bbt block if writing bbt fails
Date: Wed, 26 Aug 2015 15:57:00 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF47F35@NTXXIAMBX02.xacn.micron.com>
References: <1439330122-41912-1-git-send-email-xander.huff@ni.com>
 <1440524966-29627-1-git-send-email-xander.huff@ni.com>
 <20150825183400.GH81844@google.com>
In-Reply-To: <20150825183400.GH81844@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> + Bean, who is looking at refactoring this driver. Perhaps he can review
> this.
>=20
> On Tue, Aug 25, 2015 at 12:49:26PM -0500, Xander Huff wrote:
> > From: Ben Shelton <ben.shelton@ni.com>
> >
> > If erasing or writing the BBT fails, we should mark the current BBT
> > block as bad and use the BBT descriptor to scan for the next available
> > unused block in the BBT. We should only return a failure if there
> > isn't any space left.
> >
> > Based on original code implemented by Jeff Westfahl
> > <jeff.westfahl@ni.com>.
> >
> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> > Reviewed-by: Jaeden Amero <jaeden.amero@ni.com>
> > Suggested-by: Jeff Westfahl <jeff.westfahl@ni.com>
> > Signed-off-by: Xander Huff <xander.huff@ni.com>
> > ---
> > This v2 patch is in reply to comments from Brian Norris on 7/22/13.
> > See the following links for context:
> > http://lists.infradead.org/pipermail/linux-mtd/2013-July/047596.html
> > http://patchwork.ozlabs.org/patch/244324/
>=20
> Wow, a blast from the past...
>=20
> > ---
> >  drivers/mtd/nand/nand_base.c |  4 ++++  drivers/mtd/nand/nand_bbt.c
> > | 34 ++++++++++++++++++++++++++++++++--
> >  include/linux/mtd/nand.h     |  7 +++++++
> >  3 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/nand_base.c
> > b/drivers/mtd/nand/nand_base.c index ceb68ca..48299dc 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2761,6 +2761,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct
> erase_info *instr,
> >  		pr_debug("%s: device is write protected!\n",
> >  				__func__);
> >  		instr->state =3D MTD_ERASE_FAILED;
> > +		instr->priv =3D NAND_ERASE_WRITE_PROTECTED;
>=20
Here will overload the 'priv' field of mtdchar.c=20
Please go thought mtdchar_ioctl() function.

> I'm pretty sure this is an illegal overloading of the 'priv' field.
> Notice how ioctl(MEMERASE64) uses this field in mtdchard.c. So I suspect
> you've broken char access to /dev/mtdX. Try 'flash_erase' from mtd-utils,=
 for
> instance.
>=20
> >  		goto erase_exit;
> >  	}
> >
> > @@ -2776,6 +2777,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct
> erase_info *instr,
> >  			pr_warn("%s: attempt to erase a bad block at page
> 0x%08x\n",
> >  				    __func__, page);
> >  			instr->state =3D MTD_ERASE_FAILED;
> > +			instr->priv =3D NAND_ERASE_BAD_BLOCK;
> >  			goto erase_exit;
> >  		}
> >
> > @@ -2802,6 +2804,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct
> erase_info *instr,
> >  			pr_debug("%s: failed erase, page 0x%08x\n",
> >  					__func__, page);
> >  			instr->state =3D MTD_ERASE_FAILED;
> > +			instr->priv =3D NAND_ERASE_BLOCK_ERASE_FAILED;
> >  			instr->fail_addr =3D
> >  				((loff_t)page << chip->page_shift);
> >  			goto erase_exit;
> > @@ -2819,6 +2822,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct
> erase_info *instr,
> >  		}
> >  	}
> >  	instr->state =3D MTD_ERASE_DONE;
> > +	instr->priv =3D NAND_ERASE_OK;
> >
> >  erase_exit:
> >
> > diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> > index 63a1a36..09f9e62 100644
> > --- a/drivers/mtd/nand/nand_bbt.c
> > +++ b/drivers/mtd/nand/nand_bbt.c
> > @@ -662,6 +662,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t =
*buf,
> >  			page =3D td->pages[chip];
> >  			goto write;
> >  		}
> > +next:
> >
> >  		/*
> >  		 * Automatic placement of the bad block table. Search direction
> @@
> > -787,13 +788,42 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *=
buf,
> >  		einfo.addr =3D to;
> >  		einfo.len =3D 1 << this->bbt_erase_shift;
> >  		res =3D nand_erase_nand(mtd, &einfo, 1);
> > -		if (res < 0)
> > +		if (res =3D=3D -EIO && einfo.state =3D=3D MTD_ERASE_FAILED
> > +		    && einfo.priv =3D=3D NAND_ERASE_BLOCK_ERASE_FAILED) {
>=20
> Do you actually need that last condition? What's wrong with the first two=
?
>=20
> > +			/* This block is bad. Mark it as such and see if
> > +			 * there's another block available in the BBT area. */
> > +			int block =3D page >>
> > +				(this->bbt_erase_shift - this->page_shift);
> > +			pr_info("nand_bbt: failed to erase block %d when writing
> BBT\n",
> > +				block);
> > +			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> > +
> > +			res =3D this->block_markbad(mtd, block);
> > +			if (res)
> > +				pr_warn("nand_bbt: error %d while marking block %d
> bad\n",
> > +					res, block);
> > +			goto next;
> > +		} else if (res < 0)
> >  			goto outerr;


For my knowledge , we don't directly mark this block be a bad block,
Just like ubi layer,this block also need to further testing and verify if
It is real bad block.right?

> >
> >  		res =3D scan_write_bbt(mtd, to, len, buf,
> >  				td->options & NAND_BBT_NO_OOB ? NULL :
> >  				&buf[len]);
> > -		if (res < 0)
> > +		if (res =3D=3D -EIO) {
> > +			/* This block is bad. Mark it as such and see if
> > +			 * there's another block available in the BBT area. */
> > +			int block =3D page >>
> > +				(this->bbt_erase_shift - this->page_shift);
> > +			pr_info("nand_bbt: failed to erase block %d when writing
> BBT\n",
> > +				block);
> > +			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> > +
> > +			res =3D this->block_markbad(mtd, block);
> > +			if (res)
> > +				pr_warn("nand_bbt: error %d while marking block %d
> bad\n",
> > +					res, block);
> > +			goto next;
> > +		} else if (res < 0)
> >  			goto outerr;
> >
> >  		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h index
> > 272f429..86e11f6 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -1030,4 +1030,11 @@ struct nand_sdr_timings {
> >
> >  /* get timing characteristics from ONFI timing mode. */  const struct
> > nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
> > +
> > +/* reasons for erase failures */
> > +#define NAND_ERASE_OK			0
> > +#define NAND_ERASE_WRITE_PROTECTED	1
> > +#define NAND_ERASE_BAD_BLOCK		2
> > +#define NAND_ERASE_BLOCK_ERASE_FAILED	3
>=20
> Why exactly do you need these statuses? I thought the existing error code=
s
> were sufficient..
>=20
> > +
> >  #endif /* __LINUX_MTD_NAND_H */
>=20
> Brian
