Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNGG1-00027k-F0
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 08:10:35 +0000
Message-ID: <1438848603.32524.6.camel@embedded.rocks>
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Date: Thu, 06 Aug 2015 10:10:03 +0200
In-Reply-To: <55C30D24.1010504@nod.at>
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
 <55C2840B.5000709@nod.at> <1438811611.6328.32.camel@embedded.rocks>
 <55C287A9.8000006@nod.at> <1438813074.6328.35.camel@embedded.rocks>
 <55C30D24.1010504@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Do, 2015-08-06 at 09:30 +0200, Richard Weinberger wrote:
> Jörg,
> 
> Am 06.08.2015 um 00:17 schrieb Jörg Krause:
> > > > > Then just disable it. :)
> > > > 
> > > > I did :) I thought fastmap is used automatically by the UBI 
> > > > driver?
> > > 
> > > It will *use* fastmap automatically but not convert non-fastmap 
> > > UBI 
> > > images
> > > to fastmap.
> > > You can enable ubi.fm_autoconvert to do so.
> > 
> > Sorry for asking, but how do I create an UBI image with fastmap
> > support? I've never read something about this.
> 
> You have to use the ubi.fm_autoconvert parameter. The UBI will 
> automatically
> write down a fastmap if needed.
> 
> Currently it is not possible to create a fastmap-enabled UBI image
> using ubinize.
> The reason is that fastmap stores the LEB->PEB mappings to allow
> a fast attach. ubinize cannot know which PEBs are bad.
> So, we'd need a tool which creates the fastmap while flashing to the 
> nand.
> 

I see!

> > > > > Meanwhile I'll find out what exactly is going on.
> > > > 
> > > > Many thanks!
> > > 
> > > Can you please apply the attached debug patch?
> > > I wonder why exactly the auto resize function is failing.
> > 
> > autoresize: cannot auto-resize volume 0: -28
> 
> I have good and bad news.
> The good news is that I know what is going on, the bad one
> is that I don't have an good solution for it.
> 
> UBI is requesting a new PEB but your system is still busy with
> erasing them. With fastmap disabled UBI can use produce_free_peb()
> and wait for a new erased PEB.
> But fastmap cannot use this helper as it releases ->wl_lock
> and would lead to a inconsistent fastmap state.
> Kernels < 4.1 did so and faced interesting fastmap corruptions.
> I hoped using the current retry logic the issue you're facing cannot
> happen. But as it seems I was wrong.
> 
> Can you please give the attached patch a try?
> 

I tried the "dirty hack", but it does not solves the problem. I also
tested with 100 retries, but the error remains.

I will turn fastmap off for now, but feel free to send more patches to
try.

Jörg
