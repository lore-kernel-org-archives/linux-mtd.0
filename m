Received: from web13905.mail.yahoo.com ([216.136.175.68])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ClFZ-0003D6-I1
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 20:03:45 +0100
Message-ID: <20030505190359.52930.qmail@web13905.mail.yahoo.com>
Date: Mon, 5 May 2003 12:03:59 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.
I'm having trouble using the 'erase' and 'eraseall'
utilities on my flash device.  It's an AMD29LV640ML,
which supports CFI and uses command set #2.

I'm getting the error message "Wacky! Unable to decode
failure status".  See below: (with minor modifications
to make it more readable)
----------

# erase /devfs/mtd/2 0 1
MTD_open
Erase Total 1 Units
MTD_ioctl
MTD_ioctl
Erase Unit Size 0x10000, Performing Flash Erase of
length 65536 at offset 0x0
MTD_ioctl
MTD do_erase_oneblock(): ERASE 0x000a0000
MTD do_erase_oneblock(): Check 0x0000ff44 0x0000ff00
MTD do_erase_oneblock(): Check 0x0000004f 0x0000000b
MTD do_erase_oneblock(): Check 0x0000004f 0x0000000b
MTD do_erase_oneblock(): Check 0x0000004f 0x0000000b
MTD do_erase_oneblock(): Check 0x0000004f 0x0000000b
MTD do_erase_oneblock(): Check 0x0000004f 0x0000000b
MTD do_erase_oneblock(): Check 0x0000004f 0x0000000b
MTD do_erase_oneblock(): Check 0x0000005c 0x00000018
MTD do_erase_oneblock(): Check 0x0000005c 0x00000018
MTD do_erase_oneblock(): Check 0x0000005c 0x00000018
MTD do_erase_oneblock(): Check 0x0000004e 0x0000000a
MTD do_erase_oneblock(): Check 0x0000004e 0x0000000a
MTD do_erase_oneblock(): Check 0x0000ffff 0x0000ffff
MTD do_erase_oneblock(): Check 0x0000ffff 0x0000ffff
MTD do_erase_oneblock(): Check 0x0000ffff 0x0000ffff
MTD do_erase_oneblock(): Wacky!  Unable to decode
failure status
MTD do_erase_oneblock(): 0x000a0000(0x000000ff):
0x0000ffff 0x0000ffff 0x0000ffff 0x0000ffff

MTD Erase failu
MTD_close
error
# 
----------
The procedure that is being executed is in
cfi_cmdset_0002.c. (around line 1100)

Does anyone have a hunch of what it could be?

Thanks!

Mike

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
