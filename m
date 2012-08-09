Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzcY8-000769-SQ
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 23:53:58 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: Kernel crashes when CONFIG_MTD_NAND_VERIFY_WRITE=y
Date: Fri, 10 Aug 2012 01:53:50 +0200
References: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>
In-Reply-To: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201208100153.51140.marex@denx.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Subodh Nijsure <snijsure@grid-net.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Fabio Estevam,

> Hi,
> 
> When enabling CONFIG_MTD_NAND_VERIFY_WRITE=y on a mx28evk board
> running 3.6-rc1  I get the following crash:
> 
> root@freescale /$ dd if=/dev/zero of=/dev/mtd0 bs=128k count=1
> [   41.070000] Unable to handle kernel NULL pointer dereference at virtual
[...]

This problem is there because the GPMI NAND code doesn't implement verify buffer 
function and defaults to nand_verify_buf() call in nand_base.c:

 253 static int nand_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int 
len)
 254 {
 255         int i;
 256         struct nand_chip *chip = mtd->priv;
 257 
 258         for (i = 0; i < len; i++)
 259                 if (buf[i] != readb(chip->IO_ADDR_R))
 260                         return -EFAULT;
 261         return 0;
 262 }

Now the chip->IO_ADDR_R is zero, making the kernel access bogus location, and 
therefore crash. So the correct solution is to properly implement the struct 
nand_chip *'s verify_buf function.

Best regards,
Marek Vasut
