Received: from mailhost.rdmcorp.com ([204.225.180.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pakf-0006sK-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 21:39:49 +0100
Received: from PARKER (10.1.2.1) by mailhost.rdmcorp.com (Worldmail 1.3.167) for linux-mtd@lists.infradead.org; 12 Sep 2002 16:43:46 -0400
From: "Jack Lu" <jlu@rdmcorp.com>
To: <linux-mtd@lists.infradead.org>
Subject: the procedure setting up jffs2
Date: Fri, 13 Sep 2002 04:37:05 -0400
Message-ID: <DFEAJMIABOLKNEBOPGDHAECJCBAA.jlu@rdmcorp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi

I am using RPX850 Lite with 16MB flash(4 chips of Am29Lv320MB) with buswidth
32 and interleave 4.
I have complied the MTD and JFFS2 module into the kernel.
When I start up the Linux, Linux found the 16MB flash, the whole flash
corresponds to /dev/mtd0.

1. where can I get the mkfs.jffs2 excutable for MPC850?

2. the bottom 256KB is the boot loader code of the 16MB flash. the rest si
for storing data
	if I do
	#cat jffs2.image > /dev/mtd0
	will the bootloader be erased?

I appreciate your help.
Thanks.
