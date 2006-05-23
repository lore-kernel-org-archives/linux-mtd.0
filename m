Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FiUCZ-00075M-QO
	for linux-mtd@lists.infradead.org; Tue, 23 May 2006 06:33:33 -0400
Received: from fra-out-03.spheriq.net (fra-out-03.spheriq.net [195.46.51.131])
	by fra-del-03.spheriq.net with ESMTP id k4NAWK2X011041
	for <linux-mtd@lists.infradead.org>; Tue, 23 May 2006 10:33:20 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-03.spheriq.net with ESMTP id k4NAWFHx004266
	for <linux-mtd@lists.infradead.org>; Tue, 23 May 2006 10:32:15 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-02.spheriq.net with ESMTP id k4NAWBRR002785
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 23 May 2006 10:32:14 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67DD2DA46
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 May 2006 10:32:08 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C9A2473A4
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 May 2006 10:32:05 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 23 May 2006 12:32:04 +0200
Message-ID: <004a01c67e54$228ee2e0$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 Flash unlock
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does JFFS2 automatically unlock the flash memory (on which the file =
system is mounted) before to issue a write/erase command? If no, is it =
correct to unlock the flash sectors related to file system during the =
platform initialization?

Thanks in advance,
Best Regards
 Davide
