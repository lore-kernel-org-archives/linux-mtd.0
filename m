Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWz0-0001MS-JW
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:24:31 +0000
Subject: Re: [PATCH] mtd: pxa3xx_nand: remove unused variable 'mtd'
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Axel Lin <axel.lin@gmail.com>
In-Reply-To: <1307086473.7474.1.camel@phoenix>
References: <1307086473.7474.1.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 13:20:11 +0300
Message-ID: <1307355611.3112.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Eric Miao <eric.y.miao@gmail.com>,
	linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 15:34 +0800, Axel Lin wrote:
> Remove unused variable 'mtd' to eliminate below warning.
> 
>   CC      drivers/mtd/nand/pxa3xx_nand.o
> drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_suspend':
> drivers/mtd/nand/pxa3xx_nand.c:1167: warning: unused variable 'mtd'
> drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_resume':
> drivers/mtd/nand/pxa3xx_nand.c:1180: warning: unused variable 'mtd'
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
