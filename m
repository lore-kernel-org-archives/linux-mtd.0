Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECD8C021B2
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:Cc:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47/R7ESMUWVqcSc+8HCiP/4R71R6zd+JDb8ICCmTxB4=; b=f2n8GoQ5poMbaV
	7frj1pbXK4o9+cO49eVp3Fi0Htl09FYOMM2t6u2uPwIXBw5EDoDSFsrQGO+DU/oBCm63S6cbvc50U
	1o11sw0l+2Z1el7wZp3DiVkwDHINupPeuMBEvMzyFT90Xq0nk1Yj/YR4FOjN9nSEYzZXMOOBV6jO7
	5ksC+y6ET9HsQFLxrO908UPo1qjerg25luSQP1bzpe6BxgfCDVicyd4guEUO8oP7GFMuU92kaJN1L
	bUMBHpprZXTb1BzI94WymYji8X62whCM713BMcIoj9GAeRFsspJqYpGE6sqN/eWh+wbBF8OBOWFRN
	C8tH740nVz9ATgs3u7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1M-00000000M6M-1Lus;
	Tue, 25 Feb 2025 16:43:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwh7-000000003Ad-34BH
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 15:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740496680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QyH+Q7MigOrd7puvdyRTTPCeyR6wog0WvQSvTNgWAg=;
	b=AvG2vLT2UyMKt4n8R5Dj70DkM8Z3ZMvzKuQ1gIoX2aUdqE+uuxuS1SKIaj1lV4AiI4Mtki
	DLbQ/E90uiZ2IDtmxa3Sst5RjQ8/43nDjXsMFZOm5SpSge7vFoT2aE8Bfh0C3adhlSGkHA
	Foj2nRCWD9v5FccOYj3/9AsMw2W4X4w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-q8YtqpU0OC6xToOGXJ3YDQ-1; Tue,
 25 Feb 2025 10:17:53 -0500
X-MC-Unique: q8YtqpU0OC6xToOGXJ3YDQ-1
X-Mimecast-MFC-AGG-ID: q8YtqpU0OC6xToOGXJ3YDQ_1740496667
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1840F1A24789;
	Tue, 25 Feb 2025 15:16:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.9])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A8A29180194B;
	Tue, 25 Feb 2025 15:16:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <8f36be7c-6052-4c5d-85ff-0eed27cf1456@icloud.com>
References: <8f36be7c-6052-4c5d-85ff-0eed27cf1456@icloud.com> <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com> <20250221-rmv_return-v1-1-cc8dff275827@quicinc.com> <20250221200137.GH7373@noisy.programming.kicks-ass.net>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Will Deacon <will@kernel.org>,
    "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>,
    Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
    Thomas Gleixner <tglx@linutronix.de>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    "Rafael J. Wysocki" <rafael@kernel.org>,
    Danilo Krummrich <dakr@kernel.org>,
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
    Johannes Berg <johannes@sipsolutions.net>,
    Jamal Hadi Salim <jhs@mojatatu.com>,
    Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
    Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
    Linus Walleij <linus.walleij@linaro.org>,
    Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
    Thomas Graf <tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>,
    Marek Szyprowski <m.szyprowski@samsung.com>,
    Robin Murphy <robin.murphy@arm.com>,
    Miquel Raynal <miquel.raynal@bootlin.com>,
    Richard Weinberger <richard@nod.at>,
    Vignesh Raghavendra <vigneshr@ti.com>, linux-arch@vger.kernel.org,
    linux-mm@kvack.org, linux-kernel@vger.kernel.org,
    linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
    linux-wireless@vger.kernel.org, linux-rdma@vger.kernel.org,
    linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
    iommu@lists.linux.dev, linux-mtd@lists.infradead.org
Subject: Re: [PATCH *-next 01/18] mm/mmu_gather: Remove needless return in void API tlb_remove_page()
MIME-Version: 1.0
Content-ID: <2298250.1740496596.1@warthog.procyon.org.uk>
Date: Tue, 25 Feb 2025 15:16:36 +0000
Message-ID: <2298251.1740496596@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_071801_836147_EB9D5F42 
X-CRM114-Status: GOOD (  18.62  )
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

Zijun Hu <zijun_hu@icloud.com> wrote:

> >>  static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
> >>  {
> >> -	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
> >> +	tlb_remove_page_size(tlb, page, PAGE_SIZE);
> >>  }
> > So I don't mind removing it, but note that that return enforces
> > tlb_remove_page_size() has void return type.
> >
> 
> tlb_remove_page_size() is void function already. (^^)

That may be true... for now.  But if that is changed in the future, then you
will get an error indicating something you need to go and look at... so in
that regard, it's *better* to do this ;-)

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
