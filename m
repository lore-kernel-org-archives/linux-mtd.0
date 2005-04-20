Received: from send.forptr.21cn.com ([202.105.45.52] helo=21cn.com)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOGVO-0000Xn-3T
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 10:48:44 -0400
Date: Wed, 20 Apr 2005 22:47:24 +0800
From: "carl liao" <carlliao@21cn.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Message-ID: <VF949579774981.21346@send6.inner-21cn.com>
Subject: NAND Flash Device and JFFS2 support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I back ported mtd snapshot 20050416 codes to 2.4.26 for AMD Au1200.
The NAND device could be identified and accessed via /dev/mtd/0 interface.
I even could mount /dev/mtdblock/0, copy file to it and umount it. But there is
so many warnings or ecc error messages!

So in order to properly use NAND Flash, how could I format and read/write
data to it? I want to put Linux root file system on the NAND. Is it a right choice?

Thanks in advance for you suggestions and help!

Carl Liao
