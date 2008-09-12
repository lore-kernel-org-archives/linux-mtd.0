Received: from mail.multitekarge.com ([88.247.191.72] helo=avrupayazilim.com)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ke5Bf-0002mI-Aj
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 09:43:36 +0000
Message-ID: <48CA39E0.9060400@multitekarge.com>
Date: Fri, 12 Sep 2008 12:44:00 +0300
From: Ensar Gul <ensar.gul@multitekarge.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 root file system corruption
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: ensar.gul@multitekarge.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

we were using JFFS2 on kernel 2.6.11 and and JFFS2 root fs corrupts 
rarely. ST NAND flash: 128MiB   with 2KiB page size, erase block size: 
128KiB is used. U-Boot version: 1.1.6

I dumped corrupted jfss2 partition and found out that 3 blocks are 
filled with FF. I can boot the system via nfs and then mount this 
partition and list the files on it.However, when I give this root fs to 
the kernel, it does not boot.

we observed that this problem occurs when  the linux hangs up  and the 
the device is reset. most of the time it boots but in very rare 
cases,due to the root fs corruption, it  does not boot.

if I erase whole partition and re-write jffs2 root fs again then the 
device boots.

any comments?

regards.

ensar
