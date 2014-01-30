Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8qYX-0003eR-85
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 12:17:17 +0000
Date: Thu, 30 Jan 2014 09:17:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Message-ID: <20140130121704.GA11285@localhost>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 29, 2014 at 02:18:28PM -0800, Brian Norris wrote:
> The NAND command helpers tend to automatically shift the column address
> for x16 bus devices, since most commands expect a word address, not a
> byte address. The Read ID command, however, expects an 8-bit address
> (i.e., 0x00, 0x20, or 0x40 should not be translated to 0x00, 0x10, or
> 0x20).
> 
> This fixes the column address for a few drivers which imitate the
> nand_base defaults. Note that I don't touch sh_flctl.c, since it already
> handles this problem slightly differently (note its comment "READID is
> always performed using an 8-bit bus").
> 
> I have not tested this patch, as I only have x8 parts up for testing at
> this point. Hopefully that can change soon...
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I applied both patches and tested on my AM335x board (omap2-nand driver).
Both 8-bit and 16-bit devices get ONFI-probed and pass a nandtest round.

Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Also, checked that without these patches, the 16-bit device would be ID-probed,
but not detected as ONFI-compliant.

[..]
> +
> +/**
> + * Check if the opcode's address should be sent only on the lower 8 bits
> + * @command: opcode to check
> + */
> +static inline int nand_opcode_8bits(unsigned int command)
> +{
> +	return command == NAND_CMD_READID;
> +}
> +
>  #endif /* __LINUX_MTD_NAND_H */

With the introduction of this function, I think all the problems we've
discussed. The solution looks good to me so. Nice job!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
