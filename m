Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI7ev-0002Wf-Kr
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 07:12:43 +0000
Date: Mon, 14 May 2018 09:12:14 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, Joakim
 Tjernlund <Joakim.Tjernlund@infinera.com>, "PACKHAM Chris"
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v5 0/2] mtd: cfi_cmdset_0002: Changes to retry for flash
 erase
Message-ID: <20180514091214.35ec45b8@bbrezillon>
In-Reply-To: <TY1PR01MB09547A5F4FCDAA1FFB601C74DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB09547A5F4FCDAA1FFB601C74DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

On Mon, 14 May 2018 02:11:48 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> 
> The flash erase error is caused on the Macronix flash device below.
>   MX29GL512FHT2I-11G
> Also it has been just confirmed to be able to reproduce.
> And the retry function can resolved the flash erase error correctly.
> 
> The commit message of PATCH v4 2/2 was not correct so let me resend patches.

Can you please use git send-email when you send your patch series, so
that they are properly threaded.

> 
> Tokunori Ikegami (2):
>   mtd: cfi_cmdset_0002: Change definition naming to retry write 
>     operation
>   mtd: cfi_cmdset_0002: Change erase functions to retry for error
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
