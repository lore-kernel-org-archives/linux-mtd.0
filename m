Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOPKc-0000qz-7L
 for linux-mtd@lists.infradead.org; Thu, 31 May 2018 15:17:40 +0000
Date: Thu, 31 May 2018 17:17:25 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, stable@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v8 0/5] mtd: cfi_cmdset_0002: Change write and erase
 functions
Message-ID: <20180531171725.07df8fe5@bbrezillon>
In-Reply-To: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
References: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
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

On Wed, 30 May 2018 18:32:25 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> The changes are to make sure to check the operation status.
> Actually the flash write and erase error behavior is caused on our products.
> The flash is Macronix flash device MX29GL512FHT2I-11G used by our products.
> The patch series was separated for changes of flash write and erase.
> Since those were not depended each other at the time.
> But by additional changes the changes are related more as same way currently.
> So combine patch series for the flash write and erase changes as v6.

Applied to mtd/next.

Thanks,

Boris

> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> 
> Tokunori Ikegami (5):
>   mtd: cfi_cmdset_0002: Change write buffer to check correct value
>   mtd: cfi_cmdset_0002: Change definition naming to retry write
>     operation
>   mtd: cfi_cmdset_0002: Change erase functions to retry for error
>   mtd: cfi_cmdset_0002: Change erase functions to check chip good only
>   mtd: cfi_cmdset_0002: Change erase one block to enable XIP once
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
