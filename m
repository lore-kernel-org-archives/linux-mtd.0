Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dw29R-0000Ta-NH
 for linux-mtd@lists.infradead.org; Sun, 24 Sep 2017 08:20:36 +0000
Date: Sun, 24 Sep 2017 10:20:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 trivial@kernel.org
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
Message-ID: <20170924102006.5aa42982@bbrezillon>
In-Reply-To: <b45f83d5-6a0b-64f2-2a3a-708e1a1e7f90@gmail.com>
References: <20170923201314.GA14742@amd>
 <b45f83d5-6a0b-64f2-2a3a-708e1a1e7f90@gmail.com>
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

On Sat, 23 Sep 2017 23:10:26 +0200
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 09/23/2017 10:13 PM, Pavel Machek wrote:
> > C++ comments look wrong in kernel tree. Fix one.  
> 
> AFAIR they are now (sadly) accepted, but this patch works for me.

Works for me too. Here is my

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> Would be nice if trivial could pick it.

Hm, I'd recommend not doing that, otherwise we might end up with a
conflict if a patch modify something in this area.

> 
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > 
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 6cd0f6b..849543f1 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -267,7 +267,7 @@ struct mtd_info {
> >  	 */
> >  	unsigned int bitflip_threshold;
> >  
> > -	// Kernel-only stuff starts here.
> > +	/* Kernel-only stuff starts here. */
> >  	const char *name;
> >  	int index;
> >  
> >   
> 
> 
