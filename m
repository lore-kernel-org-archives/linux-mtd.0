Received: from draco.netpower.no ([212.33.133.34])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kid7-0000sS-AK
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 12:08:25 +0100
From: =?iso-8859-1?Q?=D8yvind_Harboe?= <oyvind.harboe@zylin.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Thu, 7 Aug 2003 13:08:15 +0200
Message-ID: <002001c35cd4$33139790$73dea8c0@lair>
MIME-Version: 1.0
In-Reply-To: <1060253873.25209.61.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 ram memory usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>You could also remove the actual compression routines if=20
>you're going to do that.=20

In my patch I:

- removed the allocation of the compression/decompression buffer
that the compression routines uses to attempt to compress.
- removed the invocation of the compression/decompression call.

>Other users, especially eCos users, may want to individually=20
>select the compression algorithms available too.

Agreed.

I haven't checked, but I can't imagine that the runlength
compressor using a lot of memory.

>Finding a way to eliminate the 'totlen' field of the=20
>jffs2_raw_node_ref structure might be productive. Or possibly=20
>making the jffs2_raw_node_ref contain doubly-linked lists if=20
>that then means we can discard obsolete nodes immediately=20
>rather than keeping them around.

I don't speak enough JFFS2 currently to comfortably attempt this.

=D8yvind
