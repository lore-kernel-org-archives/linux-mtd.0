Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7D3CF6497
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfdlMvrL7YLFy5lUO9P40j/3RoGiCPwDySypLIuWpAs=; b=h2QUiv4dZrPHLN
	75s9yXvlCcydnUkZuiEs5a6QhJ0cb2r65EGTHYu942pYkvQTu6ewCXNPgWcN9gMqludMuMHS3eqvp
	stC5EqLibSwDLc5klwIVgScOQMx6E6Y6DEYG9Eu+RpSjKqSGtDNto98z6UF3e9NNV5c8ssDH2nerV
	WwHHMqOX9faklI7WM+w1T+NjDmBWAwyUPn799kvdv/q/BFev9C74+nMzS9iK/dXob8bMI7VrmtZVr
	LIazx4PzolJd2+ojdQI+hxIY7ft2wWPSf/PY2dme/ibQ/Fdsu7Dct7tsxmPoBeEHTnx/TgiQZ7eNU
	npESlw+F1Egul4ckvwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sux3k-0000000F2tA-3X8m;
	Sun, 29 Sep 2024 16:46:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sux3g-0000000F2si-3D6V
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 16:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727628366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3vEZhvYn8tPQDHoqmt/r0UXfxhs3Vvrfcdx9VtAA9I=;
	b=UMqkHTX62dCaFKkZi6/ZCQA3kOUm2JgqB9+K4b1SLoRMHxD0Z7CQRmjSbAgZLD+SkSnh82
	PY8DSGTeuk2SG+z4f9sFmhAo7ijaLrisWMUTRi61hNYhoQUScnsqVfUPxPg8C7cfHz7fYJ
	SmDPJRzIaptB+u3TMio6cGZX314Nvv4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-14QygH-jO--D_rZYrfjn3w-1; Sun, 29 Sep 2024 12:46:05 -0400
X-MC-Unique: 14QygH-jO--D_rZYrfjn3w-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a345a02c23so22143835ab.1
        for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2024 09:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727628364; x=1728233164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3vEZhvYn8tPQDHoqmt/r0UXfxhs3Vvrfcdx9VtAA9I=;
        b=kJTs5uLDwA4DHKeTD5n7Bk4t1OH5H6/kVT2LYMxzwPcB36T7zJxXCxk7sbDk3paM9Q
         PqNCa+tlU1hM2GQ0f360gN1ZAMTBCqNZhfYUzlJZV5KGPUkFI9epdMExTjQLVB47W4aW
         4baeauS3pgm+j9NByjhkR/0LtEydxsALo0G2ocsiQQS0c+HFrfVt82Ms7/m7JZ4wvTv5
         uq4/FU4QGh9SaCMQ1RAOynmU1TDI1IWWrI3rHYmiG4hdx62qbQvClL1S6J+RNTesroR7
         p+6/19lne1zgqCm2vUtIMDXQCmPyY7V2OiE4J5kp6t9Tm2g1+qidF3+MdhC3tpkziP9A
         LwrA==
X-Forwarded-Encrypted: i=1; AJvYcCWFttcY7QtS9M9Lubs9xaD27ORPglHjUWeG6Ff1CzA51SAentB8h9Z0y2MZBhZF7bRqsvZk/7Y4P4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPEfy7gSUTR4Uvl3aPNiLtohusZyoLXK0fYeRLd0oFYJjTlG0e
	3eBB+vqFrQw3lt6nfjpHPMF/asItvk0CsfxWLli0YYR0nFSA4C9/l7vVrJ+Xl+lDI/UxAPGDU7+
	cxSTnnb4mgRDS/vanjwDqO5Gz1ZAhBt176Z8f0M5TRHWFmvukozr6w0aqpzSErgD775/0Z1sTRg
	==
X-Received: by 2002:a05:6e02:1c24:b0:3a0:8eb3:5160 with SMTP id e9e14a558f8ab-3a34516a29fmr78182845ab.11.1727628364335;
        Sun, 29 Sep 2024 09:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFKa7iEJhrKcFLLID+TvlSnmBtqAkS9qOuzY/z62/4liU5QoeOkpdnBpuco3ODLgZovG2MfQ==
X-Received: by 2002:a05:6e02:1c24:b0:3a0:8eb3:5160 with SMTP id e9e14a558f8ab-3a34516a29fmr78182735ab.11.1727628364020;
        Sun, 29 Sep 2024 09:46:04 -0700 (PDT)
Received: from [10.0.0.71] (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344d82abbsm19671135ab.33.2024.09.29.09.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2024 09:46:03 -0700 (PDT)
Message-ID: <fde1e3c9-f3ba-450c-ae5d-83abb912d2fe@redhat.com>
Date: Sun, 29 Sep 2024 11:46:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: brauner@kernel.org, David Howells <dhowells@redhat.com>,
 Richard Weinberger <richard@nod.at>
References: <20240926203604.23622-1-sandeen@redhat.com>
 <6081021a-be81-7877-8c1d-5311d9968124@huawei.com>
 <a2ff7d9b-799c-46e3-bd43-1b34bf8fdc66@redhat.com>
 <1075eb6d-9de8-8dcb-cd26-b548e6477206@huawei.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <1075eb6d-9de8-8dcb-cd26-b548e6477206@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_094608_913773_A9C2EDC7 
X-CRM114-Status: GOOD (  12.43  )
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

On 9/28/24 8:57 PM, Zhihao Cheng wrote:
> Above modification can fix the problem, but it looks not so clean.
> There are two main steps for mount/remount in the new API framework:
> 1. Get filesystem configurations by parsing the paramaters from the user data.
> 2. Apply the filesystem configurations to superblock(For mount, a superblock should be allocated first.).
> 
> So, how about doing that like ext4 does:
> 1) the filesystem specified superblock is allocated in fill_super(), not in init_fs_context(), it looks more reasonable, because filesystem doesn't need a new private superblock in remounting process. But, UBIFS has onething different, sb_test() needs volume information which comes from private superblock, so UBFIS private superblock(struct ubifs_info) is allocated in ubifs_mount(). Here, I prefer to keep private superblock allocation still in ubifs_mount(for new mount API, it is called ubifs_get_tree).
> 2) the filesystem configurations(contains mount options) are stored in a separated structure(in ext4, it is called ext4_fs_context), which is allocated in init_fs_context(). For UBIFS, we can define a similar structure to store the filesystem configurations.

Yes, this is what I had mentioned above, i.e. having a separate mount
context in ->fs_private raather than using ->fs_info, I can do it this
way if you prefer. I had just started with dhowell's original
implementation for speed. :)

Thanks,
-Eric


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
