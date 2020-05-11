Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FB2C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 22:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 373CD2070B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 22:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hL+34Edu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 373CD2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/GJUXkijAYu1tI1pIJ6A7NbVsLGbuDVKcCUblpbXvc=; b=hL+34EduTYJleT
	UMvulFh1OcD8vIHP907jWxT0Oz6+cFg0qpPQOtwUuhBU/ldFJDD5U8MAlXlTT39THiLz/3BD2imsu
	xP5nr6XfBAReFUejglVOQsa9212huDkZ71YUiRQWegIxBur9YkTIdMMfeV89CUPke8akqJ9PWtIyG
	LVHM6cdQk0VCbDCxbHKI9R8AhdssRceBIA3mn2muktrM4LiErW779QbFpCe6gnMCx1+UJBaaBlNNZ
	cHE2TSCgyr/Qdx8I5O8PMAVsx5lKHcQ1CPe5y3YTc6xkQSm6bQ6ifG1Gqa+xUSL8nOmF1Jd0qhMU7
	t4nV9Vdbkqs9hT/duZ+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYGzA-00054X-Jp; Mon, 11 May 2020 22:33:20 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYGz8-00054D-Js
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 22:33:19 +0000
Received: by mail-oi1-f195.google.com with SMTP id c124so16358139oib.13
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 15:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wGHbSnsFJYGWuvu1b3WM72Xji0DD4irBuSVt4YkTgKI=;
 b=smv1t+3mAG83oFnX+mn1aC9gxeTHr0rWVxhzovJ6EGCqvLFHOBHci6cfIoRJSQIqXz
 PYvw+xrRGlapnn7kU2AVrChCJAdfktER5SGmNIkQvBoUrdKHJZxW6YkEpWktee2QroA+
 1335gV56dkdY/RrMDtFfTG3pZccu4QNIhI4d4WarjOUeqGdc+efR/CbZObuli14D/WLd
 A06VQG1Uz9kqmwyFC41VjhiEG96AuVQE085VVwxbqnxnX2FASB778R0EcECAGEkIC34E
 hytGRODYtcMLbpdlx697WEL6BowHNmAkk8YJ4cJfRJyRHCXyPdMPsxuVElngn/PWPVGU
 EhhQ==
X-Gm-Message-State: AGi0PubdkWFEZZt3Ey+CQzXGXuYCd8UU+oclw9q+Se/jOoQ8kNM+9fXK
 +CKFungbZs+RU6AHGqS8NA==
X-Google-Smtp-Source: APiQypJuI3Zhx/CxBn4qh7KjVcz6okjsSvY5mWX+NLlxANjIA4CVRmtDvBU4eGunbZig8CyjwWfN0Q==
X-Received: by 2002:a05:6808:698:: with SMTP id
 k24mr588483oig.102.1589236397728; 
 Mon, 11 May 2020 15:33:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s16sm3989264oij.5.2020.05.11.15.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:33:16 -0700 (PDT)
Received: (nullmailer pid 5158 invoked by uid 1000);
 Mon, 11 May 2020 22:33:16 -0000
Date: Mon, 11 May 2020 17:33:16 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Convert ingenic,cgu.txt to YAML
Message-ID: <20200511223316.GA5051@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_153318_651246_A31EA23E 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 26 Apr 2020 20:58:49 +0200, Paul Cercueil wrote:
> Convert the ingenic,cgu.txt doc file to ingenic,cgu.yaml.
> 
> The binding documentation has been updated as well. The node can have a
> child node that corresponds to the USB PHY, which happens to be present
> in the middle of the CGU registers.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/clock/ingenic,cgu.txt |  57 --------
>  .../bindings/clock/ingenic,cgu.yaml           | 122 ++++++++++++++++++
>  2 files changed, 122 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
