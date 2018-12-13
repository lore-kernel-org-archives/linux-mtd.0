Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXShf-0007ws-9y
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 15:15:08 +0000
Received: by mail-oi1-x241.google.com with SMTP id t204so1876314oie.7
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 07:14:56 -0800 (PST)
Subject: Re: ubifs: fix page_count in ->ubifs_migrate_page()
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com, hch@lst.de,
 linux-fsdevel@vger.kernel.org
References: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
 <5829763.q4qAXljTxb@blindfold>
From: zhangjun <openzhangj@gmail.com>
Message-ID: <16c76437-d331-ac37-9c08-148189f9d98f@gmail.com>
Date: Thu, 13 Dec 2018 23:14:37 +0800
MIME-Version: 1.0
In-Reply-To: <5829763.q4qAXljTxb@blindfold>
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


On 2018/12/13 下午10:23, Richard Weinberger wrote:
> Hello zhangjun,
>
> thanks a lot for bringing this up!
>
> Am Mittwoch, 12. Dezember 2018, 15:13:57 CET schrieb zhangjun:
>> Because the PagePrivate() in UBIFS is different meanings,
>> alloc_cma() will fail when one dirty page cache located in
>> the type of MIGRATE_CMA
>>
>> If not adjust the 'extra_count' for dirty page,
>> ubifs_migrate_page() -> migrate_page_move_mapping() will
>> always return -EAGAIN for:
>> 	expected_count += page_has_private(page)
>> This causes the migration to fail until the page cache is cleaned
>>
>> In general, PagePrivate() indicates that buff_head is already bound
>> to this page, and at the same time page_count() will also increase.
>> But UBIFS set private flag when the cache is dirty, and page_count()
>> not increase.
>> Therefore, the expected_count of UBIFS is different from the general
>> case.
> As you noted, UBIFS uses PG_private a little different.
> It uses it as marker and when set, the page counter is not incremented,
> since no private data is attached.
> The migration code assumes that PG_private indicates a counter of +1.
> So, we have to pass a extra count of -1 to migrate_page_move_mapping() if
> the flag is set.
> Just like F2FS does. Not really nice but hey...
>
>> Signed-off-by: zhangjun <openzhangj@gmail.com>
> Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")
>
>> ---
>>   fs/ubifs/file.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index 1b78f2e..2136a5c 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -1480,8 +1480,15 @@ static int ubifs_migrate_page(struct address_space *mapping,
>>   		struct page *newpage, struct page *page, enum migrate_mode mode)
>>   {
>>   	int rc;
>> +	int extra_count;
>>   
>> -	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
>> +	/*
>> +	 * UBIFS is using PagePrivate() which can have different meanings across
>> +	 * filesystems. So here adjusting the 'extra_count' make it work.
>> +	 */
> Please rewrite that comment.
> /*
>   * UBIFS uses PG_private as marker and does not raise the page counter.
>   * migrate_page_move_mapping() expects a incremented counter if PG_private
>   * is set. Therefore pass -1 as extra_count for this case.
>   */
>
>> +	extra_count = 0 - page_has_private(page);
> if (page_has_private(page))
> 	extra_count = -1;
>
> That way this corner is much more obvious.
>
> Thanks,
> //richard
>
>
Hello Richard.

Thank you very much for your help.

1. Can i use your description for comment? like this:

/*
  * UBIFS uses PG_private a little different.
  * It uses it as marker and when set, the page counter is not incremented,
  * since no private data is attached.
  * The migration code assumes that PG_private indicates a counter of +1.
  * So, we have to pass a extra count of -1 to migrate_page_move_mapping() if
  * the flag is set.
  */

2. It's more obvious, but the branch may break the cpu pipeline?
