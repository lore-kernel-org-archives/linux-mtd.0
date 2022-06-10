Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264CAC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jun 2022 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/J1RxSLlJJlUTUlGO0FXaVTD5POaLPprr0QCBk9Lm8=; b=b2v+HrAHrV6Olt
	8xLVCKCZRHJgDv0mPLZz+R4wWFNeYPg0aN9XD3ZMy3fJ/a0BgBKpeiPWhGgWbHak7DY3C5g3R9FUr
	i8XaUcw3s3D1J44p3ytzrwDU/Kz3koCv2ZcG3iM6Ckd99R1y0m4UJ1HErVm2Oxkca+1hWbDP3D4yV
	gUH1x2k1nZP1t3HnE7lVxxask7GCXp5bqOfarHxOMoB8KUHVIRI4n0981E4V0maIoBfeVk1hrkpPY
	PIL3SxMDx1ELOeTuHwMaX2UI2PcQVcm3h6zRD31RhkOIdc3bDQhRCOtFJOlxTCS/jGjB2k4/ZyF6d
	fQVGAH4nv0JbRRLbuG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbiA-007Y1V-4O; Fri, 10 Jun 2022 10:17:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbi3-007XvZ-1F
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2022 10:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654856258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=;
	b=eLYgCVuG0zvOXKTmMaOwP6SNVlBXhzUjqF5QSpK4+tx/jRoHKlpj0rUkGC1UAleaOvghD6
	AE/0HOJPP5GnBRt4/1/x0JpVZGbqBvQ6Kmysabbq6qdTsG6mfmaKpwhXHIhukQ24SaFFXb
	l3d4Nrtesr/Vi4T7IjNKu95kj2hgdpE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-PvcMu712OBaTJsGf9GUffA-1; Fri, 10 Jun 2022 06:17:36 -0400
X-MC-Unique: PvcMu712OBaTJsGf9GUffA-1
Received: by mail-wm1-f69.google.com with SMTP id k16-20020a7bc310000000b0038e6cf00439so1126171wmj.0
        for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2022 03:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=;
        b=mIeU4wViaKNnD+q9z6tfwY+Vdgi2rsDf2aagbDqFqx67IOOOEkHKdw0MA+/i6SXHl+
         859hRlXbZMceb3vy7rj8o+3o7kFnT/wIO7iOZ0Gc+fy4PafeT8UCriy6c2Pmp7os83HQ
         /nerIlrfwucYVyDCdUspUmiKAFST8PXmA24jjNNWnWefYRfEvWZI7/960c+ISTY0iLBw
         DsT8h+iPxlzFePJuO8w/muA5T5hywu5VsLb97BTg1Yrzb0fdSrdl43SoVcoHDMTKcN5i
         FI9J/O2p9V4OdFEc1iX740TW5MH/EapbIIWdM6+yY8xY+KefSLK5ofO/jPOxUFQRWXqk
         EUVw==
X-Gm-Message-State: AOAM533EEg8QCLoUU7mtEXekQwdjH9egd/ks648gS6loWXvMIuDue/cD
	NDlsHJDrv5QOtraXlspOO3WAsyz/pw76jED4DNg37u8NyN9Ikx0b0zvyLTBncdvtnJR5TJ6dJDg
	7WcfGLjTAGPHn/c59283zxtMRtQ==
X-Received: by 2002:a05:6000:91:b0:217:8efc:f572 with SMTP id m17-20020a056000009100b002178efcf572mr29122717wrx.186.1654856255657;
        Fri, 10 Jun 2022 03:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMoCknlizO69Nl0wuEIzBALIZP/2+KDolU3ne+3dmHgzec6LJk/2XhtTIsrJ35XnXVn7hgfw==
X-Received: by 2002:a05:6000:91:b0:217:8efc:f572 with SMTP id m17-20020a056000009100b002178efcf572mr29122693wrx.186.1654856255339;
        Fri, 10 Jun 2022 03:17:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:1f00:4727:6420:1d4d:ca23? (p200300cbc7051f00472764201d4dca23.dip0.t-ipconnect.de. [2003:cb:c705:1f00:4727:6420:1d4d:ca23])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c4f5100b0039c4f53c4fdsm3105741wmq.45.2022.06.10.03.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 03:17:34 -0700 (PDT)
