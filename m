Received: from xes-mad.com ([216.165.139.220] helo=mail.xes-mad.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eLu3Z-0006Z6-HY
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 16:57:27 +0000
Date: Mon, 4 Dec 2017 10:56:56 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1306928205.372320.1512406616569.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <df3a31b1-d167-f3b9-f377-572695e5d2ee@wedev4u.fr>
References: <763349437.151011.1509293502020.JavaMail.zimbra@xes-inc.com>
 <df3a31b1-d167-f3b9-f377-572695e5d2ee@wedev4u.fr>
Subject: Re: [PATCH] mtd: spi-nor: Check that BP bits are set properly
MIME-Version: 1.0
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

----- Original Message -----
> From: "Cyrille Pitchen" <cyrille.pitchen@wedev4u.fr>
> Sent: Thursday, November 30, 2017 7:57:27 AM

Hi Cyrille,

> Hi Aaron,
>=20
> Le 29/10/2017 =E0 17:11, Aaron Sierra a =E9crit=A0:
>> Previously, the lock and unlock functions returned success even if the
>> BP bits were not actually updated in the status register due to
>> hardware write protection. Introduce write_sr_and_check() to write and
>> read back the status register to ensure the desired BP bits are
>> actually set as requested.
>>=20
>> Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
>> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 39 +++++++++++++++++++++++++++---------=
---
>>  1 file changed, 27 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c
>> index 19c00072..8a87bd1 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -550,6 +550,31 @@ static int spi_nor_erase(struct mtd_info *mtd, stru=
ct
>> erase_info *instr)
>>  =09return ret;
>>  }
>> =20
>> +/* Write status register and ensure bits in mask match written values *=
/
>> +static int write_sr_and_check(struct spi_nor *nor, u8 new, u8 mask)
>=20
> Maybe keep the previous name 'status_new' to be consistent with stm_lock(=
)
> and stm_unlock() and also because 'new' is a C++ reserved keyword so it m=
ight
> be better to avoid using it to name some variable (editor syntax coloring=
 issue
> for instance).

Sure, both of those reasons seem reasonable.
=20
>> +{
>> +=09int ret;
>> +
>> +=09ret =3D spi_nor_wait_till_ready(nor);
>> +=09if (ret)
>> +=09=09return ret;
>> +
>=20
> Why do you poll the status register here ?
> Based on the source code before your patch, it should not be needed.
> Do you think it is ?

This polling was due to an excess of caution. I've reviewed the preceding
code and agree that this can be removed from the next version of this patch=
.

> Otherwise, your patch looks good to me :)

Thanks for your review!

-Aaron S.

> Best regards,
>=20
> Cyrille
>
