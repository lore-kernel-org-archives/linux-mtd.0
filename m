Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE656C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 22:55:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEAC20874
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 22:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMML83HE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VqlJmJeJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEAC20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F3BxY08be3Fkwzu5Pr+U0L9AkVyB+Ry4O4IEAddn/Lc=; b=YMML83HERMpGmTqPGbrFxAcjD
	6zgOcO7Yh8VYOJpL1ybKytITqkS8Fqy6nGEmoRLcNpbkln+7AfOtu7Movd1w5fCIoj32ZskK5MEx0
	jxpOu4gLHLpkmlaOKBj59MwsYai4IesgVUhES3qNeskqzEXfkZjzd9Y8bNQPSlBJYWBt/HPwrGw3X
	gRM8IITnvik3TxFzWSBrfVIeyjmEt1eLslUFfWnN8ky64wjMYql437HXgVF1Acw3+UPw+lSU1kw6g
	cVJgAQYenerxkWI44KMbtf5RdDFNP2LGaEIcOea5CMsV/o6RDzrsSM2TuPNHvkyoq/b7XJK8icUlp
	RMz+cSd9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTYcK-0006rr-IB; Fri, 16 Oct 2020 22:54:32 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTYcH-0006r5-Vx
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 22:54:30 +0000
Received: by mail-pl1-x636.google.com with SMTP id w21so2043167plq.3
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 15:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ICYd57CoaTy1qGFozzh5HtqQudKTXEKY66Y/KKwo8Lk=;
 b=VqlJmJeJpWv0jfshqm7uw5p/d/Crrw98Z+oE10biAfMK6x+/MB1Ue4y9OrUuMb1S19
 NVBf0YH72PGjn6trqTsPBQU4VAblvBvPpx/VlhpjqfSCx9LzyiIz4rmKGiHcPvEhRPf3
 aAvMrYjW2k0Ii1ot6r1dmHtwQoFpgg+DRFVY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ICYd57CoaTy1qGFozzh5HtqQudKTXEKY66Y/KKwo8Lk=;
 b=pl1dKJLc/zAMWsuI0TJ9d2iBDMK++cB/GSEkWHQMzDBC8EH5oGjtbO1LMtawfWXwwd
 cRgZKC5HjmShh5TM5L0lmPpmWHqcSBB+rdEIKZ9VFzlj6oEZOcxZV++y1o/ixei9bO0z
 zq1nA4lg71ufVP3ecyJeIZANlFQCO8sgPUmTEJDeS9wmNfwo5uI0FScYvrkmc1jOATxn
 QJsHZuyPEJyXHZjYCxr4112TAIMgjZ4vUhWYKCmMr11Tqj0/evICiUyh1uTZS9j/2qIv
 csp0RgAltrcGov1bCrEDqUHCk/szbdYtqfT2rE+4vzx45+WlN8RcEyuXz92a4nY6U6Ug
 lsZw==
X-Gm-Message-State: AOAM5335JGxOhgNqkChx+69KNDGhkqAI3lqJyToTEuF7wLIBkJThrSAQ
 J/LzPH5G4gG1J5EyPlaaF4v3OQ==
X-Google-Smtp-Source: ABdhPJztu1BrcI2AvRp/VvjJLHuh4P7B1CW+afiAMTqbl51L8NnUyyWVOosqEGO8gUPez74J93eSuw==
X-Received: by 2002:a17:90b:4a10:: with SMTP id
 kk16mr6428298pjb.77.1602888867778; 
 Fri, 16 Oct 2020 15:54:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x18sm3788262pga.49.2020.10.16.15.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 15:54:26 -0700 (PDT)
Date: Fri, 16 Oct 2020 15:54:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify pstore-blk
Message-ID: <202010161553.F2BA6CF@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-1-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_185430_044691_19BA0257 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Tony Luck <tony.luck@intel.com>, Anton Vorontsov <anton@enomsg.org>,
 linux-kernel@vger.kernel.org, WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 03:20:38PM +0200, Christoph Hellwig wrote:
> this series cleans up and massively simplifies the pstore-blk code,
> please take a look.

Cool! Thanks for doing this work. I have a few things I'd like to see
done differently, and while I'm not a huge fan of the general reduction
in utility, I can live with it as long as it doesn't make other things
worse. :) I'll get this reviewed with specific feedback soon, but I'm
about to be EOW. ;)

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
