Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BvdRo-0007w1-QC
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2004 10:54:25 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Stefan =?ISO-8859-1?Q?St=FCrke?= <sst@pandatel.com>
In-Reply-To: <loom.20040813T164242-792@post.gmane.org>
References: <loom.20040813T140134-351@post.gmane.org>
	<1092400305.10618.145.camel@hades.cambridge.redhat.com>
	<loom.20040813T164242-792@post.gmane.org>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1092408859.14552.3.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 13 Aug 2004 15:54:19 +0100
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-08-13 at 14:45 +0000, Stefan Stürke wrote:
> jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
> 0x1985e002)! Marking dirty
> 
> Is it save to ignore these errors?

Yes. It's observing that there's padding between 0xfffc and 0x10000.
This is done because nodes aren't allowed to cross and eraseblock
boundary, and the image was created for 64KiB eraseblocks. It's harmless
though.

-- 
dwmw2
