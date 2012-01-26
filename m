Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqVVT-0000TZ-El
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 20:01:16 +0000
In-Reply-To: <OFDD72D713.95FC023B-ONC1257991.005F7988-C1257991.00607681@transmode.se>
References: <4F206213.9070704@flatfrog.com>
 <alpine.DEB.2.00.1201251351500.5324@utopia.booyaka.com>
 <4F2127B8.9000005@flatfrog.com> <4F213ED8.2020500@flatfrog.com>
 <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
 <OF645D734B.78418504-ONC1257991.005A101B-C1257991.005A7809@transmode.se>
 <alpine.DEB.2.00.1201260934190.11174@utopia.booyaka.com>
 <alpine.DEB.2.00.1201260936440.11174@utopia.booyaka.com>
 <OF4651C12F.58F763E5-ONC1257991.005C0D05-C1257991.005C4F23@transmode.se>
 <alpine.DEB.2.00.1201260953550.32667@utopia.booyaka.com>
 <OFDD72D713.95FC023B-ONC1257991.005F7988-C1257991.00607681@transmode.se>
Subject: Re: CONFIG_PREEMPT and JFFS2 oops
Message-ID: <OF98F390C1.0794131C-ONC1257991.006D971F-C1257991.006DF8A8@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 21:01:10 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Paul Walmsley <paul@pwsan.com>, Richard Purdie <rpurdie@openedhand.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Orjan Friberg <of@flatfrog.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> >
> > On Thu, 26 Jan 2012, Joakim Tjernlund wrote:
> >
> > > Still leeks:
> > > +                            best_slen = tdl;
> > > +                            best_buf = tmp_buf;
> > > +                            best = this;
> > >
> > > You just throw away best_buf here, don't you?
> >
> > You're right.  It's even worse than that.  best_buf will contain the data
> > from the last compressor used.  And it will be prematurely freed.  Here's
> > a fixed version.
> >
> > Time for breakfast.
>
> hmm, that memcpy is costly. Just swap tmp_buf and best_buf instead?
>
> Time to go home :)

.. and you should delay the second allocation to when it is needed. After swapping ptrs, test if
tmp_buf is NULL and kmalloc if so.

 Jocke
