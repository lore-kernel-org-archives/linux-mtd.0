Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9Loc-0008HK-9I
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2004 06:54:39 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: aman@mistralsoftware.com
In-Reply-To: <KBEHLCHPJHMPJFKMLMOPKEIJCJAA.aman@mistralsoftware.com>
References: <KBEHLCHPJHMPJFKMLMOPKEIJCJAA.aman@mistralsoftware.com>
Content-Type: text/plain
Message-Id: <1095677227.15940.0.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Mon, 20 Sep 2004 12:47:08 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: K9F2g08u0m Samsung Nand Support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-09-20 at 12:17, Amanullah Khan wrote:
> Hi All
> 
> In the K9F2g08u0m Samsung NAND, there is a restriction for programming page
> in a Block. The restriction is,
> "Within a block, the pages must be programmed consecutively from the LSB
> (least significant bit) page of the block to MSB (most significant bit)
> pages of the block. Random page address programming is prohibited".
> 
> I would like to know whether in JFFS2 these restrictions are taken care.

Yes

tglx
