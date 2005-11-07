Received: from mail.avantwave.com ([210.17.210.210])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZ497-0006pk-5l
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 05:22:42 -0500
Received: from [172.16.9.196] ([172.16.9.196])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id jA7AC6Js026062
	for <linux-mtd@lists.infradead.org>; Mon, 7 Nov 2005 18:12:06 +0800
Message-ID: <436F2894.2040104@avantwave.com>
Date: Mon, 07 Nov 2005 18:12:36 +0800
From: mike lee <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Could not write to flash AT49BV6416T
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all
   I can boot linux with this AT49BV6414T flash, but can not erase/write 
to the flash. Every time i write to that flash it finish up with 
"Input/Output Error".
    Below is the debug output of cfi_cmdset0002, it is wrong according 
to chip datasheet . I have tried to use JEDEC enabled kernel, the result 
is the same.
   By the way, that ATMEL flash is CFI version 1.0 , i don't know 
whether it is update or not.

---- debug msg ---
NOR Flash 1: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0041
  Silicon revision: 87
  Address sensitive unlock: Not required
  Erase Suspend: Not supported
  Block protection: Not supported
  Temporary block unprotect: Supported
  Block protect/unprotect scheme: 128
  Number of simultaneous operations: 3
  Burst mode: Supported
  Page mode: 1020 word page
  Vpp Supply Minimum Program/Erase Voltage: 15.15 V
  Vpp Supply Maximum Program/Erase Voltage: 15.15 V
  Top/Bottom Boot Block: Unknown value 255
NOR Flash 1: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

Thanks
Mike Lee
