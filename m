Received: from smtp.ustc.edu.cn ([202.38.64.16] helo=ustc.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTuWS-00068f-1q
	for linux-mtd@lists.infradead.org; Tue, 26 Feb 2008 07:46:45 +0000
Message-ID: <404011746.16520@ustc.edu.cn>
Message-ID: <47C3C292.3040601@mail.ustc.edu.cn>
Date: Tue, 26 Feb 2008 15:41:06 +0800
From: shizheng <shizheng@mail.ustc.edu.cn>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Does jffs support sequential programming of NAND flash?
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,all:
We are building a filesystem on large-block nand flash K9K4G08U0M.

It has a program limitation that the program addressing should
be done in sequential order in a block, i.e. random page address
programming is prohibited.

We are new to jffs, so I wanna know if yaffs support such kind of
NAND device.

best wishes, shizheng
