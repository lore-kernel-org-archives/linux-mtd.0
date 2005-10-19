Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ES2Eu-0004iA-Sz
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 20:55:36 -0400
Date: Wed, 19 Oct 2005 02:55:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Daniel Ann <ktdann@gmail.com>
Message-ID: <20051019005535.GG20236@wohnheim.fh-wedel.de>
References: <9b7ca6570510121624h5abdbf3erf526aab893bf285a@mail.gmail.com>
	<20051018234914.GF20236@wohnheim.fh-wedel.de>
	<9b7ca6570510181721v7eb18241yaee7444605a1a4ad@mail.gmail.com>
	<9b7ca6570510181725r678b865n667f046ea18b7a25@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b7ca6570510181725r678b865n667f046ea18b7a25@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FYI, problem in CVS version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 October 2005 09:25:59 +0900, Daniel Ann wrote:
> >
> > Yeah, you are right about fs/Makefile.jffs3 and few other bits such as
> > Kconfig related files.
> > I definately dont mind sending in a patch, but I'm not familiar with
> > submitting a patch. Is there a guideline which I could follow if I
> > ever had to submit one ?
> >
> 
> Just been looking at how others have submitted patch, is it just a
> diff against the mtd patched kernel file and file that I changed ?

A diff against current cvs would be preferred.  That way you can catch
patchin.sh as well.

diff -Naurp old_dir new_dir

Jörn

-- 
Geld macht nicht glücklich.
Glück macht nicht satt.
