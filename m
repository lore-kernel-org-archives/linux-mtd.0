Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYr8Q-0006x7-BZ
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 11:32:32 +0000
From: Richard Weinberger <richard@nod.at>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, hsiangkao@mail.ru,
 kirill.shutemov@linux.intel.com, stable@vger.kernel.org,
 zhangjun <openzhangj@gmail.com>
Subject: Re: [PATCH] ubifs: Get/put page when changing PG_private
Date: Mon, 17 Dec 2018 12:32:04 +0100
Message-ID: <1605618.KFvAoLHJ4l@blindfold>
In-Reply-To: <20181217105944.a7eylrxi5pni4mqq@kshutemo-mobl1>
References: <20181215150130.19381-1-richard@nod.at>
 <20181217105944.a7eylrxi5pni4mqq@kshutemo-mobl1>
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

Am Montag, 17. Dezember 2018, 11:59:44 CET schrieb Kirill A. Shutemov:
> On Sat, Dec 15, 2018 at 04:01:30PM +0100, Richard Weinberger wrote:
> > The page migration code assumes that a page with PG_private
> > set has its page count elevated by 1.
> > UBIFS never did this and therefore the migration code was unable
> > to migrate some pages owned by UBIFS.
> > The lead to situations where the CMA memory allocator failed to
> > allocate memory.
> > 
> > Fix this by using get/put_page when changing PG_private.
> 
> Looks good to me.
> 
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> 
> > Cc: <stable@vger.kernel.org>
> > Cc: zhangjun <openzhangj@gmail.com>
> > Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")
> 
> It is fair to reference the commit here. But I believe the bug itself
> predates the commit and relevant not only for migration.

My intention was not blaming you. :)
IMHO backporting the fix makes only sense up to that commit.
 
> We might make it clear in the commit message.

Fair point, I'll rephrase.

Thanks,
//richard
