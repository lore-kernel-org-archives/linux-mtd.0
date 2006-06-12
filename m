Received: from fra-del-04.spheriq.net ([195.46.51.100])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FphEE-0000fo-O6
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 03:53:06 -0400
Received: from fra-out-03.spheriq.net (fra-out-03.spheriq.net [195.46.51.131])
	by fra-del-04.spheriq.net with ESMTP id k5C7qljq011134
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2006 07:52:47 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-03.spheriq.net with ESMTP id k5C7ql4t029852
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2006 07:52:47 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-02.spheriq.net with ESMTP id k5C7qfue011926
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2006 07:52:44 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0C84DA65
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 07:51:36 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B0C84737C
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 07:51:35 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: do_xxlock_oneblock delay
Date: Mon, 12 Jun 2006 09:51:33 +0200
Message-ID: <001701c68df5$0639c0f0$253682a4@nap.st.com>
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


I'm using Linux 2.6.16 with mtd-snapshot-20060504.
If mtd unlock function (do_xxlock_oneblock) is called with udelay=3D0 =
and CONFIG_MTD_XIP is defined, the xip_wait_for_operation() waits for =
500000us. Why does it wait for 500ms if the unlock operation doesn't =
need any delay?

Thanks in advance.
Best Regards,
Davide
