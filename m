Received: from li9-11.members.linode.com ([67.18.176.11] helo=imap.thunk.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TTOzT-0008Ct-4m
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 03:29:15 +0000
Date: Tue, 30 Oct 2012 23:29:02 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH 1/9] random32: introduce random32_get_bytes() and
 prandom32_get_bytes()
Message-ID: <20121031032902.GD9475@thunk.org>
References: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
 <20121029203937.GC7098@thunk.org>
 <CAC5umyhje4oDtKzw6kYSXw99rVzZJOaeApfizGeDos3SnmUcjA@mail.gmail.com>
 <CAC5umyi=f+Q2Dxc4KS8nKd8uD3yvVNf8M9g1-nBt+6UsqSGHdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC5umyi=f+Q2Dxc4KS8nKd8uD3yvVNf8M9g1-nBt+6UsqSGHdg@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 30, 2012 at 08:12:39PM +0900, Akinobu Mita wrote:
> >>
> >> How about prandom32_get_bytes_state() and prandom32_get_bytes() instead?
> >
> > I agree with your suggestion.  I'll rename them and try again.
> >
> > By the way, should we also rename the existing random32() and
> > prandom32() in the future?

I suppose the other way to go is to just use random32 as the common
prefix, and just have random32() and random32_state().  My concern was
that people might assume that prandom32() and random32() might imply
that only prandom32() was the one using a pseudo-random number
generator.  This might be easier since there are large number of uses
of random32() in the source tree, but only a relative few using
prandom32().

    	   	     	    	     - Ted
