Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QlHmv-0003Bx-Fe
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2011 09:49:26 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: <linux-mtd@lists.infradead.org>
Subject: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with Eraseblock
	Regions
Date: Mon, 25 Jul 2011 11:48:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201107251148.51262.brian.foster@maxim-ic.com>
Cc: Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

Massive apologies if this is not the correct list or
not the correct way of reporting MTD-utils bugs.
My searches failed to find anything ....  ;-\ 

MTD-utils 1.4.5, when `mtdinfo -a' tries to print the
eraseblock regions of NOR-Flash, it open(2)s the nil
pointer (NULL).  The problem seems to be in mtdinfo.c's
print_region_info(), which assumes there is always a MTD
/dev node name (args.node).  However, in the case of `-a',
args.node is always NULL.  Oops!

------------------------------------
# dmesg           #output abbreviated ....
 ...
[   15.890000] physmap platform flash device: 02000000 at 40000000
[   15.910000] physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x002201
[   15.930000] Amd/Fujitsu Extended Query Table at 0x0040
[   15.930000]   Amd/Fujitsu Extended Query version 1.3.
[   15.940000] number of CFI chips: 1
 ...

# mtdinfo /dev/mtd0
mtd0
Name:                           physmap-flash.0
Type:                           nor
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          256 (33554432 bytes, 32.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Additional erase regions:       0
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true
Eraseblock region 0:  offset: 0xc10e2e21 size: 0xc10e2fe8 numblocks: 0x1

# mtdinfo -a      #output abbreviated ....
 ...
mtd0
 ...
Bad blocks are allowed:         false
Device is writable:             true
mtdinfo: error!: couldn't open MTD dev: (null)
         error 14 (Bad address)
 ...
------------------------------------

I think the problem was introduced by commit 266061ebd5
(CC-ed to the author of that commit, Mike Frysinger).
It appears to still exist in the the current wavefront.
I do not have a proposed fix, Sorry!

cheers,
	-blf-
-- 
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
