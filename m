MIME-Version: 1.0
In-Reply-To: <20110611092224.GB16318@ibawizard.net>
References: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
	<1307369056-29319-3-git-send-email-dbaryshkov@gmail.com>
	<20110611092224.GB16318@ibawizard.net>
Date: Sun, 12 Jun 2011 01:02:21 +0400
Message-ID: <BANLkTik4vJ6y6Y1igb_9HfaJ+ADeZ4xT0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] ts72xx: use MTDPART_OFS_RETAIN for mtd partitioning
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
Content-Type: multipart/mixed; boundary=0016e646060890cf0704a57600f0
Cc: Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com,
	Mika Westerberg <mika.westerberg@iki.fi>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <ryan@bluewatersys.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016e646060890cf0704a57600f0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello, colleagues,

On 6/11/11, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> [2011-06-06 18:04:15]:
>> Instead of specifying a callback for dynamic partitioning, use
>> MTDPART_OFS_RETAIN for reserving a place near the end of flash for
>> RedBoot.
>
> [...]
>
>> -		.offset		=3D MTDPART_OFS_APPEND,
>> -		.size		=3D 0,			/* filled in later */
>> +		.offset		=3D MTDPART_OFS_RETAIN,
>> +		.size		=3D TS72XX_REDBOOT_PART_SIZE,
>> +				/* leave so much for last partition */
>
> thank you for the mtd cleanup work. While testing this patch, I've notice=
d,
> that the TS72XX_REDBOOT_PART_SIZE is by 16K bigger, then it should be:
>
> Redboot:
>
> 	RedBoot> fis list
> 	Name              FLASH addr  Mem addr    Length      Entry point
> 	(reserved)        0x60000000  0x60000000  0x01D04000  0x00000000
> 	RedBoot           0x61D04000  0x61D04000  0x00040000  0x00000000
> 	vmlinux           0x61D44000  0x00218000  0x000C0000  0x00218000
> 	FIS directory     0x61FFC000  0x61FFC000  0x00003000  0x00000000
> 	RedBoot config    0x61FFF000  0x61FFF000  0x00001000  0x00000000
>
> Linux:
>
> 	0x000000000000-0x000000004000 : "TS-BOOTROM"
> 	0x000000004000-0x000001d00000 : "Linux"
> 	0x000001d00000-0x000002000000 : "RedBoot"
>
> So if I simply read now first 4 bytes from /dev/mtdblock2, there's no 'CR=
US'
> or 'SURC' boot HeaderID/signature and it means, that there's no valid
> Redboot
> for ep93xx. The correct value is:
>
> 	#define TS72XX_REDBOOT_PART_SIZE	(SZ_2M + SZ_1M - SZ_16K)

Could you please verify/ack the attached patch?

--=20
With best wishes
Dmitry

--0016e646060890cf0704a57600f0
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-ts72xx-correct-partition-sizes.patch"
Content-Disposition: attachment;
	filename="0001-ts72xx-correct-partition-sizes.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

RnJvbSA5YTdhNjkwNDMwMDRkMmY3MzhlMzIxYzI0NDNmODFmMzQ1YmY5YjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEbWl0cnkgRXJlbWluLVNvbGVuaWtvdiA8ZGJhcnlzaGtvdkBn
bWFpbC5jb20+CkRhdGU6IFN1biwgMTIgSnVuIDIwMTEgMDA6NTg6MzggKzA0MDAKU3ViamVjdDog
W1BBVENIXSB0czcyeHg6IGNvcnJlY3QgcGFydGl0aW9uIHNpemVzCgpTaW5jZSBhZmU0MzIyM2Qg
KHRzNzJ4eDogdXNlIE1URFBBUlRfT0ZTX1JFVEFJTiBmb3IgbXRkIHBhcnRpdGlvbmluZyksCnRz
NzJ4eCB1c2VzIGluY29ycmVjdCBzaXplIGZvciBMaW51eCBwYXJ0aXRpb24gKGRpZmZlcmVuY2Ug
aXMgMTZrKSwKY29ycmVjdCB0aGF0IHNvIHRoYXQgdXNlcnMgaGF2ZSBjb3JyZWN0IGFjY2VzcyB0
byBSZWRCb290IHBhcnRpdGlvbi4KClNpZ25lZC1vZmYtYnk6IERtaXRyeSBFcmVtaW4tU29sZW5p
a292IDxkYmFyeXNoa292QGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybS9tYWNoLWVwOTN4eC90czcy
eHguYyB8ICAgIDIgKy0KIDEgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtZXA5M3h4L3RzNzJ4eC5jIGIvYXJj
aC9hcm0vbWFjaC1lcDkzeHgvdHM3Mnh4LmMKaW5kZXggZGVhNDJlMi4uOTUxMGFlMCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vbWFjaC1lcDkzeHgvdHM3Mnh4LmMKKysrIGIvYXJjaC9hcm0vbWFjaC1l
cDkzeHgvdHM3Mnh4LmMKQEAgLTEwNiw3ICsxMDYsNyBAQCBzdGF0aWMgaW50IHRzNzJ4eF9uYW5k
X2RldmljZV9yZWFkeShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIHN0YXRpYyBjb25zdCBjaGFyICp0
czcyeHhfbmFuZF9wYXJ0X3Byb2Jlc1tdID0geyAiY21kbGluZXBhcnQiLCBOVUxMIH07CiAKICNk
ZWZpbmUgVFM3MlhYX0JPT1RST01fUEFSVF9TSVpFCShTWl8xNkspCi0jZGVmaW5lIFRTNzJYWF9S
RURCT09UX1BBUlRfU0laRQkoU1pfMk0gKyBTWl8xTSkKKyNkZWZpbmUgVFM3MlhYX1JFREJPT1Rf
UEFSVF9TSVpFCShTWl8yTSArIFNaXzFNIC0gU1pfMTZLKQogCiBzdGF0aWMgc3RydWN0IG10ZF9w
YXJ0aXRpb24gdHM3Mnh4X25hbmRfcGFydHNbXSA9IHsKIAl7Ci0tIAoxLjcuNS4zCgo=
--0016e646060890cf0704a57600f0--
