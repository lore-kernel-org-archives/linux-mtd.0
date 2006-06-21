Received: from fra-del-02.spheriq.net ([195.46.51.98])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsyZI-0002yc-OW
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 05:00:27 -0400
Received: from fra-out-01.spheriq.net (fra-out-01.spheriq.net [195.46.51.129])
	by fra-del-02.spheriq.net with ESMTP id k5L8xlMO021531
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 08:59:47 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-01.spheriq.net with ESMTP id k5L8xjMC021301
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 08:59:45 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-02.spheriq.net with ESMTP id k5L8xhx0012742
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 08:59:45 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32E4EDA46
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jun 2006 08:59:43 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E6724738C
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jun 2006 08:58:50 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: Linux Boot Time measurements
Date: Wed, 21 Jun 2006 10:58:46 +0200
Message-ID: <003501c69510$e7e9c370$253682a4@nap.st.com>
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


I'm working with Linux 2.6.16 on the OMAP5912 OSK platform. The kernel =
is run in XIP mode from a Sibley flash that works in burst mode at 48MHz =
and is cached. During the boot I have measured the following times:
1. about 1.2s from the start of the bootloader to the start of the =
kernel (perhaps most of time is spent to verify checksum)
1. about 500ms from the start of the kernel to the start of JFFS2 mount
2. about 1.2s to mount the JFFS2 file system on a 16MByte partion =
(13MByte of used space and 3MByte of free space)

What do you think about these measurements?
Any suggestion to improve the performances?

Thanks in advance.
Best Regards,
Davide
