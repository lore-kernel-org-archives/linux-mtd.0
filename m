Received: from web90107.mail.scd.yahoo.com ([66.218.94.78])
	by pentafluge.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CyjI1-0002J4-Br
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2005 04:17:23 +0000
Message-ID: <20050209041615.31286.qmail@web90107.mail.scd.yahoo.com>
Date: Tue, 8 Feb 2005 20:16:15 -0800 (PST)
From: anonymous <wanttoknowwhyandwhatfor@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: further question on commandline partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I currently have:
...
<5>physmap flash device:400000 at 4000000.
<4>__ioremap(): phys addr 04000000 is RAM lr c01d93f0.
<4>__ioremap(): virt_to_phys(high_memory) addr
02000000.
<4>__ioremap(): passed first cond.
<4>__ioremap(): passed second cond.
<4>__ioremap(): passed label.
<5>init_physmap after simple_map_init.
<5>init_physmap type=cfi_probe.
<6>phys_mapped_flash: Found 1 x16 devys_mapped_flash:
Found 1 x16 devices at 0x0 in 16-bit bank.
<4> Amd/Fujitsu Extended Query Tableat 0x0040.
<5>number of CFI chips: 1.
<5>cfi_cmdset_0002: Disabling erase-suspend-program
due to code brokenness..
<5>init_physmap after for loop.
<5>RedBoot partition parsing not
available.
<5>init_physmap after parse_mtd_partitions.
<6>mtd: Giving out device 0 to phys_mapped_flash.
<5>init_physmap after add_mtd_device.
...
Now I am trying to use commandline for creating
partitions. I was referred to the header comment in
the drivers/mtd/cmdlinepart.c:
/* The format for the command line is as follows:
*
* mtdparts=<mtddef>[;<mtddef]
* <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
* <partdef> := <size>[@offset][<name>][ro]
* <mtd-id>  := unique name used in mapping
driver/device (mtd->name)
* <size>    := standard linux memsize OR "-" to denote
all remaining space
* <name>    := '(' NAME ')'
*
* Examples:
*
* 1 NOR Flash, with 1 single writable partition:
* edb7312-nor:-
*
* 1 NOR Flash with 2 partitions, 1 NAND with one
*
edb7312-nor:256k(ARMboot)ro,-(root);edb7312-nand:-(home)
*/

It is still unclear for me from the comment and
example above - how I come up with the:

 "<mtd-id>  := unique name used in mapping
driver/device (mtd->name)"

 such as  "edb7312-nor" and "edb7312-nand" ...

is it the unique name, which I should make up on my
own
or else ?

Also speaking of the sizes for partitions: -
I suppose that for the NOR flash, the size info from
the commandline will be processed together with the
info on the total size of the NOR flash, provided in 
.config's 
CONFIG_MTD_PHYSMAP_LEN 
- am I correct in my above conjecture ?

However, this leaves unexplained how the total size of
the NAND flash is derived, say for the given above
example:
edb7312-nand:-(home)
In above notation - it merely refers to "all remaining
space" (which in particular example I think means:
entire space of the NAND flash - correct ?). So 
how the total size of the NAND flash is derived ?
(I do not see any .config entry for this info with
regards to NAND flash).

Thanks




__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
