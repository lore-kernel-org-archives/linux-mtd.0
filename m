Received: from lon-del-02.spheriq.net ([195.46.50.98])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsJ5v-0007XY-O4
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 08:43:16 -0400
Received: from lon-out-03.spheriq.net ([195.46.50.131])
	by lon-del-02.spheriq.net with ESMTP id k5JCgWRC002865
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 12:43:01 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-03.spheriq.net with ESMTP id k5JCgViQ032195
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 12:42:31 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by lon-cus-01.spheriq.net with ESMTP id k5JCgJ6u011398
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 12:42:22 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2ABDDDA65
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Jun 2006 12:41:04 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9234475B2
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Jun 2006 12:41:03 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 mounting
Date: Mon, 19 Jun 2006 14:41:01 +0200
Message-ID: <000d01c6939d$9f056fc0$253682a4@nap.st.com>
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


I have an OMAP5912 OSK platform and I'm using Linux in XIP mode from a =
Sibley flash. I have the Linux OS image on the first flash bank and the =
JFFS2 root image on the second flash bank. I have configured the flash =
and the memory controller in burst mode and I have enabled the data =
cache on the flash. During the JFFS2 mounting phase I thought every read =
would have been performed in burst mode x8 (because the data cache is =
enabled), while it seems some reads are performed in asynchronous mode. =
Why are some reads performed in asynchronous mode? Does JFFS2 always use =
the low level driver read function (cfi_intelext_read) to read the =
flash?

Thanks in advance.
Best Regards,
Davide
