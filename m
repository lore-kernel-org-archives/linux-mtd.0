Received: from smtp3.infineon.com ([203.126.106.229])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IUvql-0003nB-Uw
	for linux-mtd@lists.infradead.org; Mon, 10 Sep 2007 22:51:43 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: How to use MTD util: nandwrite
Date: Tue, 11 Sep 2007 10:51:33 +0800
Message-ID: <BA6FCA7F70D9FD43B88BFB2DD4E6EB7701136E41@xiyse301.ap.infineon.com>
From: <Wanghao.Yu@infineon.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I met a problem when I used nandwrite to copy file to NandFlash.
The command I used is as follows.
#nandwrite /tmp/hello /dev/mtd0 (copy file named hello to /dev/mtd0)
The error message is=20
MEMGETINFO: Inappropriate ioctl for device.
Before using nandwrite, I have already used "flash_eraseall -j =
/dev/mtd0" to erase the NandFlash.
I don't know where the problem is.
Could anyone help me?

Best Regards,

Yu Wanghao (Helen)
Component Verification
COM IFCX CV
Infineon Technologies
CV Lab,F3, Block A, No.38, Gaoxin 6th Road,=20
Xi'an High-tech Industries Development Zone,=20
Xi'an,  P.R.China 710075=20
Tel.	+86 29 8832 8222 ext 8513
Fax 	+86 29 8831 7279
mailto:wanghao.yu@infineon.com
