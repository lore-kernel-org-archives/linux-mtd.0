Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19TIPH-0007Tu-99
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jun 2003 10:42:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Luca Contini <luca.contini@mediaenabling.com>
In-Reply-To: <008e01c33710$1f6c6df0$a970a8c0@topo>
References: <006801c334a8$3aa7c750$a970a8c0@topo>
	 <1055839872.2233.68.camel@passion.cambridge.redhat.com>
	 <027f01c33590$8f177db0$a970a8c0@topo>
	 <1055937571.2233.103.camel@passion.cambridge.redhat.com>
	 <008e01c33710$1f6c6df0$a970a8c0@topo>
Message-Id: <1056102151.27851.300.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 20 Jun 2003 10:42:31 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Please help, nftl question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-06-20 at 10:41, Luca Contini wrote:
> Thanx,
> so I have to modify the NFTL to comply with smartmedia fat format.
> I thought NFTL was a translation layer from smartmedia to CHS hdd like
> structure.

NFTL is a pseudo-filesystem used to emulate HDD-like structure on a
DiskOnChip. You need to implement an _entirely_ separate
pseudo-filesystem to emulate HDD-like structure on SmartMedia. The
layout on the flash and all the data-structures are _entirely_
different.

-- 
dwmw2
