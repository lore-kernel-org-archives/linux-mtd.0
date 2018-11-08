Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKg8C-0007Zs-2b
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 08:57:41 +0000
Date: Thu, 8 Nov 2018 09:57:28 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: sh_flctl: convert to SPDX identifiers
Message-ID: <20181108095728.6c19b8f0@bbrezillon>
In-Reply-To: <87muqkytbv.wl-kuninori.morimoto.gx@renesas.com>
References: <87muqkytbv.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Nov 2018 06:39:20 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
> 
> As original license mentioned, it is GPL-2.0 in SPDX.
> Then, MODULE_LICENSE() should be "GPL v2" instead of "GPL".
> See ${LINUX}/include/linux/module.h
> 
> 	"GPL"		[GNU Public License v2 or later]
> 	"GPL v2"	[GNU Public License v2]

I had a similar case recently and I based my SPDX tag on the
MODULE_LICENSE() value instead of the license header.
Is this "license header" > MODULE_LICENSE() rule documented
somewhere?
