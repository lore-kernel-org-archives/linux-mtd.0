Received: from li9-11.members.linode.com ([67.18.176.11] helo=imap.thunk.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TSwQX-0004aZ-2n
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2012 20:59:18 +0000
Date: Mon, 29 Oct 2012 16:39:37 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH 1/9] random32: introduce random32_get_bytes() and
 prandom32_get_bytes()
Message-ID: <20121029203937.GC7098@thunk.org>
References: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
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

On Sun, Oct 28, 2012 at 04:18:58PM +0900, Akinobu Mita wrote:
>  /**
> + *	prandom32_get_bytes - get the requested number of pseudo-random bytes
> + *	@state: pointer to state structure holding seeded state.
> + *	@buf: where to copy the pseudo-random bytes to
> + *	@bytes: the requested number of bytes
> + *
> + *	This is used for pseudo-randomness with no outside seeding.
> + *	For more random results, use random32_get_bytes().
> + */
> +
> +/**
> + *	random32_get_bytes - get the requested number of pseudo-random bytes
> + *	@buf: where to copy the pseudo-random bytes to
> + *	@bytes: the requested number of bytes
> + */

This naming scheme is going to be very confusing.  If the function is
going to return a pseudo-random number, it *must* have a "prandom"
suffix.  Otherwise some kernel developer, somewhere, will get confused
between get_random_bytes() and random32_get_bytes(), and the result
may be a very embarassing security exposure.

How about prandom32_get_bytes_state() and prandom32_get_bytes() instead?

						- Ted
