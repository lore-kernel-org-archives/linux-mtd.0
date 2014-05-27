Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpATH-0006Tp-Tj
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 06:02:48 +0000
Received: from eiche.ahsoftware (p57B22414.dip0.t-ipconnect.de [87.178.36.20])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 54D89423C1E3
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 08:02:23 +0200 (CEST)
Message-ID: <53842A53.1060404@ahsoftware.de>
Date: Tue, 27 May 2014 08:01:55 +0200
From: Alexander Holler <holler@ahsoftware.de>
MIME-Version: 1.0
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH 09/27] mtd: nand: pxa3xx: show device structure in sysfs
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <1401142372-14148-10-git-send-email-holler@ahsoftware.de>
 <1401160341.192042842@f271.i.mail.ru>
In-Reply-To: <1401160341.192042842@f271.i.mail.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.05.2014 05:12, schrieb Alexander Shiyan:
> Tue, 27 May 2014 00:12:34 +0200 =D0=BE=D1=82 Alexander Holler <holler@a=
hsoftware.de>:
>> Fix a common error in nand-drivers which do not set up a parent device=
for
>> the mtd-device by using a new inline function.
>>
>> Signed-off-by: Alexander Holler <holler@ahsoftware.de>
>> ---
>>   drivers/mtd/nand/pxa3xx_nand.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_=
nand.c
>> index 7588fe2..7f62e7c 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -1584,8 +1584,7 @@ static int alloc_nand_resource(struct platform_d=
evice *pdev)
>>   		host->mtd =3D mtd;
>>   		host->cs =3D cs;
>>   		host->info_data =3D info;
>> -		mtd->priv =3D host;
>> -		mtd->owner =3D THIS_MODULE;
>> +		mtd_setup_common_members(mtd, host, pdev);
>>
>>   		chip->ecc.read_page	=3D pxa3xx_nand_read_page_hwecc;
>>   		chip->ecc.write_page	=3D pxa3xx_nand_write_page_hwecc;
>> --
>
> Should we add "driver.owner =3D THIS_MODULE" field for struct platform_=
driver in this case?

Yes. I assumed all drivers/modules already had an owner. I will check=20
them all and will send a v2 for those which don't have one. I wonder=20
what this field is used for if it works without. ;)

Regards,

Alexander Holler
