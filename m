Received: from moutvdomng1.kundenserver.de ([212.227.126.181])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ABtj-0006Gm-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 16:50:03 +0100
Received: from [195.20.224.219] (helo=mrvdom03.kundenserver.de)
	by moutvdomng1.kundenserver.de with esmtp (Exim 3.22 #2)
	id 17ABti-0001uV-00
	for linux-mtd@lists.infradead.org; Tue, 21 May 2002 17:50:02 +0200
Received: from [80.134.55.55] (helo=comm.esd-electronics.com)
	by mrvdom03.kundenserver.de with esmtp (Exim 2.12 #3)
	id 17ABti-0003PA-00
	for linux-mtd@lists.infradead.org; Tue, 21 May 2002 17:50:02 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: SST Flash Support (SST39VF160) 
Date: Tue, 21 May 2002 17:41:34 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJKELGDPAA.stefan.roese@esd-electronics.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <10014.1021993258@redhat.com>
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

> SST 39VF160 chips are CFI-compliant. You shouldn't need any special code
> for them -- just use cfi_probe.

That's what I tried too. Here is what I get when I use the sst flash's (all
debug info turned on):

>>>
physmap flash device: 200000 at ffc00000
CFI: Found no Physically mapped flash device at location zero
<<<

On the amd flash board I get the following debug messages:

>>>
physmap flash device: 200000 at ffc00000
Number of erase regions: 4
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 16 ?s
Maximum byte/word write timeout: 512 ?s
Full buffer write not supported
Typical block erase timeout: 1024 ?s
Maximum block erase timeout: 16384 ?s
Chip erase not supported
Device size: 0x200000 bytes (2 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 4
  Erase Region #0: BlockSize 0x4000 bytes, 1 blocks
  Erase Region #1: BlockSize 0x2000 bytes, 2 blocks
  Erase Region #2: BlockSize 0x8000 bytes, 1 blocks
  Erase Region #3: BlockSize 0x10000 bytes, 31 blocks
kmod: failed to exec /sbin/modprobe -s -k cfi_cmdset_0002, errno = 2
Support for command set 0002 not present
cfi_probe: No supported Vendor Command Set found
<<<


Any thoughts/suggestions?

Thanks a lot,
Stefan.
