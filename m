Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUJjO-0001pl-Rh
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 12:18:39 +0000
Subject: Re: ubifs: error unwinding trouble
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4A6991A5.4020105@nokia.com>
References: <20090724103038.GN19257@buzzloop.caiaq.de>
	<4A6991A5.4020105@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Jul 2009 15:17:46 +0300
Message-Id: <1248437866.24676.79.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Daniel Mack <daniel@caiaq.de>, Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-24 at 13:49 +0300, Adrian Hunter wrote:
> Daniel Mack wrote:
> > On a recent git kernel, the error unwinding for UBIFS seems to have some
> > problem, most probably a double-free or something similar.
> > 
> > When UBI is pointed to the right mtd partition (using command line
> > arguments) , everything is fine. But when it's (accidentionally) set to
> > some very small mtd, the attach process fails. Which wouldn't be a bad
> > thing by itself, but it somehow messes up the slub/slab allocators then
> > which causes very strange memory corruption effects - see the backtrace
> > below.
> > 
> > The Ooops itself is unreleated to UBI, but it does not occur when UBI
> > succeeds in attaching the volume.
> > 
> > Any idea? I searched for awhile but couldn't see anything obvious.
> 
> Looks like a double free of the eba_tbl
> 
> This might help:
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 0f2034c..e4d9ef0 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -1254,6 +1254,7 @@ out_free:
>                 if (!ubi->volumes[i])
>                         continue;
>                 kfree(ubi->volumes[i]->eba_tbl);
> +               ubi->volumes[i]->eba_tbl = NULL;
>         }
>         return err;
>  }

You are right. I've just pushed your patch to ubi-2.6.git/master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
