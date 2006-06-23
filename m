Received: from lon-del-03.spheriq.net ([195.46.50.99])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FtkgH-0005IP-6M
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 08:22:42 -0400
Received: from lon-out-03.spheriq.net ([195.46.50.131])
	by lon-del-03.spheriq.net with ESMTP id k5NCMWFs003676
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 12:22:32 GMT
Received: from lon-cus-02.spheriq.net (lon-cus-02.spheriq.net [195.46.50.38])
	by lon-out-03.spheriq.net with ESMTP id k5NCMV3q030534
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 12:22:32 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by lon-cus-02.spheriq.net with ESMTP id k5NCMMTH002055
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 12:22:27 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C31EFE3C9
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jun 2006 10:55:59 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23FD947414
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jun 2006 10:55:58 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: uboot performances
Date: Fri, 23 Jun 2006 12:55:56 +0200
Message-ID: <001001c696b3$9aeacf70$253682a4@nap.st.com>
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


I'm working with the OMAP5912 OSK platform. I have the boot-loader code =
and the Linux OS compressed image in a Sibley flash. When I run the =
system, the boot loader (uBoot) have to copy the Kernel Image (about =
700KB) in RAM. It takes about 300ms in order to perform that copy. But I =
have read some benchmark results in which the copy of the kernel in RAM =
lasts only 80-100ms. In order to reduce the time of the copy on my =
platform, the only solution that I found (after checking the memory =
controller settings) is to modify the copy function memmove (uboot/ =
lib_generic/string.c). This function performs the copy byte by byte. If =
I modify this function to perform the copy 4byte by 4byte, the =
bootloader only takes about 80 ms. Do you think this is a good =
workaround for this problem? Can you suggest me anything better?

Thanks in advance.
Best Regards,
Davide
