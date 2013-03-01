Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBGji-0008G5-G1
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 03:34:19 +0000
Message-ID: <513021C3.2000503@freescale.com>
Date: Fri, 1 Mar 2013 11:34:27 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
References: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <512EC54F.3090400@freescale.com> <20130228104819.GH22886@pengutronix.de>
In-Reply-To: <20130228104819.GH22886@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8828=E6=97=A5 18:48, Uwe Kleine-K=C3=B6ni=
g =E5=86=99=E9=81=93:
> On Thu, Feb 28, 2013 at 10:47:43AM +0800, Huang Shijie wrote:
>> =E4=BA=8E 2013=E5=B9=B402=E6=9C=8827=E6=97=A5 23:10, Uwe Kleine-K=C3=B6=
nig =E5=86=99=E9=81=93:
>>> According to the Open NAND Flash Interface Specification (ONFI) Revis=
ion
>>> 3.1 "Parameters are always transferred on the lower 8-bits of the dat=
a
>>> bus." for the Get Features and Set Features commands.
>>>
>> yes. the set/get features should works in 8-bit.
>>
>> I have never met a 16-bit onfi nand yet. :)
>>
>>> So using read_buf and write_buf is wrong for 16-bit wide nand chips a=
s
>>> they use I/O[15:0]. The Get Features command is easily fixed using 4
>>> times the read_byte callback. For Set Features error out as there is =
no
>> yes. for get features, it's easy to fix it.
>>> write_byte callback.
>> Most of the time, the nand controller will overwrite the write_buf hoo=
k...
>> I also think we need a write_byte callback.
> a default implementation could be something like that:
>
> 	static void nand_write_byte(struct mtd_info *mtd, uint8_t byte)
> 	{
> 		struct nand_chip *chip =3D mtd->priv;
>
> 		if (chip->options&  NAND_BUSWIDTH_16)
> 			chip->write_buf(mtd, (uint8_t[]){ byte, 0 }, 2);
> 		else
> 			chip->write_buf(mtd,&byte, 1);
> 	}
>
> (Is this the correct order in the array? Or might that depend on
> endianess?)
>
> Does this look right?
>
IMHO, the nand_write_byte() should not call the chip->write_buf() again.=20
Since the ->write_buf() could
be the nand_write_buf16(). it makes a little mess.

In my opinion, the default nand_write_byte() hook could use the=20
nand_write_buf() to  write just one byte;
and the nand controller can overwrite the nand_write_byte() hook if it=20
could.
Of course, it's just a suggest.

thanks
Huang Shijie



> Alternatively something could be done with chip->cmd_ctrl (but it seems
> not all drivers implement this, e.g. mxc_nand doesn't).
>
> Best regards
> Uwe
>
