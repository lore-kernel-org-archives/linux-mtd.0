Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8GN8-0006Ds-Jj
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 15:11:55 +0000
Date: Mon, 16 Jun 2008 23:30:39 +0900 (JST)
Message-Id: <20080616.233039.01916379.anemo@mba.ocn.ne.jp>
To: joern@logfs.org
Subject: Re: [PATCH RESEND] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080616083356.GA15504@logfs.org>
References: <20080614.234540.102579992.anemo@mba.ocn.ne.jp>
	<20080616083356.GA15504@logfs.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 Jun 2008 10:33:56 +0200, J=F6rn Engel <joern@logfs.org> wrot=
e:
> > On "partition is out of reach" path, i.e. slave's offset was bigger=

> > than the master's size, slave's erasesize will not be calculated an=
d
> > it leads division by zero on following boundary checking.  This pat=
ch
> > makes calculation of the slave's erasesize more robust.
> > =

> > This patch also contains some cleanups.  Do not shadow symbol 'i',
> > fold long lines, etc.
> =

> I personally consider the original long "for (...)" lines slightly
> better (or rather less bad) than your replacement.  Mixing cleanups
> with bugfixes is often a bad idea.
> =

> Another reason is that I still cannot see the bugfix among all the
> changes. *scratches head*  Ah, here it is.  *scratches some more*  An=
d
> it even appears to be correct.
> =

> Can you resend as two patches?

OK, I will send two patches --- one for the bugfix and one for sparse
warning.  Remaining cleanup ("Folding long lines, etc.") was just for
checkpatch.pl and if these new patches can be accepted, I gladly keep
code as is.  The mtdpart.c has many long lines anyway. :-)

Thank you for review.

---
Atsushi Nemoto
