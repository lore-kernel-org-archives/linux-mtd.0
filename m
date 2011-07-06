Subject: Re: [PATCH 3/4] MTD: pxa3xx_nand: enable multiple chip select support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lei Wen <leiwen@marvell.com>
Date: Wed, 06 Jul 2011 09:53:31 +0300
In-Reply-To: <1309771536-10597-4-git-send-email-leiwen@marvell.com>
References: <1309319494-17951-1-git-send-email-leiwen@marvell.com>
	<1309771536-10597-4-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309935216.3149.72.camel@sauron>
Mime-Version: 1.0
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The problem is that in this patch you change  struct pxa3xx_nand_platform_data,
and in the next patch you amend the platform data declarations, which means that
the kernel will not compile between patches 3 and 4...

On Mon, 2011-07-04 at 02:25 -0700, Lei Wen wrote:
> +               dev_info(&info->pdev->dev, "There is no nand chip on cs %d!\n"
> +                               , info->cs); 

Nitpick - keep the comma at the first line.

-- 
Best Regards,
Artem Bityutskiy
