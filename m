Return-Path: <SRS0=66Q2=WN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913E9C3A59B
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 16:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F652217F4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 16:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bd+dioKm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="renwLVE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F652217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wjmn3c0PpgblWmUzx76Gcb1GOumr2JWwXkWrYgtOaTo=; b=Bd+dioKmF4nSN7kcGYjBVwI2s
	RpYuQPIw96h/1ZKNkk/L6E41Q9rGDAdHH7b2PmqSCPYYhFSA+R0jsoawD6hM+fBt4bTR4t+kRNwYW
	nND7olLzPQOOZt/MxQKzYx090YkbCocG/j3G75n26zfOUQsjekZQKOtZ9TykEHWc5mFiG6/x+wqlC
	rWfMtSkBVeHkYmFz49cNzqTP3msUJ17auUrRPJyV0NaUvXep/JJb38xogdDRcuKEXPLbcIcgu7dyO
	wQZfdLCJz5QAvNGR3+UhEAaN81gGxq0zXqvcn+9fVVfAtZQCrFyoh8wKs6WsBMYiATvYgO+sHdh1S
	g5mcI2ZSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hz18j-0007ex-VI; Sat, 17 Aug 2019 16:01:13 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hz18f-0007cT-Ty
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2019 16:01:12 +0000
Received: by mail-lf1-x143.google.com with SMTP id c19so6071961lfm.10
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2019 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1+7TiPxmJ3iAAUyU8+nGKfNJ+qg4H69wdJGgYgGKXe4=;
 b=renwLVE4t6MRcP5ZcmILI4AbPfXwqYVjMBTfKIElNDtgfcIFYeU8tIrB/gUAytl6lf
 GUpFHkf80zb+V0K3tM4r1Ot/9rCYkg84zdkCVJdaGdaWLOpozsDhzbvufdrpihHrN3tR
 TMxRzxhlJOIgtqRCrMKBJjP0q/GTzQu3Y+xuowVJpW1Icfg6Gn+WBtpfMuxFGsqNj8oB
 RlW1kLKfSyibvLnhWNBdW0PJ1JnQ35HN0rADSVoKpu7sfG7Xl0X/7sr2FWTSDPYnsGg8
 aLYzSLDdBf8VJM9zqhQZCDbdbFM9CTE+LknLwNOfmvJpyWjg0Gz9hP3js+7ih/iHtfFi
 vrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1+7TiPxmJ3iAAUyU8+nGKfNJ+qg4H69wdJGgYgGKXe4=;
 b=YZjNpObT0JW0NJGrfs1o6z+U2IsttMsmrpwfvt0IPdu1BqsQePmLAjQyB1t9dqxhEq
 haqQBukXKcPiUT1NU4cEzsJHppZ9K4tEUjtCaBAMpssv8ia2VPlpzBgu9+y07AR26kH6
 cuHrO0zTmQKrHZ7nxopJez8BQglWWy/mZPhykJSf4XmTrXSkmO+blZN4rHwqd5BAGGS8
 cTLwu8aMO37VAPQvEEMdmc3QkXIT1MTSU7AZlTQRXodkAXcUdMU+90wcD9dJ7S8q+QM5
 z7Ze5Y2cSZ+AaftAkizAnhhZhO9dtfQPahDwIM6PqxUSZ31PEz4gjuhLMY/nrbQP5R9u
 cKdA==
X-Gm-Message-State: APjAAAWTyIj2ToOoAfPd5ilEUkxTLHZjRjDTacC2DBMhCzOM0LyO81VM
 8w8wGWLsI8gFse04ciyH7Wjtyw==
X-Google-Smtp-Source: APXvYqzgHOkrd316w+DBxyDOOMOwfJvlMQJHfKxSm3Tpn7OUxlUzLbfoBMdqodlTlf7xRwkY3y0i2g==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr7785781lfm.77.1566057666460; 
 Sat, 17 Aug 2019 09:01:06 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4817:8b14:6cce:9848:7977:d7d5?
 ([2a00:1fa0:4817:8b14:6cce:9848:7977:d7d5])
 by smtp.gmail.com with ESMTPSA id b10sm1517289ljk.79.2019.08.17.09.01.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Aug 2019 09:01:05 -0700 (PDT)
Subject: Re: [PATCH 06/26] ia64: rename ioremap_nocache to ioremap_uc
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-7-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b19607c1-07aa-e361-3c26-8bcb063ed8c1@cogentembedded.com>
Date: Sat, 17 Aug 2019 19:00:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817073253.27819-7-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_090110_093290_27DFD14C 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 17.08.2019 10:32, Christoph Hellwig wrote:

> On ia64 ioremap_nocache fails if attributs don't match.  Not other

    Attributes. :-)

> architectures does this, and we plan to get rid of ioremap_nocache.
> So get rid of the special semantics and define ioremap_nocache in
> terms of ioremap as no portable driver could rely on the behavior
> anyway.
> 
> However x86 implements ioremap_uc with a in a similar way as the ia64

    "With a" not really needed?

> version of ioremap_nocache, so implement that instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
