Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8AAC-0001wS-Bv
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 08:34:08 +0000
Date: Mon, 16 Jun 2008 10:33:56 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH RESEND] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080616083356.GA15504@logfs.org>
References: <20080614.234540.102579992.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080614.234540.102579992.anemo@mba.ocn.ne.jp>
Cc: David Woodhouse <dwmw2@infradead.org>, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 14 June 2008 23:45:40 +0900, Atsushi Nemoto wrote:
> 
> On "partition is out of reach" path, i.e. slave's offset was bigger
> than the master's size, slave's erasesize will not be calculated and
> it leads division by zero on following boundary checking.  This patch
> makes calculation of the slave's erasesize more robust.
> 
> This patch also contains some cleanups.  Do not shadow symbol 'i',
> fold long lines, etc.

I personally consider the original long "for (...)" lines slightly
better (or rather less bad) than your replacement.  Mixing cleanups
with bugfixes is often a bad idea.

Another reason is that I still cannot see the bugfix among all the
changes. *scratches head*  Ah, here it is.  *scratches some more*  And
it even appears to be correct.

Can you resend as two patches?

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
