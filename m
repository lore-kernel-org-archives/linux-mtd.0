Received: from [206.162.170.236] (helo=gateway.wavesat.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178LOV-0003W5-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 14:34:11 +0100
Message-ID: <006401c1fcde$bc00e8c0$0200010a@WT0136>
From: "Ho-Kuo Chan" <hchan@wavesat.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <001301c1fcd9$76792c40$0200010a@WT0136>  <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com>  <5240.1021554647@redhat.com>
Subject: Re: Trouble indetifying FLASH part 
Date: Thu, 16 May 2002 09:36:50 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,
    I turned on LE_BYTE_SWAP as you requested, with similar results:

physmap flash device: 4000000 at 8000000
HKC: output of ioremap: Map Priv 1 = 0xc2003000
HKC: Calling cfi_probe_chip with bus width 2, interleave 1 and device_type
16
HKC: cfi_send_gen_cmd: Addr = 0x0
HKC: cfi_send_gen_cmd: Cmd_addr = 0x0, CFIDEV_INTERLEAVE = 0x1, type = 0x2
HKC: cfi_send_gen_cmd: Val = 0xf000
HKC: cfi_send_gen_cmd: Addr = 0xaa
HKC: cfi_send_gen_cmd: Cmd_addr = 0x55, CFIDEV_INTERLEAVE = 0x1, type = 0x2
HKC: cfi_send_gen_cmd: Val = 0x9800
CFI Query Failed for driver
HKC: Calling cfi_probe_chip with bus width 2, interleave 2 and device_type 8
HKC: cfi_send_gen_cmd: Addr = 0x0
HKC: cfi_send_gen_cmd: Cmd_addr = 0x0, CFIDEV_INTERLEAVE = 0x2, type = 0x1
HKC: cfi_send_gen_cmd: Val = 0xf0f0
HKC: cfi_send_gen_cmd: Addr = 0xaa
HKC: cfi_send_gen_cmd: Cmd_addr = 0x55, CFIDEV_INTERLEAVE = 0x2, type = 0x1
HKC: cfi_send_gen_cmd: Val = 0x9898
CFI Query Failed for driver
HKC: Calling cfi_probe_chip with bus width 2, interleave 2 and device_type
16
HKC: cfi_send_gen_cmd: Addr = 0x0
HKC: cfi_send_gen_cmd: Cmd_addr = 0x0, CFIDEV_INTERLEAVE = 0x2, type = 0x2
HKC: cfi_send_gen_cmd: Val = 0xf0f0
HKC: cfi_send_gen_cmd: Addr = 0x154
HKC: cfi_send_gen_cmd: Cmd_addr = 0x55, CFIDEV_INTERLEAVE = 0x2, type = 0x2
HKC: cfi_send_gen_cmd: Val = 0x9898
CFI Query Failed for driver
CFI: Found no Physically mapped flash device at location zero

I have also tried replacing the ioremap call in init)physmap with
ioremap_nocache() but with no byte swapping. Should I try it with
LE_BYTE_SWAP?
