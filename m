Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IG7gJ-0006sq-Kj
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 02:27:43 -0400
Message-ID: <46B0272C.6040504@nokia.com>
Date: Wed, 01 Aug 2007 09:24:44 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kmpark@infradead.org
Subject: Re: [RFC PATCH] [MTD] [OneNAND] Cache Read support
References: <001501c7d3d1$bcf66b40$e1ac580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <001501c7d3d1$bcf66b40$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> This patch supports the Cache Read feature in OneNAND.
> It's similar with read-while-loading except while read it does sensing the page buffer in NAND core.
> So it's called Transfer-While-Sensing. you can find it in OneNAND Spec. in detail.
> 
> Now there's no big performance gain in our test board, Apollon(OMAP2). But others are maybe different.
> 
> Any comments are welcome.

Cool!

Presume you have run the NAND tests
