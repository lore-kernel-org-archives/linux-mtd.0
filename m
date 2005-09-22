Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EITd8-0008KD-07
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 17:09:03 +0100
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id j8MGJYja003286
	for <linux-mtd@lists.infradead.org>; Thu, 22 Sep 2005 16:19:34 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005092220084123714
	for <linux-mtd@lists.infradead.org>; Thu, 22 Sep 2005 20:08:41 +0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Sep 2005 20:08:39 +0400
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: XIP fails on kernels  2.6.12 and higher
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I can't bootup XIP linux kernel on Mainstone platform (based on PXA270
processor). I tried several different kernel versions=20
2.6.9, 2.6.11 - bootup with enabled XIP kernel feature fine.
But 2.6.12 and 2.6.13 - faults at the start of booting.=20
I found very big changes between 2.6.12 and 2.6.11 in memory management
code. I suspect it brokes XIP.=20

Do you know this problem?
Has XIP been broken on all platforms or just on Mainstone platform only?



Here is kernel failure log. (It's rather short :-) )

Linux version 2.6.13.2 (root@localhost.localdomain) (gcc version 3.4.3)
#7 Thu S
ep 22 19:51:25 MSD 2005
CPU: XScale-PXA270 [69054114] revision 4 (ARMv5TE)
Machine: Intel HCDDBBVA0 Development Platform (aka Mainstone)
Memory policy: ECC disabled, Data cache writeback
Run Mode clock: 208.00MHz (*16)
Turbo Mode clock: 416.00MHz (*2.0, active)
Memory clock: 104.00MHz (/2)
System bus clock: 104.00MHz
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Built 1 zonelists
Kernel command line: console=3DttyS1,115200 mem=3D64M
mtdparts=3Dphys_mapped_flash:512
k(blob)ro,2m(kernel)ro,16m(root),10m(vol1) rootfstype=3Djffs2 =
root=3D31:02
ro
PID hash table entries: 512 (order: 9, 8192 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Unhandled fault: imprecise external abort (0x406) at 0x00000000
