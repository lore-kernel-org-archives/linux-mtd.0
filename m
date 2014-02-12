Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDY4l-0007zc-TV
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 11:34:00 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v1 1/2] mtd: nand: omap: fix ecclayout->oobfree->offset
Date: Wed, 12 Feb 2014 11:33:16 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6FB84@DBDE04.ent.ti.com>
References: <1386925978-23705-1-git-send-email-pekon@ti.com>
 <1386925978-23705-2-git-send-email-pekon@ti.com>
 <20140125085632.GB3162@norris-Latitude-E6410>
In-Reply-To: <20140125085632.GB3162@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Artem Bityutskiy <dedekind1@gmail.com>, "Balbi, Felipe" <balbi@ti.com>, "Rini,
 Tom" <trini@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, linux-omap <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Fri, Dec 13, 2013 at 02:42:57PM +0530, Pekon Gupta wrote:
>> This patch updates starting offset for free bytes in OOB which can be us=
ed by
>> file-systems to store their metadata (like clean-marker in case of JFFS2=
).
>
>This should be describing a regression fix, right? We don't just
>arbitrarily change the "OOB free" layout; we need a reason. So please
>describe it here.
>
>(It seems like an off-by-one, or off-by-<N> error, where the oobfree
>region was miscalculated.)
>
>Possibly you can paste an example intended ecclayout as well as an
>incorrect layout that was calculated before this fix.
>
>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> ---
>>  drivers/mtd/nand/omap2.c | 17 ++++-------------
>>  1 file changed, 4 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c

[...]

>>
>> -	/* populate remaining ECC layout data */
>> -	ecclayout->oobfree->length =3D mtd->oobsize - (BADBLOCK_MARKER_LENGTH =
+
>> -							ecclayout->eccbytes);
>>  	for (i =3D 1; i < ecclayout->eccbytes; i++)
>>  		ecclayout->eccpos[i] =3D ecclayout->eccpos[0] + i;
>>  	/* check if NAND device's OOB is enough to store ECC signatures */
>> @@ -1990,6 +1977,10 @@ static int omap_nand_probe(struct platform_device=
 *pdev)
>>  		err =3D -EINVAL;
>>  		goto return_error;
>>  	}
>> +	/* populate remaining ECC layout data */
>> +	ecclayout->oobfree->offset =3D ecclayout->eccpos[ecclayout->eccbytes] =
+ 1;
>
>Hmm, this line seems a little odd. The ecclayout->eccpos[] array and the
>value of ecclayout->eccbytes sould be related as follows:
>
>  let N =3D ecclayout->eccbytes
>
>  This means the eccpos[] array should have N entries, indexed 0 to N-1,
>  and eccpos[N] is out of bounds. But you are accessing eccpos[N] above
>  (i.e., eccpos[ecclayout->eccbytes]). Are you sure this is correct? It
>  seems like it should be:
>
>	ecclayout->oobfree->offset =3D ecclayout->eccpos[ecclayout->eccbytes - 1]=
 + 1;
>
Thanks for this catch. Yes, you are correct. It's a typo.
This wasn't caught as I had tested everything on UBIFS which does not use '=
oobfree'.
Also, as ecclayout->eccpos is defined as large static array, so this dint c=
aused problems either.
	#define MTD_MAX_ECCPOS_ENTRIES_LARGE	640
	struct nand_ecclayout {
		__u32 eccpos[MTD_MAX_ECCPOS_ENTRIES_LARGE];

But, I think mtd_tests.nand_oobtest  would have caught this. I'll include t=
his change in next version.

<stripping down the CC list to avoid getting moderated by u-boot mailman>

with regards, pekon
