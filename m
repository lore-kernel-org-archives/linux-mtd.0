Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWll-0000wQ-W6
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:10:53 +0000
Received: by yxk30 with SMTP id 30so284231yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 03:10:48 -0700 (PDT)
Subject: RE: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: roman.tereshonkov@nokia.com
In-Reply-To: <1307354557.3112.21.camel@localhost>
References: <20110602064832.GA7319@july> <1307115701.3069.20.camel@localhost>
	<E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
	<1307354557.3112.21.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 13:06:31 +0300
Message-ID: <1307354791.3112.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org, dwmw2@infradead.org,
	m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 13:02 +0300, Artem Bityutskiy wrote:
> On Mon, 2011-06-06 at 09:42 +0000, roman.tereshonkov@nokia.com wrote:
> > What do mean by "no case to use the subpage"?
> > 
> > According to the spec KFM4G16Q4M-xEBx the Number of Partial Program Cycles in the page (NOP)
> > is equal to 4 -> subpage_sft=2.
> 
> I thought this means "not supported by HW". But if this is supported,
> then I'm very surprised why would we remove it. I'm dropping this patch
> from my tree.

OK, I actually did not put it to the l2 tree. And AFAICS this patch
basically reverts commit 99b17c08bca2810f5910b3027f1b9d82edf7a576, but
still leaves the data structures like onenand_oob_128.

So NACK for this patch - poor commit message, weird changes. I'm
surprised to see this from kmpark.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
