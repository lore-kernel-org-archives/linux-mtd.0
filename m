Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5bpu-0004LE-7k
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 07:30:38 +0000
Date: Mon, 9 Jun 2008 09:30:27 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Markus Schiltknecht <markus@bluegap.ch>
Subject: Re: Intel Turbo Memory
Message-ID: <20080609073026.GG13200@logfs.org>
References: <261293.50747.qm@web31815.mail.mud.yahoo.com>
	<20080605064814.GB17037@logfs.org> <484CD9C0.8060105@bluegap.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <484CD9C0.8060105@bluegap.ch>
Cc: linux-mtd@lists.infradead.org, Russell Fleitman <fleitman68@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 9 June 2008 09:20:32 +0200, Markus Schiltknecht wrote:
> Jörn Engel wrote:
> >It appears as if those devices are raw flash and could be accessed
> >through mtd - provided someone either has documentation or creates some
> >by reverse engineering.
> 
> Isn't that the first - and so far only - device which adheres to their
> NVMHCI specification [1]?

Interesting.  If that is the case then we're dealing with a weird device
indeed.  "Erases ... are abstracted", OOB is 12 bytes per 512.  So they
do some sort of FTL stuff, but still leave 12 out of 16 bytes of OOB
available for the user.  Quite odd.

Anyway, thanks for the spec!

Jörn

-- 
You can take my soul, but not my lack of enthusiasm.
-- Wally
