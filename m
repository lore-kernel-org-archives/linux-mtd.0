Received: from corvus.netpower.no ([212.33.135.184])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pp3f-0000m7-4g
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 14:00:55 +0100
From: =?iso-8859-1?Q?=D8yvind_Harboe?= <oyvind.harboe@zylin.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Thu, 21 Aug 2003 15:00:34 +0200
Message-ID: <002a01c367e4$3592e690$73dea8c0@lair>
MIME-Version: 1.0
In-Reply-To: <1061469898.13830.52.camel@hades.cambridge.redhat.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: RE: RFC - patch to reduce peak memory usage by disablingcompression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>You could make it use a static buffer and serialise=20
>compression, and it really would be only 4KiB you're saving.
>
>I sincerely hope this is done because you're using uncompressible=20
>data, rather than trading about 4KiB of cheap RAM for a doubling=20
>in expensive flash space :)
>
>If you're doing this, I'd prefer to change jffs2_compress() to=20
>allocate its _own_ buffer (or optionally use a static one),=20
>then have a simple definition of jffs2_compress which does=20
>nothing in the !CONFIG_JFFS2_FS_COMPRESSION case.=20

These are bigger changes than I want to attempt to JFFS2 at the
moment.=20

>You need to handle the case where compression is configured out=20
>and a filesystem created with compressed nodes is encountered --=20
>it looks like it'll die horribly at the moment.

I don't know my way around JFFS2 too well, but I thought I reported
an error in that case?=20

What else can be done in this case, except to fail to read the file?

In my case, it is my own firmware that writes the JFFS2, so the
situation
will never arise.=20

I can't say that I think it makes much sense to support the
configuration
of JFFS2 where it does not compress, but decompress.=20

>I'd also like to see individual compression routines selectable,=20
>and also at runtime with something akin to chattr.

What you describe is higher resolution of configurability, but for
my purposes the resolution is good enough.

Too many options isn't a good thing either. There will be a lot of
implied
orthogonality that isn't there(since all configurations will never be
tested).

=D8yvind
