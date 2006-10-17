Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZq3z-0008KI-SQ
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 10:37:12 -0400
Subject: Re: mtd-utils/nandwrite: what if write fails?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 17 Oct 2006 17:36:59 +0300
Message-Id: <1161095820.3260.84.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, 2006-10-17 at 16:17 +0200, Ricard Wanderlof wrote:
> I have a question regarding writes to NAND flash; for instance, in=20
> mtd-utils/nandwrite.c, prior to writing to a block, it is checked so that=
=20
> it isn't bad (using the MEMGETBADBLOCK ioctl). However, what happens if=20
> the block goes bad during write? If the pwrite() call which writes out th=
e=20
> page data fails, the application says perror() and exits. Shouldn't it=20
> mark the block as bad, and re-write the data so far written to the block=20
> to the next good block?=20

If we are talking about nandwrite - I would prefer it not to do this. Or
do this if an this was specified via an explicit option ...

> As I understand it, mtd doesn't mark a block bad,

Yes, MTD provides you mechanisms to do this, but it is up to you (MTD
user) to do this or not.

> it is up to the application or overlying file system (e.g. JFFS2).

Yes, not only JFFS2, just any software which works on top of MTD and
knows what it does. For example, UBI can do this. Or some user-space
tools.

>  So it=20
> won't even help to run nandwrite again as the block has not been marked=20
> bad.

Not sure, put probably yes. You may explore fix this adding a
corresponding option to nandwrite. Or you may write an utility which
does flash torturing and identifies bad eraseblocks, e.g., flash_check.

> (Or is it simply that normally nandwrite is only used during testing, or=20
> writing an initial filesystem, and the likelyhood of a block failing at=20
> precisely this time is rather small, compared to the rest of the lifetime=
=20
> of the memory (i.e. repeated JFFS2 accesses)?)
Not sure, but I personally used it only for debugging purposes.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
