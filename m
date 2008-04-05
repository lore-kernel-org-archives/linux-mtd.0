Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhyLb-0005WO-87
	for linux-mtd@lists.infradead.org; Sat, 05 Apr 2008 02:41:39 +0000
From: David Brownell <david-b@pacbell.net>
To: "Kyungmin Park" <kmpark@infradead.org>
Subject: Re: [PATCH] jffs2 summary allocation
Date: Fri, 4 Apr 2008 19:17:04 -0700
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<1207357870.3224.89.camel@vader.jdub.homelinux.org>
	<9c9fda240804041829r5a768b39n340926485aa12687@mail.gmail.com>
In-Reply-To: <9c9fda240804041829r5a768b39n340926485aa12687@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804041917.05294.david-b@pacbell.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk,
	linux-mtd@lists.infradead.org,
	Michael Trimarchi <trimarchimichael@yahoo.it>,
	spi-devel-general@lists.sourceforge.net,
	Josh Boyer <jwboyer@gmail.com>, dwmw2@infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 04 April 2008, Kyungmin Park wrote:
> So I now changed the kmalloc eraseblock to vmalloc at both jffs2 and mtd-utils.

I hope you meant: vmalloc changed to kmalloc?

And mtd-utils is userspace, not kernel, so it can't care...
