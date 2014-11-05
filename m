Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlw19-00028x-Dx
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 08:32:39 +0000
Received: from [10.136.13.65] (lbrmn-lnxub113.ric.broadcom.com [10.136.13.65])
 by mail-irva-13.broadcom.com (Postfix) with ESMTP id 1CEBB40FE5	for
 <linux-mtd@lists.infradead.org>;
 Wed,  5 Nov 2014 00:31:59 -0800 (PST)
Message-ID: <5459E090.1010300@broadcom.com>
Date: Wed, 5 Nov 2014 00:32:16 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: suspect UBIFS async operations causing issues during reboot
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are doing reboot testing with UBIFS on the 3.10 kernel with a new 
chipset we are working on.

Over 1000's of reboots we eventually find that the NAND has 
uncorrectable ECC errors reported on a random page when it is mounted.

We have found the problem is that a NAND erase operation is in progress 
when the reboot occurs. Since the NAND is in the middle of the erase 
operation the page is mostly FF with some random bits not erased when 
the reboot occurs.

We suspect the problem is the asynchronous nature of the UBIFS 
operations.  Perhaps the small write buffer that can take 3-5 seconds to 
be written or some other operation occuring in UBI/UBIFS?  I don't think 
the shutdown of the filesystem is dealing with all the threads properly.

Log below with printks adding in iproc_nand driver showing erase 
operations in progress when "Restarting system." happens.

Stopped Setup Virtual Console.
Stopping Apply Kernel Variables...
Stopped Apply Kernel Variables.
Starting Notify Audit System and Update UTMP about System Shutdown...
Stopping Runtime Directory...
Stopping Remount API VFS...
Stopped Remount API VFS.
Stopping Remount Root FS...
Stopped Remount Root FS.
Stopping Collect Read-Ahead Data...
Stopped Collect Read-Ahead Data.
Stopping Media Directory...[   18.370000] systemd[1]: Unit 
systemd-readahead-collect.service entered failed state.

Started Console System Reboot Logging.
Stopped Runtime Directory.
Stopped Media Directory.
[   18.490000] systemd[1]: Shutting down.
Sending SIGTERM to remaining processes...
Sending SIGKILL to remaining processes...
Unmounting file systems.
[   18.530000] iproc_nand_cmdfunc: cmd 0x60 addr 0x14a40000
[   18.540000] iproc_nand_waitfunc: native cmd 8 intfc status 0xc00000e0
[   18.550000] UBIFS: background thread "ubifs_bgt0_0" stops
Disabling swaps.
Detaching loop devices.
Detaching DM devices.
[   18.560000] iproc_nand_cmdfunc: cmd 0x60 addr 0x18680000
[   18.570000] iproc_nand_waitfunc: native cmd 8 intfc status 0xc00000e0
[   18.580000] Restarting system.
[   18.580000] iproc_nand_cmdfunc: cmd 0x60 addr 0x18700000

<REBOOT happens here with NAND ERASE COMMAND in progress corrupting 
0x18700000 NAND Addresses!>  Corrupted NAND only happens when erase 
operation in progress when restarting system happens.
