Received: from mail1.bemta23.messagelabs.com ([67.219.246.213])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJpCI-0002Ft-LA
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 00:26:26 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Koen
 Vandeputte <koen.vandeputte@ncentric.com>, Fabio Bettoni
 <fbettoni@gmail.com>, Felix Fietkau <nbd@openwrt.org>
Subject: RE: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Date: Tue, 6 Nov 2018 00:25:43 +0000
Message-ID: <TYAPR01MB217579A7E16A687FE04B90E5DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
 <20181105111544.4e511ed9@bbrezillon>
In-Reply-To: <20181105111544.4e511ed9@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
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

Thank you so much for your reviewing.

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, November 05, 2018 7:16 PM
> To: IKEGAMI Tokunori
> Cc: boris.brezillon@free-electrons.com; Hauke Mehrtens;
> stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> do_write_oneword() to use chip_good()
>=20
> On Fri, 26 Oct 2018 01:32:09 +0900
> Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:
>=20
> > In OpenWrt Project the flash write error caused on some products.
>=20
> It's okay to mention that the issue was discovered by the OpenWRT team,
> but I'd rephrase it differently.
>=20
> "As reported by the OpenWRT team, write requests sometimes fail on some
> platforms".

Yes I will do fix as this.

>=20
> > Also the issue can be fixed by using chip_good() instead of chip_ready(=
).
> > The chip_ready() just checks the value from flash memory twice.
> > And the chip_good() checks the value with the expected value.
> > Probably the issue can be fixed as checked correctly by the chip_good()=
.
> > So change to use chip_good() instead of chip_ready().
>=20
> Well, that's not really explaining why you think chip_good() should be
> used instead of chip_ready(). So I went on and looked at the
> chip_good(), chip_ready() and do_write_oneword() implementation, and
> also looked at users of do_write_oneword(). It seems this function is
> used to write data to the flash, and apparently the "one bit should
> toggle to reflect a busy state" does not apply when writing things to
> the memory array (it's probably working for other CFI commands, but I
> guess it takes more time to actually change the level of a NOR cell,
> hence the result of 2 identical reads does not mean that the write is
> done).
>=20
> Also, it seems that cmdset_0001 is not implementing chip_ready() the
> same way, and I wonder if cmdset_0002 implementation is correct to
> start with. Or maybe I don't get what chip_ready() is for.
>=20
> Anyway, this is the sort of clarification I'd like to have.

I am thinking to update the commit message as below.

    mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()

    As reported by the OpenWRT team, write requests sometimes fail on some
    platforms.
    Currently to check the state chip_ready() is used correctly as describe=
d by
    the flash memory S29GL256P11TFI01 datasheet.
    Also chip_good() is used to check if the write is succeeded and it was
    implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve erro=
r
    checking").
    But actually the write failure is caused on some platforms and also it =
can
    be fixed by using chip_good() to check the state and retry instead.
    It is depended on the actual flash chip behavior so the root cause is
    unknown.

If any comment please let me know.

>=20
> >
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>
>=20
> Has the patch really gone through all those people? SoB is used when you
> apply a patch in your tree or when you're the original author.

I have just checked the OpenWRT git log again and it looks that it was orig=
inally
implemented by Felix Fietkau <nbd@openwrt.org> by the patch below so I will=
 update the Signed-off-by tag as so.
  <https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dcommitdiff;h=3D2530=
640f07cd2b3b14fe9ec03fa63a586452cc5f>

>=20
> > Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> > Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>
>=20
> Not sure we want to add new undocumented tags, but you can mention
> that all those people helped you find/debug the issue. They can also
> add their Reviewed-by/Tested-by if they like.

Yes so I am thinking to change as below.

    Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
    Signed-off-by: Felix Fietkau <nbd@openwrt.org>
    Tested-by: Fabio Bettoni <fbettoni@gmail.com>
    Reported-by: Fabio Bettoni <fbettoni@gmail.com>
    Cc: Hauke Mehrtens <hauke@hauke-m.de>
    Cc: Koen Vandeputte <koen.vandeputte@ncentric.com>

If any problem let me know.

By the way the patch has been tested by Fabio-san then there was still the =
failure behavior.
And it was not followed the original patch changes correctly.
So I will update the patch change a little by the next version v4 patch.
  Note: It has been retested by the Fabio-san as okay.

>=20
> > Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: stable@vger.kernel.org
> > ---
> > Changes since v2:
> > - Just update the commit message for the comment.
> >
> > Changes since v1:
> > - Just update the commit message.
> >
> > Background:
> > This is required for OpenWrt Project to result the flash write issue as
> > below patche.
> >
> <https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dcommitdiff;h=3Dddc1=
1c3
> 932c7b7b7df7d5fbd48f207e77619eaa7>
> >
> > Also the original patch in OpenWRT is below.
> >
> <https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/
> patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>
> >
> > The reason to use chip_good() is that just actually fix the issue.
> > And also in the past I had fixed the erase function also as same way by
> the
> > patch below.
> >   <https://patchwork.ozlabs.org/patch/922656/>
> >     Note: The reason for the patch for erase is same.
> >
> > In my understanding the chip_ready() is just checked the value twice fr=
om
> > flash.
> > So I think that sometimes incorrect value is read twice and it is depen=
ded
> > on the flash device behavior but not sure..
> >
> > So change to use chip_good() instead of chip_ready().
> >
> >  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index 72428b6bfc47..251c9e1675bd 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1627,31 +1627,37 @@ static int __xipram do_write_oneword(struct
> map_info *map, struct flchip *chip,
> >  			continue;
> >  		}
> >
> > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
> > +		if (chip_good(map, adr, datum))
> > +			break;
> > +
> > +		if (time_after(jiffies, timeo)){
> >  			xip_enable(map, chip, adr);
> >  			printk(KERN_WARNING "MTD %s(): software
> timeout\n", __func__);
> >  			xip_disable(map, chip, adr);
> > +			ret =3D -EIO;
> >  			break;
> >  		}
> >
> > -		if (chip_ready(map, adr))
> > -			break;
> > -
> >  		/* Latency issues. Drop the lock, wait a while and retry
> */
> >  		UDELAY(map, chip, adr, 1);
> >  	}
> > +
> >  	/* Did we succeed? */
> > -	if (!chip_good(map, adr, datum)) {
> > +	if (ret) {
> >  		/* reset on all failures. */
> >  		map_write(map, CMD(0xF0), chip->start);
> >  		/* FIXME - should have reset delay before continuing */
> >
> > -		if (++retry_cnt <=3D MAX_RETRIES)
> > +		if (++retry_cnt <=3D MAX_RETRIES) {
> > +			ret =3D 0;
> >  			goto retry;
> > +		}
> >
> >  		ret =3D -EIO;
> >  	}
> > +
> >  	xip_enable(map, chip, adr);
> > +
>=20
> Not a big deal, but I'd prefer to not have coding style changes mixed
> with functional changes (in other words, you can drop the addition of
> blanks lines around xip_enable()).

Yes I will do fix this.

Regards,
Ikegami

>=20
> >   op_done:
> >  	if (mode =3D=3D FL_OTP_WRITE)
> >  		otp_exit(map, chip, adr, map_bankwidth(map));
