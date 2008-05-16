Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwsCy-0004BW-RJ
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 05:10:21 +0000
Date: Fri, 16 May 2008 07:10:01 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] NAND subpage read feature as a way to increase
	performance. Take 2.
Message-ID: <20080516051001.GA11460@logfs.org>
References: <Pine.LNX.4.64.0805151643360.32186@pentafluge.infradead.org>
	<1210914078.27243.13.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1210914078.27243.13.camel@sauron>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>, hamish@cloud.net.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 May 2008 08:01:18 +0300, Artem Bityutskiy wrote:
> On Thu, 2008-05-15 at 17:23 +0100, Alexey Korolev wrote:
> > Hi, 
> > 
> > This patch enables NAND subpage read functionality. 
> > If upper layer drivers are requesting to read non page aligned data NAND
> > subpage-read functionality reads the only whose ECC regions which include
> > requested data when original code reads whole page.
> > This significantly improves performance in many cases. 
> > 
> > Here are some digits :
> > 
> > UBI volume mount time
> > No subpage reads: 5.75 seconds
> > Subpage read patch: 2.42 seconds
> > 
> > Open/stat time for files on JFFS2 volume:
> > No subpage read  0m 5.36s
> > Subpage read     0m 2.88s
> > 
> > Signed-off-by Alexey Korolev <akorolev@infradead.org>
> > -------------------------
> 
> Looks good to me,
> Acked-by Artem Bityutskiy <dedekind@infradead.org>

Same here
Acked-by: Joern Engel <joern@logfs.org>

Jörn

-- 
Joern's library part 6:
http://www.gzip.org/zlib/feldspar.html
