Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1520QF-0008SP-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2001 01:53:16 +0100
Message-ID: <F1BD619B2A58D41197990050DA2C08E40258E3@SLINK12>
From: Jan Rovins <Jan.Rovins@radisys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, Steve Ferri <steve.ferri@radisys.com>
Subject: RE: MTD on a Motorola MPCN765 ? (32 bit linux and 64 bit flash)
Date: Mon, 21 May 2001 20:57:04 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi David & list,

I have made some progress getting CFI probe to recognize my chips,
by providing the CFIDEV_BUSWIDTH_8 code paths, as I was advised last month.
(yes, it only took me about a month 
to get my 2.2.17 kernel working with the new directory structure :-)
But the recommendations I was given assume I am running Linux in 64 bit
mode, 
which I am not. My longs are still 32 bit,
 and I can now read the flash through MTD, but can't yet form commands to
write
and erase the upper two 16 bit flash devices.
(To access those upper two devices I would have to add 0x04 to the
unlock1,&2 addresses)
When using interleaved chips, are the commands always given to the whole
bank simultaneously?
Could I fake a 64 bit write by doing two 32 bit writes?
Basically I will be reading & writing flash as a 32 bit machine would,
but faking up 64 bit commands.  Would this work?

An other Semi-related question:
when the probe runs, I get This line:
MCPN765 flash device: Found 4 x16 devices at 0x0 in 64-bit mode

but later on I get:
number of CFI chips: 1

Shouldn't the Number of chips listed be == to the interleave?
There is a loop in cfi_probe.c (around line 583) where cfi_probe_chip_1() 
gets called multiple times, and the chip count gets bumped,
my configuration does not enter the loop even once, the test fails the first
time.
what is going wrong here?

(At End of Mail is output from Linux boot)

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, April 17, 2001 10:45 AM
To: Jan Rovins
Cc: mtd@infradead.org; Steve Ferri
Subject: Re: MTD on a Motorola MPCN765 ? 



jrovins@ss7-link.com said:
> I tried some guesses at AMD CFI configuration, but it looks like our
> board has exotic flash chips & geometry that are not currently
> supported in MTD. (Time to roll up my sleeves & start hacking code)

> The MPCN765 has a 16MB bank of flash that is 64 bits wide (Ugh!) and
> is comprised of four 16 bit devices.

Hmmm. This isn't currently supported, but it should be on 64-bit platforms.

In a few places, we currently assume that __u32 is big enough to hold the 
largest word for accessing flash - when building commands, etc. 

If we change that to 'unsigned long' and put all the 64-bit stuff inside 
"#ifdef BITS_PER_LONG >= 64" we should be OK. 


jrovins@ss7-link.com said:
> Right now I am looking for some general guidance as to which direction
> to proceed. my gut feel is to do a board specific Mapping
> implementation, because of the strange geometry. The other alternative
> would be to expand the generic AMD/CFI stuff so that it could
> accommodate our board's flash geometry.

You need both - you'll need to provide a board-specific mapping driver, and 
you also need to extend the generic code a little so it can cope with 
64-bit busses.

Roughly:
 1. Provide cfi64_to_cpu and cpu_to_cfi64 in include/linux/mtd/cfi_endian.h
 2. Add the necessary 64-bit parts to the inline routines in cfi.h - 
	cfi_write(), cfi_read(), cfi_read_query(), cfi_build_cmd(), etc.,
	and make them use 'unsigned long' instead of __u32 for holding
	a bus word. 
	Also add the CFIDEV_BUSWIDTH_8 definitions. You can leave out 
	CFIDEV_INTERLEAVE_8 for now unless you're feeling virtuous.
 3. Fix up the CFI command set drivers to use unsigned long too, and add the
	64-bit cases where appropriate. 

Remember to surround all 64-bit stuff with #ifdef CFIDEV_BUSWIDTH_8 (which 
in turn is dependent on BITS_PER_LONG >= 64). 

--
dwmw2

Linux Boot Output -----------

