Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BdqWS-0000zi-5N
	for linux-mtd@lists.infradead.org; Fri, 25 Jun 2004 09:13:40 -0400
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 153ABDD34
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Jun 2004 13:13:38 +0000 (GMT)
Received: from zeta.dmz-eu.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A7E612303
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Jun 2004 13:13:37 +0000 (UTC)
Received: from mail2.dlh.st.com (mail2.dlh.st.com [138.198.194.103])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 412B6F2A5
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Jun 2004 13:13:35 +0000 (GMT)
From: Manish RATHI <manish.rathi@st.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 25 Jun 2004 18:43:34 +0530
Message-ID: <000101c45ab6$37efd9f0$7c04b40a@dlh.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: query
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am newbee in linux.
i've to write a nand flash driver for a Soc which is using ARM as core =
so that soc can boot from nand flash rather than ram based file =
system(initrd).

i need to write a nand flash driver. As far as i understand nand driver =
will be layer interacting with nand fLASH.
Above it there will be mtd layer and above it there will be file system.

Mtd layer is already available in linux. Can somebody suggest me good =
literature to understand it and nand based flash driver.?

I'd like to know how will be flow from user application to layer.
Will these primitives be same like open, close, read, write, lseek,
ioctl or some additional will be needed.

will boot block be in flash? Does kernel read by flash using open and =
write?

Pls also tell me relevant information sites.

Thanks
Regards
Manish
