Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E29C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vOISSaeOV4q1Zh3RA4L+IpayKrxhaQoy4n2Hy0wexRs=; b=GvDKvSJiokgIed9VFV3ayd+pP5
	Muf7hO6svyjbViDw+C3WI6sy6X9updrXotquegqJjFCs49KUs76bNBZ2IeKrt7apknGofklpypoqo
	6AhHHbnlQGwsHn4Ti+KlOsSM5XHEKPnNCiEBfMAdYCKn+DKJsP1u2J4VmERZZBE/rTevY0SRC2k6z
	tpEP1Z+Co11KvvujAGhfvT9+Y4X7zT3h5xJ4i4wyFBUp3/9h1LNLKn5hzEq9mcf9WerAjBqR5qpwB
	jHLZ10NjKZmcW39mhCSNhYq70VoZ9MxROXBHViuyRNPgkl91sT3vaBfee00CgmaUBbgQVPJBAaJOL
	wb8GVTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghXW-007qXl-4n; Fri, 07 Oct 2022 07:12:58 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghXT-007qVg-1n
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 07:12:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id w15-20020a17090a8a0f00b0020afece09efso3218002pjn.5
        for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2022 00:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zD2QyyEYPUnjnfZd5KlBttq9+yeDt7qD9jNTNzib9dk=;
        b=sSoyhto2Qk2Kpg6HqPAneYQnnnmxccFxFeqwMKLrFcryCjJPMpI73mSTLc6/L3ER6k
         Qdhvk8g14MHO+V1tm6z7iE/fLy0BlMHekDqSRz7MrNRfqmTDmcX6vlKi0s4uOUtpjaFB
         y5ij6gVzF54ddthXP5Fej8wOdsYIlWbtV/EsawWbEYN2MaG4q1yxQu2PNPSx2PtVKQ9R
         lnow0RCrHaB6ifX9xdwBX5SxWaMFTcvGzihMCnZJSIekezzixpsqINi5Wqk5DvSVhugs
         sJFJfajqvicDWE/aeNz17g4Q/3BKjmXhrutINa9LKIIj2SAGM/OsyzZv6KozUg+O+JyN
         ValA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zD2QyyEYPUnjnfZd5KlBttq9+yeDt7qD9jNTNzib9dk=;
        b=UZmHfsls53GDOapQUm0p//stt0FUREhe8RHeZehLqBwb+SGyyOXPAQ+L74DZ8qpcrR
         G3sVluiGtOEl+p52WWV5dE4w76fkscifGq4ILg/fo/W2MnbMlwb0UsDTbGah35GWBst/
         PmZMkAuWl5B1gHx4ceSjlaQe77d5VU7R0N/4wY3yJ6fSB5srutqWNXrEFpt/+AqNStfY
         PMvmeHDjV7cHONPqjEfhsoodFjCx6ZsY7gxZBmyQyKasnx0ZRukSrIW9EybE9S/jXFzp
         jnOBRMCvQB7GOqWV9EY0nru45b5Q+cp2Laf7eIxj2RtW/d9cEkRnw2O00yhrHkc7/alm
         pEaA==
X-Gm-Message-State: ACrzQf3YCS8GC3WbyPTbPjmO69QEeBFzGiN5Clepm6NaNhYcGd3OGEfX
	vQZQpT/joZhALrPpc4eTMdLQ1IqVo8WJ
X-Google-Smtp-Source: AMsMyM5oEThtlITNWKR9bOiEmeTojRuWczoWkPZmH3K+2RmRxCZ0jYn4s0trWQbemg/vJjtZFbKFbM+qvBDv
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a62:584:0:b0:55a:a7a5:b597 with SMTP id
 126-20020a620584000000b0055aa7a5b597mr3819065pff.71.1665126772257; Fri, 07
 Oct 2022 00:12:52 -0700 (PDT)
Date: Fri,  7 Oct 2022 07:12:26 +0000
In-Reply-To: <20221004115516.5ccaf9db@xps-13>
Mime-Version: 1.0
References: <20221004115516.5ccaf9db@xps-13>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007071226.705169-1-sgzhang@google.com>
Subject: [PATCH v1] review comments to be complied by
From: Ray Zhang <sgzhang@google.com>
To: miquel.raynal@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	richard@nod.at, sgzhang@google.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_001255_123663_E6481937 
X-CRM114-Status: UNSURE (   5.53  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKClRoYW5rcyBmb3IgeW91ciByZXZpZXcgY29tbWVudHMgdy5yLnQgW1BBVENI
IHYxXSwgd2hpY2ggd2lsbCBiZSBjb21wbGllZCBieQppbiBuZXh0IHBhdGNoIHZlcnNpb24gW1BB
VENIIHYyXS4KClJlZ2FyZHMsCgpSYXkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
