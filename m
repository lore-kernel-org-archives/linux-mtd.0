Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GfvKW-0006C2-UJ
	for linux-mtd@lists.infradead.org; Fri, 03 Nov 2006 04:27:32 -0500
Subject: Re: Clarification on PLACE -vs- AUTO with JFFS2 cleanmarkers.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Pete MacKay <linux@architechnical.net>
In-Reply-To: <45924.69.30.123.186.1162491027.squirrel@www.architechnical.net>
References: <45924.69.30.123.186.1162491027.squirrel@www.architechnical.net>
Content-Type: text/plain; charset=utf-8
Date: Fri, 03 Nov 2006 11:26:45 +0200
Message-Id: <1162546005.15435.37.camel@sauron>
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

On Thu, 2006-11-02 at 13:10 -0500, Pete MacKay wrote:
> I've written a custom driver for the ST 512R3A 8-bit NAND under 2.6.16 an=
d
> ported it to 2.6.18.  Because of some chip and system peculiarities I was
> unable to use the NAND framework and wrote it using solely MTD (except fo=
r
> software ECC).  The problem occurs when mounting a JFFS2 file system: the
> cleanmarker is written to bytes 0-7 (ECC, bad block marker) instead of
> 8-15 of the OOB, as instructed by the write_ops call with ooboffs=3D0,
> ooblen=3D8, and mode=3DMTD_OOB_PLACE.  My understanding is that MTD_OOB_A=
UTO
> should be used to put the cleanmarker into the the free bytes; am I
> mistaken?  I've corrected what we thought were other problems with len an=
d
> ooblen in wbuf.c but it looks like that patch came out Monday.

In my opinion you have hit a bug which seems to be introduced at May
2006 by commit 8593fbc68b0df1168995de76d1af38eb62fd6b62.

I think it assumed to be MTD_OOB_AUTO.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
