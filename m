Received: from milvb95a.icn.siemens.it ([83.103.117.137])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVS1u-0003II-Kh
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 07:04:20 -0400
Message-ID: <69DF49BE936F4441980EC1D59F0ADC2F0108B472@aqlby02a.siemens.it>
From: Sette Agostino <Agostino.Sette@siemens.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 28 Oct 2005 13:04:04 +0200
MIME-Version: 1.0
Content-Type: text/plain
Subject: Mounting devpts on /dev/pts failed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
 
I have the following problem on a TQM859 CCM card with MPC859:
 
============================================================================
==================
PPCBoot 2.0.0 (Oct 20 2005 - 12:28:22)
 
CPU:   unknown MPC859 (0x08010004) at 133 MHz: 16 kB I-Cache 8 kB D-Cache
FEC present
         *** Warning: CPU Core has Silicon Bugs -- Check the Errata ***
Board: Siemens CCM
       Watchdog enabled
DRAM:  Restart Reason: 0xc0000000
32 MB
FLASH:  8 MB
In:    serial
Out:   serial
Err:   serial
Restart Reason: 0xc0000000
PUMA:  env. variable puma_addr undefined
Net:   FEC ETHERNET
 
Hello at Preboot
 
Hit any key to stop autoboot:  0
 
## Booting image at 40180000 ...
   Image Name:   Linux-2.4.20-rthal5
   Created:      2004-10-04  10:14:39 UTC
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    614355 Bytes = 599.10 kB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
IP-Config: Gateway not on directly connected network.
init started:  BusyBox v0.60.5 (2003.11.19-14:32+0000) multi-callmount:
Mounting devpts on /dev/pts failed: No su
ch file or directory
/opt/rc.project: /opt/bin/sinfo: No such file or directory
export USER='root'
export HOME='/'
export wdt_8xx='timeout:120'
export TERM='linux'
export PATH='/usr/bin:/bin:/usr/sbin:/sbin'
export SHELL='/bin/sh'
export PWD='/'
export mem='32512k'
/opt/rc.project: /opt/bin/sinfo: No such file or directory
export USER='root'
export HOME='/'
export wdt_8xx='timeout:120'
export TERM='linux'
export PATH='/usr/bin:/bin:/usr/sbin:/sbin'
export SHELL='/bin/sh'
export PWD='/'
export mem='32512k'
============================================================================
==================
 
I have this problem with a clock frequency of 66,5 MHz,  but if I go at 62
MHZ, the problem disappears and everything works properly.
I investigate on a SDRAM problem, but up to know I am focusing on FLASH.
Do you have any suggestions about how to solve my problem?
 
Thanks
 
Ciao
Agostino
