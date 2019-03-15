Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEF4C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 23:26:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875D6218AC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 23:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rNWQzBtE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 875D6218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wdcVfmro7d2m9eyez3m1mRfmv4iWtINNJ1EfB4+sdk=; b=rNWQzBtEu8f9VR
	9kbRk9P88gnfAna/1xUn/WRzEIjLHyKcgHwtqfYnwwvLvq5w5otpXo2dd7sgrBYhn8yVgjk8SH0Wm
	2s8C8Yy7EVBQ2fdAgDnM35DfcRM6HAVTwSjCFGOQCAio5jMtznV+BseX9EwglbhFebmgz83OkVbQ6
	QJFZvnm/v5ZV5e04nx03vdHaeESeYAbIu9qQPW3Xs3gq0Wws0S0v+fdrwdh83HLhvH085+DUavcPa
	wafk1V7QZnKp+i9s+uDLRySR4XyePiToQ2PpB65mq1dIk+2DTUQnvFflzRxOMq0aJBljGXi5lILFv
	bDEPR5RZLnpyIONZB4Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4wDE-00027a-Gl; Fri, 15 Mar 2019 23:26:04 +0000
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4wDC-00026t-1P
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 23:26:03 +0000
Received: by mail-pf1-f196.google.com with SMTP id v64so7356713pfb.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2019 16:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jN4lslZoo0XzcPQMuFQEoVt8Mtr1usouygAU6nGhbcw=;
 b=nANhff/iF0kre56aIdKvwsCeJvTp8kwmBMPsfjRuY8ivXnGuIov3Rd+Oxr/BZpaXFV
 N4LQOsK/mo6za0oJUBENiuafaalj03spDaoAHpQB3tov7OVF6vQ1J8M14vllQVi8H8/5
 MlH5Abnum+cYzRcHFcRZBnZ86xjdYKPb1NJ1rAHFkiTJrFDDjSWgPfm/5lkJCZThVn+N
 iTDYK6diF6T8U9Mu05Zkz+J7nafP6OUWAi5tdrI2MCO8hEoLF2Kv87F9hNAs+/mROeSD
 5Pzf7PWGzU64kEZdEs+TPS01unC358mg+C7B8JRIWfnjjXmG5RYLNVJdyBIEdzr3Wwve
 LXEQ==
X-Gm-Message-State: APjAAAUVv8v3ie6ylZGYuG5hzJZe+R2wlXYkK01PYFClXHAVYtBImJaI
 uyzK4SpZ3seWG6UzKRwIGQ==
X-Google-Smtp-Source: APXvYqxeZUXGHdtOMd5RHCEV4FkI/BSTuYMQnJGaThDJmgZ9XFtMKtCiSZ4WrnACJJ8WAcCg/TXIlA==
X-Received: by 2002:a63:2ad4:: with SMTP id q203mr6036478pgq.43.1552692360740; 
 Fri, 15 Mar 2019 16:26:00 -0700 (PDT)
Received: from localhost ([172.56.6.21])
 by smtp.gmail.com with ESMTPSA id j24sm8260569pgl.58.2019.03.15.16.25.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Mar 2019 16:25:59 -0700 (PDT)
Date: Fri, 15 Mar 2019 18:25:57 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 03/12] dt-bindings: mtd: ingenic: Use standard
 ecc-engine property
Message-ID: <20190315232536.GA23734@bogus>
References: <20190313222259.28704-1-paul@crapouillou.net>
 <20190313222259.28704-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313222259.28704-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_162602_078336_2BBC4593 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Boris Brezillon <bbrezillon@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 13 Mar 2019 23:22:50 +0100, Paul Cercueil wrote:
> The 'ingenic,bch-controller' property is now deprecated and the
> 'ecc-engine' property should be used instead.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v5: New patch
> 
>  Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
