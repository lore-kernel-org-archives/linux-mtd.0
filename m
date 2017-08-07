Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deYt6-0001gN-J4
 for linux-mtd@lists.infradead.org; Mon, 07 Aug 2017 03:39:30 +0000
Subject: Re: [PATCH] mtd: nand: atmel: fix of_irq_get() error check
To: Wenyou Yang <wenyou.yang@atmel.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
References: <20170805211436.181653483@cogentembedded.com>
From: "Yang, Wenyou" <Wenyou.Yang@Microchip.com>
Message-ID: <244d6398-6fa9-17c2-43a4-7309fd080318@Microchip.com>
Date: Mon, 7 Aug 2017 11:38:55 +0800
MIME-Version: 1.0
In-Reply-To: <20170805211436.181653483@cogentembedded.com>
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

tested


On 2017/8/6 5:14, Sergei Shtylyov wrote:
