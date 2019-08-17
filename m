Return-Path: <SRS0=66Q2=WN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE83C3A59F
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 21:27:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1EBA21019
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 21:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eLSGJ7mE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hov3AcxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1EBA21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sd27ARzLxbHiQM8QIPD+CMQr76gBv7aKFilGRrP7oaA=; b=eLSGJ7mEx9UGrs
	2mr1R5CuThWidy69EN35JsvY/JDi/gQY+U/VK7upg0fsCdVLWp87O0sFMY6+6ylKADYsVF5tEF7ZG
	AjfYhbRs69QGN+Jbz6YQgfxdJ/sfghjqIZr/gy5DfadiQ6E4B5naoQYCkmhZjQ6Kr3ZZsZr7Jh38j
	4ascxU7hvsYOCNxSpI1PK/rmgb/RyrLcz0VGmHVRvIKtwkxXa5f7uVkasNXJx45MbZTghEvD2wXAV
	tlFnCOj5KzqY7TqM9gOyeAQ0Yy0RYzzqOdrHAkxa6qPjJoR3f9xYOQkHR1f2vcwjf5pVlYPD6Qp2j
	RLXyinxTb+bCmX2jG+hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hz6E7-0001II-7o; Sat, 17 Aug 2019 21:27:07 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hz6E4-0001H7-EH
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2019 21:27:05 +0000
Received: by mail-io1-xd44.google.com with SMTP id 18so13267509ioe.10
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2019 14:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=RWNnky4tg4pNafhn5H03aH8PwpXjgmBSavfJgIeX0Ak=;
 b=hov3AcxQ6M0mcpBwyir6wMfwuFoM/2pj4MlCmv+T09knj2Mmqt8UJz4bLEelDU0dEY
 q35RSput0GqdXzjDl39iW6e96fi6ZvYG7hVSedcruoQ/r2si3vSEQf+S3NbKo/JWKMFz
 l1Pncvs1WA7x9utXPIZU7hNH8C4hBPXAZA2OymhT4WgZagRVCnEht474gNpFzrJa6Xjg
 FvMhl4KIMbZ3FFtCmeGSVrAzUl96LhDRs8lD2zGj/KFGyr4hodIlFUOwRQsA6Da7S+zZ
 ouRU8O2CZBVhaSm1B4pGrx6QOwfw1b8VOQgHVh5JaC0Jm1cxHTFnZdggwnO1D5Ig+YJ1
 Lkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=RWNnky4tg4pNafhn5H03aH8PwpXjgmBSavfJgIeX0Ak=;
 b=IGH+0xsEYHsFBMnGWKx9kL0xVHKqMo/63Jqs0gM6DRL93KnkxlAUYUrNeMkaJHKf3Q
 +4Gq1oELryxtYiSQ1JfEhYGeOc0jRvkAZcHBk1HJnF9p2X7bdEc/joRNGKn4yhaH6mb+
 3x8SeDSogcQSrbibSzrymP0mn/oaV2/bFY+shhj6NgEWXpVOQDfJMCQl+pWAWbtANV1+
 Dcl1PSlYSEWeziUZ/jtwApp81umTVUeta7tCttjlukRXfBj0LMjCxpqywElYkyXL2P0u
 Cud4scNFu0uBocfcD89hSoJWtnU0OaNxdQXuMfGRioSgtCnZ4sX6SSehKow9Vu5ocdmT
 5njQ==
X-Gm-Message-State: APjAAAUULIaEBZ6iY0aChSuAVe2sd7oqMTW59jLcWM8fFBLZooL/JhQl
 4fxSWNSoY6YWryMkpu5n7wqHEA==
X-Google-Smtp-Source: APXvYqwKE/3SM/rVpl4teujkfN9+UilDZaKhxrZT/14FwdMPovoCNf3aYcPot40i7G8y5JQK54ukCg==
X-Received: by 2002:a6b:b9c2:: with SMTP id
 j185mr15509819iof.148.1566077223658; 
 Sat, 17 Aug 2019 14:27:03 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 v23sm11488293ioh.58.2019.08.17.14.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 14:27:03 -0700 (PDT)
Date: Sat, 17 Aug 2019 14:27:02 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/26] asm-generic: don't provide __ioremap
In-Reply-To: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1908171426390.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-15-hch@lst.de>
 <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_142704_483689_C2791BD6 
X-CRM114-Status: UNSURE (   5.91  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 17 Aug 2019, Paul Walmsley wrote:

> Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv

This ack is superfluous since the patch doesn't touch arch/riscv; feel 
free to drop it


- Paul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
