From: bpqw <bpqw@micron.com>
To: Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 1/1 v2] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Mon, 29 Sep 2014 00:30:04 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315DCF74@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCED6@NTXXIAMBX02.xacn.micron.com>
 <201409290043.43750.marex@denx.de>
In-Reply-To: <201409290043.43750.marex@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> For Micron spi norflash,you can enable Quad spi transfer by clear=20
>> EVCR(Enhanced Volatile Configuration Register) Quad I/O protocol bit.
>
>OK, this information is nice and all, but what does this patch do? I can't=
 learn this information from the commit message as it is, can I ?=20
>And , the purpose of the commit message is exactly to summarize the change=
 the patch implements.


you don't understand what purpose of this patch! just as subject and commit=
 message described,
it is for enable Micron Quad spi transfer mode.do you read the spi-nor.c fi=
le? please pay attention
to the set_quad_mode() function.by the way,I can add more commit message fo=
r it,but I think
it is redundant,don't need.

>> +static int micron_quad_enable(struct spi_nor *nor) {
>> +	int ret, val;
>> +
>> +	ret =3D nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(nor->dev, "error %d reading EVCR\n", ret);
>> +		return -EINVAL;
>> +	}
>> +
>> +	write_enable(nor);
>> +
>> +	/* set EVCR ,enable quad I/O */
>> +	nor->cmd_buf[0] =3D val & ~EVCR_QUAD_EN_MICRON;
>> +	ret =3D nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1, 0);
>> +	if (ret < 0) {
>> +		dev_err(nor->dev,
>> +			"error while writing EVCR register\n");
>> +		return -EINVAL;

>Why not just "return ret;" ?
>[...]

Ok,this is good,I will modify it in the next patch version.thanks.
