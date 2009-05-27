Received: from ey-out-1920.google.com ([74.125.78.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9FwQ-00068n-0p
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 10:01:06 +0000
Received: by ey-out-1920.google.com with SMTP id 13so819971eye.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 May 2009 03:00:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243405314.11172.5.camel@localhost.localdomain>
References: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
	<1243323142.21646.129.camel@localhost.localdomain>
	<72795ccb0905260240q6389dd35j681dbe50a6d4990f@mail.gmail.com>
	<1243331031.21646.134.camel@localhost.localdomain>
	<72795ccb0905260247p6c204cc4w78eaafd28ffc3cf8@mail.gmail.com>
	<72795ccb0905260321n3b4646brb9adc90425b5304b@mail.gmail.com>
	<72795ccb0905260455x701ea6e9u5bafc7c394609a4b@mail.gmail.com>
	<1243405314.11172.5.camel@localhost.localdomain>
Date: Wed, 27 May 2009 12:00:54 +0200
Message-ID: <72795ccb0905270300p7ac111fduba8d656a8031a96c@mail.gmail.com>
Subject: Re: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: simon polette <spolette@gmail.com>
To: dedekind@infradead.org
Content-Type: multipart/mixed; boundary=0016364d230345ca85046ae1eb25
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk, spolette@adetelgroup.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016364d230345ca85046ae1eb25
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2009/5/27 Artem Bityutskiy <dedekind@infradead.org>:
> On Tue, 2009-05-26 at 13:55 +0200, simon polette wrote:
>> 2009/5/26 simon polette <spolette@gmail.com>:
>> > 2009/5/26 simon polette <spolette@gmail.com>:
>> >> 2009/5/26 Artem Bityutskiy <dedekind@infradead.org>:
>> >>> On Tue, 2009-05-26 at 11:40 +0200, simon polette wrote:
>> >>>> 2009/5/26 Artem Bityutskiy <dedekind@infradead.org>:
>> >>>> > On Mon, 2009-05-25 at 17:44 +0200, simon polette wrote:
>> >>>> >> +config =9A =9A =9A MTD_NAND_ATMEL_FLASH_BBT
>> >>>> >> + =9A =9A bool "Use On-Flash Bad Block Table"
>> >>>> >> + =9A =9A depends on MTD_NAND_ATMEL
>> >>>> >> + =9A =9A help
>> >>>> >> + =9A =9A =9A This enables the On-Flash BBT, which mean that the=
 bad blocks
>> >>>> >> + =9A =9A =9A will be scanned one time then the BBT will be stor=
ed
>> >>>> >> + =9A =9A =9A in flash, so scanning Nand flash for bad blocks wi=
ll be no more
>> >>>> >> + =9A =9A =9A necessary for the next boots.
>> >>>> >> +
>> >>>> >
>> >>>> > I do not think you need a config option for this. It should be
>> >>>> > a module parameter instead.
>> >>>> >
>> >>>> > --
>> >>>> > Best regards,
>> >>>> > Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>> >>>> >
>> >>>> >
>> >>>>
>> >>>> Yes, good idea, but do you think that I can keep a config option to
>> >>>> define the default state of that param, it means doing something li=
ke
>> >>>> :
>> >>>> #ifdef CONFIG_MTD_NAND_ATMEL_FLASH_BBT
>> >>>> static int use_on_flash_bbt =3D 1;
>> >>>> #else
>> >>>> static int use_on_flash_bbt =3D 0;
>> >>>> #endif
>> >>>> module_param(use_on_flash_bbt, int, 0);
>> >>>
>> >>> I think it is generally bad idea if each nand driver will
>> >>> introduce a separate config option for this kind of stuff.
>> >>>
>> >>> You may always boot your kernel with something like
>> >>> atmel_nand.on_flash_bbt=3D1 in the kernel parameters.
>> >>>
>> >>> --
>> >>> Best regards,
>> >>> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>> >>>
>> >>>
>> >>
>> >> Ok, I asked this question cause it's what have been done in the nand
>> >> diskonchip driver.
>> >> I'll send you a new patch soon.
>> >>
>> >> Best regards,
>> >>
>> >> Simon Polette
>> >> Adeneo - Adetelgroup
>> >>
>> >
>> > So here is the new patch :
>> >
>> > Signed-off-by: Simon Polette <spolette@adetelgroup.com>
>> > ---
>> > =9Adrivers/mtd/nand/atmel_nand.c | =9A =9A9 +++++++++
>> > =9A1 files changed, 9 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_na=
nd.c
>> > index 47a33ce..e113594 100644
>> > --- a/drivers/mtd/nand/atmel_nand.c
>> > +++ b/drivers/mtd/nand/atmel_nand.c
>> > @@ -24,6 +24,7 @@
>> >
>> > =9A#include <linux/slab.h>
>> > =9A#include <linux/module.h>
>> > +#include <linux/moduleparam.h>
>> > =9A#include <linux/platform_device.h>
>> > =9A#include <linux/mtd/mtd.h>
>> > =9A#include <linux/mtd/nand.h>Signed-off-by: Simon Polette
>> > <spolette@adetelgroup.com>
>> > @@ -47,6 +48,9 @@
>> > =9A#define no_ecc =9A =9A =9A =9A 0
>> > =9A#endif
>> >
>> > +static int on_flash_bbt =3D 0;
>> > +module_param(on_flash_bbt, int, 0);
>> > +
>> > =9A/* Register access macros */
>> > =9A#define ecc_readl(add, reg) =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A =9A\
>> > =9A =9A =9A =9A__raw_readl(add + ATMEL_ECC_##reg)
>> > @@ -465,6 +469,11 @@ static int __init atmel_nand_probe(struct
>> > platform_device *pdev)
>> > =9A =9A =9A =9A =9A =9A =9A =9A}
>> > =9A =9A =9A =9A}
>> >
>> > + =9A =9A =9A if (on_flash_bbt) {
>> > + =9A =9A =9A =9A =9A =9A =9A printk("atmel_nand: Use On Flash BBT\n")=
;
>> > + =9A =9A =9A =9A =9A =9A =9A nand_chip->options |=3D NAND_USE_FLASH_B=
BT;
>> > + =9A =9A =9A }
>> > +
>> > =9A =9A =9A =9A/* first scan to find the device and get the page size =
*/
>> > =9A =9A =9A =9Aif (nand_scan_ident(mtd, 1)) {
>> > =9A =9A =9A =9A =9A =9A =9A =9Ares =3D -ENXIO;
>> > --
>> > 1.6.0.4
>> >
>> > --
>> > Best regards,
>> >
>> > Simon Polette
>> > Adeneo - Adetelgroup
>> >
>> A line have been mistakenly inserted into the patch, probably by a
>> middle click, sorry for the inconvenience.
>>
>>
>> Signed-off-by: Simon Polette <spolette@adetelgroup.com>
>> ---
>> =9Adrivers/mtd/nand/atmel_nand.c | =9A =9A9 +++++++++
>> =9A1 files changed, 9 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand=
.c
>> index 47a33ce..e113594 100644
>> --- a/drivers/mtd/nand/atmel_nand.c
>> +++ b/drivers/mtd/nand/atmel_nand.c
>> @@ -24,6 +24,7 @@
>>
>> =9A#include <linux/slab.h>
>> =9A#include <linux/module.h>
>> +#include <linux/moduleparam.h>
>> =9A#include <linux/platform_device.h>
>> =9A#include <linux/mtd/mtd.h>
>> =9A#include <linux/mtd/nand.h>
>> @@ -47,6 +48,9 @@
>> =9A#define no_ecc =9A =9A =9A =9A =9A =9A =9A 0
>> =9A#endif
>>
>> +static int on_flash_bbt =3D 0;
>> +module_param(on_flash_bbt, int, 0);
>> +
>> =9A/* Register access macros */
>> =9A#define ecc_readl(add, reg) =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =
=9A =9A =9A\
>> =9A =9A =9A __raw_readl(add + ATMEL_ECC_##reg)
>> @@ -465,6 +469,11 @@ static int __init atmel_nand_probe(struct
>> platform_device *pdev)
>> =9A =9A =9A =9A =9A =9A =9A }
>> =9A =9A =9A }
>>
>> + =9A =9A if (on_flash_bbt) {
>> + =9A =9A =9A =9A =9A =9A printk("atmel_nand: Use On Flash BBT\n");
>> + =9A =9A =9A =9A =9A =9A nand_chip->options |=3D NAND_USE_FLASH_BBT;
>> + =9A =9A }
>
> Is it please also possible to add KERN_INFO to the 'printk()'
> please. And also add it to the already existing 'printk()' in
> the driver: printk("No SmartMedia card inserted.\n");
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
Hoping the patch is correct now :

--0016364d230345ca85046ae1eb25
Content-Type: text/x-diff; charset=US-ASCII;
	name="mtd-atmel-nand-Add-on-flash-bbt-support.patch"
Content-Disposition: attachment;
	filename="mtd-atmel-nand-Add-on-flash-bbt-support.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fv7v84xb0

U2lnbmVkLW9mZi1ieTogU2ltb24gUG9sZXR0ZSA8c3BvbGV0dGVAYWRldGVsZ3JvdXAuY29tPgot
LS0KIGRyaXZlcnMvbXRkL25hbmQvYXRtZWxfbmFuZC5jIHwgICAxMSArKysrKysrKysrLQogMSBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvYXRtZWxfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9hdG1l
bF9uYW5kLmMKaW5kZXggNDdhMzNjZS4uMjgwMjk5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9hdG1lbF9uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9hdG1lbF9uYW5kLmMKQEAg
LTI0LDYgKzI0LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KICNpbmNs
dWRlIDxsaW51eC9tdGQvbmFuZC5oPgpAQCAtNDcsNiArNDgsOSBAQAogI2RlZmluZSBub19lY2MJ
CTAKICNlbmRpZgogCitzdGF0aWMgaW50IG9uX2ZsYXNoX2JidCA9IDA7Cittb2R1bGVfcGFyYW0o
b25fZmxhc2hfYmJ0LCBpbnQsIDApOworCiAvKiBSZWdpc3RlciBhY2Nlc3MgbWFjcm9zICovCiAj
ZGVmaW5lIGVjY19yZWFkbChhZGQsIHJlZykJCQkJXAogCV9fcmF3X3JlYWRsKGFkZCArIEFUTUVM
X0VDQ18jI3JlZykKQEAgLTQ1OSwxMiArNDYzLDE3IEBAIHN0YXRpYyBpbnQgX19pbml0IGF0bWVs
X25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWlmIChob3N0LT5i
b2FyZC0+ZGV0X3BpbikgewogCQlpZiAoZ3Bpb19nZXRfdmFsdWUoaG9zdC0+Ym9hcmQtPmRldF9w
aW4pKSB7Ci0JCQlwcmludGsoIk5vIFNtYXJ0TWVkaWEgY2FyZCBpbnNlcnRlZC5cbiIpOworCQkJ
cHJpbnRrKEtFUk5fSU5GTyAiTm8gU21hcnRNZWRpYSBjYXJkIGluc2VydGVkLlxuIik7CiAJCQly
ZXMgPSBFTlhJTzsKIAkJCWdvdG8gZXJyX25vX2NhcmQ7CiAJCX0KIAl9CiAKKwlpZiAob25fZmxh
c2hfYmJ0KSB7CisJCXByaW50ayhLRVJOX0lORk8gImF0bWVsX25hbmQ6IFVzZSBPbiBGbGFzaCBC
QlRcbiIpOworCQluYW5kX2NoaXAtPm9wdGlvbnMgfD0gTkFORF9VU0VfRkxBU0hfQkJUOworCX0K
KwogCS8qIGZpcnN0IHNjYW4gdG8gZmluZCB0aGUgZGV2aWNlIGFuZCBnZXQgdGhlIHBhZ2Ugc2l6
ZSAqLwogCWlmIChuYW5kX3NjYW5faWRlbnQobXRkLCAxKSkgewogCQlyZXMgPSAtRU5YSU87Ci0t
IAoxLjYuMC40Cgo=
--0016364d230345ca85046ae1eb25--
