Received: from fra-del-04.spheriq.net ([195.46.51.100])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fnwxa-0007nf-Qy
	for linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 08:16:39 -0400
Received: from fra-out-02.spheriq.net (fra-out-02.spheriq.net [195.46.51.130])
	by fra-del-04.spheriq.net with ESMTP id k57CGIaG026575
	for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2006 12:16:18 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-02.spheriq.net with ESMTP id k57CGHUk018301
	for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2006 12:16:17 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-02.spheriq.net with ESMTP id k57CGGxu020063
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2006 12:16:16 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4337EDA43
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Jun 2006 12:16:15 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B45C147407
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Jun 2006 12:16:14 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: Root mounting time
Date: Wed, 7 Jun 2006 14:16:11 +0200
Message-ID: <001c01c68a2c$2a67d600$253682a4@nap.st.com>
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


I'm working in XIP mode on a OMAP platform using Sibley device in burst =
mode (burst frequency =3D 48MHz). I see that it's necessary about 1 sec =
to mount JFFS2 on a 1MB root image. Do you feel this is a reasonable =
time? How long does it usually take to mount the JFFS2 on a typical root =
image?

Thanks in advance.
Best regards,
Davide
