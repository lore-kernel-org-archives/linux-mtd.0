Received: from mail-db9lp0253.outbound.messaging.microsoft.com
 ([213.199.154.253] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8nTW-0001ZZ-8Y
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 08:27:39 +0000
Message-ID: <52089C91.4090903@freescale.com>
Date: Mon, 12 Aug 2013 16:28:01 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 3/6] mtd: set the ecc step size for master/slave
 mtd_info
References: <1376285092-19683-1-git-send-email-b32955@freescale.com>
 <1376285092-19683-4-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A32@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F2A32@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8812=E6=97=A5 15:00, Gupta, Pekon =E5=86=99=
=E9=81=93:
>> Set the ecc step size for master/slave mtd_info{}.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   drivers/mtd/mtdpart.c        |    1 +
>>   drivers/mtd/nand/nand_base.c |    1 +
>>   2 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
>> index 3014933..63b42a6 100644
>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c
>> @@ -516,6 +516,7 @@ static struct mtd_part *allocate_partition(struct
>> mtd_info *master,
>>   	}
>>
>>   	slave->mtd.ecclayout =3D master->ecclayout;
>> +	slave->mtd.ecc_step =3D master->ecc_step;
>>   	slave->mtd.ecc_strength =3D master->ecc_strength;
>>   	slave->mtd.bitflip_threshold =3D master->bitflip_threshold;
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base=
.c
>> index 8f04fb0..6e4095d 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3788,6 +3788,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>>   	/* propagate ecc info to mtd_info */
>>   	mtd->ecclayout =3D chip->ecc.layout;
>>   	mtd->ecc_strength =3D chip->ecc.strength;
>> +	mtd->ecc_step =3D chip->ecc.size;
> [Pekon]: Sorry for noticing this lately..
> But do you really want to name ecc.*size* as *ecc_step* ?
Please see :
http://lists.infradead.org/pipermail/linux-mtd/2013-May/046928.html

Artem thought the ecc_step is more proper.


> Wouldn't it be better to follow same nomenclature everywhere ?
> Like ' mtd->ecc_size =3D chip.ecc.size;'
>
> Because we also have ecc.steps as another parameter here.
there is no need to expose the ecc.steps to use space.

Since the user can get the ecc_step, and pagesize, they can get the=20
ecc.steps by:
(pagesize / ecc_step).

thanks
Huang Shijie
> And someone might want to expose it in user-space later.
> (Just a naming change requested here to keep things in sync..)
