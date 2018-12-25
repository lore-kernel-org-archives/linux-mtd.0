Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gbtwI-0003Sx-U5
 for linux-mtd@lists.infradead.org; Tue, 25 Dec 2018 21:08:36 +0000
From: Richard Weinberger <richard@nod.at>
To: zhangjun <openzhangj@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, hsiangkao@mail.ru,
 kirill.shutemov@linux.intel.com, stable@vger.kernel.org
Subject: Re: [PATCH] ubifs: Get/put page when changing PG_private
Date: Tue, 25 Dec 2018 22:08:09 +0100
Message-ID: <39657760.jfV4gqXEqu@blindfold>
In-Reply-To: <b9def265-5e93-a451-0f7b-91c0edac0b00@gmail.com>
References: <20181215150130.19381-1-richard@nod.at>
 <386368225.TvJUPtmGVW@blindfold>
 <b9def265-5e93-a451-0f7b-91c0edac0b00@gmail.com>
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

Am Dienstag, 25. Dezember 2018, 03:42:37 CET schrieb zhangjun:
> Hello,richard
> 
> 
> Before fully understanding this regression, in order to fix the bug of 
> cma_alloc(),
> submit a conservative patch that modifies count in iomap_migrate_page().
> Can you consider merging first?

No. There is no need to rush.
As it looks like the iomap regression is trivial, Christoph pointed out
that a case was forgotten.
But Dave is currently (like almost all of us) on vacation to confirm.

Thanks,
//richard
