Received: from wis38-1-82-236-159-40.fbx.proxad.net ([82.236.159.40]
	helo=rameau.dmz.musique-ancienne.org)
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyY6R-0002B3-0r
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2010 22:47:54 +0000
Date: Thu, 23 Sep 2010 00:47:38 +0200
From: Bruno Cornec <bruno@victoria.frmug.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: latest MTD-utils
Message-ID: <20100922224738.GB23892@victoria2.home.musique-ancienne.org>
References: <AANLkTin+Y2YD3w4MfdTmQkRyB_UZD8pY51ci4pTQHacB@mail.gmail.com>
	<1285053950.7512.5.camel@localhost>
	<871v8n2osc.fsf@macbook.be.48ers.dk>
	<1285077063.7512.120.camel@localhost>
	<1285077268.7512.121.camel@localhost>
	<87sk131977.fsf@macbook.be.48ers.dk>
	<1285079252.7512.136.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1285079252.7512.136.camel@localhost>
Cc: Bruno Cornec <bruno@project-builder.org>, twebb <taliaferro62@gmail.com>,
	David.Woodhouse@intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Tue, Sep 21, 2010 at 05:27:32PM +0300, Artem Bityutskiy wrote:
> On Tue, 2010-09-21 at 16:07 +0200, Peter Korsgaard wrote:
> > >>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:
> > 
> > Hi,
> > 
> >  Artem> Peter, why would not you make a make tarball target, BTW? Sorry,
> >  Artem> may be you explained, but I forgot.
> > 
> > You mean why don't I just checkout from git and make a tarball myself?
> > 
> > Tarballs are pretty much the standard for source releases, and
> > source-based metadistributions (like Buildroot that I maintain) normally
> > are optimized for tarballs rather than semi-random git snapshots
> > (E.G. mirroring, automatic handling, ..).
> > 
> > And then there's the issue about people checking the ftp and not
> > noticing that there's actually a new stable release out instead of the
> > old 1.3.1
> 
> It is not too difficult to provide tarball, but this is something
> developers do not care about, they develop. Packagers do care, and it is
> saner when packagers do this, not developers.

Well, I'd find normal that a team producing a SW, agrees to produce a
given version and materialize its production by the delivery of a tar
ball correctly tagged. At least, that's what I do for my projects.

Also I understand quite well SVN, but with git, I'm always under the
impression that there is not really a reference repo from which people
can build a reference SW. Probably my lack of practice of git.

> I was in LinuxCon Brazil this year, and there was this presentation:
> http://events.linuxfoundation.org/2010/linuxcon-brazil/cornec
> where bruno said exactly the same. And he was promoting his project
> which claims to be able to pick sources from anywhere - git, svn,
> whatever.

Yes it is ;-) My goal is to allow people wanting to follow the
development to have a way to install/uninstall the project very easily
without perturbation to their normal packaging system.

To that purpose, the tool creates from a VCS such as git/svn/... a tar
ball for a given version/branch/context/ and build appropriate packages
from that point. It needs some conf files in order to support that.
(Examples of projects using project-builder.org at
http://trac.project-builder.org/browser/projects and doc at
http://trac.project-builder.org/browser/devel/pb-doc/LabProject-Builder.org.pdf
More details upon request.

> I'm not competent in the packaging area, though. Just a logical thought.
> Also CCed Bruno, may he'll be interested to know his presentation was
> listened to :-) Bruno, the beginning of the conversation is here:
> http://lists.infradead.org/pipermail/linux-mtd/2010-September/032164.html

Thanks ! And really happy to see that some words of what I said are
indeed useful ;-)

Best regards,
Bruno.
-- 
Des infos sur la musique ancienne  -- http://www.musique-ancienne.org
Des infos sur les logiciels libres -- http://www.HyPer-Linux.org
Home, sweet musical Home -- Lover of Andromède, Béatrice, Early Music, 
Josquin, Linux, Mélisande, Recorder, and Ségolène (not in that order)
