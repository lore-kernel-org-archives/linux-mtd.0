Received: from [200.53.172.133] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16CWdk-0005Q3-00
	for <linux-mtd@lists.infradead.org>; Sat, 08 Dec 2001 01:50:57 +0000
Message-ID: <20011208021016.28394.qmail@qis>
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: linux-mtd@lists.infradead.org
Subject: nftl_format with offset
Date: Sat, 08 Dec 2001 02:10:16 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
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

Hello,
I got this problem, why when I :
nftl_format /dev/mtd0
i can load nftl module without problems, but when I:
nftl_format /dev/mtd0 0x100000
it gives "Could not find valid boot record" error ?
It happends because I upgraded to 2.4.16, with the lastest cvs code. What 
should be wrong? 

Here are the details: 

[root@qis1 util]# ./nftl_format /dev/mtd0
$Id: nftl_format.c,v 1.17 2001/08/29 14:28:48 dwmw2 Exp $
Phase 1. Checking and erasing Erase Zones from 0x00000000 to 0x00800000
Skipping bad zone (factory marked) #103 @ 0xce000
Skipping bad zone (factory marked) #128 @ 0x100000
Skipping bad zone (factory marked) #129 @ 0x102000
	Checking Zone #1023 @ 0x7fe000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase Unit
You have new mail in /var/spool/mail/root
[root@qis1 util]# dmesg|tail -5
MTD_ioctl
_DoC_WaitReady called for out-of-line wait
MTD_ioctl
_DoC_WaitReady called for out-of-line wait
MTD_close
You have new mail in /var/spool/mail/root
[root@qis1 util]# insmod nftl
Using /lib/modules/2.4.16-normal/kernel/drivers/mtd/nftl.o
[root@qis1 util]# dmesg|tail -5
Got mutex
NFTL read request of 0x2 sectors @ 6 (req->nr_sectors == 2)
NFTL read request completed OK
end_request(1)
unknown partition table
[root@qis1 util]# 


[root@qis1 util]# ./nftl_format /dev/mtd0 0x100000
$Id: nftl_format.c,v 1.17 2001/08/29 14:28:48 dwmw2 Exp $
Phase 1. Checking and erasing Erase Zones from 0x00100000 to 0x00800000
Skipping bad zone (factory marked) #128 @ 0x100000
Skipping bad zone (factory marked) #129 @ 0x102000
	Checking Zone #1023 @ 0x7fe000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase Unit
You have new mail in /var/spool/mail/root
[root@qis1 util]# dmesg|tail -5
MTD_ioctl
_DoC_WaitReady called for out-of-line wait
MTD_ioctl
_DoC_WaitReady called for out-of-line wait
MTD_close
[root@qis1 util]# insmod nftl
Using /lib/modules/2.4.16-normal/kernel/drivers/mtd/nftl.o
[root@qis1 util]# dmesg|tail -5
mtd->read = d00396c0, size = 8388608, erasesize = 8192
NFTL_setup
NFTL Media Headers at 0x0 and 0x104000 disagree.
Could not find valid boot record
Could not mount NFTL device
[root@qis1 util]# dmesg|tail
MTD_ioctl
_DoC_WaitReady called for out-of-line wait
MTD_close
NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip Millennium
mtd->read = d00396c0, size = 8388608, erasesize = 8192
NFTL_setup
NFTL Media Headers at 0x0 and 0x104000 disagree.
Could not find valid boot record
Could not mount NFTL device
[root@qis1 util]# 
