Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYqcz-0001Co-Ga
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 11:00:03 +0000
Received: by mail-pf1-x442.google.com with SMTP id u6so6182536pfh.11
 for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2018 02:59:50 -0800 (PST)
Date: Mon, 17 Dec 2018 13:59:44 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, hsiangkao@mail.ru,
 kirill.shutemov@linux.intel.com, stable@vger.kernel.org,
 zhangjun <openzhangj@gmail.com>
Subject: Re: [PATCH] ubifs: Get/put page when changing PG_private
Message-ID: <20181217105944.a7eylrxi5pni4mqq@kshutemo-mobl1>
References: <20181215150130.19381-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181215150130.19381-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 15, 2018 at 04:01:30PM +0100, Richard Weinberger wrote:
> The page migration code assumes that a page with PG_private
> set has its page count elevated by 1.
> UBIFS never did this and therefore the migration code was unable
> to migrate some pages owned by UBIFS.
> The lead to situations where the CMA memory allocator failed to
> allocate memory.
> 
> Fix this by using get/put_page when changing PG_private.

Looks good to me.

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

> Cc: <stable@vger.kernel.org>
> Cc: zhangjun <openzhangj@gmail.com>
> Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")

It is fair to reference the commit here. But I believe the bug itself
predates the commit and relevant not only for migration.

We might make it clear in the commit message.

-- 
 Kirill A. Shutemov
