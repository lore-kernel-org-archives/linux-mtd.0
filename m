Received: from mail-by2on0065.outbound.protection.outlook.com ([207.46.100.65]
 helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy1cd-0005tU-Bz
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 16:57:20 +0000
Message-ID: <5485D7B5.2@opensource.altera.com>
Date: Mon, 8 Dec 2014 10:54:13 -0600
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
References: <1417808133-20719-1-git-send-email-grmoore@opensource.altera.com>
 <1417808133-20719-3-git-send-email-grmoore@opensource.altera.com>
 <CACna6ry0WBwcqH74sub-C=e0oGsPEoqXZ4O7uAwGcJC9Zc2zJw@mail.gmail.com>
In-Reply-To: <CACna6ry0WBwcqH74sub-C=e0oGsPEoqXZ4O7uAwGcJC9Zc2zJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/05/2014 04:30 PM, Rafał Miłecki wrote:
> Since my commit
> mtd: spi-nor: allow NULL as chip name and try to auto detect it
> second argument is optional.
>
> Can you simply pass NULL instead of modalias?
>

OK, passing NULL.  Works fine for me, thanks.

-Graham
