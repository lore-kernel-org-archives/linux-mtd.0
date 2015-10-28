Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrTK8-0003Q0-1r
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 16:11:41 +0000
From: Marek Vasut <marex@denx.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
Date: Wed, 28 Oct 2015 17:11:14 +0100
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <20151027175446.GT13239@google.com> <20151028085813.4b0b3ac8@bbrezillon>
In-Reply-To: <20151028085813.4b0b3ac8@bbrezillon>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201510281711.14196.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, October 28, 2015 at 08:58:13 AM, Boris Brezillon wrote:
> Hi Brian,

Hi,

[...]

> > Are
> > there ever cases we want more than one (master) MTD per nand_chip? Or
> > vice versa?
> 
> Nope, I'd say that you always have a 1:1 relationship between a master
> MTD device and a NAND device.

Do some sorts of chipselects come into play here ? Ie. you can have one master
with multiple NAND chips connected to it.

Best regards,
Marek Vasut
