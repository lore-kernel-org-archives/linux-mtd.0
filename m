Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15COwp-0003xf-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 18:05:51 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id TAA09184
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 19:11:14 +0200 (CEST)
Message-ID: <3B2F8734.93729473@inventel.fr>
Date: Tue, 19 Jun 2001 19:09:08 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Abraham vd Merwe <abraham@2d3d.co.za>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: non cfi flash memory
References: <20010619154314.A17475@crystal.2d3d.co.za>  <3B2F4DEA.6839BBD0@inventel.fr> <4395.992957074@redhat.com> <10928.992958699@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

David Woodhouse a écrit :
> 
> abraham@2d3d.co.za said:
> >  I really think those cfi_cmdset_*.c chip driver modules should be
> > renamed to something else. It's really confusing since they're not
> > only for CFI chips.
> 
> I agree.
> 

I have 320C3 versions which seem to have cfi properties.
This is a debugged output from initialisation :

cfi_qry_mode, cfi->cfi_mode : 0x0
clep7211: Found 2 x16 devices at 0x0 in 32-bit mode
Number of erase regions: 2
  Erase Region #0: BlockSize 0x10000 bytes, 63 blocks
  Erase Region #1: BlockSize 0x2000 bytes, 8 blocks
Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
Primary Algorithm Table at 0035
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
Vpp Minimum: b.4 V
Vpp Maximum: c.6 V
Typical byte/word write timeout: 32 µs
Maximum byte/word write timeout: 512 µs
Full buffer write not supported
Typical block erase timeout: 1024 µs
Maximum block erase timeout: 8192 µs
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
check_cmd_set, type : 0x3
cfi_qry_mode, cfi->cfi_mode : 0x0
 Intel/Sharp Extended Query Table at 0x0035
  Feature/Command Support: 0066
     - Chip Erase:         unsupported
     - Suspend Erase:      supported
     - Suspend Program:    supported
     - Legacy Lock/Unlock: unsupported
     - Queued Erase:       unsupported
     - Instant block lock: supported
     - Protection Bits:    supported
     - Page-mode read:     unsupported
     - Synchronous read:   unsupported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0003
     - Lock Bit Active:      yes
     - Valid Bit Active:     yes
  Vcc Logic Supply Optimum Program/Erase Voltage: 0.7 V
  Vpp Programming Supply Optimum Program/Erase Voltage: 0.0 V
JEDEC ID: 89 C4
number of CFI chips: 1
0: offset=0x0,size=0x20000,blocks=63
1: offset=0x7e0000,size=0x4000,blocks=8
Creating 2 MTD partitions on "clep7211":
0x00000000-0x00100000 : "boot partition"
mtd: Giving out device 0 to boot partition
0x00100000-0x00400000 : "cramfs partition"
mtd: Giving out device 1 to cramfs partition
clep7211 flash access initialized


Is the number of CFI chips: 1 correct since I have two x16 flash in
parallel to have a 32 bit bus ?
And when I try to eraseall /dev/mtd0, I have the following problem :
/dev # eraseall /dev/mtd0
MTD_open
MTD_ioctl
Erasing 128 KibMTD_ioctl
yte @ 0 --  0 % complete.
eraseall: /dev/mMTD_ioctl
td0: MTD Erase failure: Read-only file system
Erasing 128 Kibyte @ 20000 -- 12 % complete.
eraseall: /dev/mMTD_ioctl
td0: MTD Erase failure: Read-only file system
Erasing 128 Kibyte @ 40000 -- 25 %
complete.                                                                                                  
...

(777 for /dev/mtd0 access)

Xavier
