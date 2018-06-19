Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV4cU-0006Il-GS
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 00:35:41 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Date: Tue, 19 Jun 2018 00:35:00 +0000
Message-ID: <f16525ea6b534123bda64b09e818ce6d@svr-chch-ex1.atlnz.lc>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
 <20180618151450.3e740270@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

On 19/06/18 01:15, Miquel Raynal wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Mon, 18 Jun 2018 16:52:53 +1200, Chris Packham=0A=
> <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> Hi,=0A=
>>=0A=
>> I'm looking at adding support for the Micron MT29F1G08ABAFAWP-ITE:F chip=
=0A=
>> to one of our boards which uses the Marvell NFCv2 controller.=0A=
>>=0A=
>> This particular chip is a bit odd in that the datasheet states support=
=0A=
>> for ONFI 1.0 but the revision number field is 00 00. It also is marked=
=0A=
>> ABAFA but reports internally as ABAGA. Finally it has internal 8-bit ECC=
=0A=
>> which cannot be disabled.=0A=
> =0A=
> Boris and I agree that in this case, the chip should not be probed if=0A=
> ecc->type !=3D ON_DIE (and eventually NONE).=0A=
> =0A=
> This should be handled in the Micron driver.=0A=
> =0A=
> Also, what is the returned value of micron_supports_on_die_ecc() (with=0A=
> patch 1/2)?=0A=
=0A=
micron_supports_on_die_ecc() returns MICRON_ON_DIE_UNSUPPORTED. =0A=
Technically this chip should be MICRON_ON_DIE_MANDATORY since it can't =0A=
be disabled but that wouldn't be much help since that would still result =
=0A=
in -EINVAL. I'll dig into micron_supports_on_die_ecc() and see if I can =0A=
find something in the datasheet to use.=0A=
=0A=
> =0A=
> Regards,=0A=
> Miqu=E8l=0A=
> =0A=
=0A=
