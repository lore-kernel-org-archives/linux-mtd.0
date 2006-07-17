Received: from fra-del-04.spheriq.net ([195.46.51.100])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G2UbP-0006Yg-2J
	for linux-mtd@lists.infradead.org; Mon, 17 Jul 2006 11:01:48 -0400
Received: from fra-out-02.spheriq.net (fra-out-02.spheriq.net [195.46.51.130])
	by fra-del-04.spheriq.net with ESMTP id k6HF0Ocr008792
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2006 15:01:28 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-02.spheriq.net with ESMTP id k6HExVId006201
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2006 14:59:32 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-01.spheriq.net with ESMTP id k6HExTf3027694
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2006 14:59:30 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 892C1DA43
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jul 2006 14:59:29 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39D9D476C5
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jul 2006 14:59:29 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: nandwrite problem
Date: Mon, 17 Jul 2006 16:59:27 +0200
Message-ID: <000301c6a9b1$998eb590$253682a4@nap.st.com>
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


I have a NAND device related to MTD block 5. The NAND device is =
correctly probing during the kernel boot phase.=20
If I run the following commands

#mkdir /dev/mtdblock/5 b 31 5
#mount -t jffs2 /dev/mtdblock/5 /nand/

the JFFS2 file system is correctly mounting on the /nand/ directory.
But, if I run the following command

#./nandwrite -j /dev/mtdblock/5 filesys.jffs2_nand

in order to copy a file system image on the NAND device, the system =
returns the following message:

MEMGETINFO: Inappropriate ioctl for device

Any suggestions to solve the problem?

Thanks in advance,
Davide