Message-ID: <e287a12d-29d9-da69-9315-52414341cbd1@redhat.com>
Date: Fri, 10 Jun 2022 12:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 03/19] fs: Add aops->migrate_folio
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-aio@kvack.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-4-willy@infradead.org>
 <b2a81248-03fc-afb3-1041-d8206e95e08a@redhat.com>
 <YqIFHPJZNMrmtXlh@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YqIFHPJZNMrmtXlh@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_031743_288004_CAD52C63 
X-CRM114-Status: GOOD (  21.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09.06.22 16:35, Matthew Wilcox wrote:
> On Thu, Jun 09, 2022 at 02:50:20PM +0200, David Hildenbrand wrote:
>> On 08.06.22 17:02, Matthew Wilcox (Oracle) wrote:
>>> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
>>> index c0fe711f14d3..3d28b23676bd 100644
>>> --- a/Documentation/filesystems/locking.rst
>>> +++ b/Documentation/filesystems/locking.rst
>>> @@ -253,7 +253,8 @@ prototypes::
>>>  	void (*free_folio)(struct folio *);
>>>  	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>>  	bool (*isolate_page) (struct page *, isolate_mode_t);
>>> -	int (*migratepage)(struct address_space *, struct page *, struct page *);
>>> +	int (*migrate_folio)(struct address_space *, struct folio *dst,
>>> +			struct folio *src, enum migrate_mode);
>>>  	void (*putback_page) (struct page *);
>>
>> isolate_page/putback_page are leftovers from the previous patch, no?
> 
> Argh, right, I completely forgot I needed to update the documentation in
> that patch.
> 
>>> +++ b/Documentation/vm/page_migration.rst
>>> @@ -181,22 +181,23 @@ which are function pointers of struct address_space_operations.
>>>     Once page is successfully isolated, VM uses page.lru fields so driver
>>>     shouldn't expect to preserve values in those fields.
>>>  
>>> -2. ``int (*migratepage) (struct address_space *mapping,``
>>> -|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
>>> -
>>> -   After isolation, VM calls migratepage() of driver with the isolated page.
>>> -   The function of migratepage() is to move the contents of the old page to the
>>> -   new page
>>> -   and set up fields of struct page newpage. Keep in mind that you should
>>> -   indicate to the VM the oldpage is no longer movable via __ClearPageMovable()
>>> -   under page_lock if you migrated the oldpage successfully and returned
>>> -   MIGRATEPAGE_SUCCESS. If driver cannot migrate the page at the moment, driver
>>> -   can return -EAGAIN. On -EAGAIN, VM will retry page migration in a short time
>>> -   because VM interprets -EAGAIN as "temporary migration failure". On returning
>>> -   any error except -EAGAIN, VM will give up the page migration without
>>> -   retrying.
>>> -
>>> -   Driver shouldn't touch the page.lru field while in the migratepage() function.
>>> +2. ``int (*migrate_folio) (struct address_space *mapping,``
>>> +|	``struct folio *dst, struct folio *src, enum migrate_mode);``
>>> +
>>> +   After isolation, VM calls the driver's migrate_folio() with the
>>> +   isolated folio.  The purpose of migrate_folio() is to move the contents
>>> +   of the source folio to the destination folio and set up the fields
>>> +   of destination folio.  Keep in mind that you should indicate to the
>>> +   VM the source folio is no longer movable via __ClearPageMovable()
>>> +   under folio if you migrated the source successfully and returned
>>> +   MIGRATEPAGE_SUCCESS.  If driver cannot migrate the folio at the
>>> +   moment, driver can return -EAGAIN. On -EAGAIN, VM will retry folio
>>> +   migration in a short time because VM interprets -EAGAIN as "temporary
>>> +   migration failure".  On returning any error except -EAGAIN, VM will
>>> +   give up the folio migration without retrying.
>>> +
>>> +   Driver shouldn't touch the folio.lru field while in the migrate_folio()
>>> +   function.
>>>  
>>>  3. ``void (*putback_page)(struct page *);``
>>
>> Hmm, here it's a bit more complicated now, because we essentially have
>> two paths: LRU+migrate_folio or !LRU+movable_ops
>> (isolate/migrate/putback page)
> 
> Oh ... actually, this is just documenting the driver side of things.
> I don't really like how it's written.  Here, have some rewritten
> documentation (which is now part of the previous patch):
> 

LGTM, thanks.


-- 
Thanks,

David / dhildenb


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
