Received: from pmac.infradead.org ([2001:8b0:10b:1:20d:93ff:fe7a:3f2c])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FloKt-00085M-Kn
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 10:39:49 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] avoid unnnecessary mtd read when read can be satisfied by
	write buffer
Date: Thu, 1 Jun 2006 15:39:34 +0100
References: <447E0FA4.7010201@realmsys.com>
	<20060601143249.GB15216@wohnheim.fh-wedel.de>
In-Reply-To: <20060601143249.GB15216@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200606011539.35964.dwmw2@infradead.org>
Sender: David Woodhouse <dwmw2@pmac.infradead.org>
Cc: =?iso-8859-1?q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	Kevin Vigor <kevin@realmsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 01 June 2006 15:32, J=F6rn Engel wrote:
> Not sure whether this micro optimization is worth the code. =A0A real
> solution would be to have a cache for the full device. =A0Possibly read
> the device through pagecache somehow (writing obviously should be
> write-through, not write-back). =A0That would have a significantly
> higher hit rate than your patch.

We haven't written to the device yet, at this point -- this is just the cas=
e=20
where the data in question exist _only_ in the wbuf, but we're actually=20
reading from the flash first _anyway_, with the current code.=20

I don't think that caching the compressed nodes from the flash is going to =
be=20
particularly useful -- we already have the page cache for _uncompressed_=20
data. For other things we might want to cache, such as dirents and symlinks=
,=20
we'll do _much_ better to store that in memory for ourselves rather than ju=
st=20
caching whole pages of the backing store for such sparse content.

=2D-=20
dwmw2
