Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kfSW-0007Wg-Az
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 08:45:16 +0100
Message-ID: <3F320400.3000002@hectrix.com>
Date: Thu, 07 Aug 2003 15:47:12 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: "init not found" after booting GRUB on DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I followed Karim's book to put the kernel, modules, root filesystem
(including busybox and tinylogin) and GRUB on a DOC and tried booting
it. The kernel loaded successfully but it ended with a kernel panic of
"no init found". I use this statements in my menu.lst:

   title DiskOnChip 2000
   kernel (dc0,0)/boot/vmlinuz-2.4.21-5x86 ro root=/dev/nftla1

I have busybox's init in /sbin and I also tried adding "init=/sbin/init"
to the above statement but with the same result.

The NFTL driver is built-in and it correctly detects my DOC. The kernel 
also successfully mounts the root filesystem (ext3).

How should I configure GRUB in order to load the busybox's init?

advTHANKSance!

Selwyn
