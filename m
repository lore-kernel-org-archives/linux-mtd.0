Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97369C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652D921855
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+xtE08i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVAXd9Kr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 652D921855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGvd/bt8LGBe09EDV/Pv8+rKc4bVkSRZ7J+M5eEylFU=; b=F+xtE08ixEpftC
	cY8DLcCH5zkieIs6hOEnld89VYGaOLCJfacVDujyh+DiUaz/ioZ04qN3avesobH1n/f4hCK/DZxEf
	KwkmmtGTspktMmw5+mqNO/ws9o6eGJ6mBe98+eOpdySxsoCMmsNcyUD5nGdCA8D1eNMEuHIJZoTtr
	BDoWYL/frLbUS2IBCkjMWHCBZtYniPB1nKfuy8e6MoJmLWPjqqECWjdkZrKyZRjjXrFEBE5GCxhMB
	W/weYQnGHySpF7U08dIo4ZK6bDIsa8ggrN530kvU4d4OLvX/tkrD5CExawhID6LeU+rQkFEzr2lp2
	pheTynYPVzFOYmX0Y7/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9h1W-0005Mg-1a; Fri, 29 Mar 2019 02:13:38 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9h1T-0005M4-QJ
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 02:13:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id i17so275882pfo.6
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 19:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dIZqirFlcwzhcftvnfiLTQjzfNbvecaVh5j30eHdvp8=;
 b=CVAXd9KrtP87XGYe7xJkMkXhC7Am0h4DNmCHOs7E1BOhsTnr3Xkaj2sogKbqUFHLGo
 +lJ5Lqkmd4iTSiaamuppZkYNmNElo0OYpireXcKdM49Z1i4pfq6PgZ8mF2w7x8Ql5pnM
 HaeD/WwYK6njUDYIAosu21H2U+zK+6ee9CNQMiVY0i5fB+Wc/fsOlXIfFhii/z2mV8Fy
 pDvf3HtNyEeQQGfuMs2lCuiuBhHEL2LnEAvETCJ9KoVtmoYtEHxKQWYD/+I2XZzvZEOh
 goGU4oCw7CseHyz7pJnAXRz7JSfb7udody03sMl3tFhUP+WkxQlq6KXEc4bvEv1ODNlT
 vqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dIZqirFlcwzhcftvnfiLTQjzfNbvecaVh5j30eHdvp8=;
 b=sBBKadbTNYbJ9442SpluZXLnf7tABk32PWZsNrGc2yBaKUt+SNmP063EHyt0Ke7UUV
 Bq2xn6zAJZu83zG5DYNYjEXNdyUZ68fb6Lebw8vmOLhKTWgJF9ogdqC39GhRvVw2fZKk
 599VwzRwWYUWwK0QO58Cf/SfMc103asJ9mDK7SgOKY2NU4wfejcjDFS6CsrBn7fQMRc0
 4WJkcDYF+4+oAvEWf0uhG34X/Ji3en4lcke9gTDZtgCIXz8Sw8YxOVlQBsTETv+vIoZB
 E7biEKewET7yY2NX7M7W9vwlQ7phVnx1x45VrqBrycqiRRGDe8MkGzwm7hLXoFe+4K0+
 CI/A==
X-Gm-Message-State: APjAAAVAUThze3O1te1AQCOZdJ01YS+ameOKSvP7WMtfqpmqA/878xhQ
 f6TRnO9nn8iC2+aWMt6fuzM=
X-Google-Smtp-Source: APXvYqxOzYd1MxHNAcHtO/kH7qIdMO8VA6/3+rmPDg/06J/l0x1gBHh4CzonmIFY/xN93bfUGQh45Q==
X-Received: by 2002:a63:1912:: with SMTP id z18mr44348087pgl.115.1553825614950; 
 Thu, 28 Mar 2019 19:13:34 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id p3sm596100pfn.167.2019.03.28.19.13.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 19:13:34 -0700 (PDT)
Subject: Re: [PATCH V2 4/5] dt-bindings: mtd: describe BCM963XX ImageTag
 format and usage
To: Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
 <20190328141910.5723-5-jonas.gorski@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <a6d6e2c1-963a-5326-b677-cdc941a3c93d@gmail.com>
Date: Thu, 28 Mar 2019 19:13:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328141910.5723-5-jonas.gorski@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_191335_851897_E331E6BA 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/28/2019 7:19 AM, Jonas Gorski wrote:
> Describe how to use the BCM963XX ImageTag format in a mixed flash layout
> environment.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
