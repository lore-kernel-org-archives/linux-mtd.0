Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMxgF-0005yC-Rg
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 15:34:02 +0000
Date: Sun, 27 May 2018 17:33:46 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "ikegami@allied-telesis.co.jp"
 <ikegami@allied-telesis.co.jp>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "chris.packham@alliedtelesis.co.nz" <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase
 functions
Message-ID: <20180527173346.7469ac93@bbrezillon>
In-Reply-To: <f74834424cb3f1f86e8803884b53be5f62d15c94.camel@infinera.com>
References: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
 <f74834424cb3f1f86e8803884b53be5f62d15c94.camel@infinera.com>
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

Hi Joakim,

On Thu, 17 May 2018 13:12:26 +0000
Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:

> I think the patches look good

Should I add your Reviewed-by tag (maybe Tested-by as well)?

> but I think they should go to stable as well.

Then I'll need a v7 with the "Cc: stable@vger.kernel.org" tag. Also,
some patches are clearly not fixes (patch 2 and 5 at least).

Regards,

Boris

> 
>  Jocke
> 
> On Wed, 2018-05-16 at 02:11 +0900, smtpuser wrote:
> > 
> > From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > 
> > The changes are to make sure to check the operation status.
> > Actually the flash write and erase error behavior is caused on our products.
> > The flash is Macronix flash device MX29GL512FHT2I-11G used by our products.
> > The patch series was separated for changes of flash write and erase.
> > Since those were not depended each other at the time.
> > But by additional changes the changes are related more as same way currently.
> > So combine patch series for the flash write and erase changes as v6.
> > 
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> > Cc: linux-mtd@lists.infradead.org
> > 
> > Tokunori Ikegami (5):
> >   mtd: cfi_cmdset_0002: Change write buffer to check correct value
> >   mtd: cfi_cmdset_0002: Change definition naming to retry write
> >     operation
> >   mtd: cfi_cmdset_0002: Change erase functions to retry for error
> >   mtd: cfi_cmdset_0002: Change erase functions to check chip good only
> >   mtd: cfi_cmdset_0002: Change erase one block to enable XIP once
> > 
> >  drivers/mtd/chips/cfi_cmdset_0002.c | 36 +++++++++++++++++++++++-------------
> >  1 file changed, 23 insertions(+), 13 deletions(-)
> > 
> > --
> > 2.16.1
> >   
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
