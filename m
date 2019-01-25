Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F3FC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 06:31:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01C3218D2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 06:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OJWPbyS9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01C3218D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIhYcVvYThbHyCseZLW8gmVmHAo6ol6TXrowsnPjo0w=; b=OJWPbyS9Xm54MY
	RUx4hZeVwC7Jn2Z7YoAAJlhBx4A2pdG15yBknbBK2mHU15G/ifgfY5wD81h2bNPcRDQ7Cq6AuY7TJ
	Xmf1oCXyvIQsUadM+vBYMRJVdhLj3kiJBmUkKFpkthTeoL5PKdRUA0janxudBIlc+61HdFkK8fxWy
	T81E8luSKE9t8C8/C+HFkvmXQZ5O18/62+n7mbtL4MDIS7fH9bueVp0TiYarUqjxFdbixv58QRM7L
	J4tngzc48J0H2NnKwo7wjv6/bF2jScRnhq2I45rCRoASscZ8H28CjqKBbP7BpE9/8QPH0W6DYo7o7
	8SPnE5PX9Q6lIiJrEnWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmv1T-0002xD-7i; Fri, 25 Jan 2019 06:31:27 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmv1D-0002wT-Ac
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 06:31:13 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 17C5948EAB8D0F573D97;
 Fri, 25 Jan 2019 14:31:00 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.14) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.408.0; Fri, 25 Jan 2019
 14:30:56 +0800
Subject: Re: [PATCH] jffs2: GC deadlock reading a page that is used in
 jffs2_write_begin()
To: Richard Weinberger <richard.weinberger@gmail.com>, Kyeong Yoo
 <kyeong.yoo@alliedtelesis.co.nz>
References: <149914202384.24318.7331828698981799313.stgit@kyeongy-dl.atlnz.lc>
 <CAFLxGvy4NbfHHoHXaH=sR-3e10+EAbDwLsdM1_Eyk_gT5=HE8Q@mail.gmail.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <9e09a853-9ae6-a92a-8b87-5f94c4187d70@huawei.com>
Date: Fri, 25 Jan 2019 14:30:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvy4NbfHHoHXaH=sR-3e10+EAbDwLsdM1_Eyk_gT5=HE8Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.177.31.14]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_223111_702600_E668E25C 
X-CRM114-Status: GOOD (  24.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On 2018/12/16 6:37, Richard Weinberger wrote:
> On Tue, Jul 4, 2017 at 6:23 AM Kyeong Yoo
> <kyeong.yoo@alliedtelesis.co.nz> wrote:
>>
>> GC task can deadlock in read_cache_page() because it may attempt
>> to release a page that is actually allocated by another task in
>> jffs2_write_begin().
>> The reason is that in jffs2_write_begin() there is a small window
>> a cache page is allocated for use but not set Uptodate yet.
>>
>> This ends up with a deadlock between two tasks:
>> 1) A task (e.g. file copy)
>>    - jffs2_write_begin() locks a cache page
>>    - jffs2_write_end() tries to lock "alloc_sem" from
>>          jffs2_reserve_space() <-- STUCK
>> 2) GC task (jffs2_gcd_mtd3)
>>    - jffs2_garbage_collect_pass() locks "alloc_sem"
>>    - try to lock the same cache page in read_cache_page() <-- STUCK
>>
>> So to avoid this deadlock, hold "alloc_sem" in jffs2_write_begin()
>> while reading data in a cache page.
>>