MCPN765 flash device: 1000000 at f4000000
start CFI Probe
>>>Top of cfi_probe(), calling  cfi_cfi_probe(map).
>>> Top of cfi_cfi_probe() calling cfi_probe_new_chip
top of cfi_probe_new_chip()cfi_probe_new_chip() CASE Bus Width 8
>>>cfi_probe_new_chip() interleave 4 dev_type X16
>>>Top of cfi_probe_chip() chips:0x0
cfi_probe_chip() set for CFI_DEVICETYPE_X16 
>>>cfi_probe_chip() First call to Probe_chip_1() with u1:0xaaa u2:0x554
>>> Top of cfi_probe_chip_1() chips:)0x0
cfi_build_cmd: cmd: 0xf0 val: 0xf000f0
cfi_send_gen_cmd: base:0x0 c_adr:0x0 f_addr:0x0 cmd:0xf0 val:0xf000f0
cfi_build_cmd: cmd: 0x98 val: 0x980098
cfi_send_gen_cmd: base:0x0 c_adr:0x55 f_addr:0x2a8 cmd:0x98 val:0x980098
cfi_check_qry_or_id: base=0x00000000 interl=4 type=2 index=-1
osf: 0x8 (8) Read: 0x80
cfi_build_cmd: cmd: 0x51 val: 0x510051
look for Q: 0x510051 
cfi_build_cmd: cmd: 0x51 val: 0x510051
cfi_build_cmd: cmd: 0x52 val: 0x520052
cfi_build_cmd: cmd: 0x59 val: 0x590059
cfi_probe_chip_1(): cfi_check_qry_or_id SUCCESS
cfi_probe_chip_1: NO Chips!?
MCPN765 flash device: Found 4 x16 devices at 0x0 in 64-bit mode
cfi_cfi_probe() ofs_factor: 8
Number of erase regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks
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
Device size: 0x400000 bytes (4 Mb)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
cfi_build_cmd: cmd: 0xff val: 0xff00ff
cfi_send_gen_cmd: base:0x0 c_adr:0x55 f_addr:0x2a8 cmd:0xff val:0xff00ff
***cfi.cfiq->DevSize is 22
***cfi.chipshift adjusted to 24
>>>cfi_cfi_probe() before Loop,  base:0x1000000 test:0x1000000 incr:
0x1000000; 
>>>cfi_cfi_probe() CHIPSHIFT is: 0x18; 
 End of cfi_cfi_probe() 
>>>in cfi_probe(), after  cfi_cfi_probe(map)calling: check_cmd_set(map, 1,
cfi->chips[0].start);.
cfi_build_cmd: cmd: 0x98 val: 0x980098
cfi_send_gen_cmd: base:0x0 c_adr:0x55 f_addr:0x2a8 cmd:0x98 val:0x980098
cfi_build_cmd: cmd: 0x98 val: 0x980098
cfi_send_gen_cmd: base:0x0 c_adr:0x55 f_addr:0x2a8 cmd:0x98 val:0x980098
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
cfi_build_cmd: cmd: 0xf0 val: 0xf000f0
cfi_send_gen_cmd: base:0x0 c_adr:0x55 f_addr:0x2a8 cmd:0xf0 val:0xf000f0
cfi_build_cmd: cmd: 0xaa val: 0xaa00aa
cfi_send_gen_cmd: base:0x0 c_adr:0x555 f_addr:0x2aa8 cmd:0xaa val:0xaa00aa
cfi_build_cmd: cmd: 0x55 val: 0x550055
cfi_send_gen_cmd: base:0x0 c_adr:0x2aa f_addr:0x1550 cmd:0x55 val:0x550055
cfi_build_cmd: cmd: 0x90 val: 0x900090
cfi_send_gen_cmd: base:0x0 c_adr:0x555 f_addr:0x2aa8 cmd:0x90 val:0x900090
cfi_build_cmd: cmd: 0x98 val: 0x980098
cfi_send_gen_cmd: base:0x0 c_adr:0x55 f_addr:0x2a8 cmd:0x98 val:0x980098
MCPN765 flash device: Swapping erase regions for broken CFI table.
cfi_build_cmd: cmd: 0xf0 val: 0xf000f0
cfi_send_gen_cmd: base:0x0 c_adr:0x55 f_addr:0x2a8 cmd:0xf0 val:0xf000f0
>>>in cfi_probe(), in if, calling map->fldrv->probe(map)
*****number of CFI chips: 1
0: offset=0x0,size=0x40000,blocks=63
1: offset=0xfc0000,size=0x8000,blocks=8
Done CFI Probe
AT MTD add_partitions
mtd: Giving out device 0 to Kernel image & initrd
mtd: Giving out device 1 to Persistant storage
DONE MTD add_partitions
FlagaDM flash device initialized
Serial driver version 4.27 with no serial options enabled
