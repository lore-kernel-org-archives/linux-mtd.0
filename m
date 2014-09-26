From: bpqw <bpqw@micron.com>
To: Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 1/1] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Fri, 26 Sep 2014 08:39:38 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
In-Reply-To: <201409251211.57183.marex@denx.de>
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

>> +	/* set EVCR ,enable quad I/O */
>> +	nor->cmd_buf[0] =3D val & ~EVCR_QUAD_EN_MICRON;
>> +	ret =3D nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1, 0);
>> +	if (ret < 0) {
>> +		dev_err(nor->dev,
>> +			"error while writing EVCR register\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (wait_till_ready(nor))
>> +		return 1;

>Why does this not return proper error code or even better, return value fr=
om
>wait_till_ready() ?
>
>Other than that, there's nothing wrong with the patch I think.

Hi,Marek
Thanks for your review,you can find the same usage in the spi-nor.c.
Below method is OK? Or you can give me some suggestion.

if (wait_till_ready(nor))
	return - EINVAL;
