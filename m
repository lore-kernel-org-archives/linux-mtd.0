Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZfmH-0004XQ-00
	for mtd-list@infradead.org; Sun, 04 Mar 2001 21:10:53 +0000
Received: from shell9.ba.best.com ([206.184.139.140] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ZfmF-0004XK-00
	for mtd@infradead.org; Sun, 04 Mar 2001 21:10:51 +0000
Received: (from subodh@localhost)
	by shell9.ba.best.com (8.9.3/8.9.2/best.sh) id NAA07230
	for mtd@infradead.org; Sun, 4 Mar 2001 13:09:51 -0800 (PST)
From: Subodh Nijsure <subodh@best.com>
Message-Id: <200103042109.NAA07230@shell9.ba.best.com>
Subject: What should value of CONFIG_MTD_CFIB* be?
To: mtd@infradead.org
Date: Sun, 4 Mar 2001 13:09:51 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


[I am very much a novice when it comes flash..] 

In the latest MTD code ( from infradead CVS ) there are few #defines 
are introduced CONFIG_MTD_CFI_B1, B2,B3 and CONFIG_MTD_CFI_I1. 


What should my values be for above variables 
if my hardware is two Intel 28F160S3
(sector size 64K) flash devices, configured to operate in 
16-bit mode giving me 4Mb, 32-bit wide memory? 


This is how my MTD config looks like and cfi_probe is not able to  
detect these intel chips.

#
# Linearly Mapped Flash Device Drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_CFI_GEOMETRY is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=28000000
CONFIG_MTD_PHYSMAP_LEN=400000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_PNC2000 is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_SBC_MEDIAGX is not set
# CONFIG_MTD_ELAN_104NC is not set
# CONFIG_MTD_SA1100 is not set
# CONFIG_MTD_DC21285 is not set
CONFIG_MTD_CSTM_CFI_JEDEC=y
CONFIG_MTD_JEDEC=y
# CONFIG_MTD_MIXMEM is not set
# CONFIG_MTD_OCTAGON is not set
# CONFIG_MTD_VMAX is not set 


/Subodh

p.s.
In my bootrom I have command called flashcfi where I have 
code, I am able to read Q R Y when I send READ QUERY command 00980098 

Retrieve cfi info assuming flash base is BASE0=0X28000000
In function flash_retrieve_cfi_info
Clear any status register info Writing @0x28000000 value 00500050
Put flash into READ ID mode Writing @0x28000000 value 00900090
Put flash into READ QUERY mode Writing @0x28000000 value 00980098
Reading at 28000040 value 'Q'
Reading at 28000044 value 'R'
Reading at 28000048 value 'Y'
Flash CFI Info found!!
manufacturer_code (flash_info.manufacturer_code) = 0xb0 (0xb0)
device_code  flash_info.device_code = 0xd0 (0xd0)
cfi_ident =  flash_info.cfi_ident QRY
is_cfi_supported =  flash_info.is_cfi_supported 1
primary_vendor_command_code flash_info.primary_vendor_command_code = 0x01
primary_extended_query_table flash_info.primary_extended_query_table = 0x31
alternate_vendor_command_code = flash_info.alternate_vendor_command_code 0x00
alternate_extended_query_table = flash_info.alternate_extended_query_table 0x00
flash_info.device_size is flash_info.device_size 0x15
device_size = 0x15 (2097152 bytes, 2 MB, 16 Mb)
x8_async_ifc flash_info.x8_async_ifc = 0x2
x16_async_ifc flash_info.x16_async_ifc = 0x0
max_write_buffer_size flash_info.max_write_buffer_size = 5 (32 bytes)
num_erase_block_regions flash_info.num_erase_block_regions = 1
num_erase_blocks_r1 flash_info.num_erase_blocks_r1 = 0x1f (31 blocks)
size_erase_blocks_r1 flash_info.size_erase_blocks_r1 = 0x100 (65536 bytes)
flash_info.vcc_min_program_erase 48
flash_info.vcc_max_program_erase 85
flash_info.vpp_min_program_erase 48
flash_info.vpp_min_program_erase 85
vcc_min_program_erase flash_info.vcc_min_program_erase 3.0 V
vcc_max_program_erase = 5.5 V
vpp_min_program_erase = 3.0 V
vpp_max_program_erase = 5.5 V
flash_info.typ_single_word_timeout = 3
flash_info.typ_max_buffer_write_timeout = 6
flash_info.typ_block_erase_timeout = 10
flash_info.typ_full_chip_erase_timeout = 15
typ_single_word_timeout = 3 (8 usec)
typ_max_buffer_write_timeout = 6 (64 usec)     
typ_block_erase_timeout = 10 (1024 msec)
typ_full_chip_erase_timeout = 15 (32768 msec)
flash_info.max_word_program_timeout = 4
flash_info.max_buffer_write_timeout = 4
flash_info.max_block_erase_timeout = 4
flash_info.max_chip_erase_timeout = 4
max_word_program_timeout = 4 (128 usec)
max_buffer_write_timeout = 4 (1024 usec)
max_block_erase_timeout = 4 (16384 msec)
max_chip_erase_timeout = 4 (524288 msec)
                                                                                


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
