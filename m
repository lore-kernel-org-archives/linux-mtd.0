Received: from [206.162.170.236] (helo=gateway.wavesat.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BFic-0003Vi-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 15:06:58 +0100
Message-ID: <006601c2032c$a62c2330$0200010a@WT0136>
From: "Ho-Kuo Chan" <hchan@wavesat.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <007401c2029f$8c95ac30$0200010a@WT0136>  <009c01c1fce9$4415bf60$0200010a@WT0136> <008101c1fce3$ae6588b0$0200010a@WT0136> <006401c1fcde$bc00e8c0$0200010a@WT0136> <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> <9456.1021556252@redhat.com> <14029.1021558521@redhat.com> <19099.1021561319@redhat.com>  <14563.1022190250@redhat.com>
Subject: Re: Trouble indetifying FLASH part 
Date: Fri, 24 May 2002 10:09:41 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi David,
> hchan@wavesat.com said:
> > Calling cfi_probe_chip with bus width 2, interleave 2 and device_type 8
> > Calling cfi_probe_chip with bus width 2, interleave 2 and device_type 16
>
> What you have is a single chip, isn't it?
>
> Why does it never probe for bus width 2, interleave 1 and device_type 16?
>
> --
> dwmw2
Ooops, sorry, I missed part of the copy/paste. This is the result with
interleave at 1 with device_type 16:

Calling cfi_probe_chip with bus width 2, interleave 1 and device_type 16
Output Reg: 0x45480000
TCR: 0x750a0000
ODR: 0x20000
Control 0: 0x17ee616
Addr = 0x0
Cmd_addr = 0x0, CFIDEV_INTERLEAVE = 0x1, type = 0x2
Val = 0xf000
Addr = 0xaa
Cmd_addr = 0x55, CFIDEV_INTERLEAVE = 0x1, type = 0x2
Val = 0x9800
Read 0x=0, cmd = 0x5100
Read 0x=100, cmd = 0x5200
Read = 0x3e00, cmd = 0x5900
CFI Query Failed for driver

Something just occurred to me: the calculated cmd values are endian swapped.
I just checked and LE_BYTE_SWAP is still on, I have just turned it off and
the device is now recognied:

Calling cfi_probe_chip with bus width 2, interleave 1 and device_type 16
Output Reg: 0x45480000
TCR: 0x750a0000
ODR: 0x20000
Control 0: 0x17ee616
Addr = 0x0
Cmd_addr = 0x0, CFIDEV_INTERLEAVE = 0x1, type = 0x2
Val = 0xf0
Addr = 0xaa
Cmd_addr = 0x55, CFIDEV_INTERLEAVE = 0x1, type = 0x2
Val = 0x98
Read 0x=51, cmd = 0x51
Read 0x=52, cmd = 0x52
Read = 0x59, cmd = 0x59
Number of erase regions: 2
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 16 탎
Maximum byte/word write timeout: 512 탎
Full buffer write not supported
Typical block erase timeout: 1024 탎
Maximum block erase timeout: 16384 탎
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks
<snip>
number of CFI chips: 1
mtd: Giving out device 0 to Physically mapped flash

Thanks for your help!!!!

HK
