Received: from [81.6.214.140] (helo=mail.infocell-its.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DH2SP-00050b-2r
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 11:23:46 -0500
Message-ID: <424C1C58.3000905@infocell-its.com>
Date: Thu, 31 Mar 2005 16:50:48 +0100
From: Zeri Virgo <zerivirgo@infocell-its.com>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <4249C357.2040600@ieee.org>
In-Reply-To: <4249C357.2040600@ieee.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:
> As promised (albeit somewhat delayed), I have just checked into CVS some 
> changes to DOCBoot supporting NFTL-based DOC2000 devices.

Thanks for this - it's just what I need!

Unfortunately my 2.6.11.5 kernel patched with mtd/patchkernel.sh, is 
crashing with the following stack trace (I've just jotted down the 
symbols)...

EIP is at nand_do_read
...
nand_read+0x2c/0x30
find_media_headers+0x3e/0x150
nftl_scan_bbt+0x8f/0x360
nand_scan+0x466/0x940
doc2000_count_chips+0x4e/0x60
init_nanddoc+0x34b/0xad0
do_initcalls
...


The MTD section of my .config is below (I removed NFTL because I'm only 
going to be using JFFS2, ok?). Is there anything obviously wrong here?

- Zeri


CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_CONCAT=y
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not setCONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PLATRAM is not set
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_BLOCK2MTD is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
CONFIG_MTD_NAND=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_NAND_DISKONCHIP=y
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
# CONFIG_MTD_NAND_NANDSIM is not set
