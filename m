Received: from numenor.qualcomm.com ([129.46.51.58])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJzn9-0002iI-Oe
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2003 18:32:35 +0000
Received: from neophyte.qualcomm.com (neophyte.qualcomm.com [129.46.61.149])
	hACIVAVY003260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Nov 2003 10:31:11 -0800 (PST)
Received: from NAEXFE01.na.qualcomm.com (naexfe01.qualcomm.com [172.30.32.17])
	hACIV8Tx023723	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Nov 2003 10:31:09 -0800 (PST)
From: hking <hking@qualcomm.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 12 Nov 2003 10:31:08 -0800
MIME-Version: 1.0
Message-Id: <200311121031.08597.hking@qualcomm.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Problem: erase mtd device
Reply-To: hking@qualcomm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is what I got after I added three custom partitions in the physmap.c=
:
After the kernel (2.4.20) boots up, I logged in as root and type:
#cat /proc/mtd
=3D=3D and I got:
dev:    size   erasesize  name
mtd0: 00040000 00040000 "ResetWord"
mtd1: 01ec0000 00040000 "User FS"
mtd2: 00100000 00040000 "UBOOT"


The size, erasesize and name look correct.  It does not say the starting =
point=20
of each partitions.  Since our first and third partition are write-protec=
ted,=20
so I tried to erase the mtd1.


And I typed:
#erase /dev/mtd1
=3D=3D and I got:
File open error


And I typed:
#eraseall /dev/mtd1
=3D=3D and I got:
eraseall: /dev/mtd1: No such device


Did I do anything wrong?=20
