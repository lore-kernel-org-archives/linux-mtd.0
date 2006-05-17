Received: from lon-del-04.spheriq.net ([195.46.50.101])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FgM30-0002YB-TZ
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 09:27:39 -0400
Received: from lon-out-03.spheriq.net ([195.46.50.131])
	by lon-del-04.spheriq.net with ESMTP id k4HDQYoU002654
	for <linux-mtd@lists.infradead.org>; Wed, 17 May 2006 13:26:34 GMT
Received: from lon-cus-02.spheriq.net (lon-cus-02.spheriq.net [195.46.50.38])
	by lon-out-03.spheriq.net with ESMTP id k4HDQXn2010512
	for <linux-mtd@lists.infradead.org>; Wed, 17 May 2006 13:26:33 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by lon-cus-02.spheriq.net with ESMTP id k4HDQUOH015512
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 17 May 2006 13:26:32 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77B09DA71
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 May 2006 13:26:11 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0323147441
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 May 2006 13:25:35 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 17 May 2006 15:25:34 +0200
Message-ID: <002801c679b5$60bd2d90$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working to support Sibley devices in Linux OS with the JFF2 file =
system.

I have patched my Linux 2.6.16 OS with the latest snapshot downloaded at =
the following web address

http://ftp.linux.org.uk/pub/people/dwmw2/mtd/cvs/

After the boot, the Operating System mounts correctly the JFFS2 file =
system on the Sibley device and it seems to work properly (for example, =
a new file has been correctly created and/or deleted). But, when I =
reboot the system, I can see some Warning Messages during the file =
system mount phase:

>Empty flash at 0x000cd808 ends at 0x000cdc00
>jffs2_scan_dirent_node(): Name CRC failed on node at 0x000cdfd8: Read=20
>0xebaf74d5, calculated 0x44660075 JFFS2 notice: (12) check_node_data: =
wrong data CRC in data node at 0x000cf000: read 0xe49530c6, calculated =
0xe6751c2f.

The file system still works properly. So, I have the following =
questions:=20
1. Do you have some suggestion to solve my problem?=20
2. With my patch it seems that the headers are not correctly written. Do =
you know anything about it?=20
3. Do you know if a most recent patch is available?

Thanks in advance for any kind of support.

Best Regards,
Davide
