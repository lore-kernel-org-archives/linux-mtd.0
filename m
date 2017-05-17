Received: from us-smtp-delivery-212.mimecast.com ([216.205.24.212])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAuUr-0006ty-33
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 08:39:54 +0000
Subject: Re: [PATCH] mtd: nand: tango: Fix incorrect use of SEQIN command
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, "Cyrille
 Pitchen" <cyrille.pitchen@atmel.com>
References: <1494886224-20393-1-git-send-email-boris.brezillon@free-electrons.com>
 <20170516003001.636a9cac@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <b9c5447f-2b55-9323-a348-13d2bda16335@sigmadesigns.com>
Date: Wed, 17 May 2017 10:38:21 +0200
MIME-Version: 1.0
In-Reply-To: <20170516003001.636a9cac@bbrezillon>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16/05/2017 00:30, Boris Brezillon wrote:

> Boris Brezillon wrote:
>=20
>> SEQIN is supposed to be used one wants to start programming a page.
>=20
> =09=09=09      ^ when one ...
>=20
>> What we want here is just changing the column within the page, which is
                            =20
I would write "is just to change".

>> done with the RNDIN command.
>>
>=20
> Forgot the following tags.
>=20
> Fixes: 6956e2385a16 ("mtd: nand: add tango NAND flash controller support"=
)
> Cc: state@vger.kernel.org

stable, I assume.

>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> ---
>>  drivers/mtd/nand/tango_nand.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand=
.c
>> index 05b6e1065203..a2150b15d4c1 100644
>> --- a/drivers/mtd/nand/tango_nand.c
>> +++ b/drivers/mtd/nand/tango_nand.c
>> @@ -332,7 +332,7 @@ static void aux_write(struct nand_chip *chip, const =
u8 **buf, int len, int *pos)
>> =20
>>  =09if (!*buf) {
>>  =09=09/* skip over "len" bytes */
>> -=09=09chip->cmdfunc(mtd, NAND_CMD_SEQIN, *pos, -1);
>> +=09=09chip->cmdfunc(mtd, NAND_CMD_RNDIN, *pos, -1);
>>  =09} else {
>>  =09=09tango_write_buf(mtd, *buf, len);
>>  =09=09*buf +=3D len;

Looks correct, but I have no knowledge of NAND protocols :-)

Acked-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Regards.
