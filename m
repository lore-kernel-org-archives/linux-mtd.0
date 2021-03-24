Return-Path: <SRS0=a/jC=IW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED421C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 16:11:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5DC619BA
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 16:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5DC619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XMSMvLRElcnyFSQDZraFRRrVcnI/SI/GsCog2qRhaPA=; b=B6mWf/3KzKe/sgBwZWbMJSAT5
	Mb64XL2r1qxXlJ/gzg2RABscDq2xxr1ZQDt+AJr8kpRa1cecrXIfzZDazePS0GKUfKbRoxDEANuWM
	Ywlw586AhgeTRyAfAFlleZIXBZmlRNlfHPzCKc7Ddt4raJ/bJX4R1C+iYGdTX/hrsBoo+qlYzdzO7
	5Y+UsD8xgBc2C39t5d5GPt5tq8ahTl1eirvN5fM+R3JIFOJtOGizzKjFWl6UANgTxnMy51MyHpsYV
	w6MJFilXVmdkjK6RhvDbWLuCHg/2q+df1Pj4c2mpbxthVm2D+HF9zxs2n8j1n7ypYcAQWGsbYWI3x
	tSwWbk4sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP65O-00HLri-8F; Wed, 24 Mar 2021 16:10:22 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP65J-00HLrE-PD
 for linux-mtd@lists.infradead.org; Wed, 24 Mar 2021 16:10:19 +0000
Received: by mail-il1-f175.google.com with SMTP id z9so21848770ilb.4
 for <linux-mtd@lists.infradead.org>; Wed, 24 Mar 2021 09:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VNP7Y6+0uXAbF81x4TSakPwVzbjmi5CX3FP7U60yxNc=;
 b=K7boo9jjJhBY0ht0fx90kjzatbXFcE73LXEkMlEeJf3kpvQEhEqP5QB+VEQbsicBmC
 kEQwTidQcoJUCds64QRDV7KB6n8l4DUHa+OfJTFIjPTFoHxivTiYRoh0c0y+gVNUAEoK
 stIEkl9YWYlMuJPpNQHkQbqCORJkP+FGNynGANySdMB9WQV9Q6CI2/VcEzzLaD887X2a
 J38+C8ZFZfi+bt1u+DX5CZYb6jbf9v5jV291gYaRQYUMv2hp9S8IoQFcIFGrQdBbAQxG
 BmImQiEZ3B8TaWD0QMhZzMT5LDgEIDjphJS5FSDUPr3/lqonWwwQ1v8e0BPssZvFB6+K
 J95w==
X-Gm-Message-State: AOAM531nrSkGALP3Q75sSGaFw0fcTcCfzXJv4pG9leCOXCjPsktQpBPt
 JK/NukJR1ADCXE3xCEHnGg==
X-Google-Smtp-Source: ABdhPJwmwxbEeSIquUcBlAzmteTnXpQkZkEyemHNVIjdnZEt0hjspkOoJ/XkhvZh0v8Iv4bk/VZfWA==
X-Received: by 2002:a92:c549:: with SMTP id a9mr3257290ilj.300.1616602216731; 
 Wed, 24 Mar 2021 09:10:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d3sm1315600ilo.32.2021.03.24.09.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:10:15 -0700 (PDT)
Received: (nullmailer pid 3166203 invoked by uid 1000);
 Wed, 24 Mar 2021 16:10:12 -0000
Date: Wed, 24 Mar 2021 10:10:12 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Vivek Unune <npcomplete13@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: add binding for Linksys Northstar
 partitions
Message-ID: <20210324161012.GA3166146@robh.at.kernel.org>
References: <20210312134919.7767-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312134919.7767-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_161017_985938_FEA1547B 
X-CRM114-Status: UNSURE (   9.85  )
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

T24gRnJpLCAxMiBNYXIgMjAyMSAxNDo0OToxOCArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBMaW5rc3lz
IG9uIEJyb2FkY29tIE5vcnRoc3RhciBkZXZpY2VzIHVzZXMgZml4ZWQgZmxhc2ggbGF5b3V0IHdp
dGgKPiBtdWx0aXBsZSBmaXJtd2FyZSBwYXJ0aXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiAgLi4uL210ZC9wYXJ0aXRp
b25zL2xpbmtzeXMsbnMtcGFydGl0aW9ucy55YW1sIHwgNzQgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2xpbmtzeXMs
bnMtcGFydGl0aW9ucy55YW1sCj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
