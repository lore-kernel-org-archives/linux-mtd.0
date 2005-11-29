Received: from [202.108.3.160] (helo=vip3-160.sinamail.sina.com.cn)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh1BT-0001DN-7D
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 03:50:07 -0500
Message-ID: <20051129084313.19723.qmail@vip3-160.sinamail.sina.com.cn>
Date: Tue, 29 Nov 2005 16:43:13 +0800
MIME-Version: 1.0
From: superlidu@vip.sina.com
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
Subject: question:EXT2 on a normal NAND flash(not a diskonchip flash)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi, Now I am going to use ext2 on a normal nand flash, according to the MTD guild,there should be four layer: ext2-->NFTL-->MTD-->NAND FLASH. now I have a question, the xconfig help said NFTL is used on the diskonchip flash, can I use it on the normal nand flash(like samsung\'s)? if it can do, what should I do in my nand flash driver?

    Thanks for your help!

Sword
