Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gbcgJ-0002EN-CC
 for linux-mtd@lists.infradead.org; Tue, 25 Dec 2018 02:42:59 +0000
Received: by mail-ot1-x341.google.com with SMTP id a11so11771449otr.10
 for <linux-mtd@lists.infradead.org>; Mon, 24 Dec 2018 18:42:44 -0800 (PST)
Subject: Re: [PATCH] ubifs: Get/put page when changing PG_private
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 hsiangkao@mail.ru, kirill.shutemov@linux.intel.com, stable@vger.kernel.org
References: <20181215150130.19381-1-richard@nod.at>
 <386368225.TvJUPtmGVW@blindfold>
From: zhangjun <openzhangj@gmail.com>
Message-ID: <b9def265-5e93-a451-0f7b-91c0edac0b00@gmail.com>
Date: Tue, 25 Dec 2018 10:42:37 +0800
MIME-Version: 1.0
In-Reply-To: <386368225.TvJUPtmGVW@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018/12/21 下午4:56, Richard Weinberger wrote:
> Am Samstag, 15. Dezember 2018, 16:01:30 CET schrieb Richard Weinberger:
>> The page migration code assumes that a page with PG_private
>> set has its page count elevated by 1.
>> UBIFS never did this and therefore the migration code was unable
>> to migrate some pages owned by UBIFS.
>> The lead to situations where the CMA memory allocator failed to
>> allocate memory.
>>
>> Fix this by using get/put_page when changing PG_private.
>>
>> Cc: <stable@vger.kernel.org>
>> Cc: zhangjun <openzhangj@gmail.com>
>> Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")
>> Reported-by: zhangjun <openzhangj@gmail.com>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> FYI, on the XFS side a similar change caused a regression.
> https://marc.info/?l=linux-fsdevel&m=154530861202448&w=2
>
> Until this regression is not fully understood, including the implications
> for UBIFS, I'll not merge this patch.
>
> Thanks,
> //richard
>
>
Hello,richard


Before fully understanding this regression, in order to fix the bug of 
cma_alloc(),
submit a conservative patch that modifies count in iomap_migrate_page().
Can you consider merging first?

https://marc.info/?l=linux-kernel&m=154473132332661&w=2


Thanks
//zhangjun
