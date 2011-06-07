Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqf2-0003cC-1J
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:25:13 +0000
Received: by wyb28 with SMTP id 28so4621755wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:25:08 -0700 (PDT)
Subject: Re: [PATCH 1/6] jffs2: make lzo optional at build time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <BANLkTi=A_TjJ4JwRQLjgTz217ZhR0eCHVQ@mail.gmail.com>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307428482.11104.38.camel@localhost>
	<BANLkTi=A_TjJ4JwRQLjgTz217ZhR0eCHVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 10:20:51 +0300
Message-ID: <1307431251.11104.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 02:59 -0400, Mike Frysinger wrote:
> On Tue, Jun 7, 2011 at 02:34, Artem Bityutskiy wrote:
> > On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
> >> The external lzo dep can be a pain to deal with when cross-compiling,
> >> so make it optional for jffs2.  This is useful if people aren't even
> >> using the functionality, or for quicker development.
> >
> > How about mkfs.ubifs - it requires lzo as well. And then mkfs.jffs2
> > wants libacl which might be the same PITA.
> 
> libacl already has a knob.

OK.

>   i didnt bother with mkfs.ubifs because it
> additionally requires libuuid which comes from util-linux.

Yeah. The only reason for this is that it wants to generate an UUID for
the new file-system. We could just use pseudo-random numbers as a
work-around.

>   also, it
> seemed like lzo is the only compression supported by UBI, so making it
> optional didnt seem like it'd result in anything useful.

Not really, UBIFS currently supports lzo, zlib, and no compression. But
lzo is the default.

>   at least
> jffs2 can operate without it by using other compression schemes.

UBIFS as well.

But please, do not bother with UBIFS if you do not need this. Just
verify that mkfs.jffs2 fails if you have not compiled lzo and try to use
it. I mean, mkfs.jffs2 should not silently use zlib in this case.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
