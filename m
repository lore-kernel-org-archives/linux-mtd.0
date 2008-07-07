Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KFhNi-0008R9-B3
	for linux-mtd@lists.infradead.org; Mon, 07 Jul 2008 03:27:15 +0000
Message-ID: <415400846.17365@cqu.edu.cn>
Subject: problem of UBI debug info printing
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2008 11:25:58 +0800
Message-Id: <1215401158.3218.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

No debug message about UBI's WL unit can be found in
/var/log/dmesg file in my 2.6.26-rc5-01191-g23baa5b-dirty kernel. 
I don't why? I need you help. thanks in advance. 

My CONFIG_* is as following:

......

#
# UBI - Unsorted block images
#
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_RESERVE=1
CONFIG_MTD_UBI_GLUEBI=y

#
# UBI debugging options
#
CONFIG_MTD_UBI_DEBUG=y
CONFIG_MTD_UBI_DEBUG_MSG=y
CONFIG_MTD_UBI_DEBUG_PARANOID=y
# CONFIG_MTD_UBI_DEBUG_DISABLE_BGT is not set
# CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set

#
# Additional UBI debugging messages
#
CONFIG_MTD_UBI_DEBUG_MSG_BLD=y
CONFIG_MTD_UBI_DEBUG_MSG_EBA=y
CONFIG_MTD_UBI_DEBUG_MSG_WL=y
CONFIG_MTD_UBI_DEBUG_MSG_IO=y
# CONFIG_PARPORT is not set
CONFIG_PNP=y
# CONFIG_PNP_DEBUG is not set

-- 
yours Sincerely,

xiaochuan-xu (许小川)
