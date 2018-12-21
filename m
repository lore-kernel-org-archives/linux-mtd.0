Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaI9i-0006RS-UY
 for linux-mtd@lists.infradead.org; Fri, 21 Dec 2018 10:35:48 +0000
Received: by mail-pf1-x441.google.com with SMTP id q1so2424079pfi.5
 for <linux-mtd@lists.infradead.org>; Fri, 21 Dec 2018 02:35:36 -0800 (PST)
Date: Fri, 21 Dec 2018 13:35:30 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, hsiangkao@mail.ru,
 kirill.shutemov@linux.intel.com, stable@vger.kernel.org,
 zhangjun <openzhangj@gmail.com>
Subject: Re: [PATCH] ubifs: Get/put page when changing PG_private
Message-ID: <20181221103530.zahcs4gm5mlknhug@kshutemo-mobl1>
References: <20181215150130.19381-1-richard@nod.at>
 <386368225.TvJUPtmGVW@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <386368225.TvJUPtmGVW@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 21, 2018 at 09:56:25AM +0100, Richard Weinberger wrote:
> Am Samstag, 15. Dezember 2018, 16:01:30 CET schrieb Richard Weinberger:
> > The page migration code assumes that a page with PG_private
> > set has its page count elevated by 1.
> > UBIFS never did this and therefore the migration code was unable
> > to migrate some pages owned by UBIFS.
> > The lead to situations where the CMA memory allocator failed to
> > allocate memory.
> > 
> > Fix this by using get/put_page when changing PG_private.
> > 
> > Cc: <stable@vger.kernel.org>
> > Cc: zhangjun <openzhangj@gmail.com>
> > Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")
> > Reported-by: zhangjun <openzhangj@gmail.com>
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> FYI, on the XFS side a similar change caused a regression.
> https://marc.info/?l=linux-fsdevel&m=154530861202448&w=2
> 
> Until this regression is not fully understood, including the implications
> for UBIFS, I'll not merge this patch.

This looks like a reasonable resolution to me:

http://lkml.kernel.org/r/20181221093919.GA2337@lst.de

But let's wait the inclusion (or objection).

-- 
 Kirill A. Shutemov
