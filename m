Received: from thunk.org ([69.25.196.29] helo=thunker.thunk.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoofU-0006rF-BK
	for linux-mtd@lists.infradead.org; Sat, 19 Sep 2009 01:23:21 +0000
Date: Fri, 18 Sep 2009 21:23:08 -0400
From: Theodore Tso <tytso@mit.edu>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
Message-ID: <20090919012308.GG28781@mit.edu>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
	<20090902092402.GI1466@nb.net.home>
	<200909181252.09503.corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200909181252.09503.corentincj@iksaif.net>
Cc: util-linux-ng@vger.kernel.org, Karel Zak <kzak@redhat.com>,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2009 at 12:52:09PM +0200, Corentin Chary wrote:
> On Wednesday 02 September 2009 11:24:02 Karel Zak wrote:
> >  Hi Corentin,
> > 
> > On Mon, Aug 24, 2009 at 01:11:54PM +0200, Corentin Chary wrote:
> > > Probe UBI volume under /dev (or /devfs, /devices).
> > 
> >  that's not elegant. Does it mean that UBI volumes are not in
> >  /proc/partitions?
> > 
> >  Ted, any comment?
> 
> Any news for this patch ?
> Thanks,

Sorry, I've been travelling and it's the merge window and I have
slides for a Usenix tutorial due soon, so my userspace-related pages
have been swapped out.  And next week is LinuxCon/Plumber's...  

I'll try to look at this either next week if I can find some airplane
hacking time or when I get back from Plumber's Conference.

	     	       	   	     	       - Ted
