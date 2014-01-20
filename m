Received: from mail-oa0-f44.google.com ([209.85.219.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5KT5-0001fi-KW
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:25:08 +0000
Received: by mail-oa0-f44.google.com with SMTP id g12so8136395oah.31
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:24:39 -0800 (PST)
Date: Mon, 20 Jan 2014 11:24:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd pxa3xx_nand.c: add support for 2048 bytes page size
 layout
Message-ID: <20140120192435.GL8919@ld-irv-0074>
References: <1389623738-19585-1-git-send-email-giometti@linux.it>
 <20140115132724.GB2534@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140115132724.GB2534@localhost>
Cc: linux-mtd@lists.infradead.org, Rodolfo Giometti <giometti@linux.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 15, 2014 at 10:27:25AM -0300, Ezequiel Garcia wrote:
> Hi Rodolfo,
> 
> On Mon, Jan 13, 2014 at 03:35:38PM +0100, Rodolfo Giometti wrote:
> > Signed-off-by: Rodolfo Giometti <giometti@linux.it>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> 
> I know this is just a small nitpick, but can you re-submit this
> with a subject similar to the other commits:
> 
> ""mtd: nand: pxa3xx: Add support for 2048 bytes page size devices""
> 
> Also, I think you can add some details about the patch in the change
> log. Something along these lines might be fine:
> 
> ""
> This commit adds support for devices with 2048B page sizes and
> 4-bit ECC strength requirements. This is achieved by enabling the BCH
> ECC engine, which provides a higher strength: 16-bit over 2048 bytes.
> 
> Additionally, add a proper ECC layout to model the controller's view
> of the device (where 'U' means unused and 'B' is the bad block marker):
> 
>  ----------------------------------------------------
>  | 2048B data | B | B | 30B spare | 30B ECC | U | U |
>  ----------------------------------------------------
> ""
> 
> With these modifications you can also add:
> 
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

I updated the patch with Ezequiel's descriptions and pushed to
l2-mtd.git. Thanks!

Brian
