Received: from bnet12.balasai.co.in ([203.199.134.122])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D0gcw-00016L-Ug
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 08:51:04 -0500
Received: from sharmila (static61.11.119-121.dsl-pun.eth.net [61.11.119.121]
	(may be forged)) (authenticated bits=0)
	by bnet12.balasai.co.in (8.12.8/8.12.8) with ESMTP id j1EDoYJo014763
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 19:20:54 +0530
Message-ID: <002101c5129d$fc311e10$046464c7@sharmila>
From: "sharmila inamdar" <sharmilai@rapideffect.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 14 Feb 2005 19:33:28 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-7"
Content-Transfer-Encoding: 7bit
Subject: M-systems linux driver 5.1.4 and INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have recently received  128MB DOCs  (MD2202-D128). With the 5.1.4
utilities it is clear that it is DOC2000 TSOP and is using INFTL.

>From the list I understand that the MTD driver will support these DOCs on
kernel 2.6.x . But for certain time constraints, I have to use these DOCS on
Linux ( Redhat 6.2,kernel v 2.2.14).   I want to format these DOCs and put
file system on them.


We have been using M-sys old DOCS ,which are NTFL based, on this setup with
5.1.4 driver. But the same can not be utilized now.

For formatting I followed the documented procedure. i.e.

step-1 > formatted the DOC with DOS utilities and put the firmware
doc514.exb with /empty and /nodsos flag

step-2 -> in Linux, gave command fdisk /dev/msys/fla

and it says device can not be read .




What's wrong ?Does the M-sys driver (5.1.4) on Linux support these DOCs
?does it support INFTL ?
How do I go about this ?  I am not getting any sort of hint on this from
M-sys site or other sources.

..sharmila
