Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GKaDq-0003gn-TL
	for linux-mtd@lists.infradead.org; Tue, 05 Sep 2006 13:40:12 +0100
Received: from fra-out-01.spheriq.net (fra-out-01.spheriq.net [195.46.51.129])
	by fra-del-03.spheriq.net with ESMTP id k85CcCOD004505
	for <linux-mtd@lists.infradead.org>; Tue, 5 Sep 2006 12:38:12 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-01.spheriq.net with ESMTP id k85CbfF0003153
	for <linux-mtd@lists.infradead.org>; Tue, 5 Sep 2006 12:37:41 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-01.spheriq.net with ESMTP id k85Cbefn011324
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 5 Sep 2006 12:37:41 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17C5CDA45
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Sep 2006 12:37:40 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD59547450
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Sep 2006 12:37:39 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 ECC options
Date: Tue, 5 Sep 2006 14:37:41 +0200
Message-ID: <000f01c6d0e8$145e1ce0$d204960a@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm working with JFFS2 on a NAND device. In order to disable the =
software ECC is it enough to set the mtd field "nand.eccmode" to =
"NAND_ECC_NONE"?=20
If I do this, I have some CRC errors if JFFS2 file system includes a bad =
block. Is it right? Does the CRC check depend on the ECC options?

In order to use the summary support, is it enough to set the macro =
"CONFIG_JFFS2_SUMMARY" in the file ".config"? Do I have to re-make the =
file system image (that I create using the mkfs.jffs2 utility) in order =
to use it with the summary support?

Thanks in advance,
Davide
