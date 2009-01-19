Received: from hera.kernel.org ([140.211.167.34])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LOkHY-00007e-DZ
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 02:54:32 +0000
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
From: Jaswinder Singh Rajput <jaswinder@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20090119112429.78f5dc33.sfr@canb.auug.org.au>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<20090119112429.78f5dc33.sfr@canb.auug.org.au>
Content-Type: text/plain
Date: Mon, 19 Jan 2009 08:23:14 +0530
Message-Id: <1232333594.3129.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	Ingo Molnar <mingo@elte.hu>, linux-media@vger.kernel.org,
	mchehab@infradead.org, linux-raid@vger.kernel.org,
	netfilter@vger.kernel.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, oliver.hartkopp@volkswagen.de,
	spi-devel-general@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-01-19 at 11:24 +1100, Stephen Rothwell wrote:
> On Sun, 18 Jan 2009 01:47:21 +0530 Jaswinder Singh Rajput <jaswinder@kernel.org> wrote:
> >
> > diff --git a/include/linux/nfsd/stats.h b/include/linux/nfsd/stats.h
> > index 7678cfb..0b53cfe 100644
> > --- a/include/linux/nfsd/stats.h
> > +++ b/include/linux/nfsd/stats.h
> > @@ -29,9 +29,11 @@ struct nfsd_stats {
> >  	unsigned int	ra_size;	/* size of ra cache */
> >  	unsigned int	ra_depth[11];	/* number of times ra entry was found that deep
> >  					 * in the cache (10percentiles). [10] = not found */
> > +#ifdef __KERNEL__
> >  #ifdef CONFIG_NFSD_V4
> >  	unsigned int	nfs4_opcount[LAST_NFS4_OP + 1];	/* count of individual nfsv4 operations */
> >  #endif
> > +#endif /* __KERNEL__ */
> >  
> >  };
> 
> The only variable in the kernel of type "struct nfsd_stats" is only
> exported to user mode via procfs, so this whole structure could probably
> go inside __KERNEL__.  Then looking harder, I wonder if this header
> should be exported to user mode at all.
> 

I was in doubt may be this will be used by some userspace utilities.

Once I got confirmation that it is not required in userspace, I will
remove it :-)

--
JSR
