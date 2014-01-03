Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz9S8-0004vi-Js
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 18:26:36 +0000
Received: by mail-ob0-f182.google.com with SMTP id wp4so15913340obc.41
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 10:26:11 -0800 (PST)
Date: Fri, 3 Jan 2014 10:26:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 0/4] mtd: nan: use dev_err() instead of printk()
Message-ID: <20140103182607.GF5631@ld-irv-0074>
References: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
Cc: 'Andrew Lunn' <andrew@lunn.ch>, 'Linus Walleij' <linus.walleij@linaro.org>,
 'Josh Wu' <josh.wu@atmel.com>, linux-mtd@lists.infradead.org,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 26, 2013 at 12:29:48PM +0900, Jingoo Han wrote:
> Use dev_err()/dev_warn() instead of printk() to provide a better
> message to userspace.
> 
> Change since v1
> - Remove the site-specific OOM messages, per Ezequiel Garcia.
> 
> Jingoo Han (4)
>     mtd: atmel_nand: use dev_err() instead of printk()
>     mtd: fsmc_nand: use dev_warn() instead of printk()
>     mtd: orion_nand: use dev_err() instead of printk()
>     mtd: sharpsl: use dev_err() instead of printk()

Pushed all 4 to l2-mtd.git. Thanks.

Brian
