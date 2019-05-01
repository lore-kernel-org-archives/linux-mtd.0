Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFEFC43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 18:25:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00EBA20645
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 18:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cy+jtNda";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hu/9UibJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00EBA20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbahviOS0fd+DNm64mVOPoyYBPlNsezfexjk2/2AbbI=; b=cy+jtNdadRhs+s
	LUEkpiwJ7jSP77UBw4i57tW4Sv9Rz8P649ousdDmwHTftV84k6sZAZDS5P9FU7WCe0ojCGKWnzGXX
	RaxJCF7u5zvZDzNH8oYwziR475yBs8Cw8oyc0XcIPZ+m0Vp2lv28UlkrkyL9G24GmUcnRdudmm58Y
	b/+btJUGRsQZ7+cJVrFxq9DVXd+9xFRneTqNEn+lXlmYx9IPv/s5u2sLzrowB3xOS667QC9o/XCHO
	jOG1lX2VBPNp5WmbefdMy7yvOlBjSpLHbqRe4HzkGY8Y1tGdcHGp5pIQFaBqndh0k8R3QgbwE7Txr
	pCvWXaYkriAH4NfF2nIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLtvK-00088v-Nn; Wed, 01 May 2019 18:25:42 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLtvI-00088X-D7
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 18:25:41 +0000
Received: by mail-vs1-xe36.google.com with SMTP id e2so10287209vsc.13
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CL8fj/1WvD1XOCsOkJZLbwr2FkrpulNbESBS+POuiy4=;
 b=hu/9UibJbGHN4C66jypCqfrbpjHMgUcaeYXOGUNbli3BiwRurGxcpdiXWQHRQ5i06U
 Y11FqcRwwKe4Azn+8nSK+mXnIP8Lr8lTLiTGRZ3nr/fhzubOnGjrJnrDWU/Dpet3fmLk
 YEKBuYVr+e4TorKS95zgT9WAQiACfYixLAVkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CL8fj/1WvD1XOCsOkJZLbwr2FkrpulNbESBS+POuiy4=;
 b=sLXjrqPi3eOIVHPYf8QeRyg8zfLj74v9F0w4EtBPX7ljOXEJDLwjoN6siGH2asVu5B
 hFaj6qW3cNoqh50nK8MWud9XVqGoKvjQntpjB5jGOP6TCSda2Ia9okWBECCIbCxpTgvy
 FCeAtK0KLxi+/gYfiHrHLLFIssgmQ7vY1mP3kMmPto464KiaLvC5R/yD9bJprlue7MR7
 LQNqg2QJ8bLUuemSLwt5S0tq0RRMZ7d6AJ6krFdgCaiCg5pqPqgnWAucc7g0UJC96fTZ
 WYN7ky5O+HRrcuy/Gr/aluIM+dxFshksc6Bh6zWALw5VeR3Eda0dAXbc2IiBfchRUoPC
 9DhA==
X-Gm-Message-State: APjAAAXjGEliP+6zY0LA7QSXfwf9G7ZhWL3bRb1a6kv9OTlV/49mTbAO
 Nevcr7Ne7O5NdmYB+d0XdkWb41+KDWI=
X-Google-Smtp-Source: APXvYqypt5U8N0QAqFolmsNMSqWKZrCk8VN4EOShOI6WF3WkuSZa6hrB7DpeQHaRgVT+O4X5wIAJ7Q==
X-Received: by 2002:a67:8dc4:: with SMTP id p187mr1662604vsd.157.1556735137729; 
 Wed, 01 May 2019 11:25:37 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id 8sm9971842vks.11.2019.05.01.11.25.36
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 11:25:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id w13so10335781vsc.4
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 11:25:36 -0700 (PDT)
X-Received: by 2002:a67:f849:: with SMTP id b9mr39824551vsp.188.1556735135694; 
 Wed, 01 May 2019 11:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190501160636.30841-1-hch@lst.de>
In-Reply-To: <20190501160636.30841-1-hch@lst.de>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 1 May 2019 11:25:23 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKMswkBy-kEk7mb01v3oJADvGyhRf6JMh7BsjUKsme9QA@mail.gmail.com>
Message-ID: <CAGXu5jKMswkBy-kEk7mb01v3oJADvGyhRf6JMh7BsjUKsme9QA@mail.gmail.com>
Subject: Re: fix filler_t callback type mismatches
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_112540_468971_51F7E404 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
Cc: "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 1, 2019 at 9:07 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Casting mapping->a_ops->readpage to filler_t causes an indirect call
> type mismatch with Control-Flow Integrity checking. This change fixes
> the mismatch in read_cache_page_gfp and read_mapping_page by adding
> using a NULL filler argument as an indication to call ->readpage
> directly, and by passing the right parameter callbacks in nfs and jffs2.

Nice. This looks great; thanks for looking at this. For the series
(including patch 5):

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
