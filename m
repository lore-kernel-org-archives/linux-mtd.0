Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0vzr-0002jJ-HD
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 20:14:41 +0000
Received: by mail-io0-x244.google.com with SMTP id x86so6975181ioe.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 13:14:19 -0700 (PDT)
Date: Wed, 19 Apr 2017 13:14:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geliang Tang <geliangtang@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdswap: use MTDSWAP_ECNT_MIN/MAX
Message-ID: <20170419201416.GE20555@google.com>
References: <254e9f859fdb1f850c1d3bd5777e97bf468b4e5a.1482225376.git.geliangtang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <254e9f859fdb1f850c1d3bd5777e97bf468b4e5a.1482225376.git.geliangtang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 20, 2016 at 09:54:33PM +0800, Geliang Tang wrote:
> Since macros MTDSWAP_ECNT_MIN() and MTDSWAP_ECNT_MAX() have been
> defined in mtdswap.c, use them instead of open-coding.
> 
> Signed-off-by: Geliang Tang <geliangtang@gmail.com>

Applied to l2-mtd.git
