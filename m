Received: from lon-del-02.spheriq.net ([195.46.50.98])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4CwB-00063s-FU
	for linux-mtd@lists.infradead.org; Tue, 09 Jan 2007 04:06:40 -0500
Received: from lon-out-03.spheriq.net ([195.46.50.131])
	by lon-del-02.spheriq.net with ESMTP id l0996Hhr031908
	for <linux-mtd@lists.infradead.org>; Tue, 9 Jan 2007 09:06:17 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-03.spheriq.net with ESMTP id l0996Gi0000389
	for <linux-mtd@lists.infradead.org>; Tue, 9 Jan 2007 09:06:16 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by lon-cus-01.spheriq.net with ESMTP id l0996CWA031197
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 9 Jan 2007 09:06:16 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC9FCDA69
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Jan 2007 09:05:19 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E7BE472F9
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Jan 2007 09:05:19 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: Paging demand
Date: Tue, 9 Jan 2007 10:05:08 +0100
Message-ID: <001801c733cd$48e296b0$d204960a@nap.st.com>
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

Hi,

I have read some documents that talk about CRAMFS as the only file =
system that supports the paging demand. But I think that the paging =
demand only depends on the Operating System. So I think that Linux also =
uses the paging demand with JFFS2. Is it right?

Best regards,
Davide
