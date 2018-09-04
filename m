Received: from mail-db5eur01on0040.outbound.protection.outlook.com
 ([104.47.2.40] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx7dJ-0005dc-Rn
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 09:28:28 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Query: spi-nor: dummy buswidth calculation
Date: Tue, 4 Sep 2018 09:28:11 +0000
Message-ID: <VI1PR04MB1038E10EBE458DD72A1070C499030@VI1PR04MB1038.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

I have query regarding dummy bus width calculation for the read commands, a=
dded in the patch series [1]

In func m25p80_read(), dummy.buswidth is being assigned as
+       op.dummy.buswidth =3D op.addr.buswidth;

Above, buswidth for dummy commands are being assigned and are marked equal =
to the buswidth of the address command.
This is true for case when we are doing operation in 1-4-4 or 1-2-2 protoco=
l where data as well as address are running on same data lines and having s=
ame buswidth.

I am adding support of octal commands in framework and for this needs to ad=
d support for 1-1-8 protocol for Micron flash MT35XU512ABA1G12.
For octal command, 7Ch, flash is sending data and the dummy on the 8 data l=
ines and address on 1 data line.

If I do below code change, then I am getting correct data else there is dat=
a corruption only in the first byte read.
-       op.dummy.buswidth =3D op.addr.buswidth;
+       op.dummy.buswidth =3D spi_nor_get_protocol_data_nbits(nor->read_pro=
to);


[1] https://patchwork.kernel.org/patch/10334345/

--
Regards
Yogesh Gaur
