Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVl56-0004Qv-Cf
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 04:29:26 -0400
Subject: Re: UBI fixes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Frank Haverkamp <f.haverkamp@web.de>
In-Reply-To: <1160121379.5460.29.camel@localhost.localdomain>
References: <1159888850.13696.13.camel@sauron>
	<1159956864.13696.25.camel@sauron>
	<1160121379.5460.29.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Fri, 06 Oct 2006 11:29:14 +0300
Message-Id: <1160123354.13696.74.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-10-06 at 09:56 +0200, Frank Haverkamp wrote:
> The idea with the command line which solves the initialization order
> issue looks very good to me. We should add a kernel config option to set
> a default. In my case it would the MTD named "content" which
> needs to be UBInized.

Yes, this is not difficult.

> Nevertheless the original JFFS2/UBI support from Joern had some
> important advantages which we should keep:

> The gluebi-MTD supported the put_block() operation to pass blocks
> back to the UBI layer. One reason for doing it was to eliminate the need
> for JFFS2 to care about erasing blocks (Joern, Thomas if there were
> more, please comment). If JFFS2 needs a block, it gets one from UBI, if
> it wants to get rid of it, it passes it back to UBI, which can do now to
> whatever is best e.g. apply wearleveling mechanisms. UBI knows best what
> to do with blocks which are due to erasure. However this mechanism
> introduced some more changes to JFFS2 at all the spots where blocks were
> to be deleted.

My opinion is:

1. If you keep this - then whole idea of gluebi makes zero sense. Then
just port JFFS2 to UBI native interface. Chose one of the roads - either
transparent compatibility (gluebi) or native interface. It is not wice
to choose a mix of them.

2. All this put_block() does introduce some optimizations. But it is
minor. It does not worth the crap we introduce into MTD and JFFS2. It
really does not worth it.

3. If you really want these improvements, and you *even* persuade dwmw2
to accept these hacks into JFFS2, and tglx to accept this in MTD - fine.
This won't add more "odd" things to UBI - and I'm happy. Although I
don't like the idea.

> The put_block() feature of an MTD is of general nature, I think. We
> should probably not ty it to UBI. If an MTD has this feature JFFS2 can
> exploit it in the way Joern showed in his example. Let's keep it, but
> let us remove any UBI naming in that code:

OK, I understand, although I still believe it doesn't worth it. I have
quite a large experience of digging JFFS2. And I assure you - it is
complex enough already.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
