Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CF4C4361B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:57:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4AC423ECE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4AC423ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VbRl/BDLyv7Jkhw2sNGJ3jfCLZR+h3JyXhhuPNl96Dc=; b=gYOVJM4G2IXW5AdBvyO2q7gBO
	SsCWGUefyDkeGXda7sk/X4AlU8+pGL2QvBY5nIjKPdHWFHzXnCmhX2LJOfPFzbGNDsGk07Bd7qGwa
	5rnok82QPtBKiumSdaA/xzjp6y/cm96yqAsVjKSt/g06pXnMgqNAotwaIiggSduaQHiHilDRMm6xy
	FX/M/E59VWewzMQDcdWR83VYhoAj3E4Byt+RDAu0RYyt6zKqJi08jdIBjsqZKUw7UeH1Nf8Bv1tyT
	c+sVUdJqtlmQNbAqGBW4rXtzi9iJYgC78rPSj+g8aqLGr3pTRrMkJJu5TxylzGW4QCnajf70vTAQ2
	OjM/IJegw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZXZ-00017P-TD; Fri, 11 Dec 2020 03:56:21 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZXX-00016z-DV
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 03:56:20 +0000
Received: by mail-oi1-f193.google.com with SMTP id 15so8406531oix.8
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2020 19:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KNePDxDoWxSGS5qvG1IL1wSOTEdhCnUyMwQIX6YT+T4=;
 b=LVUappUKmD7NsjIk6Y+dIQkm6Lrr+8JoT+tNKgax7lJEUQALX+82bO18wxwnO/UK1q
 tsNWmnvlI7hJjwLzy8Ua7Ds4xS/RPcy1tnMlKIxSDymB1tfyz0PQcgy1o8qFZz72Z4ko
 9dqpAzF84pXM3mJwUTUuOnaJgV51qH1HdaSI8u62CYvIHGveAGXPC8bsCDc7baU7vdkV
 yTrP3/CHfu+wInM2dCkAD1o2/LN8uGUsyQCdQnex56wt/z6wLX+YpVxwbPolLBWI+iuQ
 aS6dcIIOAwY8k0jkZnE68vsTu8xr2u/dUQf2sSlIYDbinKXA+JlRXLnpgEUzEpgPKTA2
 S0Iw==
X-Gm-Message-State: AOAM532TZfu9cVRWobEYPMzLz4FBdx2Uu5KA4sqf7/IreQou3GKrJ8EG
 FR0gMXyozDxc1hTTjuaDfg==
X-Google-Smtp-Source: ABdhPJweXtVgZup/C5S5WujLl2ghdY7LcCNznXHswkSiBMJamznjD2SEJessyWCiSjvy/DXRYbLwfg==
X-Received: by 2002:a05:6808:28a:: with SMTP id
 z10mr8159629oic.174.1607658978760; 
 Thu, 10 Dec 2020 19:56:18 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r12sm1515438ooo.25.2020.12.10.19.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:56:17 -0800 (PST)
Received: (nullmailer pid 3616192 invoked by uid 1000);
 Fri, 11 Dec 2020 03:56:16 -0000
Date: Thu, 10 Dec 2020 21:56:16 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] dt-bindings: mtd: convert "fixed-partitions" to the
 json-schema
Message-ID: <20201211035616.GA3616113@robh.at.kernel.org>
References: <20201210172352.31632-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210172352.31632-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_225619_501761_4B8F4A12 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxMCBEZWMgMjAyMCAxODoyMzo1MiArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIHN0
YW5kYXJkaXplcyBpdHMgZG9jdW1lbnRhdGlvbiwgYWxsb3dzIHZhbGlkYXRpbmcgd2l0aCBNYWtl
ZmlsZQo+IGNoZWNrcyBhbmQgaGVscHMgd3JpdGluZyBEVFMgZmlsZXMuCj4gCj4gTm90aWNlYWJs
ZSBjaGFuZ2VzOgo+IDEuIERyb3BwZWQgIlBhcnRpdGlvbnMgY2FuIGJlIHJlcHJlc2VudGVkIGJ5
IHN1Yi1ub2RlcyBvZiBhIGZsYXNoCj4gICAgZGV2aWNlLiIgYXMgd2UgYWxzbyBzdXBwb3J0IHN1
YnBhcnRpdGlvbnMgKGRvbid0IGhhdmUgdG8gYmUgcGFydCBvZgo+ICAgIGZsYXNoIGRldmljZSBu
b2RlKQo+IDIuIERyb3BwZWQgInRvIExpbnV4IiBhcyBiaW5kaW5ncyBhcmUgbWVhbnQgdG8gYmUg
b3MgYWdub3N0aWMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgo+IC0tLQo+IFYyOiBBZGQgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxz
Cj4gICAgIE1vdmUgImNvbXBhdGlibGUgPSIgcHJvcGVydHkgdXAgaW4gZXhhbXBsZXMKPiAgICAg
QWRkIG1pbkl0ZW1zIHRvIHRoZSAicmVnIgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9uLnR4dCAgICAgfCAxMzEgKy0tLS0tLS0tLS0tLS0tCj4gIC4uLi9tdGQv
cGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgICAgICB8IDE1MiArKysrKysrKysrKysr
KysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNTQgaW5zZXJ0aW9ucygrKSwgMTI5IGRlbGV0aW9u
cygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbAo+IAoKQXBwbGllZCwgdGhh
bmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
