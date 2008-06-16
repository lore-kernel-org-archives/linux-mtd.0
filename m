Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8G8v-0008Gr-SN
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 14:57:14 +0000
Date: Mon, 16 Jun 2008 16:57:04 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH RESEND] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080616145704.GB20814@logfs.org>
References: <20080614.234540.102579992.anemo@mba.ocn.ne.jp>
	<20080616083356.GA15504@logfs.org>
	<20080616.233039.01916379.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080616.233039.01916379.anemo@mba.ocn.ne.jp>
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

On Mon, 16 June 2008 23:30:39 +0900, Atsushi Nemoto wrote:
> 
> OK, I will send two patches --- one for the bugfix and one for sparse
> warning.  Remaining cleanup ("Folding long lines, etc.") was just for
> checkpatch.pl and if these new patches can be accepted, I gladly keep
> code as is.  The mtdpart.c has many long lines anyway. :-)

David seems to like long lines.  Sometimes even for good reasons.

Jörn

-- 
Audacity augments courage; hesitation, fear.
-- Publilius Syrus
