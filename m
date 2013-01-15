Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv2HS-0005ld-Q3
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 08:54:04 +0000
Message-ID: <50F5190D.9050700@freescale.com>
Date: Tue, 15 Jan 2013 16:53:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH] mtd: apply tPROG delay for ONFI nand's page program
References: <1358147853-31826-1-git-send-email-b32955@freescale.com>
 <50F3FA09.3080405@parrot.com>
In-Reply-To: <50F3FA09.3080405@parrot.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8814=E6=97=A5 20:28, Matthieu CASTET =E5=86=
=99=E9=81=93:
> Huang Shijie a =C3=A9crit :
>> With some latest Micron's onfi nand(such as MT29F64G08CBABAWP),
>> I find that if we do not apply the tPROG delay as the datasheet tells =
us,
>> the page program may fails. You will read out the all 0xff from this p=
age
>> in this case.
>>
>> This patch adds the tPROG delay for page program when it is an onfi na=
nd.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   drivers/mtd/nand/nand_base.c |    4 ++++
>>   1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base=
.c
>> index 8323ac9..b628dd5 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -841,6 +841,10 @@ static int nand_wait(struct mtd_info *mtd, struct=
 nand_chip *chip)
>>   	 */
>>   	ndelay(100);
>>
>> +	/* Apply the tPROG delay for ONFI nand program. */
>> +	if (chip->onfi_version&&  state =3D=3D FL_WRITING)
>> +		udelay(le16_to_cpu(chip->onfi_params.t_prog));
>> +
>>   	if ((state =3D=3D FL_ERASING)&&  (chip->options&  NAND_IS_AND))
>>   		chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
>>   	else
> It looks wrong : why should be wait tPROG before using status command t=
o monitor
> program end ?
>
> tPROG is the Page program time (Measured from the falling edge of SR[6]=
 to the
> rising edge of SR[6]), but because we monitor SR[6] with status command=
, we
> already wait for that time.
>
thanks. you are right. Please ignore this patch.
> Are you sure that it is not a bug in your nand driver with status comma=
nd ?
>
>
I will try to find the bug in the driver.

thanks
Huang Shijie
> Matthieu
>
