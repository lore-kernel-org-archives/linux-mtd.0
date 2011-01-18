Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PfD0k-0003OR-Cu
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 14:58:21 +0000
Date: Tue, 18 Jan 2011 15:58:12 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 4/5] CRIS: stop checking for MTD_CONCAT
Message-ID: <20110118145812.GO9874@axis.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
	<20110112124033.GF7105@axis.com> <1295348719.2470.126.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1295348719.2470.126.camel@koala>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
	linux-cris-kernel <linux-cris-kernel@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 18, 2011 at 12:05:19PM +0100, Artem Bityutskiy wrote:
> On Wed, 2011-01-12 at 13:40 +0100, Jesper Nilsson wrote:
> > On Tue, Jan 11, 2011 at 12:33:38PM +0100, Dmitry Eremin-Solenikov wrote:
> > > As MTD_CONCAT support is becoming an integral part of MTD core,
> > > there is no need for it's special treatment. So stop checking for
> > > MTD_CONCAT availability.
> > > 
> > > Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> > 
> > Looks good, I'll pull this patch into the cris-tree.
> > 
> > Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> 
> I've put whole patch series to my l2-mtd-2.6 tree, I think it is better
> to keep the CRIS patch there as well. Please, give your ack to merge the
> CRIS patch via the MTD tree.

No problem, and thanks again.

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
