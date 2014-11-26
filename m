Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtTu3-000131-IN
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 04:08:32 +0000
Received: by mail-pd0-f173.google.com with SMTP id ft15so1957382pdb.4
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 20:08:09 -0800 (PST)
Date: Tue, 25 Nov 2014 20:06:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: bpqw <bpqw@micron.com>
Subject: Re: [V5 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Message-ID: <20141126040642.GA21347@ld-irv-0074>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 06, 2014 at 03:09:06AM +0000, bpqw wrote:
> This patch adds code which enables Quad I/O mode on Micron SPI NOR flashes.
> 
> For Micron SPI NOR flash,enabling or disabling quad I/O protocol is controlled
> by EVCR (Enhanced Volatile Configuration Register), Quad I/O protocol bit 7.
> When EVCR bit 7 is reset to 0,the SPI NOR flash will operate in quad I/O mode.
> 
> Signed-off-by: bean huo <beanhuo@micron.com>
> Acked-by: Marek Vasut <marex@denx.de>
> ---
>  v1-v2:
> 	Modified to that capture wait_till_ready()
> 	return value,if error,directly return its
> 	the value.
>  v2-v3:
> 	Directly use the reurning error value of
> 	read_reg and write_reg,instead of -EINVAL.
>  v3-v4:
> 	Modify commit logs that wraped into 80 columns 
>  v4-v5:
> 	Rebuild new patch based on latest linux-mtd

You probably aren't based on l2-mtd.git. Your patch still doesn't build.
I can fix it up if it's easy, but FYI. Still reviewing...

drivers/mtd/spi-nor/spi-nor.c: In function ‘micron_quad_enable’:
drivers/mtd/spi-nor/spi-nor.c:874:2: warning: passing argument 3 of ‘nor->read_reg’ from incompatible pointer type [enabled by default]
  ret = nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
  ^
drivers/mtd/spi-nor/spi-nor.c:874:2: note: expected ‘u8 *’ but argument is of type ‘int *’
drivers/mtd/spi-nor/spi-nor.c:891:2: error: implicit declaration of function ‘wait_till_ready’ [-Werror=implicit-function-declaration]
  ret = wait_till_ready(nor);
  ^
drivers/mtd/spi-nor/spi-nor.c:896:2: warning: passing argument 3 of ‘nor->read_reg’ from incompatible pointer type [enabled by default]
  ret = nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
  ^
drivers/mtd/spi-nor/spi-nor.c:896:2: note: expected ‘u8 *’ but argument is of type ‘int *’

Brian
