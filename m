Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DcyWc-0004SZ-Jl
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 00:38:48 -0400
Received: from fra-out-01.spheriq.net (fra-out-01.spheriq.net [195.46.51.129])
	by fra-del-03.spheriq.net with ESMTP id j4V4cfwY020287
	for <linux-mtd@lists.infradead.org>; Tue, 31 May 2005 04:38:41 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-01.spheriq.net with ESMTP id j4V4c97A021648
	for <linux-mtd@lists.infradead.org>; Tue, 31 May 2005 04:38:10 GMT
From: Pankaj GOYAL <pankaj.goyal@st.com>
To: <linux-mtd@lists.infradead.org>, <linux-mtd-bounces@lists.infradead.org>
Date: Tue, 31 May 2005 10:08:30 +0530
Message-ID: <000501c5659a$9916bba0$0f10b40a@dlh.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: Significance of Sector size while using the mkfs.jffs2 utility
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
	I m using the 16MB nand flash which has a block size of 16KB and the =
page size of 512byte with 16byte oob.I have created three partition on =
my NAND of 1MB(bootloader) 5MB(root filesystem) and 10MB(user =
filesystem).I m making the root filesystem image using the cross =
compiled (for ARM) mkfs.jffs2 utility (with the erasesize as 16KB and =
sector size 512 byte)to make a jffs2 filesystem image.But the jffs2 =
image exceeds the size of 5MB.Then I try to with different sector sizes =
and obeserve that with the sector size of 4KB ,I m able to make the =
jffs2 image of less then 5MB.
	I want to ask that is it safe to specify the sector size of 4KB while =
my nand has the page size of 512 byte only.Also I want to know that what =
is the use of the option -p during the use of mkfs.jffs2 utility.Is is =
necessary to use this option.What if I do not specify this flag.


Thanks and regards
Pankaj
