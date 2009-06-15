Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MG6di-0008Qd-Di
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 07:30:05 +0000
Subject: Re: RFC: [PATCH] MTD OneNAND: multiblock erase support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mika Korhonen <mika.j.korhonen@gmail.com>
In-Reply-To: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
References: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 15 Jun 2009 10:29:47 +0300
Message-Id: <1245050987.5847.452.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-15 at 10:03 +0300, Mika Korhonen wrote:
> Hi,
> 
> I wrote an initial support for OneNAND multiblock erase feature.  When
> done in maximum 64 eraseblock batches multiblock erase is up to 30x
> faster than block-by-block erase (not including erase verify, though).
> 
> However, I only had possibility to test this with an OMAP board, so I
> don't know if e.g. the default onenand_wait needs adjustment. Also for
> Flex-OneNAND the support goes off. Does Flex even have mb erase?
> 
> What do you think?

Would it be please possible to send the patch inlined?

Also, I suggest you to CC:

Adrian Hunter <adrian.hunter@nokia.com>
Kyungmin Park <kyungmin.park@samsung.com>
Amul Saha <amul.saha@samsung.com>

because they are OneNAND-relevent.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
