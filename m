Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19TIIV-0007Mn-Sm
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jun 2003 10:35:08 +0100
Message-ID: <008e01c33710$1f6c6df0$a970a8c0@topo>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <006801c334a8$3aa7c750$a970a8c0@topo>
	<1055839872.2233.68.camel@passion.cambridge.redhat.com>
	<027f01c33590$8f177db0$a970a8c0@topo>
	<1055937571.2233.103.camel@passion.cambridge.redhat.com>
Date: Fri, 20 Jun 2003 11:41:28 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Thanx,
so I have to modify the NFTL to comply with smartmedia fat format.
I thought NFTL was a translation layer from smartmedia to CHS hdd like
structure.

regards

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Luca Contini" <luca.contini@mediaenabling.com>
Cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Sent: Wednesday, June 18, 2003 1:59 PM
Subject: Re: Please help, nftl question


> On Wed, 2003-06-18 at 12:55, Luca Contini wrote:
> > Thank you David.
> > One more question: I want to put a vfat filesystem on top of nftl
(actually
> > i'd like to read from a smartmedia formatted with fat12 by a digital
> > camera).
>
> A digital camera will not be using NFTL. NFTL is only used on the
> M-Systems DiskOnChip, and outside the Free World patents enforce that
> restriction.
>
> You want the SmartMedia translation layer, which isn't yet implemented
> and merged, although I do believe I recall seeing code for it at one
> point. It would fit into the diagram I showed you alongside mtdblock,
> FTL, NFTL etc.
>
>
>
> --
> dwmw2
>
>
>
