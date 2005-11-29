Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh1JT-0001pV-4t
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 03:58:33 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: superlidu@vip.sina.com
In-Reply-To: <20051129084313.19723.qmail@vip3-160.sinamail.sina.com.cn>
References: <20051129084313.19723.qmail@vip3-160.sinamail.sina.com.cn>
Content-Type: text/plain
Date: Tue, 29 Nov 2005 10:03:30 +0100
Message-Id: <1133255010.32542.367.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: question:EXT2 on a normal NAND flash(not a diskonchip flash)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-11-29 at 16:43 +0800, superlidu@vip.sina.com wrote:
> Hi, Now I am going to use ext2 on a normal nand flash, according to
> the MTD guild,there should be four layer: ext2-->NFTL-->MTD-->NAND
> FLASH. now I have a question, the xconfig help said NFTL is used on
> the diskonchip flash, can I use it on the normal nand flash(like
> samsung\'s)? if it can do, what should I do in my nand flash driver?

NFTL works only on DiskOnChip devices. 

Use a NAND aware filesystem.

	tglx
