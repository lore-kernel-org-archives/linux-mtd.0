Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P9EVn-0003eN-7x
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 10:06:11 +0000
From: Lei Wen <leiwen@marvell.com>
To: Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	adrian.wenl@gmail.com
Subject: [PATCH V3 0/6] pxa3xx_nand update series set
Date: Fri, 22 Oct 2010 18:14:38 +0800
Message-Id: <1287742484-4276-1-git-send-email-leiwen@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH V3 1/6] pxa3xx_nand: make scan procedure more clear
[PATCH V3 2/6] pxa3xx_nand: rework irq logic 
[PATCH V3 3/6] pxa3xx_nand: discard wait_for_event,write_cmd,__readid function
[PATCH V3 4/6] pxa3xx_nand: unify prepare command
[PATCH V3 5/6] pxa3xx_nand: mtd scan id process could be defined by driver itself
[PATCH V3 6/6] pxa3xx_nand: clean the keep configure code
