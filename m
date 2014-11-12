From: bpqw <bpqw@micron.com>
To: Graham Moore <grmoore@opensource.altera.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [V5 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Wed, 12 Nov 2014 00:58:31 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315EB0DA@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
 <54613259.4070903@opensource.altera.com>
 <alpine.DEB.2.02.1411111336010.1356@lava-test-server>
In-Reply-To: <alpine.DEB.2.02.1411111336010.1356@lava-test-server>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, bpqw <bpqw@micron.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>Hi, I'm having trouble with this patch using a Cadence QSPI controller and=
 Micron n25q00 part.

>I can use quad commands in Extended SPI mode, but I can't make this EVCR Q=
uad mode work.


Yes,but if you use quad commands in Extended spi mode,only for Quad command=
s,the command line is DQ0,
Address/data line is DQ0,DQ1,DQ2 and DQ3(1-x-4).=20
But if in Quad I/O mode,for all the commands,the command/address/data line =
will be 4,they are DQ0,DQ1,DQ2 and DQ3(4-x-4).

>The Cadence QSPI Controller has fields to configure the quad transfer, and=
 can support quad opcode,=20
>quad address, and quad data, or some combination.  There is a chart in the=
 docs which shows the combinations for various read commands.

>Problem is, I've tried all of the combinations and all I get is FF with th=
is EVCR patch.

This maybe your spi controller is still extended mode,=20
Once EVCR bit 7 is set to 0, the spi nor device will operate in quad I/O.Co=
mmand-address-data line is 4-x-4.
So after send WRITE EVCR command , spi controller also  must transfer to qu=
ad I/O Mode,and set its Command-address-data line also
Should be 4-x-4 .

>If I don't set the quad mode in the EVCR, then I can use quad read command=
s no problem.
Yes,you don't set the quad mode in the EVCR,you can use quad read commands,=
but this patch is for enable Micron SPI nor Quad I/O mode,
If you want to enable it ,you must set EVCR.

>Bottom line, with the Cadence QSPI controller, if I use quad commands in E=
xtended SPI mode, then all good.  If I use this EVCR quad mode, then all ba=
d.

>Anybody else have a Cadence QSPI controller and using EVCR quad mode succe=
ssfully?

>Thanks,
>Graham Moore

Hi,Brian

Whether this patch can be merged?thanks.
