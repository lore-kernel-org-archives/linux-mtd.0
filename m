Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWsw-0001Dm-1e
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:18:14 +0000
Subject: Re: [PATCH 1/2] mtd: nuc900_nand: add missing nand_release in
	nuc900_nand_remove
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Axel Lin <axel.lin@gmail.com>
In-Reply-To: <1307065913.10001.2.camel@phoenix>
References: <1307065913.10001.2.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 13:13:47 +0300
Message-ID: <1307355227.3112.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wan ZongShun <mcuos.com@gmail.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 09:51 +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/mtd/nand/nuc900_nand.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Pushed both to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
