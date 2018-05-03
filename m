Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEB4f-0006lh-Ex
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 10:03:21 +0000
Date: Thu, 3 May 2018 12:02:41 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: dwmw2@infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v2] mtd: chips: Replace printk() with pr_*()
Message-ID: <20180503120241.4b2d5010@bbrezillon>
In-Reply-To: <20180324163145.GA472@seema-Inspiron-15-3567>
References: <20180324163145.GA472@seema-Inspiron-15-3567>
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

On Sat, 24 Mar 2018 22:01:45 +0530
Arushi Singhal <arushisinghal19971997@gmail.com> wrote:

> Using pr_<loglevel>() is more concise than printk(KERN_<LOGLEVEL>).
> This patch:
> * Replace printks having a log level with the appropriate
> pr_*() macros.
> * Indent the code where possible.
> * Remove periods from messages.
> 
> Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> ---
> changes:
> Before printk() is changes to dev_*macro(), but it was not good idea
> because mtd->dev is only initialized after mtd_device_register() is called.
> 
>  drivers/mtd/chips/cfi_cmdset_0001.c | 130 +++++++++++++++++++-----------------

I see printk(KERN_ ...) in other files inside this directory. This
should be fixed too.
