Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FloEm-0007nr-Hn
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 10:33:37 -0400
Date: Thu, 1 Jun 2006 16:32:49 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kevin Vigor <kevin@realmsys.com>
Subject: Re: [PATCH] avoid unnnecessary mtd read when read can be satisfied by
	write buffer
Message-ID: <20060601143249.GB15216@wohnheim.fh-wedel.de>
References: <447E0FA4.7010201@realmsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <447E0FA4.7010201@realmsys.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 May 2006 15:50:28 -0600, Kevin Vigor wrote:
> 
> The following small patch modifies wbuf.c::jffs2_flash_read to avoid a 
> call to the mtd read layer in the case where all data returned by the 
> read would be replaced by data from the write buffer anyway. This 
> condition occurs relatively infrequently, but the cost of the test is 
> low and the benefit of avoiding the mtd read is high.

Not sure whether this micro optimization is worth the code.  A real
solution would be to have a cache for the full device.  Possibly read
the device through pagecache somehow (writing obviously should be
write-through, not write-back).  That would have a significantly
higher hit rate than your patch.

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
