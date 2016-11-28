Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBHBN-0000HW-KI
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 08:21:02 +0000
Subject: Re: [patch 2/2] mtd: spi-nor: Fix some error codes in
 cqspi_setup_flash()
To: Moritz Fischer <moritz.fischer@ettus.com>, Marek Vasut <marex@denx.de>
References: <20161013080857.GC3389@mwanda>
 <3ebab16e-ddf8-0a4b-aaaf-d5b424720eb2@denx.de>
 <CAAtXAHey9fxQJ12=xt8jd4ZYTsYLs8s-TJ=YS=ob8CB03mnXpA@mail.gmail.com>
CC: <kernel-janitors@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 "Brian Norris" <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Graham Moore
 <grmoore@opensource.altera.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <1368be77-903a-6fa2-e3e6-2724998c7599@atmel.com>
Date: Mon, 28 Nov 2016 09:20:38 +0100
MIME-Version: 1.0
In-Reply-To: <CAAtXAHey9fxQJ12=xt8jd4ZYTsYLs8s-TJ=YS=ob8CB03mnXpA@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 16/10/2016 à 00:09, Moritz Fischer a écrit :
> On Fri, Oct 14, 2016 at 9:16 AM, Marek Vasut <marex@denx.de> wrote:
>> On 10/13/2016 10:30 AM, Dan Carpenter wrote:
>>> We return success or possibly uninitialized values on these error paths
>>> instead of proper error codes.
>>>
>>> Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>
>> Nice
>>
>> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>
Applied to git://github.com/spi-nor/linux.git

Thanks!

> 
> Thanks,
> 
> Moritz
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
