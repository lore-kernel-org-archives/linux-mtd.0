Received: from mgw2.diku.dk ([130.225.96.92])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OgWsM-0006Mw-GP
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 05:50:51 +0000
Date: Wed, 4 Aug 2010 07:48:45 +0200 (CEST)
From: Julia Lawall <julia@diku.dk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: question about drivers/mtd/ubi/cdev.c
In-Reply-To: <1280891212.4363.5.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.64.1008040747330.3431@ask.diku.dk>
References: <Pine.LNX.4.64.1008032206060.20393@ask.diku.dk>
	<1280891212.4363.5.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 4 Aug 2010, Artem Bityutskiy wrote:

> On Tue, 2010-08-03 at 22:12 +0200, Julia Lawall wrote:
> > I was wondering about the following code in the function rename_volumes in 
> > the file drivers/mtd/ubi/cdev.c:
> > 
> > list_for_each_entry(re, &rename_list, list) {
> > 	...
> >         if (no_remove_needed)
> >                 continue;
> > 	...
> >         re = kzalloc(sizeof(struct ubi_rename_entry), GFP_KERNEL);
> > 	if (!re) { ... }
> >         re->remove = 1;
> >         re->desc = desc;
> >         list_add(&re->list, &rename_list);
> > 	...
> > }
> > 
> > Is there a danger of repeating computation since re is redefined and moved 
> > back to the beginning of the list?
> 
> Hmm, the code is bogus, I do not know how it works, but it does, because
> I tested it :-)
>
> We should not use 're' as a temporary variable inside the loop. I guess
> we can use 're1' instead. I'll change this later, when have time, unless
> you submit a fix earlier :-)

Would the proper approach be to use list_for_each_entry_safe?

julia
