Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMf74-0002mH-HA
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 16:30:52 +0000
In-Reply-To: <55C0DD73.4050009@dave-tech.it>
References: <mailman.4514.1438332781.1758.linux-mtd@lists.infradead.org>
 <mailman.4514.1438332781.1758.linux-mtd.{9f6e5a96-15b4-4e33-a5c0-29fab6f7a2dc}.0@lists.infradead.org>
 <20150731091037.09c7ee57@bbrezillon> <55C0DD73.4050009@dave-tech.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: [RFC PATCH 1/2] mtd: nand: add nand_check_erased helper functions
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Tue, 04 Aug 2015 18:27:52 +0200
To: Andrea Scian <rnd4@dave-tech.it>,linux-mtd@lists.infradead.org
CC: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Message-ID: <96F19FF3-4FC0-4CC0-91E3-4497F7B912A2@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hi Andrea

Le 4 août 2015 17:42:43 GMT+02:00, Andrea Scian <rnd4@dave-tech.it> a écrit :
>
>>> +
>>> +		bitflips += sizeof(long) - weight;
>
>as above:
>
>bitflips += sizeof(long)*BITS_PER_BYTE - weight;


Indeed, or we could just replace sizeof(u8) by BITS_PER_BYTE and sizeof(long) by BITS_PER_LONG.

I'll fix that in the next version.

Note that I didn't test the series on a real platform and won't be able to do so for the next two weeks, so you might find other inconsistencies/bugs.

Thanks for testing it.

Best regards,

Boris
