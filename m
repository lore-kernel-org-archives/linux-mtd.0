Received: from cool.coventive.com ([211.79.9.188])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RWea-000569-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 11:21:32 +0100
Message-ID: <3B668812.7020405@coventive.com>
Date: Tue, 31 Jul 2001 18:27:30 +0800
From: Patrick <patrick_chiu@coventive.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: I patch the MTD , but compiler do not compile any object code in /usr/src/linux/drivers/MTD/
Content-Type: text/plain; charset=Big5
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

I patch the MTD code in kernel source 2.4.0-test9 for mipsel

after I build the kernel , booting the kernel ,without any message about

MTD

when I try every kind of MTD driver.

I found the /usr/src/linux/drivers/MTD/ without any object code (*.o)

I have no idea


#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=0
CONFIG_MTD_PARTITIONS=m
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_BOOTLDR_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set
# CONFIG_MTD_CHAR is not set
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
CONFIG_MTD_JEDEC=m
