Received: from mail-px0-f171.google.com ([209.85.212.171])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QD8Yq-0006yZ-Rv
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 05:05:45 +0000
Received: by pxi7 with SMTP id 7so270810pxi.16
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 22:05:42 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 22 Apr 2011 01:05:41 -0400
Message-ID: <BANLkTi=b6XGamVPAfuQZJo=sRQy286xh0g@mail.gmail.com>
Subject: JFFS2 loss of power expectations
From: Cliff Brake <cliff.brake@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm helping debug a system that is running the 2.6.27 kernel with
JFFS2 (with summary) on SLC NAND.  The CPU is a PXA270 (cm-x270), and
appears to be using NAND_ECC_SOFT.  We are experiencing some file
system corruption if we lose power when the system is booting up.
There is some amount of file system activity when udev and other
system components start, but overall there is not much that is being
written to the file system.

A few questions:

1) should this combination be fairly robust to power failure (are
failures expected, or possible)?
2) any suggestions for debugging this?

We have not ruled out hardware problems (power supply, etc).

Thanks,
Cliff

-- 
=================
http://bec-systems.com
