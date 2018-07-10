Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcnjr-0007h2-20
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 08:11:15 +0000
Date: Tue, 10 Jul 2018 10:10:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/2] mtd: rawnand: micron: Fix on-die ECC
Message-ID: <20180710101049.57a7cd21@bbrezillon>
In-Reply-To: <20180709210937.30150-1-boris.brezillon@bootlin.com>
References: <20180709210937.30150-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  9 Jul 2018 23:09:35 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Chris, Bean,
> 
> Here are 2 patches for you to review/test. The first one is fixing
> the layout definition, and unless I missed something it should be
> correct.
> 
> The second one is just my understanding of how byte 5 of READ_ID works
> based on our experience with the 4bit/512 on-die ECC chip we have
> worked on and the other datasheet I had a look at.
> I'm not 100% sure this will work for all chips, but might work for the
> 2 chips we support right now.

I tested it on a MT29F2G08ABAEAH4 (4bit/512bytes on-die ECC) and it
works as expected. When I do the SET_FEATURES(ECC_EN) the ECC enabled
bit in READID byte 5 is set, and when I do SET_FEATURES(ECC_DIS), the
bit is cleared.

Now we need to make sure it works correctly on MT29F1G08ABAFAWP.

> So please test and/or review it and let me know if this approach works.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (2):
>   mtd: rawnand: micron: Define the proper layout for 8bit/512bytes
>     on-die ECC
>   mtd: rawnand: micron: Fix on-die ECC detection logic
> 
>  drivers/mtd/nand/raw/nand_micron.c | 110 +++++++++++++++++++++++++------------
>  1 file changed, 75 insertions(+), 35 deletions(-)
> 
