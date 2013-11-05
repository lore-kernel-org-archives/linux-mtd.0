Date: Tue, 5 Nov 2013 11:08:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 22/28] mtd: nand: pxa3xx: Introduce multiple page
 I/O support
Message-ID: <20131105190808.GR20061@ld-irv-0074.broadcom.com>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383656135-8627-23-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383656135-8627-23-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One more thing on this patch:

On Tue, Nov 05, 2013 at 09:55:29AM -0300, Ezequiel Garcia wrote:
> @@ -437,7 +487,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>  
>  static void handle_data_pio(struct pxa3xx_nand_info *info)
>  {
> -	unsigned int do_bytes = min(info->data_size, info->fifo_size);
> +	unsigned int do_bytes = min(info->data_size, info->chunk_size);

After this change, you no longer are using fifo_size globally (you only
use it locally in pxa3xx_nand_detect_config() to set the chunk_size).
Perhaps you can drop the field?

>  
>  	switch (info->state) {
>  	case STATE_PIO_WRITING:

Brian
