Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaGbn-0004gE-Ii
 for linux-mtd@lists.infradead.org; Fri, 21 Dec 2018 08:56:41 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 hsiangkao@mail.ru, kirill.shutemov@linux.intel.com, stable@vger.kernel.org,
 zhangjun <openzhangj@gmail.com>
Subject: Re: [PATCH] ubifs: Get/put page when changing PG_private
Date: Fri, 21 Dec 2018 09:56:25 +0100
Message-ID: <386368225.TvJUPtmGVW@blindfold>
In-Reply-To: <20181215150130.19381-1-richard@nod.at>
References: <20181215150130.19381-1-richard@nod.at>
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

Am Samstag, 15. Dezember 2018, 16:01:30 CET schrieb Richard Weinberger:
> The page migration code assumes that a page with PG_private
> set has its page count elevated by 1.
> UBIFS never did this and therefore the migration code was unable
> to migrate some pages owned by UBIFS.
> The lead to situations where the CMA memory allocator failed to
> allocate memory.
> 
> Fix this by using get/put_page when changing PG_private.
> 
> Cc: <stable@vger.kernel.org>
> Cc: zhangjun <openzhangj@gmail.com>
> Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")
> Reported-by: zhangjun <openzhangj@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

FYI, on the XFS side a similar change caused a regression.
https://marc.info/?l=linux-fsdevel&m=154530861202448&w=2

Until this regression is not fully understood, including the implications
for UBIFS, I'll not merge this patch.

Thanks,
//richard
