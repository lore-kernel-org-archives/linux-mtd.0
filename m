Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhmLn-0003HI-71
 for linux-mtd@lists.infradead.org; Mon, 13 Apr 2015 21:57:03 +0000
Received: by wgsk9 with SMTP id k9so95935912wgs.3
 for <linux-mtd@lists.infradead.org>; Mon, 13 Apr 2015 14:56:41 -0700 (PDT)
Sender: Tomas Hlavacek <tmshlvck@gmail.com>
From: Tomas Hlavacek <tomas.hlavacek@nic.cz>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: Missing support for
 =?iso-8859-1?Q?ECC=5FSOFT=5FBCH_in_fsl-elbc-nand?=
Date: Mon, 13 Apr 2015 23:56:36 +0200
MIME-Version: 1.0
Message-ID: <419241df-e18f-42f2-83d8-a6f056a5de74@nic.cz>
In-Reply-To: <1428952353.22867.621.camel@freescale.com>
References: <55156575.8080704@nic.cz>
 <5a117ed2-8cb4-4f55-9098-ff622066db4e@nic.cz>
 <1428952353.22867.621.camel@freescale.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: =?utf-8?B?TWFydGluIFN0cmJhxI1rYQ==?= <martin.strbacka@nic.cz>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Monday, April 13, 2015 9:12:33 PM CEST, Scott Wood wrote:
> On Mon, 2015-04-13 at 00:30 +0200, Tomas Hlavacek wrote:
>> 1) How to disable HW ECC?
>>=20
>> What I have done is this:
>>=20
>> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c  ...
>
> You shouldn't be setting BR_DECC if you don't want to use HW ECC, so
> this ifdef doesn't accomplish anything.
>
> Also, while a compile-time hack may be suitable for your own use, to get
> a mergable patch it should be a runtime decision.  You should be able to
> read at runtime the level of ECC that the flash requires.

How? Could you please point me to some starting point what to read in order=20=

to implement it?

>
>>         } else {
>>                 dev_err(priv->dev,
>>                         "fsl_elbc_init: page size %d is not supported\n",
>> @@ -774,11 +791,18 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd=20=

>> *priv) ...
>
> Instead change U-Boot to never set that bit in the first place.

OK, got it.

>> 2) We need to implement RNDOUT operation for SW ECC / ECC_BCH. My attempt=20=

>> follows:
>>=20
>> @@ -335,6 +335,21 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd,=20=

>> unsigned int command,
>>                 fsl_elbc_run_command(mtd); ...
>
> I think you should just set index =3D column.

OK, thanks.

Tomas
