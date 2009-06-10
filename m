Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MERWd-0001cp-8g
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 17:23:54 +0000
Date: Wed, 10 Jun 2009 18:23:40 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 1/3] [MTD-UTILS] Unified reading from standard input and
	from file
Message-ID: <20090610172340.GA7416@shareable.org>
References: <h0k3il$ij6$1@ger.gmane.org>
	<1244551983.5847.388.camel@localhost.localdomain>
	<4A2E98BD.30704@orb.com> <h0mppp$7v2$1@ger.gmane.org>
	<1244649814.5847.404.camel@localhost.localdomain>
	<1244649943.5847.405.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1244649943.5847.405.camel@localhost.localdomain>
Cc: Jehan Bing <jehan@orb.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Wed, 2009-06-10 at 19:03 +0300, Artem Bityutskiy wrote:
> > Err, is it normal C do do stuff like
> > {
> > 	readlen = meminfo.writesize;
> > 	int tinycnt += cnt;
> 
> Sorry, I meant
> {
> 	readlen = meminfo.writesize;
> 	int tinycnt = 0;

It's C99, and GCC has accepted that syntax since GCC 3.0.

If you want to disable it, use -Werror=declaration-after-statement in
current GCC, or -pedantic (but that has other effects).

-- Jamie
