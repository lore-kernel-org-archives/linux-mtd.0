Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLe84-0001K5-Bv
	for linux-mtd@lists.infradead.org; Wed, 23 Jul 2008 13:11:42 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KLe7z-00075A-F4
	for linux-mtd@lists.infradead.org; Wed, 23 Jul 2008 13:11:35 +0000
Received: from 82-135-208-232.static.zebra.lt ([82.135.208.232])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2008 13:11:35 +0000
Received: from augulis.darius by 82-135-208-232.static.zebra.lt with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2008 13:11:35 +0000
To: linux-mtd@lists.infradead.org
From: Darius <augulis.darius@gmail.com>
Subject: Re: XIP Kernel freeze
Date: Wed, 23 Jul 2008 16:05:22 +0300
Message-ID: <g67alq$3i0$1@ger.gmane.org>
References: <g6776j$n5p$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <g6776j$n5p$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Darius wrote:
> Hi All,
> 
> I'm using XIP kernel on i.MXL board MXLADS V2.0
> This board has two 16bit NOR Flahs devices configured as one 32bit memory.
> Overall 32Mbytes Flash. Memory chips are Spansion S29PL127.
> 
> kernel freezes when booting on this line from cfi_probe.c:
> 
> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
> cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
> --->>> cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
> 
> First two commands are sent successful, but after last one kernel freezes.
> This happens almost everytime when booting kernel, but not allways.
> Sometimes, very rare, kernel is booting normaly.
> When kernel is booted successful, everything works ok - i can write and erase to and from flash memory.
> 
> Where can be a problem? Is it possible that it is caused by hardware?
> 

kernel is 2.6.26-git7
when compiling, I'm getting such warnings:

  CC      drivers/mtd/chips/cfi_probe.o
/tmp/cc4TCFuE.s: Assembler messages:
/tmp/cc4TCFuE.s:56: Warning: ignoring changed section attributes for .data
   CC      drivers/mtd/chips/cfi_util.o
/tmp/ccisjcki.s: Assembler messages:
/tmp/ccisjcki.s:295: Warning: ignoring changed section attributes for .data
   CC      drivers/mtd/chips/cfi_cmdset_0002.o
/tmp/cc9DRNfF.s: Assembler messages:
/tmp/cc9DRNfF.s:1974: Warning: ignoring changed section attributes for .data
   CC      drivers/mtd/chips/gen_probe.o
