Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FphQD-00016B-2x
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 04:06:25 -0400
Received: from fra-out-02.spheriq.net (fra-out-02.spheriq.net [195.46.51.130])
	by fra-del-03.spheriq.net with ESMTP id k5C84soV026748
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2006 08:05:11 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-02.spheriq.net with ESMTP id k5C81s6q004502
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2006 08:01:54 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-01.spheriq.net with ESMTP id k5C81oDI026853
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2006 08:01:54 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58147DA48
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 08:01:50 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EB1D47384
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 08:01:50 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: FW: JFFS2 Mounting time
Date: Mon, 12 Jun 2006 10:01:48 +0200
Message-ID: <001a01c68df6$750dfcc0$253682a4@nap.st.com>
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


I'm using Linux 2.6.16 with mtd-snapshot-20060504. I mount JFFS2 on =
Sibley device (configured in burst mode with burst frequency of 48MHz). =
If I reserve a 16MByte MTD partition to JFFS2 with 80% file system =
usage, I'm able to mount the root file system in 2.6 sec. Is this a =
reasonable time? Any suggestion to improve the mounting performances? =
Any information about the JFFS2 mounting time with NOR devices?

Thanks in advance.
Best regards,
Davide

P.S. I must apologize because I have some problems to replay my previous =
questions posted on the forum.
