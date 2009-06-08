Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDdyp-0000To-K3
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 12:29:48 +0000
Date: Mon, 8 Jun 2009 13:29:34 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: about ubifs
Message-ID: <20090608122934.GG25684@shareable.org>
References: <1244204035.18630.0.camel@tommy-desktop>
	<71cd59b00906050542v72c228a0r883cef7795189fe9@mail.gmail.com>
	<1244206994.20718.7.camel@tommy-desktop>
	<71cd59b00906050704m650d9701q1012dc8b649d8d7f@mail.gmail.com>
	<20090608013528.GI15426@shareable.org>
	<1244440195.5847.327.camel@localhost.localdomain>
	<20090608120110.GE25684@shareable.org>
	<1244463373.5847.357.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1244463373.5847.357.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, tommy <jiujin.hong@mid-fun.com>,
	Corentin Chary <corentin.chary@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2009-06-08 at 13:01 +0100, Jamie Lokier wrote:
> > I was thinking both sync-on-close and sync-on-close-after-truncate
> > would be most useful as _generic_ mount options, in the same way that
> > O_SYNC has generic filesystem support these days.
> 
> May be. On the other hand this would kill any remote possibility of
> having user-space fixed :-)

My point was that "fixing" user-space by requiring every shell script
to run a special (currently non-existing) fsync program after every
thing it does which modifies a file (virtually every shell command)
which has an ordered relationship with other files is stupid.

It's fine for C programs to call fsync() (e.g. I'm good about doing
that) even though it's sometimes breaks performance, but it's
unhelpful to sprinkle every other line in every shell script with it,
as it would defeat the point of shell scripts which is simplicity.

-- Jamie
