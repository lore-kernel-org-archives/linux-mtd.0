Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OggcS-0005lQ-Kf
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 16:15:05 +0000
Received: by fxm3 with SMTP id 3so2993210fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 09:15:01 -0700 (PDT)
Subject: Re: ubifs : corruption after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C5690B1.6030407@parrot.com>
References: <4C346D5B.2000609@parrot.com>	<4C3C1572.8080501@parrot.com>
	<4C3C2740.2040105@parrot.com>	<4C3C30D1.9030005@parrot.com>
	<1279031064.31639.90.camel@localhost>	<4C3C81E3.3030407@parrot.com>
	<4C4FDEF5.2040405@parrot.com>  <4C5690B1.6030407@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Aug 2010 19:14:57 +0300
Message-Id: <1280938497.4363.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-02 at 11:32 +0200, Matthieu CASTET wrote:
> Matthieu CASTET a écrit :
> > Hi,
> > 
> > Matthieu CASTET a écrit :
> >> Artem Bityutskiy a écrit :
> >> Ok thanks, I will run it
> >>
> >> When checking the code, I saw that switch_gc_head can set c->gc_lnum to -1.
> >>
> >> In ubifs_put_super, we set c->mst_node->gc_lnum to c->gc_lnum and write 
> >> master node.
> >> Can't ubifs_put_super run while switch_gc_head set gc_lnum to -1 ?
> >>
> > I manage to reproduce it with the backtrace [1].
> > 
> Waiting for a proper fix, I force recovery if gc_lnum to 

The workaround looks ok, but I still do not understand how we end up
with writing -1. The only place c->gc_lnum is set to -1 is in GC, but it
is then initialized properly, and only error can cause GC to return with
c->gc_lnum == -1, in which case we switch to R/O mode immediately.

Is your UBIFS identical to what I have in my 2.6.27 back-port tree?

Also, I will have really little time till the beginning of September, so
probably this will wait...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
