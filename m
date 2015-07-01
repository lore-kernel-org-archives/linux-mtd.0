Received: from mx6-out11.antispamcloud.com ([95.211.2.202])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAAud-0007nm-Jn
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 05:50:24 +0000
Message-ID: <55937F74.1020801@topic.nl>
Date: Wed, 1 Jul 2015 07:49:40 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
MIME-Version: 1.0
To: =?ISO-2022-JP?B?IkJlYW4gSHVvIBskQnA5SUxJTBsoQiAoYmVhbmh1byki?=
 <beanhuo@micron.com>
CC: "git@xilinx.com" <git@xilinx.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Only set Micron quad-read mode when
 controller in 4-lane TX mode
References: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
 <A765B125120D1346A63912DDE6D8B6310BF3651A@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF3651A@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BFOn 01-07-15 04:19, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) =
wrote:
>> drivers/mtd/spi-nor/spi-nor.c | 2 ++
>> 1 file changed, 2 insertions(+)
>=20
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c index e8f6131..10ba94f 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1398,6 +1398,8 @@ static int set_quad_mode(struct spi_nor *nor, stru=
ct flash_info *info)
>   >		}
>   >		return status;
>   >	case CFI_MFR_ST:
>> +		if (!(nor->spi->mode & SPI_TX_QUAD))
>> +			return 0;
> I think, this action should be done before callback set_quad_mode,and add=
 some codes in
> Spi controller driver.what is more,how do you get spi member in spi_nor?s=
eems no this member.

Too many changes between the Xilinx tree and mainline. My patch isn't for
mainline, I'll make a new one.

> I have one concern that as long as spi nor be configed into quad mode,spi=
 controller must be also
> immediately Transfer into quad mode, otherwise read status will be fail.

The original commit that added the micron Quad mode did not do this. I wond=
er
how this was tested, because it could never have worked on any setup I'm aw=
are
of. After setting the "quad mode" bit in volatile config, the controller ne=
eds
to start sending commands on all 4 lanes.
Even if it succeeds in doing that, a soft reset (e.g. unloading/loading the
driver, or kexec to another kernel) will bring the system in a state where =
the
controller will use 1 lane for commands while the chip expects 4, thus
breaking all communication.

Having slept and pondered about this, I suggest plainly removing the Micron
Quad mode code, because it is just broken and can never work. There's no
actual performance advantage here, apart from just saving a few clocks on
commands, which would be less than 0.1% on a 1k data read.

> But setting spi controller layer(driver/spi/) and configure spi nor layer=
(driver/mtd/spi-nor)
>   are not the same mtd layer,I found that it's hard to do.
> But for new structure spi controller(such as driver/mtd/spi-nor/fsl-quads=
pi.c) is very reasonable.and
> it can be easy to set spi controller and spi nor into quad mode at the sa=
me time.

I'm sorry, but I didn't understand what you meant  here.



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
