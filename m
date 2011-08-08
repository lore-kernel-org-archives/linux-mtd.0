Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqJt8-0001Ma-Mo
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 07:04:39 +0000
Received: by ywp17 with SMTP id 17so440798ywp.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Aug 2011 00:04:35 -0700 (PDT)
Subject: [linux-next] mtd: build error due to unknown field 'bbt_options'
	specified in initializer
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Aug 2011 15:04:25 +0800
Message-ID: <1312787065.13157.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Anton Vorontsov <avorontsov@ru.mvista.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct platform_nand_data doest not have bbt_options field.
Thus "make orion5x_defconfig;make" has below build error:

  CC      arch/arm/mach-orion5x/ts78xx-setup.o
arch/arm/mach-orion5x/ts78xx-setup.c:278: error: unknown field 'bbt_options' specified in initializer
make[1]: *** [arch/arm/mach-orion5x/ts78xx-setup.o] Error 1
make: *** [arch/arm/mach-orion5x] Error 2

Regards,
Axel
