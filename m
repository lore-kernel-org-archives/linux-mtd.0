Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhF8s-0005Pj-7p
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 09:24:58 +0000
Date: Mon, 5 May 2014 06:24:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH for v3.15 0/2] UBI: block: Support very large volumes
Message-ID: <20140505092403.GB2873@arch.cereza>
References: <1397741023-2122-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140423235911.GB1628@arch.cereza>
 <1399271816.17496.111.camel@sauron.fi.intel.com>
 <1399274592.15290.12.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1399274592.15290.12.camel@sauron.fi.intel.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05 May 10:23 AM, Artem Bityutskiy wrote:
> On Mon, 2014-05-05 at 09:36 +0300, Artem Bityutskiy wrote:
> > On Wed, 2014-04-23 at 20:59 -0300, Ezequiel Garcia wrote:
> > > >  drivers/mtd/ubi/block.c | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > 
> > > 
> > > Do you think you can pick this for v3.15-rc3?
> > 
> > Picked both, I'll send them to Linus soon, thanks!
> 
> So kbuild caught a warning. Shame I did not notice this myself, but the
> warning indicates a bigger problem - the entire function is not allowed
> to fail, but it seems like there are conditions when it needs to fail.
> Would you please analyze the error handling in the resize path?
> 

Working on it.

Sorry for the crap,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
