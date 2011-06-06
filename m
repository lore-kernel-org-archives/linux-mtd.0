Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWKh-0000Vb-5D
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:42:52 +0000
From: <roman.tereshonkov@nokia.com>
To: <dedekind1@gmail.com>, <kmpark@infradead.org>
Subject: RE: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
Date: Mon, 6 Jun 2011 09:42:29 +0000
Message-ID: <E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
References: <20110602064832.GA7319@july> <1307115701.3069.20.camel@localhost>
In-Reply-To: <1307115701.3069.20.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

>-----Original Message-----
>From: ext Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
>Sent: 03 June, 2011 18:42
>To: Kyungmin Park; Tereshonkov Roman (Nokia-SD/Helsinki)
>Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org;=20
>m.szyprowski@samsung.com
>Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at=20
>4KiB pagesize
>
>On Thu, 2011-06-02 at 15:48 +0900, Kyungmin Park wrote:
>> From: Kyungmin Park <kyungmin.park@samsung.com>
>>=20
>> There's no case to use the subpage for 4KiB pagesize.
>>=20
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> diff --git a/drivers/mtd/onenand/onenand_base.c=20
>b/drivers/mtd/onenand/onenand_base.c
>> index ac9e959..337be7c 100644
>> --- a/drivers/mtd/onenand/onenand_base.c
>> +++ b/drivers/mtd/onenand/onenand_base.c
>> @@ -4047,13 +4047,11 @@ int onenand_scan(struct mtd_info=20
>*mtd, int maxchips)
>>  	 */
>>  	switch (mtd->oobsize) {
>>  	case 128:
>> -		if (FLEXONENAND(this)) {
>> +		if (FLEXONENAND(this))
>>  			this->ecclayout =3D &flexonenand_oob_128;
>> -			mtd->subpage_sft =3D 0;
>> -		} else {
>> +		else
>>  			this->ecclayout =3D &onenand_oob_128;
>> -			mtd->subpage_sft =3D 2;
>> -		}
>> +		mtd->subpage_sft =3D 0;
>>  		break;
>>  	case 64:
>>  		this->ecclayout =3D &onenand_oob_64;
>
>Roman, are you happy with this change?
>


What do mean by "no case to use the subpage"?

According to the spec KFM4G16Q4M-xEBx the Number of Partial Program Cycles =
in the page (NOP)
is equal to 4 -> subpage_sft=3D2.

Regards
Roman Tereshonkov

>--=20
>Best Regards,
>Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>
>=
