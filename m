Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fa6aA-0003l3-Lt
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 21:42:12 +0000
From: Richard Weinberger <richard@nod.at>
To: Kees Cook <keescook@chromium.org>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Silvio Cesare <silvio.cesare@gmail.com>,
 "# 3.4.x" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] Revert "UBIFS: Fix potential integer overflow in
 allocation"
Date: Mon, 02 Jul 2018 23:41:42 +0200
Message-ID: <5400614.4lJzJ1gdXR@blindfold>
In-Reply-To: <CAGXu5jJabYkC06ZGa1X2HweY8idyDR8a2y805btY5jKMHKbSuA@mail.gmail.com>
References: <20180701212051.29486-1-richard@nod.at>
 <2073665.T6vW7v0NJO@blindfold>
 <CAGXu5jJabYkC06ZGa1X2HweY8idyDR8a2y805btY5jKMHKbSuA@mail.gmail.com>
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

Am Montag, 2. Juli 2018, 20:27:00 CEST schrieb Kees Cook:
> > Let's queue another patch for the next merge window which converts
> > kmalloc() -> kmalloc_array().
> 
> I'd prefer to leave it as-is for 4.18 because it would be the only
> unconverted kmalloc()-with-multiplication in the entire tree. We did
> treewide conversions and a revert would be undoing that here. (The
> scripts that check for this case would run "clean" for 4.18.)
> 
> So, this gets back to the question of the int vs u32: if you just
> didn't revert this patch, then the kmalloc_array() would stand too.
> Easy! :)

I can queue the kmalloc_array() conversion on top of the revert.
But TBH, using kmalloc_array() here is just ridiculous, we allocate
dn->size times 2 where dn->size is at most 4k.

Thanks,
//richard
