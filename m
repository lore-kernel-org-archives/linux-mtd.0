Received: from pact518.hit.edu.cn ([202.118.236.130])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DDfRo-0002bl-5I
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 04:13:13 -0500
Message-ID: <20050322085040.31545.qmail@pact518.hit.edu.cn>
From: "Bruce Tang" <tjtsir@pact518.hit.edu.cn>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Mar 2005 16:50:40 +0800
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="gb2312"
Content-Transfer-Encoding: 7bit
Subject: cramfs: wrong magic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,Xavier 

I had used the kernel source from samsung
to boot S3c2410 based board. While booting, the kernel couldn't mount the
filesystem (cramfs).
It panics with the message "cramfs wrong magic". 

This problem is very similar with your problem I found at 
http://lists.infradead.org/pipermail/linux-mtd/2004-March/009431.html
can you help me to solve this issue. I had listed below the boot
message. 

Thanks and Regards,
Bruce Tang 

.......................
pty: 256 Unix98 ptys configured
s3c2410-ts initialized
S3C2410 Real Time Clock Driver v0.1
block: 128 slots per queue, batch=32
eth0: cs8920 rev `(3.3 Volts) found at 0xd0000300
cs8900a.c: wrong device driver!
cs89x0: no cs8900 or cs8920 detected.Be sure to disable PnP with SETUP
NAND device: Manufacture ID: 0xec, Chip ID: 0x76 (Samsung K9D1208V0M)
bon0: 00000000-00030000 (00030000) 00000000
bon1: 00030000-00100000 (000d0000) 00000000
bon2: 00100000-03ffc000 (03efc000) 00000000
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
cramfs: wrong magic
FAT: bogus logical sector size 65535
Kernel panic: VFS: Unable to mount root fs on 61:02 
