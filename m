Date: Wed, 21 Jul 2010 10:16:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Artem.Bityutskiy@nokia.com
Subject: Re: [patch 1/4] mtd/sst25l: check for null consistently
Message-Id: <20100721101654.1dbb3468.akpm@linux-foundation.org>
In-Reply-To: <1279708452.2306.6.camel@localhost>
References: <201007202224.o6KMO0oR021381@imap1.linux-foundation.org>
	<1279708452.2306.6.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, andre@bluewatersys.com, dwmw2@infradead.org,
	error27@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 Jul 2010 13:34:12 +0300 Artem Bityutskiy <Artem.Bityutskiy@nokia.com> wrote:

> On Tue, 2010-07-20 at 15:23 -0700, akpm@linux-foundation.org wrote:
> > From: Dan Carpenter <error27@gmail.com>
> > 
> > The rest of the function assumes that "data" can be null.  I don't know
> > the code well enough to say whether it can actually be null, but there is
> > no harm in checking here.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Cc: Andre Renaud <andre@bluewatersys.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 
> This patch is also in my l2-mtd-2.6 / master tree.
> 
> The tree: http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Can we add that tree to linux-next?
