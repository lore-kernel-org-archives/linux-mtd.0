Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUMyI-0003UB-SH
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 15:46:16 +0000
Date: Fri, 24 Jul 2009 17:46:00 +0200
From: Daniel Mack <daniel@caiaq.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: ubifs: error unwinding trouble
Message-ID: <20090724154600.GR19257@buzzloop.caiaq.de>
References: <20090724103038.GN19257@buzzloop.caiaq.de>
	<4A6991A5.4020105@nokia.com> <1248437866.24676.79.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1248437866.24676.79.camel@localhost>
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2009 at 03:17:46PM +0300, Artem Bityutskiy wrote:
> On Fri, 2009-07-24 at 13:49 +0300, Adrian Hunter wrote:
> > diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> > index 0f2034c..e4d9ef0 100644
> > --- a/drivers/mtd/ubi/eba.c
> > +++ b/drivers/mtd/ubi/eba.c
> > @@ -1254,6 +1254,7 @@ out_free:
> >                 if (!ubi->volumes[i])
> >                         continue;
> >                 kfree(ubi->volumes[i]->eba_tbl);
> > +               ubi->volumes[i]->eba_tbl = NULL;
> >         }
> >         return err;
> >  }
> 
> You are right. I've just pushed your patch to ubi-2.6.git/master.

Great. Thanks for the quick response!
Is there any merge cycle outstanding for ubifs in 2.6.31?

Daniel
