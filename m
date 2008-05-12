Received: from [59.36.102.42] (helo=21cn.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JvRSU-0005x6-Qx
	for linux-mtd@lists.infradead.org; Mon, 12 May 2008 06:24:27 +0000
Received: from aisp5-smtp?dg (dgproxy5.inner-hermes.com [10.27.2.5])
	by 21cn.com (HERMES) with ESMTP id 398093807C
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 May 2008 14:43:14 +0800 (CST)
Received: from gzb4103([218.17.227.162])
	by aisp5-smtp@dg(Knowledge-based Antispam Gateway
	2.126n(2008-04-29),59.36.102.14) with ESMTP id
	local14894.1210572687 for <linux-mtd@lists.infradead.org>;
	Mon, 12 May 2008 14:11:27 +0800
Date: Mon, 12 May 2008 14:11:27 +0800
From: "marco.qu" <szarm@21cn.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: 64bit mtd subsystem and 4K page nand flash
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Message-Id: <20080512064314.398093807C@21cn.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Is anybody can provide patches to convert the MTD subsystem to overcome the limit of
using a 32bit variable to store size/offset?

Is anybody can provide patches for 4k+128 byte per page nand flash ? 

	

2008-05-12


Best Regards,
 				
marco
