Received: from f58.pav1.hotmail.com ([64.4.31.58] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182tiP-0007kB-00
	for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2002 14:32:29 +0100
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: cfi_probe called with unsupported buswidth 2...?
Date: Sat, 19 Oct 2002 13:31:47 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F58cOV1EetVoMDrxxnS0000077f@hotmail.com>
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

Hi Friends,

Am using Am29LV320D. Have updated physmap.c with proper addresses.
In make menuconfig MTD, have added physical memory addr and size with
bus width 2. Getting below error. What's wrong inthe config?.
Any suggestions?.

----------------------
pty: 256 Unix98 ptys configured
block: queued sectors max/low 19050kB/6350kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 12288K size 1024 blocksize
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 4194303k freed
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications 
AB.
loop: loaded (max 8 devices)
physmap flash device: 800000 at 2800000
cfi_probe called with unsupported buswidth 2
Physically mapped flash: Found no CFI device at location zero
wrong magic
Kernel panic: VFS: Unable to mount root fs on 01:00
Rebooting in 180 seconds..
----------------------

Thanks and Regards,
Vijay

_________________________________________________________________
Surf the Web without missing calls! Get MSN Broadband.  
http://resourcecenter.msn.com/access/plans/freeactivation.asp
