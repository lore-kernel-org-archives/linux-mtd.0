Received: from heisenberg.zen.co.uk ([212.23.3.141])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEq5P-0007s5-5Z
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 18:00:40 +0000
Date: Tue, 15 Jan 2008 17:57:32 +0000
From: Ben Hutchings <bhutchings@solarflare.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver (2nd
	try)
Message-ID: <20080115175731.GF28547@solarflare.com>
References: <47866921.40904@solarflare.com>
	<20080114170358.GO3544@solarflare.com>
	<20080115164613.GC22338@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115164613.GC22338@lazybastard.org>
Sender: "Ben Hutchings <bhutchings>" <bwh@solarflare.com>
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Something I missed:

Jörn Engel wrote:
<snip>
> You can replace EFX_ASSERT with BUG_ON (with negated condition)
> throughout the code.  Duplicating existing kernel infrastructure needs a
> very good reason to be accepted.
<snip>

Assertions made with EFX_ASSERT() are only checked if EFX_ENABLE_DEBUG
is set, and we don't really want them to be included in a production
build.  Is there a suitable kernel facility for more paranoid checks
that will be disabled by default?

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
