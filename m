Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTgWg-0002op-An
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 21:08:11 +0000
Received: by fabs1 with SMTP id s1so998395fab.36
 for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2011 13:08:08 -0800 (PST)
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 24 Nov 2011 23:08:03 +0200
In-Reply-To: <878vn5xml5.fsf@free.fr>
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda> <878vn5xml5.fsf@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322168887.2216.1.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-11-24 at 22:00 +0100, Robert Jarzmik wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > On Thu, Nov 24, 2011 at 11:17:56AM +0100, Robert Jarzmik wrote:
> >> >  	if (!found)
> >> > @@ -1138,9 +1141,11 @@ notfound:
> >> >  	ret = -ENODEV;
> >> >  	dev_info(dev, "No supported DiskOnChip found\n");
> >> >  err_probe:
> >> > -	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
> >> > +	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
> >> >  		if (docg3_floors[floor])
> >> >  			doc_release_device(docg3_floors[floor]);
> >> > +	}
> >> > +	kfree(docg3_floors);
> >> This is in conflict. Could you drop that hunk and wait for the other patch to go
> >> upstream ? Or alternatively use the whole serie in [2] as your base ?
> >> I think some patches of the serie didn't make it in the tree you're
> >> using.
> >> 
> >
> > I'm on linux-next.  They're all going to hit linux next soon right?
> Euh, I don't know, it's Artem decision there, as he's taking my patches.

My l2-mtd-2.6.git tre is in linux-next, which means all your patches
from your tree are also in linux next already.

Please, send incremental fixes - for this and for the compilation/sparse
warnings. I will also ad Reviewed-by from Ivan and Mike.

Artem.
