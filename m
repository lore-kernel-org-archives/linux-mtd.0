Subject: Re: How stable is jffs2 summarize option?
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF6BA924CE.75C9F3A4-ONC1257735.0035A313-C1257735.00360683@transmode.se>
References: <201005311503.42629.muehlfelder@enertex.de>
	<1275383715.25797.14.camel@macbook.infradead.org>
	<201006011126.23862.muehlfelder@enertex.de>
	<1275384788.25797.17.camel@macbook.infradead.org>
	<OF6BA924CE.75C9F3A4-ONC1257735.0035A313-C1257735.00360683@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Jun 2010 11:38:57 +0100
Message-ID: <1275388737.25797.89.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thorsten =?ISO-8859-1?Q?M=FChlfelder?= <muehlfelder@enertex.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-01 at 11:50 +0200, Joakim Tjernlund wrote:
> >
> > On Tue, 2010-06-01 at 11:26 +0200, Thorsten Mühlfelder wrote:
> > > and what do you think about switching to yaffs2? I know it is developed
> > > elsewhere, but it seems to be a good alternative to jffs2+summary and
> > > probably switching is easier than to ubifs.
> >
> > Why would you think that switching to something that isn't part of the
> > Linux kernel would be easier than switching to ubifs? That seems... odd.
> 
> Yes, if ubifs doesn't fit, perhaps have a look at the recently added
> logfs?
> 
>     Jocke
> 
> BTW, I once tried JFFS2 summary and it didn't make much of a difference for us.

Did you use 'sumtool' after creating your images? For reasons which are
now lost in the mists of time, that support wasn't just added directly
to mkfs.jffs2.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
