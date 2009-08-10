Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaPF2-0006mr-0M
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:24:28 +0000
Subject: Re: [patch 2/8] mtd: SST25L (non JEDEC) SPI Flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200908062305.n76N5Vqo004889@imap1.linux-foundation.org>
References: <200908062305.n76N5Vqo004889@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:21:55 +0300
Message-Id: <1249888915.19638.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linus.walleij@stericsson.com, ryan@bluewatersys.com, andre@bluewatersys.com,
	linux-mtd@lists.infradead.org, hartleys@visionengravers.com,
	avorontsov@ru.mvista.com, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-06 at 16:05 -0700, akpm@linux-foundation.org wrote:
> From: Ryan Mallon <ryan@bluewatersys.com>
> 
> Add support for the non JEDEC SST25L SPI Flash devices.
> 
> Signed-off-by: Andre Renaud <andre@bluewatersys.com>
> Signed-off-by: Ryan Mallon <ryan@bluewatersys.com>
> Acked-by: Linus Walleij <linus.walleij@stericsson.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
> Cc: "H Hartley Sweeten" <hartleys@visionengravers.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This one is in my l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
