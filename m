Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTM1f-00069G-B6
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 07:18:49 +0000
Date: Sun, 2 Dec 2018 08:18:32 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: robert.jarzmik@free.fr, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 miquel.raynal@bootlin.com, keescook@chromium.org,
 shreeya.patel23498@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: remove DEBUGFS_RO_ATTR()
Message-ID: <20181202081832.08de39b2@bbrezillon>
In-Reply-To: <20181202015417.9100-1-tiny.windzz@gmail.com>
References: <20181202015417.9100-1-tiny.windzz@gmail.com>
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

On Sat,  1 Dec 2018 20:54:17 -0500
Yangtao Li <tiny.windzz@gmail.com> wrote:

> We already have the DEFINE_SHOW_ATTRIBUTE.There is no need to define
> such a macro,so remove DEBUGFS_RO_ATTR.Also use DEFINE_SHOW_ATTRIBUTE
> to simplify some code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
> Changes in v2:
> -Remove a missing DEBUGFS_RO_ATTR
> ---
>  drivers/mtd/devices/docg3.c    | 20 ++++++++++++--------
>  drivers/mtd/devices/docg3.h    | 11 -----------
>  drivers/mtd/mtdswap.c          | 12 +-----------
>  drivers/mtd/nand/raw/nandsim.c | 16 +++-------------
>  4 files changed, 16 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 512bd4c2eec0..80143972963e 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1603,7 +1603,7 @@ static void doc_unregister_sysfs(struct platform_device *pdev,
>  /*
>   * Debug sysfs entries
>   */
> -static int dbg_flashctrl_show(struct seq_file *s, void *p)
> +static int flashcontrol_show(struct seq_file *s, void *p)
>  {
>  	struct docg3 *docg3 = (struct docg3 *)s->private;
>  
> @@ -1623,9 +1623,10 @@ static int dbg_flashctrl_show(struct seq_file *s, void *p)
>  
>  	return 0;
>  }
> -DEBUGFS_RO_ATTR(flashcontrol, dbg_flashctrl_show);
>  
> -static int dbg_asicmode_show(struct seq_file *s, void *p)
> +DEFINE_SHOW_ATTRIBUTE(flashcontrol);

Just nitpicking, but can you remove the blank line between the function
definition and DEFINE_SHOW_ATTRIBUTE()?
