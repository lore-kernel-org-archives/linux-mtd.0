Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14H7KC-0004m7-00
	for mtd-list@infradead.org; Fri, 12 Jan 2001 16:45:12 +0000
Date: Fri, 12 Jan 2001 19:53:00 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: mtdpart.c 
In-Reply-To: <23563.979316864@redhat.com>
Message-ID: <Pine.LNX.4.21.0101121951430.26282-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 12 Jan 2001, David Woodhouse wrote:
> > in mtdpart.c which is not in the Makefile.. is it safe to use this or
> > should I conjure up partition code myself in my mapping ? 
> 
> Use mtdpart.c

Ok great!

Axis flash mapping: 200000 at e0000000
Axis flash-image: Found a CFI device at 0x0 in 16 bit mode
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
Device size: 0x200000 bytes (2 Mb)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 4
  Erase Region #0: BlockSize 0x4000 bytes, 1 blocks
  Erase Region #1: BlockSize 0x2000 bytes, 2 blocks
  Erase Region #2: BlockSize 0x8000 bytes, 1 blocks
  Erase Region #3: BlockSize 0x10000 bytes, 31 blocks

Invalid Extended Query Table at 0040: 02 00 F2
No supported Vendor Command Set found
cfi_probe erred 0


:(

Wonder where it blew up - maybe I should dump the latest mtd cvs (using
2.4.0 release now)

/BW




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
