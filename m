Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtYdQ-0005bU-Rg
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 05:25:49 +0000
Received: by iyf13 with SMTP id 13so1202023iyf.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 22:25:46 -0700 (PDT)
Subject: Re: [linux-next] mtd: build error due to unknown field
	'bbt_options' specified in initializer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Date: Wed, 17 Aug 2011 08:27:27 +0300
In-Reply-To: <1312787065.13157.1.camel@phoenix>
References: <1312787065.13157.1.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313558852.2679.8.camel@sauron>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Anton Vorontsov <avorontsov@ru.mvista.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-08 at 15:04 +0800, Axel Lin wrote:
> struct platform_nand_data doest not have bbt_options field.
> Thus "make orion5x_defconfig;make" has below build error:
> 
>   CC      arch/arm/mach-orion5x/ts78xx-setup.o
> arch/arm/mach-orion5x/ts78xx-setup.c:278: error: unknown field 'bbt_options' specified in initializer
> make[1]: *** [arch/arm/mach-orion5x/ts78xx-setup.o] Error 1
> make: *** [arch/arm/mach-orion5x] Error 2

The fix is added to l2-mtd-2.6.git, thanks for reporting.

-- 
Best Regards,
Artem Bityutskiy
