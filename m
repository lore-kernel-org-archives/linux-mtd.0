Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P70Vr-0003PX-Fw
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 06:45:04 +0000
Received: by wyi11 with SMTP id 11so1619156wyi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 23:45:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20101015140112.GD4276@pengutronix.de>
References: <1286992482-6009-1-git-send-email-zhangyd6@gmail.com>
	<20101015140112.GD4276@pengutronix.de>
Date: Sat, 16 Oct 2010 14:45:00 +0800
Message-ID: <AANLkTi=7vMoiwdStTW_fi0rvJ1iuU8oRbt5-kMdK29gE@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [CHIPS] Add JEDEC probe support for the SST38VF6401
	flash chip
From: yidong zhang <zhangyd6@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Sang
   According to the datasheet, the flash has no externded Query table,
so i try it in the CFI probe mode it failed. The sector-erase size
operates the whole memory, so does the block-erase size. So i use the
JEDEC probe mode. Sorry for the noise.

On Fri, Oct 15, 2010 at 10:01 PM, Wolfram Sang <w.sang@pengutronix.de> wrot=
e:
> On Wed, Oct 13, 2010 at 01:54:42PM -0400, zhangyd wrote:
>> Add SST38VF6401(64Mbit) chip to jedec_probe. Sorry for the wrong descrip=
tion of the flash size in last patch.
>
> Can you explain why CFI can't be used?
>
>>
>> Signed-off-by: yidong zhang<zhangyd6@gmail.com>
>> ---
>> =A0drivers/mtd/chips/jedec_probe.c | =A0 13 +++++++++++++
>> =A01 files changed, 13 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_p=
robe.c
>> index d72a5fb..b7a1016 100644
>> --- a/drivers/mtd/chips/jedec_probe.c
>> +++ b/drivers/mtd/chips/jedec_probe.c
>> @@ -163,6 +163,7 @@
>> =A0#define SST49LF030A =A00x001C
>> =A0#define SST49LF040A =A00x0051
>> =A0#define SST49LF080A =A00x005B
>> +#define SST38VF6401 =A00x536B
>> =A0#define SST36VF3203 =A00x7354
>>
>> =A0/* Toshiba */
>> @@ -1569,6 +1570,18 @@ static const struct amd_flash_info jedec_table[] =
=3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 }, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mfr_id =A0 =A0 =A0 =A0 =3D CFI_MFR_ST,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .dev_id =A0 =A0 =A0 =A0 =3D SST38VF6401,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "SST 38VF6401",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .devtypes =A0 =A0 =A0 =3D CFI_DEVICETYPE_X16,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .uaddr =A0 =A0 =A0 =A0 =A0=3D MTD_UADDR_0X0AAA=
_0x555,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .dev_size =A0 =A0 =A0 =3D SIZE_8MiB,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .cmd_set =A0 =A0 =A0 =A0=3D P_ID_AMD_STD,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .nr_regions =A0 =A0 =3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .regions =A0 =A0 =A0 =A0=3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ERASEINFO(0x10000,128),
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .mfr_id =A0 =A0 =A0 =A0 =3D CFI_MFR_ST,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dev_id =A0 =A0 =A0 =A0 =3D M29F800AB,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "ST M29F800AB"=
,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devtypes =A0 =A0 =A0 =3D CFI_DEVICETYPE_X16=
|CFI_DEVICETYPE_X8,
>> --
>> 1.7.2.3
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Wo=
lfram Sang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEYEARECAAYFAky4XqcACgkQD27XaX1/VRtKRQCfemn4m3IOVP15NugnbKdkbKgR
> yzoAn2NWzpp/F1GPUO+TW3vB3j9aZR2r
> =3DAk1U
> -----END PGP SIGNATURE-----
>
>
