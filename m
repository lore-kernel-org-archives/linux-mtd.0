Received: from mail1.bemta24.messagelabs.com ([67.219.250.4])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFijI-0002kc-Un
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2018 16:43:51 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: Hauke Mehrtens <hauke@hauke-m.de>, Koen Vandeputte
 <koen.vandeputte@ncentric.com>, Fabio Bettoni <fbettoni@gmail.com>, Joakim
 Tjernlund <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v2 01/10] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Date: Thu, 25 Oct 2018 16:36:11 +0000
Message-ID: <TYAPR01MB21757CF9C706C213D19CE5B6DCF70@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
 <20181019165526.11159-2-ikegami@allied-telesis.co.jp>
 <a35141a64cd24b90854770c66ed1aba3@svr-chch-ex1.atlnz.lc>
In-Reply-To: <a35141a64cd24b90854770c66ed1aba3@svr-chch-ex1.atlnz.lc>
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



> -----Original Message-----
> From: stable-owner@vger.kernel.org
> [mailto:stable-owner@vger.kernel.org] On Behalf Of Chris Packham
> Sent: Thursday, October 25, 2018 6:24 AM
> To: IKEGAMI Tokunori; boris.brezillon@free-electrons.com
> Cc: Hauke Mehrtens; Koen Vandeputte; Fabio Bettoni; Joakim Tjernlund;
> linux-mtd@lists.infradead.org; stable@vger.kernel.org
> Subject: Re: [PATCH v2 01/10] mtd: cfi_cmdset_0002: Change
> do_write_oneword() to use chip_good()
>=20
> On 20/10/18 5:55 AM, Tokunori Ikegami wrote:
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
> > So change to use chip_good() instead of chip_ready().
> >
> > The reason to use chip_good() is that just actually fix the issue.
> > And also in the past I had fixed the erase function also as same way by
> the
> > patch below.
> >    <https://patchwork.ozlabs.org/patch/922656/>
> >      Note: The reason for the patch for erase is same.
> >
> > In my understanding the chip_ready() is just checked the value twice fr=
om
> > flash.
> > So I think that sometimes incorrect value is read twice and it is depen=
ded
> > on the flash device behavior but not sure..
> >
> > So change to use chip_good() instead of chip_ready().
>=20
> I think much of this is commentary for readers of the mailing list not
> something that should be in the final commit (i.e. it should be after
> the '---'). The commit message should really reflect what the problem
> was and how this change fixes it.

[Ikegami] Yes fixed as so.

>=20
> I think you've got a better handle on what chip_good() does than I do so
> I won't attempt to provide a commit message here.
>=20
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>
> > Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> > Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>
> > Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: stable@vger.kernel.org
> > ---
> > Changes since v1:
> > - Just update the commit message.
> >
> >   drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index 72428b6bfc47..251c9e1675bd 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1627,31 +1627,37 @@ static int __xipram do_write_oneword(struct
> map_info *map, struct flchip *chip,
> >   			continue;
> >   		}
> >
> > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
> > +		if (chip_good(map, adr, datum))
> > +			break;
> > +
> > +		if (time_after(jiffies, timeo)){
> >   			xip_enable(map, chip, adr);
> >   			printk(KERN_WARNING "MTD %s(): software
> timeout\n", __func__);
> >   			xip_disable(map, chip, adr);
> > +			ret =3D -EIO;
> >   			break;
> >   		}
> >
> > -		if (chip_ready(map, adr))
> > -			break;
> > -
> >   		/* Latency issues. Drop the lock, wait a while and retry
> */
> >   		UDELAY(map, chip, adr, 1);
> >   	}
> > +
> >   	/* Did we succeed? */
> > -	if (!chip_good(map, adr, datum)) {
> > +	if (ret) {
> >   		/* reset on all failures. */
> >   		map_write(map, CMD(0xF0), chip->start);
> >   		/* FIXME - should have reset delay before continuing */
> >
> > -		if (++retry_cnt <=3D MAX_RETRIES)
> > +		if (++retry_cnt <=3D MAX_RETRIES) {
> > +			ret =3D 0;
> >   			goto retry;
> > +		}
> >
> >   		ret =3D -EIO;
> >   	}
> > +
> >   	xip_enable(map, chip, adr);
> > +
> >    op_done:
> >   	if (mode =3D=3D FL_OTP_WRITE)
> >   		otp_exit(map, chip, adr, map_bankwidth(map));
> >
