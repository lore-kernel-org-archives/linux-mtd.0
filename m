Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G2o3s-0001TQ-Ms
	for linux-mtd@lists.infradead.org; Tue, 18 Jul 2006 07:48:30 -0400
Received: from fra-out-01.spheriq.net (fra-out-01.spheriq.net [195.46.51.129])
	by fra-del-03.spheriq.net with ESMTP id k6IBmF1g027114
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2006 11:48:17 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-01.spheriq.net with ESMTP id k6IBmDvF026940
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2006 11:48:13 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-01.spheriq.net with ESMTP id k6IBmAGX009557
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2006 11:48:13 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCBE4DAA9
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jul 2006 11:44:12 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8DFE247497
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jul 2006 11:44:12 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: nandwrite fix
Date: Tue, 18 Jul 2006 13:44:00 +0200
Message-ID: <000201c6aa5f$7c79f420$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have tried to use the nandwrite utility with a large page nand, but it =
doesn't work properly. The problem is related to the jffs2_oobinfo =
struct. I have fixed the problem replacing the defined jffs2_oobinfo =
struct (for small page nand)

struct nand_oobinfo jffs2_oobinfo =3D {
	.useecc =3D MTD_NANDECC_PLACE,
	.eccbytes =3D 6,
	.eccpos =3D { 0, 1, 2, 3, 6, 7 }
};

with the following struct (for large page nand)

struct nand_oobinfo jffs2_oobinfo =3D {
        .useecc =3D MTD_NANDECC_AUTOPLACE,
        .eccbytes =3D 24,
        .eccpos =3D {
                40, 41, 42, 43, 44, 45, 46, 47,
                48, 49, 50, 51, 52, 53, 54, 55,
                56, 57, 58, 59, 60, 61, 62, 63},
        .oobfree =3D { {2, 38} }
};

Now the nandwrite utility works properly, but I think it's better to =
define a macro in order to select the correct jffs2_oobinfo struct =
depending on the device page size. What do you think about?

Best regards,
Davide
