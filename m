Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bv9Yp-0004TW-AE
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2004 02:59:40 -0400
To: Andy Hawkins <a.hawkins@cabletime.com>,  D.A.Fedorov@inp.nsk.su,
	linux-mtd@lists.infradead.org,  Thayne Harbaugh <tharbaugh@lnxi.com>
References: <Pine.SGI.4.10.10407262153220.569820-100000@Sky.inp.nsk.su>
	<1090856360.2220.63.camel@adh> <1090858047.2219.77.camel@adh>
	<m37jsdnp6w.fsf@maxwell.lnxi.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 12 Aug 2004 00:59:37 -0600
In-Reply-To: <m37jsdnp6w.fsf@maxwell.lnxi.com>
Message-ID: <m38yck6duu.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: 
Subject: Re: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ebiederman@lnxi.com (Eric W. Biederman) writes:

> Andy Hawkins <a.hawkins@cabletime.com> writes:
> 

> > If so,
> > what is the *correct* way for this code to determine whether or not they
> > are needed (this code is in a 'generic' file, so I'm surprised that
> > there's chip specific information in there).
> 
> 
> I have the first chunk done but I'm not ready to check it
> in until I have a chance to test it.  And I am swamped right now..

Well the changes wound up being a little more extensive than
I described them.  But the code in cfi_cmdset_0001 and cfi_cmdset_0002 should
now be free of incorrect assumptions about what a flash chip can do.

As for the correct way to do this it probably still needs a little more
code review but there are fixup functions that are called when command sets
are initialized that allow for weird cases to be special cased.

Eric
