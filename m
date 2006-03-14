Received: from nproxy.gmail.com ([64.233.182.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FJ4At-0002V1-3x
	for linux-mtd@lists.infradead.org; Tue, 14 Mar 2006 02:42:38 -0500
Received: by nproxy.gmail.com with SMTP id a27so74588nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Mar 2006 23:42:32 -0800 (PST)
Message-ID: <fd16d25f0603132342l37cecfc6o2b236a138036ca75@mail.gmail.com>
From: "Sudhakar Rajashekhara" <sudhakar.raj@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_2134_7509881.1142322152478"
Subject: Hardware ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Tue, 14 Mar 2006 07:42:40 -0000

------=_Part_2134_7509881.1142322152478
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I am working on the NAND driver for an ARM based SoC which has Samsung
K9K1208Q0C 64MB nand (Size of oobblock =3D 512 and Amount of oob data per
block =3D 16). The driver is up and working. This nand chip is capable of
generating hardware ECC. Now I want to integrate the Hardware ECC support
into my NAND driver. How I should populate the "eccmode" and "options"
fields of the nand_chip structure? Can I use NAND_HWECC_SYNDROME as one of
the options?

Thanks in advance,
Sudhakar

------=_Part_2134_7509881.1142322152478
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi,</div>
<div>&nbsp;</div>
<div>I am working on the NAND driver for an ARM based SoC which has Samsung=
 K9K1208Q0C 64MB nand (Size of oobblock =3D 512 and Amount of oob data per =
block =3D 16). The driver is up and working. This nand chip is capable of g=
enerating hardware ECC. Now I want to integrate the Hardware ECC support in=
to&nbsp;my NAND&nbsp;driver. How I should populate the &quot;eccmode&quot; =
and &quot;options&quot; fields of the nand_chip structure? Can I use NAND_H=
WECC_SYNDROME as one of the options?
</div>
<div>&nbsp;</div>
<div>Thanks in advance,</div>
<div>Sudhakar</div>

------=_Part_2134_7509881.1142322152478--
