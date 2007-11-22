Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IvDWc-0004i2-Gh
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 09:59:36 -0500
Date: Thu, 22 Nov 2007 14:59:26 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Very slow nor flash write
Message-ID: <20071122145926.GB13759@shareable.org>
References: <497747.61534.qm@web59203.mail.re1.yahoo.com>
	<Pine.LNX.4.64.0711221405160.11563@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0711221405160.11563@pentafluge.infradead.org>
Cc: nico@cam.org, linux-mtd@lists.infradead.org, tike64 <tike64@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey Korolev wrote:
> The best thing would be to set default word programming time for the
> slowest case. I think 10KB/s would be worst enough case.

I'm sure I've seen flash devices that program slower than 10KB/s.
However, I don't know if any CFI-1 devices would be that slow.

-- Jamie
