Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MG99y-0005YX-QN
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 10:11:34 +0000
Message-ID: <4A361E6C.3000208@nokia.com>
Date: Mon, 15 Jun 2009 13:11:56 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Mika Korhonen <mika.j.korhonen@gmail.com>
Subject: Re: RFC: [PATCH] MTD OneNAND: multiblock erase support
References: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
In-Reply-To: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "kyungmin78@gmail.com" <kyungmin78@gmail.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mika Korhonen wrote:
> I wrote an initial support for OneNAND multiblock erase feature.  When
> done in maximum 64 eraseblock batches multiblock erase is up to 30x
> faster than block-by-block erase (not including erase verify, though).
> 
> However, I only had possibility to test this with an OMAP board, so I
> don't know if e.g. the default onenand_wait needs adjustment. Also for
> Flex-OneNAND the support goes off. Does Flex even have mb erase?
> 
> What do you think?

I expect all OneNAND support multiblock erase, so the config should
go away.  Kyungmin can probably comment on that.

Waiting for multiblock-erase, you should probably spin, not use the
interrupt line.  You should change the wait function in
onenand_base and omap2.c.

You should handle multiple multiblock erases.

You should check for bad blocks *before* doing command 0x95

Waiting for erase-verify, you should probably spin too.
