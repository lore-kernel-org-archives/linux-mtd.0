Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhDFP-0003uE-H8
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 07:23:35 +0000
Message-ID: <1399274592.15290.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH for v3.15 0/2] UBI: block: Support very large volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 05 May 2014 10:23:12 +0300
In-Reply-To: <1399271816.17496.111.camel@sauron.fi.intel.com>
References: <1397741023-2122-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140423235911.GB1628@arch.cereza>
 <1399271816.17496.111.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-05-05 at 09:36 +0300, Artem Bityutskiy wrote:
> On Wed, 2014-04-23 at 20:59 -0300, Ezequiel Garcia wrote:
> > >  drivers/mtd/ubi/block.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > 
> > Do you think you can pick this for v3.15-rc3?
> 
> Picked both, I'll send them to Linus soon, thanks!

So kbuild caught a warning. Shame I did not notice this myself, but the
warning indicates a bigger problem - the entire function is not allowed
to fail, but it seems like there are conditions when it needs to fail.
Would you please analyze the error handling in the resize path?

-- 
Best Regards,
Artem Bityutskiy
