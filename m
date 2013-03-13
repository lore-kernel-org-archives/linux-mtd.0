Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjJt-0003MP-DV
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 10:54:05 +0000
Message-ID: <1363172096.11441.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V4 1/3] mtd: add new fields to nand_flash_dev{}
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 13 Mar 2013 12:54:56 +0200
In-Reply-To: <1362653364-29993-2-git-send-email-b32955@freescale.com>
References: <1362653364-29993-1-git-send-email-b32955@freescale.com>
 <1362653364-29993-2-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-03-07 at 18:49 +0800, Huang Shijie wrote:
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 591eeeb..f0a9d93 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -578,6 +578,8 @@ struct nand_chip {
>   * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
>   * @chipsize: total chip size in MiB
>   * @options: stores various chip bit options
> + * @id_len: The valid length of the @id.
> + * @oobsize: OOB size
>   */
>  struct nand_flash_dev {
>  	char *name;
> @@ -592,6 +594,8 @@ struct nand_flash_dev {
>  	unsigned long chipsize;
>  	unsigned long erasesize;
>  	unsigned long options;
> +	unsigned long id_len;
> +	unsigned long oobsize;
>  };

Why are these of type 'long', which is 64 bits in 64-bit architectures,
which seems to be unnecessarily big. Wouldn't 'unsigned int' be enough?

Also, can we avoid having the 'id_len' field? Can the end of the
sequence of ID's be marked with a '0' or '0xFF' marker instead?

-- 
Best Regards,
Artem Bityutskiy
