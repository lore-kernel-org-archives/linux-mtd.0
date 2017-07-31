Received: from mail.thorsis.com ([213.211.200.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dc3y7-0002kR-22
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 06:14:21 +0000
From: Alexander Dahl <ada@thorsis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexander Dahl <post@lespocky.de>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Date: Mon, 31 Jul 2017 08:13:19 +0200
Message-ID: <16874505.VNammbPfxu@ada>
In-Reply-To: <20170727212703.724d41fd@bbrezillon>
References: <5326598.QgYTQxcFMR@ada>
 <20170726204054.oejtb73jsxxlmovm@falbala.home.lespocky.de>
 <20170727212703.724d41fd@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hei hei,

Am Donnerstag, 27. Juli 2017, 21:27:03 schrieb Boris Brezillon:
> Did you have time to test with f9ce2eddf176 ("mtd: nand: atmel: Add
> ->setup_data_interface() hooks") reverted? BTW, it's probably simpler
> to just comment out this line [1]

This does not revert cleanly.

> [1]http://elixir.free-electrons.com/linux/v4.13-rc2/source/drivers/mtd
> /nand/atmel/nand-controller.c#L1493

I tried this in atmel_nand_init():

+       /*
        if (nc->mck && nc->caps->ops->setup_data_interface)
                chip->setup_data_interface = atmel_nand_setup_data_interface;
+       */

So this basically skips all those timing init, right? If I do this I get 
the timings which were applied in U-Boot and the NAND-Flash just works.

Greets
Alex
