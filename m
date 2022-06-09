Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD82C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udsFl8IVncUO1Ebh0fjgAn5Tpmzgoea+XdB38oQh83s=; b=gF+SaOxTzU9euE
	2i3YM+rcYDiW8Rgxm+PZVl+x9MB3ir+F38YAMstDWvJCWwEsZ8w3mD/j5g0E2NhaZoS4CV1CwyPSx
	hOyrfSI9YWniRLa9H1HfoOzxvme1VNen8cj7rNRn543iIgSgruRSY+nzw0yQ8v7BngTLYz+u79ART
	YmtJYHZoJEaglul2JG6APykUdENDt4+JlvDWjeGXk4fG1irwVANtag0CW/C9KT0RHsU5lcfnszQJb
	AzB6PA+7wdLmbVurSTnTFnXxgT+VTAFftwcyJvIXp5EeJngQq+FobQMBfEWNBxKB0PX/KOyNFIHj7
	o9D7kuH5lyow7ANg3DDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHYK-001s0P-NB; Thu, 09 Jun 2022 12:46:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHYH-001rxY-9w
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654778776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zufIRXqzWNkS/vBQ6LnlofDt3t0aO0GgELLgxZEV3qM=;
	b=bfaVa0reba5JNx1JCCi449akB/iE7w7HJkh+iPewcoKUtXRVntBOZRj18BsRFXEJQD7Xt3
	GObsr5AzbK9k5Qx9iLnaJWAyVgOUUAb6wweVt7qXGOICRsO1ol959im5WFYdFixia0rC7b
	ZHeTquzJ+C6aZV+E1vVG8wDxl9vLE1g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-BXtztT2TM3qA5uILIbTvnw-1; Thu, 09 Jun 2022 08:46:14 -0400
X-MC-Unique: BXtztT2TM3qA5uILIbTvnw-1
Received: by mail-wm1-f71.google.com with SMTP id u12-20020a05600c19cc00b0038ec265155fso15941576wmq.6
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 05:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=zufIRXqzWNkS/vBQ6LnlofDt3t0aO0GgELLgxZEV3qM=;
        b=31FQFhCUSeAm6Lzn4E/ha6s6sL+1TjuwgXv2iBC2LvTD9cbw2uJCyMfQhME0w3Awme
         t7j/muS7QmhWpJEuHpYLa8mal2HKx+yr0tL9DG+0oVVU6mKqICaHhQWcL5dlYNPveOO1
         ZNVmyS0OZTsmWc41h1LB1sx5UtadVMtSUmNrzIdbUXC5NHzsCx1yh9XWIzQ5LQoB3CJn
         W/jqSDKUAjHlZOegPOpehd9qgHJPrQRDUkbsLAJ6NZ/Jt4KsfDwJ6PRokcoKeV+pmw2H
         Q78aq0KjGKs0ULwalneGX6LWgaMKTbWUnKBO5v4IFXb0OMIRb34+TBlwWesiFf1XEWUY
         u5Eg==
X-Gm-Message-State: AOAM5325a/lqAN8plx9m5mE3OyVOvOn+VRS2lqetPgPrkxvWYNOneHjd
	FgLFBDMgAOiH7IEMRCZNGo0L3E67WNgIubeIldn0/Q3O00nwyUai2FsnXy4Kt2ktaCLCRVS0VLh
	bBwrCCCI009hR3SYrQ/tzUS3X0g==
X-Received: by 2002:a05:6000:168b:b0:218:54da:90ba with SMTP id y11-20020a056000168b00b0021854da90bamr12022154wrd.283.1654778773732;
        Thu, 09 Jun 2022 05:46:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFg5i2EPJ88Gv87gtw7EHVrLhSwsyQAltgpPZk1DxRKIUlDObIOhdmhH9jKki5ThpOI9Vqng==
X-Received: by 2002:a05:6000:168b:b0:218:54da:90ba with SMTP id y11-20020a056000168b00b0021854da90bamr12022117wrd.283.1654778773451;
        Thu, 09 Jun 2022 05:46:13 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8? ([2a09:80c0:192:0:20af:34be:985b:b6c8])
        by smtp.gmail.com with ESMTPSA id a7-20020a05600c224700b0039c693a54ecsm3854607wmm.23.2022.06.09.05.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 05:46:12 -0700 (PDT)
Message-ID: <c204c627-ec6b-cd8c-412d-57c8f55c61fa@redhat.com>
Date: Thu, 9 Jun 2022 14:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 01/19] secretmem: Remove isolate_page
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 virtualization@lists.linux-foundation.org
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-2-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220608150249.3033815-2-willy@infradead.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054617_484166_64047FC2 
X-CRM114-Status: GOOD (  15.26  )
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

On 08.06.22 17:02, Matthew Wilcox (Oracle) wrote:
> The isolate_page operation is never called for filesystems, only
> for device drivers which call SetPageMovable.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/secretmem.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 206ed6b40c1d..1c7f1775b56e 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -133,11 +133,6 @@ static const struct file_operations secretmem_fops = {
>  	.mmap		= secretmem_mmap,
>  };
>  
> -static bool secretmem_isolate_page(struct page *page, isolate_mode_t mode)
> -{
> -	return false;
> -}
> -
>  static int secretmem_migratepage(struct address_space *mapping,
>  				 struct page *newpage, struct page *page,
>  				 enum migrate_mode mode)
> @@ -155,7 +150,6 @@ const struct address_space_operations secretmem_aops = {
>  	.dirty_folio	= noop_dirty_folio,
>  	.free_folio	= secretmem_free_folio,
>  	.migratepage	= secretmem_migratepage,
> -	.isolate_page	= secretmem_isolate_page,
>  };
>  
>  static int secretmem_setattr(struct user_namespace *mnt_userns,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
