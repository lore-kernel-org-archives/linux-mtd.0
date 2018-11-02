Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIg4e-0000oL-9Y
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 20:29:46 +0000
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: replay: fix high stack usage
Date: Fri, 02 Nov 2018 21:29:30 +0100
Message-ID: <22023095.Sk82ml8AZ4@blindfold>
In-Reply-To: <20181102153932.1750967-1-arnd@arndb.de>
References: <20181102153932.1750967-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 2. November 2018, 16:39:24 CET schrieb Arnd Bergmann:
> Having two shash descriptors on the stack cause a very significant kernel
> stack usage that can cross the warning threshold:
> 
> fs/ubifs/replay.c: In function 'authenticate_sleb':
> fs/ubifs/replay.c:633:1: error: the frame size of 1144 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> 
> Normally, gcc optimizes the out, but with CONFIG_CC_OPTIMIZE_FOR_DEBUGGING,
> it does not. Splitting the two stack allocations into separate functions
> means that they will use the same memory again. In normal configurations
> (optimizing for size or performance), those should get inlined and we get
> the same behavior as before.

Thanks for addressing this, applied!

Thanks,
//richard
