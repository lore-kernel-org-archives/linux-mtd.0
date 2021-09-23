Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C7AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 16:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD936105A
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 16:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DD936105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9E6N/p38d3Pt/hFj4VA9oXjuB3O6EKxKJsJDoRgfzRE=; b=MBLx4UYQtW3pId
	gTbR9UfHrG+MMcaU4d8iO0dC2UZCA4nNgf/GsnkVyZom2BLIdIAQ9U0Hnrpx+DNmjbqxEb8Y3XVB4
	H9f1dbrdQAubBO15hrzlP1Nfm2n6CBC1dth0les3xdgFQ7oUl8TksdrY0v2Bbht6CSubi7g7nQr2u
	0KffTi4TY0C7d2qBeA4u5pZt6VfbtA4A4Zq/7aQt98/zqmRAPks2SVOpU4Ornt3YS2gGmg8t0s+kj
	OL9jHIgNrz0cbEX5WIh/IvRGrfRa9FXeVtT3MjdBQcXIIgb375wRM7eNoEMfDb2/HUZsrkFmLExJX
	/3EMLJKcC4eGfInudCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTS1y-00CCHO-7O; Thu, 23 Sep 2021 16:57:06 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTS1j-00CCBm-6k; Thu, 23 Sep 2021 16:56:52 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 h9-20020a9d2f09000000b005453f95356cso9335968otb.11; 
 Thu, 23 Sep 2021 09:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yCuhDbFySv0WBASIMuHbe9F9f8YaVqjJ37FH7IkOu2Q=;
 b=e7NePd5npUTazHkUyoclQEgFubGzSSHmayepgyadATl71b4QThCQTeKfc80VxE4XGX
 6yR977EN+xk6ZaBEEArYWnzdbwqBk9fRpVs0bzjJ1iJEFGnZhkJILNuAiFxtKs8yvFSp
 OxfUc8Uvsqf8H9IVVVzAy/9pgJP4EUwvkbftoL9wmeU5+Kai9bmJaYyodrIYIy/siqy3
 1KkPnohk7gm5oupzP0Gp6v9Qprz3LAulDLnDrgJDhJN5yP5a5ZKFf+TDUYH7DHy6Q8OL
 jxDwuAd9XeJKbvwvw9alSv73Nn78eXcxmA413KLKicNlOqtegRhujDX8TDV9Tn1fJdW4
 GNtQ==
X-Gm-Message-State: AOAM530UoZ6EPmxSBz71F1YSJlD8KqJw3rCTLruTEsoMxNY4n7fbWBwY
 x47Hb3WaIYPHhzAqBbz1CrYIkK+dDg==
X-Google-Smtp-Source: ABdhPJwZF13O3L94Az07rbZOHYKpGcxO0Y3TsLBWTY4BwTvdCjMK2u5P9d4TPJIIAl0Dmte2Oz4hQQ==
X-Received: by 2002:a9d:7dd0:: with SMTP id k16mr5369860otn.51.1632416209860; 
 Thu, 23 Sep 2021 09:56:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s26sm1498922ooc.26.2021.09.23.09.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 09:56:49 -0700 (PDT)
Received: (nullmailer pid 3165231 invoked by uid 1000);
 Thu, 23 Sep 2021 16:56:48 -0000
Date: Thu, 23 Sep 2021 11:56:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-mtd@lists.infradead.org, olof@lixom.net, ka@semihalf.com,
 dinguyen@kernel.org, devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, jam@semihalf.com, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, tn@semihalf.com, p.zabel@pengutronix.de,
 linux-kernel@vger.kernel.org, arnd@arndb.de, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mtd: spi-nor: add n25q00 schema
Message-ID: <YUyx0K9M7wspVl+E@robh.at.kernel.org>
References: <20210920124141.1166544-1-pan@semihalf.com>
 <20210920124141.1166544-2-pan@semihalf.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920124141.1166544-2-pan@semihalf.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_095651_315557_01793D58 
X-CRM114-Status: UNSURE (   9.05  )
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

T24gTW9uLCAyMCBTZXAgMjAyMSAxNDo0MTozOSArMDIwMCwgUGF3ZcWCIEFuaWtpZWwgd3JvdGU6
Cj4gQWRkIHNjaGVtYSBmb3IgdGhlIG4yNXEwMCBOT1IgZmxhc2ggbWVtb3J5Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgo+IC0tLQo+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCgpB
Y2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
