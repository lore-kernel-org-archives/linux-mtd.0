Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8wPC-0002lO-4g
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 19:36:35 +0000
Received: by mail-pa0-f43.google.com with SMTP id kx10so6812413pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 11:36:11 -0800 (PST)
Date: Wed, 7 Jan 2015 11:36:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Subject: Re: [V7 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Message-ID: <20150107193607.GJ9759@ld-irv-0074>
References: <A765B125120D1346A63912DDE6D8B6315F19EB@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315F19EB@NTXXIAMBX02.xacn.micron.com>
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

On Wed, Dec 17, 2014 at 07:35:45AM +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> This patch adds code which enables Quad I/O mode on Micron SPI NOR flashes.
> 
> For Micron SPI NOR flash, enabling or disabling quad I/O protocol can be done
> By two methods, which are to use EVCR(Enhanced Volatile Configuration Register)
> and the ENTER QUAD I/O MODE command. There is no difference between these two
> methods. Unfortunately, for some Micron spi nor flashes, there no ENTER Quad I/O
> command(35h),such as n25q064.But for all current Micron spi nor, if it support
> quad I/O mode, using EVCR definitely be supported. It is a recommended method to
> enable Quad I/O mode by EVCR, Quad I/O protocol bit 7.When EVCR bit 7 is reset
> to 0,the SPI NOR flash will operate in quad I/O mode.
> 
> This patch has been tested on N25Q512A and MT25TL256BAA1ESF.Micron spi nor of
> spi_nor_ids[] table all support this method.
> 
> Signed-off-by: bean huo <beanhuo@micron.com>
> Acked-by: Marek Vasut <marex@denx.de>

Pushed to l2-mtd.git. Thanks.

Brian
