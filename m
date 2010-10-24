Subject: Re: [PATCH] mtd: add Broadcom BCM63xx image tag partition parser
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201009121553.01374.florian@openwrt.org>
References: <201009121553.01374.florian@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 00:11:49 +0100
Message-ID: <1287961909.5674.15.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-12 at 15:52 +0200, Florian Fainelli wrote:
> 
> +       ret = master->read(master, master->erasesize, sizeof(struct bcm_tag),
> +                                                       &retlen, (void *)buf);
> +       if (retlen != sizeof(struct bcm_tag)) {
> +               vfree(buf);
> +               return -EIO;
> +       }
> +
> +       sscanf(buf->kernel_address, "%u", &kerneladdr);
> +       sscanf(buf->kernel_length, "%u", &kernellen);
> +       sscanf(buf->total_length, "%u", &totallen);
> +       tagversion = &(buf->tag_version[0]);
> +       boardid = &(buf->board_id[0]);
> +
> +       printk(KERN_INFO PFX "CFE boot tag found with version %s "
> +                               "and board type %s\n", tagversion, boardid); 

Um, that looks easy to crash, given that you aren't even checking the
CRC before you do this, and you aren't checking that any of these
strings are actually NUL-terminated.

I'm applying it as-is, since I'm extremely late -- I've been slacking.
But please could I have a fix?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
