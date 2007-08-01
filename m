From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>
References: <001501c7d3d1$bcf66b40$e1ac580a@swcenter.sec.samsung.co.kr>
	<46B0272C.6040504@nokia.com>
Subject: RE: [RFC PATCH] [MTD] [OneNAND] Cache Read support
Date: Wed, 1 Aug 2007 16:09:22 +0900
Message-ID: <001c01c7d40a$e57aa4d0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <46B0272C.6040504@nokia.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 
> ext Kyungmin Park wrote:
> > This patch supports the Cache Read feature in OneNAND.
> > It's similar with read-while-loading except while read it does sensing the page buffer in NAND
> core.
> > So it's called Transfer-While-Sensing. you can find it in OneNAND Spec. in detail.
> >
> > Now there's no big performance gain in our test board, Apollon(OMAP2). But others are maybe
> different.
> >
> > Any comments are welcome.
> 
> Cool!
> 
> Presume you have run the NAND tests

Sure, it passed NAND tests.

Could you review the code?
I wonder why there's no performance gain. It's faster than read-while-loading in the Spec.
Software overhead? Or there's not many 2 or more pages read?

Thank you,
Kyungmin Park
