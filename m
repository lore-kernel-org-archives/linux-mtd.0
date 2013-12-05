From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: RE: [RFC/PATCH] mtd: nand: Refactor print messages
Date: Thu, 5 Dec 2013 06:26:39 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA51E62@DBDE04.ent.ti.com>
References: <1385379031-27766-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131205020137.GH27149@ld-irv-0074.broadcom.com>
In-Reply-To: <20131205020137.GH27149@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Mon, Nov 25, 2013 at 08:30:31AM -0300, Ezequiel Garcia wrote:
[...]
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index bd39f7b..4bdc0df 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>...
>> @@ -3372,8 +3374,8 @@ static struct nand_flash_dev *nand_get_flash_type(=
struct mtd_info *mtd,
>>  		id_data[i] =3D chip->read_byte(mtd);
>>
>>  	if (id_data[0] !=3D *maf_id || id_data[1] !=3D *dev_id) {
>> -		pr_info("%s: second ID read did not match "
>> -			"%02x,%02x against %02x,%02x\n", __func__,
>> +		pr_info("second ID read did not match "
>> +			"%02x,%02x against %02x,%02x\n",
>
>scripts/checkpatch.pl and Documentation/CodingStyle don't like this long
>string (even though it would be over 80 chars). I think we should combine =
them.
>
Yes, breaking the string into multiple prints have a problem that you don't=
 know
whether all parts of string get displayed continuously in console log.
Or they are scattered and mixed with other device probes logs because
device probe can sleep. Thus, we need to justify between:
- constrain print log to be within 80 character, (even in world where most
   modern have gone much beyond 80+ character of display).  OR=20
- have logs scattered and mixed with other device probe logs, which makes
   On-field tracing and debugging difficult.

(I like the other part of this patch, prefixing all messages with consisten=
t string).


with regards, pekon
