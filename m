Received: from mail1.infineon.com ([192.35.17.229])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15t76o-0005Ly-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2001 13:44:42 +0100
Message-ID: <2F0C46A18294D411ABAC00508BFD6D89249969@xch.savan.com>
From: Amit.Lubovsky@infineon.com
To: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: mtd 
Date: Mon, 15 Oct 2001 14:52:40 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
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

Hi,
I did as it is said in document
mtd-jffs-HOWTO.txt, v 1.13 2001/05/01 to add MTD support in linux kernel 2.4 for my mips 5kc on my malta board.
I have 2 pcs. flash chips on the board (Intel DT28F160) which has 4 MB capacity.
So I configured xconfig with CFI support, i.e:
CONFIG_MTD
CONFIG_MTD_ROM
CONFIG_MTD_CFI
CONFIG_MTD_CFI_ADVANCED_OPTIONS
CONFIG_MTD_CFI_NOSWAP
CONFIG_MTD_CFI_GEOMETRY
CONFIG_MTD_CFI_B4
CONFIG_MTD_CFI_I4
CONFIG_MTD_CFI_INTELEXT
CONFIG_MTD_CFI_PHYSMAP
CONFIG_MTD_CFI_PHYSMAP_START=1E000000
CONFIG_MTD_CFI_LEN=390900
CONFIG_MTD_CFI_BUSWIDTH=4

since it didn't worked I have change the function ioremap() in physmap.c to ioremap_nocache() but it still doesn't work...
Any clue???

Thanks, Amit.
