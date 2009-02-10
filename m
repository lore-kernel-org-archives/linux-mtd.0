Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWrvY-0004Pt-Ln
	for linux-mtd@lists.infradead.org; Tue, 10 Feb 2009 12:41:27 +0000
Date: Tue, 10 Feb 2009 12:41:18 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Dzuy Nguyen <dzuy@infinity-studios.com>
Subject: Re: jffs2: Too few erase blocks (1)
Message-ID: <20090210124118.GD5449@shareable.org>
References: <498FC4BB.7060903@infinity-studios.com>
	<Pine.LNX.4.64.0902090947080.19761@lnxricardw.se.axis.com>
	<49904E48.7000805@infinity-studios.com>
	<Pine.LNX.4.64.0902091731030.22663@lnxricardw.se.axis.com>
	<4990FF85.70709@infinity-studios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4990FF85.70709@infinity-studios.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dzuy Nguyen wrote:
> I think I'll just use ext2.  ext2 doesn't mind small partition.
> Writing to it should work the same as dd.

Be careful.  Writing to ext2 over mtdblock may wear out the flash
faster than dd over mtd.

-- Jamie
