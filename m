Date: Thu, 7 Nov 2013 10:43:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix bug driver will in a dead lock if
 no nand detected
Message-ID: <20131107184306.GX20061@ld-irv-0074.broadcom.com>
References: <1383645547-21813-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383645547-21813-1-git-send-email-josh.wu@atmel.com>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 05, 2013 at 05:59:07PM +0800, Josh Wu wrote:
> In the atmel driver probe function, the code shows like following:
>   atmel_nand_probe(...) {
>         ...
> 
>   err_nand_ioremap:
>         platform_driver_unregister(&atmel_nand_nfc_driver);
>         return res;
>   }
> 
> If no nand flash detected, the driver probe function will goto
> err_nand_ioremap label.
> Then platform_driver_unregister() will be called. It will get the
> lock of atmel_nand device since it is parent of nfc_device. The
> problem is the lock is already hold by atmel_nand_probe itself.
> So system will be in a dead lock.
> 
> This patch just simply removed to platform_driver_unregister() call.
> When atmel_nand driver is quit the platform_driver_unregister() will
> be called in atmel_nand_remove().
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git, with a little extra note and a
Cc: <stable@vger.kernel.org>

Thanks,
Brian
