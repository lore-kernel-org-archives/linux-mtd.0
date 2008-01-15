Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEqfU-0002S6-4Y
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 18:37:48 +0000
Date: Tue, 15 Jan 2008 19:28:54 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver (2nd
	try)
Message-ID: <20080115182854.GH22338@lazybastard.org>
References: <47866921.40904@solarflare.com>
	<20080114170358.GO3544@solarflare.com>
	<20080115164613.GC22338@lazybastard.org>
	<20080115175731.GF28547@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115175731.GF28547@solarflare.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	linux-net-drivers@solarflare.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 17:57:32 +0000, Ben Hutchings wrote:
> Jörn Engel wrote:
> <snip>
> > You can replace EFX_ASSERT with BUG_ON (with negated condition)
> > throughout the code.  Duplicating existing kernel infrastructure needs a
> > very good reason to be accepted.
> <snip>
> 
> Assertions made with EFX_ASSERT() are only checked if EFX_ENABLE_DEBUG
> is set, and we don't really want them to be included in a production
> build.  Is there a suitable kernel facility for more paranoid checks
> that will be disabled by default?

Not that I know of.  Having this once in a generic form might be useful.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
