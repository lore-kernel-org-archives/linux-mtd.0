Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI904-0000oJ-CO
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:38:46 +0000
Date: Mon, 14 May 2018 10:38:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: Fix read logic for layouts with
 ->nchunks > 2
Message-ID: <20180514103819.57dda077@xps13>
In-Reply-To: <20180509071358.12157-1-boris.brezillon@bootlin.com>
References: <20180509071358.12157-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed,  9 May 2018 09:13:58 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> The code is doing monolithic reads for all chunks except the last one
> which is wrong since a monolithic read will issue the
> READ0+ADDRS+READ_START sequence. It not only takes longer because it
> forces the NAND chip to reload the page content into its internal
> cache, but by doing that we also reset the column pointer to 0, which
> means we'll always read the first chunk instead of moving to the next
> one.
>=20
> Rework the code to do a monolithic read only for the first chunk,
> then switch to naked reads for all intermediate chunks and finally
> issue a last naked read for the last chunk.
>=20
> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller driver
> Cc: stable@vger.kernel.org
> Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

I'm surprised not to have spotted this while testing the 4k
pages-8b/512B strength layout. Probably something I changed during the
review process and forgot to test again.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
