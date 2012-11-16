Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHNK-0007tW-7f
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 08:34:11 +0000
Message-ID: <50A5FB79.3030305@freescale.com>
Date: Fri, 16 Nov 2012 16:38:17 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd nand : print flash size during detection
References: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
 <1353054248.3618.3.camel@sauron.fi.intel.com>
In-Reply-To: <1353054248.3618.3.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B411=E6=9C=8816=E6=97=A5 16:24, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Tue, 2012-11-06 at 12:03 +0100, Matthieu CASTET wrote:
>> This help to detect bad flash identification in case the size is not p=
resent
>> on the name (ONFI).
>>
>> Signed-off-by: Matthieu CASTET<matthieu.castet@parrot.com>
>> ---
>>   drivers/mtd/nand/nand_base.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base=
.c
>> index c90ef66..8916bc6 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3292,10 +3292,10 @@ ident_done:
>>   		chip->cmdfunc =3D nand_command_lp;
>>
>>   	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s =
%s),"
>> -		" page size: %d, OOB size: %d\n",
>> +		" %dMiB page size: %d, OOB size: %d\n",
> Is this readable? No comma after the size. I guess it is better to add
> "size %dMiB," instead?
>
In multi chip enables nand chips, such as some Micron nand chips, you=20
will find half size is printed
after this patch is applied. Why? because we only scan one #CE, but this=20
nand chip has two #CE, the #CE0 and #CE1.


a little confused.

Best Regards
Huang Shijie
