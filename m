Return-Path: <SRS0=vhf6=CV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CF5C433E2
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2020 06:18:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA2F208FE
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2020 06:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3fkv1rg+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZyDz7oU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA2F208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B8LWE5Sw3k0iZ7xNnAdIk2huEscRsyAucbsJWDScsak=; b=3fkv1rg+M2eVKzbEU8uUZzu3Z
	uROiPm/i4Zjtgw/3JSk21vu/5tfz96MFf2rJxCuDuhfSgGrXjCwbqBdEWlL0/zcbCZDWMIoGa3KHs
	f8SQyNTwEZTYJz4PIyqBwsi7CKoaH/RBykSmLOk3eHlKEuFCIKtx8kiyNdPte8mmu4eGVa6MvEe4E
	lhabwzoYXMn/qefvZve+aI4tx2MLmPI2a7ILx83/Joedz2X6TLXUaUdfLoakBqeWyTX3rd1ii3+57
	OPlnlsh0OH5Ji2G31kGQMLSRryjHJof/l/jg3+CT3AesxjsjxU7/BSsKKvXElTwHmDoYwW0JHVE9M
	dLLqB/BoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGyr5-0006Lu-JR; Sat, 12 Sep 2020 06:17:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGyr3-0006Kx-7G
 for linux-mtd@lists.infradead.org; Sat, 12 Sep 2020 06:17:46 +0000
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32BD8221E3
 for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2020 06:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599891461;
 bh=uuS+Z49skG3lx+esbagnWe105drLTNKLOy8Ma2dzjMo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dZyDz7oUXmzrS2wbdCR1OjKcH7321NGa7jyxMDH4h/o9UFLTl0K1PPE+nTnMPNcaO
 pFhcF7zZNdVWBScpmda30k1PDw7hv27W+vep/NtOAu79ccmU1uTlmfOyQ7QIgiL3rv
 v+vZsGweGVfhdRtBDeOgxgmo0SHmfbkdHi6VqF9g=
Received: by mail-lf1-f46.google.com with SMTP id q8so8037145lfb.6
 for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2020 23:17:41 -0700 (PDT)
X-Gm-Message-State: AOAM532GAm4+B0LIYyq+mD084mYbW7sGF1OFWglKlFxHea0XFW/CJxi2
 ++bxj8h4Grle+lJV30wHNQxcnXoOqNMhPiBfDWg=
X-Google-Smtp-Source: ABdhPJxOiiANvrJ6fr7d6kLKZBhdGAMugfK2BYTTNlwkd2Y5yYk1Y7sPwQKbOfKHnZSoz9jAWmxnXjr56qyYcRtmpeU=
X-Received: by 2002:a19:cc09:: with SMTP id c9mr1179259lfg.482.1599891459438; 
 Fri, 11 Sep 2020 23:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-6-hch@lst.de>
In-Reply-To: <20200910144833.742260-6-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Fri, 11 Sep 2020 23:17:28 -0700
X-Gmail-Original-Message-ID: <CAPhsuW56nRgq_hAs4zdg+qabVsbyYkmZk2+4+4ykzbg0Aa=W2g@mail.gmail.com>
Message-ID: <CAPhsuW56nRgq_hAs4zdg+qabVsbyYkmZk2+4+4ykzbg0Aa=W2g@mail.gmail.com>
Subject: Re: [PATCH 05/12] md: update the optimal I/O size on reshape
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_021745_329209_4E2072EE 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 cgroups@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The raid5 and raid10 drivers currently update the read-ahead size,
> but not the optimal I/O size on reshape.  To prepare for deriving the
> read-ahead size from the optimal I/O size make sure it is updated
> as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