Acquiring alloc_sem may be too heavy, can we use it as a slow path and using
the following code as the fast path ?

    /*
     * Need to make sure this page is Uptodate before locking it,
     * else the write may dead-lock with the GC thread which tries
     * to wait for unlock a not-Uptodate page.
     */
    gfp_mask = mapping_gfp_mask(mapping);
    if (flags & AOP_FLAG_NOFS)
        gfp_mask &= ~__GFP_FS;
    pg = read_cache_page_gfp(mapping, index, gfp_mask);
    if (IS_ERR(pg)) {
        ret = PTR_ERR(pg);
        goto out_err;
    }

    lock_page(pg);
    /* If page is reclaimed, fall back to slow path */
    if (!pg->mapping) {
        unlock_page(pg);
        put_page(pg);

        /*
         * While getting a page and reading data in, lock c->alloc_sem until
         * the page is Uptodate. Otherwise GC task may attempt to read the same
         * page in read_cache_page(), which causes a deadlock.
         */
        mutex_lock(&c->alloc_sem);
        pg = grab_cache_page_write_begin(mapping, index, flags);

And will the fix go into v5.0 ?

Regards,
Tao

>> Signed-off-by: Kyeong Yoo <kyeong.yoo@alliedtelesis.co.nz>
>> ---
>>
>> Note: I'm resending this patch to linux-mtd.
>>
>>  fs/jffs2/file.c |   40 +++++++++++++++++++++++++---------------
>>  1 file changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
>> index c12476e309c6..eb4e4d784d26 100644
>> --- a/fs/jffs2/file.c
>> +++ b/fs/jffs2/file.c
>> @@ -135,20 +135,15 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
>>         struct page *pg;
>>         struct inode *inode = mapping->host;
>>         struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
>> +       struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
>>         pgoff_t index = pos >> PAGE_SHIFT;
>>         uint32_t pageofs = index << PAGE_SHIFT;
>>         int ret = 0;
>>
>> -       pg = grab_cache_page_write_begin(mapping, index, flags);
>> -       if (!pg)
>> -               return -ENOMEM;
>> -       *pagep = pg;
>> -
>>         jffs2_dbg(1, "%s()\n", __func__);
>>
>>         if (pageofs > inode->i_size) {
>>                 /* Make new hole frag from old EOF to new page */
>> -               struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
>>                 struct jffs2_raw_inode ri;
>>                 struct jffs2_full_dnode *fn;
>>                 uint32_t alloc_len;
>> @@ -159,7 +154,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
>>                 ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
>>                                           ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>>                 if (ret)
>> -                       goto out_page;
>> +                       goto out_err;
>>
>>                 mutex_lock(&f->sem);
>>                 memset(&ri, 0, sizeof(ri));
>> @@ -189,7 +184,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
>>                         ret = PTR_ERR(fn);
>>                         jffs2_complete_reservation(c);
>>                         mutex_unlock(&f->sem);
>> -                       goto out_page;
>> +                       goto out_err;
>>                 }
>>                 ret = jffs2_add_full_dnode_to_inode(c, f, fn);
>>                 if (f->metadata) {
>> @@ -204,7 +199,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
>>                         jffs2_free_full_dnode(fn);
>>                         jffs2_complete_reservation(c);
>>                         mutex_unlock(&f->sem);
>> -                       goto out_page;
>> +                       goto out_err;
>>                 }
>>                 jffs2_complete_reservation(c);
>>                 inode->i_size = pageofs;
>> @@ -212,6 +207,19 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
>>         }
>>
>>         /*
>> +        * While getting a page and reading data in, lock c->alloc_sem until
>> +        * the page is Uptodate. Otherwise GC task may attempt to read the same
>> +        * page in read_cache_page(), which causes a deadlock.
>> +        */
>> +       mutex_lock(&c->alloc_sem);
>> +       pg = grab_cache_page_write_begin(mapping, index, flags);
>> +       if (!pg) {
>> +               ret = -ENOMEM;
>> +               goto release_sem;
>> +       }
>> +       *pagep = pg;
>> +
>> +       /*
>>          * Read in the page if it wasn't already present. Cannot optimize away
>>          * the whole page write case until jffs2_write_end can handle the
>>          * case of a short-copy.
>> @@ -220,15 +228,17 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
>>                 mutex_lock(&f->sem);
>>                 ret = jffs2_do_readpage_nolock(inode, pg);
>>                 mutex_unlock(&f->sem);
>> -               if (ret)
>> -                       goto out_page;
>> +               if (ret) {
>> +                       unlock_page(pg);
>> +                       put_page(pg);
>> +                       goto release_sem;
>> +               }
>>         }
>>         jffs2_dbg(1, "end write_begin(). pg->flags %lx\n", pg->flags);
>> -       return ret;
>>
>> -out_page:
>> -       unlock_page(pg);
>> -       put_page(pg);
>> +release_sem:
>> +       mutex_unlock(&c->alloc_sem);
>> +out_err:
>>         return ret;
>>  }
> 
> Kyeong,
> 
> first of all, sorry for the massive delay!
> 
> Right now I'm trying to get jffs2 back in shape and stumbled across your patch.
> My test suite can actually trigger this deadlock and I think your
> patch is likely the
> right solution. I'm still reviewing and try to make very sure that it
> works as expected.
> 
> David, unless you have objections I'd carry this patch via the MTD tree.
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
