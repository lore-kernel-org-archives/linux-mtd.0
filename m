Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHYl2-0002E1-1n
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 14:43:04 +0000
From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: enhance ONFI table reliability/stable
Date: Tue, 21 Jul 2015 14:42:34 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF37D1C@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
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

Hi,=20

Recently, I faced some case about ONFI table reliability, now it used CRC.
If there is bit flips in ONFI parameter pages, parameter backup page will b=
e taken.=20
For latest linux,default read three copys.

	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
	for (i =3D 0; i < 3; i++) {
		for (j =3D 0; j < sizeof(*p); j++)
			((uint8_t *)p)[j] =3D chip->read_byte(mtd);
		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
				le16_to_cpu(p->crc)) {
			break;
		}
	}

However ,with technoogy improvement,for TLC and new generatin MLC,I think, =
three copys of=20
Parameter tables is not powerful enough.my question is that if there is a g=
ood method to protect and corrent parameter page. For example,we can use li=
nux software BCH ecc.
Any suggections and input be welcomed,if you having any concerns about this=
,don't free tell me.
