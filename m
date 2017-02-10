Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc1kq-0000di-PP
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 03:20:15 +0000
Received: by mail-pf0-x243.google.com with SMTP id o64so534263pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 19:19:51 -0800 (PST)
Date: Thu, 9 Feb 2017 19:19:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd: Add partition device node to mtd partition devices
Message-ID: <20170210031948.GA67059@google.com>
References: <20170209105024.1579-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170209105024.1579-1-u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 09, 2017 at 11:50:24AM +0100, Uwe Kleine-König wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The user visible change here is that mtd partitions get an of_node link
> in sysfs.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Appled to l2-mtd.git
