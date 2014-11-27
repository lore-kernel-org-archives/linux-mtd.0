From: bpqw <bpqw@micron.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [V5 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Thu, 27 Nov 2014 05:55:43 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315EE059@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
 <20141126211240.GD21347@ld-irv-0074>
In-Reply-To: <20141126211240.GD21347@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, bpqw <bpqw@micron.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>First of all, can you fix your mail so that you have a proper 'From'?
>That should be your real name (not bpqw), so that it gives a proper patch =
author.=20
>If you can't get your mail header to have the right 'From:' line, then it =
also works to begin your mail with:

Sorry for this confusion. This bpqw email is our software public mailbox de=
dicated to submit linux patch.
Because our personal email title include Chinese name, this will result to =
messy code in from item.
I have ever submit one patch many times by my personal mail, but I always d=
idn't accept maintainer's response.
So I think, maybe my patch with Chinese name has been moved into maintainer=
's junk folder.

I don't know my mail from-field with Chinese name can or not be accepted, i=
f can,=20
I will submit next version patch by my personal mail.
=20
>> This patch adds code which enables Quad I/O mode on Micron SPI NOR flash=
es.
>>=20
>> For Micron SPI NOR flash,enabling or disabling quad I/O protocol is=20
>> controlled by EVCR (Enhanced Volatile Configuration Register), Quad I/O =
protocol bit 7.
>> When EVCR bit 7 is reset to 0,the SPI NOR flash will operate in quad I/O=
 mode.

>What's the difference between using EVCR and the ENTER QUAD I/O MODE
>(35h) command I see in some of your datasheets? Are both supported on all =
Micron quad I/O SPI NOR flash?

There is no difference between using EVCR and the ENTER QUAD I/O MODE comma=
nd.
But, for some Micron spi nor, there no ENTER Quad I/O command(35h),such as =
n25q064.
for all current Micron spi nor, if it support quad I/O mode, Using EVCR def=
initely be supported.
So, we recommend that enable QUAD I/O mode by writing ECVR.
 =20

>Also, which SPI NOR is this enabled for? I don't see any Micron entries in=
 spi_nor_ids[] which contain the SPI_NOR_QUAD_READ flag.

Yes, we now don't see any Micron entries in spi_nor_ids[] which contain the=
 SPI_NOR_QUAD_READ flag.
But Micron spi nor in spi_nor_ids[] all support Quad I/O mode. maybe custom=
er want to use default mode(extended I/O mode),
When submitted relevant patch, they didn't SPI_NOR_QUAD_READ flag in the sp=
i_nor_ids[].
This patch is just for wanting to enable Micron Quad I/O mode.


>> Signed-off-by: bean huo <beanhuo@micron.com>
>> Acked-by: Marek Vasut <marex@denx.de>
>> ---
>>  v1-v2:
>> 	Modified to that capture wait_till_ready()
>> 	return value,if error,directly return its
>> 	the value.
>>  v2-v3:
>> 	Directly use the reurning error value of
>> 	read_reg and write_reg,instead of -EINVAL.
>>  v3-v4:
>> 	Modify commit logs that wraped into 80 columns
>>  v4-v5:
>> 	Rebuild new patch based on latest linux-mtd

>Please rebase on l2-mtd.git. Sorry if that wasn't clear earlier.

OK,I will rebase it and sumbit a new version. Thanks for your suggestion.

>> +		dev_err(nor->dev,
>> +			"error while writing EVCR register\n");

>Join the above two lines?

Will be fixed it in the next version.

>> +		return ret;
>> +	}
>> +
>> +	ret =3D wait_till_ready(nor);

>It's spi_nor_wait_till_ready(), now.

OK, will be fixed it.

>> =20
>>  #define SR_QUAD_EN_MX		0x40	/* Macronix Quad I/O */
>> =20
>> +#define EVCR_QUAD_EN_MICRON    0x80    /* Micron Quad I/O */

>Like with other register bitfields (SR, FSR), please place a comment above=
 to describe the register, like:


OK, will be fixed it.

>Brian

All in all ,thanks for your response and valuable suggestions.
I will rebuild a new version, and submit it .

---Bean Huo---
