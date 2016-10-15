Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bvX8v-0000Bx-73
 for linux-mtd@lists.infradead.org; Sat, 15 Oct 2016 22:09:26 +0000
Received: by mail-vk0-x22e.google.com with SMTP id 83so119384441vkd.0
 for <linux-mtd@lists.infradead.org>; Sat, 15 Oct 2016 15:09:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3ebab16e-ddf8-0a4b-aaaf-d5b424720eb2@denx.de>
References: <20161013080857.GC3389@mwanda>
 <3ebab16e-ddf8-0a4b-aaaf-d5b424720eb2@denx.de>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Sun, 16 Oct 2016 00:09:02 +0200
Message-ID: <CAAtXAHey9fxQJ12=xt8jd4ZYTsYLs8s-TJ=YS=ob8CB03mnXpA@mail.gmail.com>
Subject: Re: [patch 2/2] mtd: spi-nor: Fix some error codes in
 cqspi_setup_flash()
To: Marek Vasut <marex@denx.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 14, 2016 at 9:16 AM, Marek Vasut <marex@denx.de> wrote:
> On 10/13/2016 10:30 AM, Dan Carpenter wrote:
>> We return success or possibly uninitialized values on these error paths
>> instead of proper error codes.
>>
>> Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>
> Nice
>
> Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>

Thanks,

Moritz
