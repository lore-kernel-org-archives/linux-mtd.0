Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B671088E78
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 05:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYKQP1QdTxoQCHF8bnfLRWVT94VGcWoUXec2X8cErlw=; b=p5SYtBfCyMKraH
	EiiQgrmVQ7OXgnGgBvktLh/NLbxhIWfTIYUqk7nJ2isFB4GEIVqtUDITTp1iKsSQQmFamrvGlPFlS
	0s3xxdkt9N46Y5Msl0JUcDnBtb218gICySe2G2TfxnD4TTvwXoxbDnW81P8JnourRK4n6jdQ8IkvP
	QHk/teuzO4MRJrMY2tgmS8d4JL6R/zb6j03U0BWgnOjTZTj1GunrGBwrD4bGyH6su4EKbnAkLtUkA
	Y84CTy/t2Pf3jQoQ4E8z0oCv60wYPFbM2u0kRhgRxLrisjh4xe/I84Y4qHDG91HxOemu6KMYCoc7G
	MVjxRh6Di5Q06nouIMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w364V-00000009xJB-2u0u;
	Thu, 19 Mar 2026 05:37:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w364Q-00000009xIe-1nIm
	for linux-mtd@lists.infradead.org;
	Thu, 19 Mar 2026 05:37:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ab39b111b9so2418585ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2026 22:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773898641; x=1774503441; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60j1lBiHaNA5SIxKdMG0q5Pm6jWzJaZqQXdmPT8/wiA=;
        b=jUx4K6LXBZp5KUeix7tlD8FfGglpQ0GRMl1+l/NnFQHADawm2tS88gYHbAvZVM2+ej
         gKWST+nH8eTixkyGjw+cSfu9V8yhnz4G1HDVnBu40dJTmAO8bu0WJPGVHOO7g465Ou/U
         isi2QUBTVhkkPo5Kuyncb4GXeYX7WcsRWyO/tiXq8a3W2et9wC28+RxGwot2qLGWql2W
         IDJ05+Xof1wHcuyzoFXYihPFLrmHx7p0ElL5snWWCROrT7ioR0mNUUjQx2/m4BJ6wrLl
         kBQOcR+DleCqzkCyijsD2ya5PdypAMlFV7daksXlAPgCNrz2H6zDHp0SuTmIjcUH+0gK
         s/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773898641; x=1774503441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60j1lBiHaNA5SIxKdMG0q5Pm6jWzJaZqQXdmPT8/wiA=;
        b=BXMTWlyri3vc+sbVZObMSLCGF27zkaR5PVdEaeM+CIJmFS9bKRb0kVvH9f1BlJpNZQ
         Ft4VRAZdtuy6zcoUaP8LlLR8x8eNWs9lcaQRARMQoizr49BPn/npIJry/qg5ND44sbxy
         TGwtlCBTSFv3lUs357CZHmUf7t9KPi5Cfn4Zl0QUYTNUG5NfIuyF7bOkf+uGxoNoXh5a
         53fFl53JrygW9xX/xmkQTpsf2f/DKeUpevGtIH95XUp7RUJQap0LIbpbZfBBZeXRiK+h
         QUETDPlAOIPHwGgw5STV9xXcCFBdSFkZ6ZK/Z+eskMLbZDopHw4O7vtCMNhcXwl8WwQv
         zBjA==
X-Forwarded-Encrypted: i=1; AJvYcCX1UiduDmAKZwIjt2GFMROFnErwrysmQ9L6EL7ojq4h2s4SkSC7XKKTWHrVHRd6CpcFIm3jxRlQDOE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2bxh9qfwE2M9D1QTK4zwGnW2laI6SG/Cmkj6GIx6T2GFyJ7KX
	t4jW1pjjguY7EMnO54wFa+ZnUBJq7WPlt3YgKJ5kRv6tLUMjdCVk46EZ
X-Gm-Gg: ATEYQzzAKe0wODiMM2BNi4Y4JQBFIIXF2zmhmfNRSwRueg5SCf688vBuxIfKIScAt5N
	cBlxLM5yIpXU1HbEuUGEkPUE0kq+wNuqHUmsohA2px8m1yFuQYiBlmamrvEI46iP1HhWonXIOWq
	VhE+oWFY6wvJRvJJKyNfrHDywVyvkA4qEKHyA0AT3vAOoqJyQ6S1++rgZm5t1/uVt7NO50fUG1R
	aaUG/2OHW7xF2YxMms5VmCQ/K0DEJlqEWhgF5BZxfjWcDsyPuP3F4RIUTEplJO0/45Y2x96IQte
	z96IxQ9bkPLzf5n/O4nLXiSVXEiMeZth072E8WelgxKUuMJXWt4bKmxmnvBSVkz7TmfHx2R+IAN
	AkqlWoBnLuUEJDrvOZFSxyaqHJjneDHUghBuDHvCdQe13HAyClfyCFUffgsEgtqQhk6Y1ecaXDc
	IzlqH2FhWglEUwp3Emp0QM5bmGG3nBrkM9Mrgdz4SiLUsI
X-Received: by 2002:a17:902:f60b:b0:2ae:a73c:f773 with SMTP id d9443c01a7336-2b06e410d50mr55600955ad.41.1773898641265;
        Wed, 18 Mar 2026 22:37:21 -0700 (PDT)
Received: from google.com ([49.216.182.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e60493asm45836815ad.59.2026.03.18.22.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:37:20 -0700 (PDT)
Date: Thu, 19 Mar 2026 13:37:14 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	jserv <jserv@ccns.ncku.edu.tw>, eleanor15x <eleanor15x@gmail.com>,
	marscheng <marscheng@google.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] lib/list_sort: introduce list_sort_nonatomic() and
 clean up scheduling workarounds
Message-ID: <abuLijcND3mqnUoa@google.com>
References: <20260317165905.1482256-1-visitorckw@gmail.com>
 <abo-vgtDeFNRjG5G@infradead.org>
 <566555015.53186.1773828471518.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <566555015.53186.1773828471518.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_223722_470218_F67B7767 
X-CRM114-Status: GOOD (  18.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2026 at 11:07:51AM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Christoph Hellwig" <hch@infradead.org>
> >> This change leaves the generic list_sort() completely free of
> >> scheduling hacks, simplifies UBIFS's callbacks, and ensures that legacy
> >> long-list sorting workloads remain safe from soft lockups on
> >> non-preemptible kernels.
> > =

> > As said before we really should not add the extra nonatomic API
> > and just do the right thing, and drop the cond_resched in ubifs
> > in a prep patch.
> =

> I think you are right. After inspecting UBIFS's usage of list_sort()
> I feel more confident that we can remove the calls to cond_resched()
> from the compare functions.
> =

> The compare functions are rather cheap, they don't do (blocking)
> MTD io.
> In the GC case each list contains at most as many UBIFS nodes you can
> stuff into a single LEB.
> The replay case is a little different, the replay list can contain
> elements from multiple LEBs. But the UBIFS journal is limited to
> a few LEBs, so the list is likely always at most a few thousand
> elements long.
> So, we always talk about calling the compare functions a few thousand
> times, not millions times.
> =

Great, thanks for verifying this.

I'll prepare a v3 to drop the cond_resched() calls from UBIFS's cmp(),
and remove the if(!++count) from list_sort().

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
