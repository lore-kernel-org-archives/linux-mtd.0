Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ObdkD-0008NT-Ux
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 18:10:15 +0000
Received: by fxm3 with SMTP id 3so4373400fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jul 2010 11:10:11 -0700 (PDT)
Subject: Re: [patch 1/4] mtd/sst25l: check for null consistently
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20100721101654.1dbb3468.akpm@linux-foundation.org>
References: <201007202224.o6KMO0oR021381@imap1.linux-foundation.org>
	<1279708452.2306.6.camel@localhost>
	<20100721101654.1dbb3468.akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 21:10:08 +0300
Message-Id: <1279735808.16247.73.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, andre@bluewatersys.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org, error27@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-21 at 10:16 -0700, Andrew Morton wrote:
> On Wed, 21 Jul 2010 13:34:12 +0300 Artem Bityutskiy <Artem.Bityutskiy@nokia.com> wrote:
> 
> > On Tue, 2010-07-20 at 15:23 -0700, akpm@linux-foundation.org wrote:
> > > From: Dan Carpenter <error27@gmail.com>
> > > 
> > > The rest of the function assumes that "data" can be null.  I don't know
> > > the code well enough to say whether it can actually be null, but there is
> > > no harm in checking here.
> > > 
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > > Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > > Cc: Andre Renaud <andre@bluewatersys.com>
> > > Cc: David Woodhouse <dwmw2@infradead.org>
> > > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > 
> > This patch is also in my l2-mtd-2.6 / master tree.
> > 
> > The tree: http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
> 
> Can we add that tree to linux-next?

Well... This is not the first time you are requesting this :) Up to
dwmw2, but alternatively, he could just look at my tree more often.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
