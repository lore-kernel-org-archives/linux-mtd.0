Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq7UK-0001FM-EW
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 20:31:33 +0000
Received: by mail-ob0-f171.google.com with SMTP id wp18so4336661obc.30
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 12:31:11 -0800 (PST)
Date: Mon, 9 Dec 2013 12:31:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2] mtd: nand: gpio: Remove unneeded CONFIG_OF
Message-ID: <20131209203105.GU27149@ld-irv-0074.broadcom.com>
References: <1386430609-2910-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386430609-2910-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 07, 2013 at 12:36:49PM -0300, Ezequiel Garcia wrote:
> Since the of_mtd header provides dummy stubs for !CONFIG_OF, it's safe
> to remove the #ifdef CONFIG_OF. Also remove the of_match_ptr guard as
> it's no longer required. Build tested only.
> 
> Cc: Alexander Shiyan <shc_work@mail.ru>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Just because we can compile with and without CONFIG_OF doesn't mean the
behavior is equivalent now.

Take a look at gpio_nand_get_io_sync_of(): we allocate and throw away
memory (it's only cleaned up at device removal time):

static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
{
	struct resource *r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
	u64 addr;

	if (!r || of_property_read_u64(pdev->dev.of_node,
				       "gpio-control-nand,io-sync-reg", &addr))
		return NULL;
...

But I guess this should be fixed anyway, to do this:

static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
{
	struct resource *r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
	u64 addr;

	if (of_property_read_u64(pdev->dev.of_node,
				 "gpio-control-nand,io-sync-reg", &addr))
		return NULL;

	r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
	if (!r)
		return NULL; /* Probably should be PTR_ERR(-ENOMEM), with callee-error-checking */
...

I think we might as well fix this before forcing this quirk onto !OF
builds.

Brian
