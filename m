Received: from mails.tsinghua.edu.cn ([166.111.8.16])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15yUoc-00010r-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2001 09:04:11 +0000
From: "846cb5a5def91b3df2" <zhongxin00@mails.tsinghua.edu.cn>
To: linux-mtd@lists.infradead.org  
Date: Tue, 30 Oct 2001 17:12:17 +0800
Reply-To: "846cb5a5def91b3df2" <zhongxin00@mails.tsinghua.edu.cn>
Subject: problem in installing mkfs.jffs!
Message-Id: <E15yUoc-00010r-00@pentafluge.infradead.org>
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

I download total mtd directory from cvs yesterday.
Today I want install the mkfs.jffs under util directory.
I did the instructions in the readme file.
But when I type make,there are some error informations as follows:
gcc  -O2 -Wall  -o mkfs.jffs  mkfs.jffs.o  -lz mkfs.jffs.o: In function
`write_val32':
mkfs.jffs.o(.text+0x449): undefined reference to `__cpu_to_le32'
mkfs.jffs.o(.text+0x455): undefined reference to `__cpu_to_be32'
mkfs.jffs.o: In function `write_val16':
mkfs.jffs.o(.text+0x49f): undefined reference to `__cpu_to_le16'
mkfs.jffs.o(.text+0x4af): undefined reference to `__cpu_to_be16'
mkfs.jffs.o: In function `read_val32':
mkfs.jffs.o(.text+0x4f7): undefined reference to `__le32_to_cpu'
mkfs.jffs.o(.text+0x507): undefined reference to `__be32_to_cpu'
mkfs.jffs.o: In function `read_val16':
mkfs.jffs.o(.text+0x54a): undefined reference to `__le16_to_cpu'
mkfs.jffs.o(.text+0x55a): undefined reference to `__be16_to_cpu'
mkfs.jffs.o: In function `write_file':
mkfs.jffs.o(.text+0x89c): undefined reference to `__cpu_to_le16'
mkfs.jffs.o(.text+0x8ae): undefined reference to `__cpu_to_be16'
collect2: ld returned 1 exit status
make: *** [mkfs.jffs] Error 1
Can someone tell me how to solve this problem?
Thanks!!!
