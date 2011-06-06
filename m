Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWyd-0001JR-Vn
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:24:08 +0000
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: fix a memory leak
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Axel Lin <axel.lin@gmail.com>
In-Reply-To: <1307078050.4167.1.camel@phoenix>
References: <1307078050.4167.1.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 13:19:42 +0300
Message-ID: <1307355582.3112.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Haojian Zhuang <haojian.zhuang@marvell.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 13:14 +0800, Axel Lin wrote:
> In pxa3xx_nand_remove, we should call nand_release instead of
> mtd_device_unregister to properly free bad block table memory
> and bad block descriptor memory.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
