Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD78C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 23:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16A7+4jfnqEAjw+YZvOPloVHBGMKw/ljg3xjEEN6jf4=; b=vVbmTg/IRnaWp0
	D3fVmKcb7SCxBYlWG0idp7yI1WtnipL7P+NnTcaxCQ27/ni6q7k+xzHtE+QoV2F9ACjzPN/UPiaMH
	/FuVYDv5vrIeU59RGuDRErND+L5eQmUEAY9/2TlSsZfpkit/bHFwDFZMTPJYen/I9lmOUCFhfvl7w
	iUpWw/Fpczfi+5PnbDB8BUXb7iIpSZFwtJfyEXFfm99figanf/S+hGCa3ww5G11t7Geg9VGXXUNNz
	S8GlMnY6toLOY70HMGINa9xyh68sofovys7TOvITZ9/2WCdJc/be/MNbN97xWBuSqyyhXULLmF4X5
	MICrKjW31pNKSjtKdEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPYaQ-004jyd-AZ; Wed, 02 Mar 2022 23:40:50 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPYY5-004jBb-5Q; Wed, 02 Mar 2022 23:38:26 +0000
Received: by mail-qt1-x832.google.com with SMTP id b23so3197985qtt.6;
 Wed, 02 Mar 2022 15:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0UHeOvGnIMNoM6NqeyF78xFos6+YD8GiFF2O+NX+I08=;
 b=A/8uC4OLZK85x/RsG6wFgeWjAayUjjUSlMWGVzfPxubGvRVyL6+UqPMrijz8hBNBae
 7+Xma0aYf2Wnr1goOeR8vCpaBIDCURIghfyk8+CPkPm8Wjlh4XrVXzXMmlU7y9LZ5llU
 Ra7+w69qG+z5lQmzrnsv6xktbsN0B2rEgy1R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0UHeOvGnIMNoM6NqeyF78xFos6+YD8GiFF2O+NX+I08=;
 b=d3TI/ytvBirhkia00iFJbYQv7CmuJbj39MM4Lnpr78pooeZfl5IX14FbxaHTrjT3/H
 AxjchkDT6e3lOZnUYOqGV0bu6qx2xS+JpwXiSRAorxfGeBUC+qoOK1L4QUMCVeHVaZyJ
 KNCDjqcPpNrsKxf6Kl/ap/X3eIFbImkDzaTNusRRP7oBWoQDnyJX260VYoJs+hkNki+b
 TM5Gc/AV7wOCViFJZVW+BZ8JCqXdS8E7TCIDPmSCtrkLLxlhHrnCwogWIRsxCQWD9J1S
 Nna7N/eM06OwGuibcd+9TIkvh6pKJcQjdiuk3JGOl2y13OdTVg6prOPRxHCkUGVrJl1y
 r4RA==
X-Gm-Message-State: AOAM531s1mwmk9oE4SZbYfFL00a3tHa+pHt4DUv5kUC9OoivDsjCRaB5
 wbKfIn/LCSoRfR+wvm0DxSROChaK7e4bM/hhY4I=
X-Google-Smtp-Source: ABdhPJwCs5BS/vb/0Gnia8sBd/4fwz2M9pisx/6g/jEojI9HtPhU1m7xtnkyYUd9xlwgdUsE3xPO2rpi1UAXpFZPYeE=
X-Received: by 2002:a05:622a:1b8d:b0:2c6:59a9:360e with SMTP id
 bp13-20020a05622a1b8d00b002c659a9360emr25551831qtb.678.1646264303744; Wed, 02
 Mar 2022 15:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-5-clg@kaod.org>
In-Reply-To: <20220302173114.927476-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 23:38:10 +0000
Message-ID: <CACPK8Xc5DMeBnQnVWk4YUsiN7YFsujYh9Qs9okrc8vFvaF28Fw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] spi: spi-mem: Add driver for Aspeed SMC
 controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_153825_299329_19504F9B 
X-CRM114-Status: GOOD (  21.56  )
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

T24gV2VkLCAyIE1hciAyMDIyIGF0IDE3OjMxLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qu
b3JnPiB3cm90ZToKPgo+IFRoaXMgU1BJIGRyaXZlciBhZGRzIHN1cHBvcnQgZm9yIHRoZSBBc3Bl
ZWQgc3RhdGljIG1lbW9yeSBjb250cm9sbGVycwo+IG9mIHRoZSBBU1QyNjAwLCBBU1QyNTAwIGFu
ZCBBU1QyNDAwIFNvQ3MgdXNpbmcgdGhlIHNwaS1tZW0gaW50ZXJmYWNlLgo+Cj4gICogQVNUMjYw
MCBGaXJtd2FyZSBTUEkgTWVtb3J5IENvbnRyb2xsZXIgKEZNQykKPiAgICAuIEJNQyBmaXJtd2Fy
ZQo+ICAgIC4gMyBjaGlwIHNlbGVjdCBwaW5zIChDRTAgfiBDRTIpCj4gICAgLiBPbmx5IHN1cHBv
cnRzIFNQSSB0eXBlIGZsYXNoIG1lbW9yeQo+ICAgIC4gZGlmZmVyZW50IHNlZ21lbnQgcmVnaXN0
ZXIgaW50ZXJmYWNlCj4gICAgLiBzaW5nbGUsIGR1YWwgYW5kIHF1YWQgbW9kZS4KPgo+ICAqIEFT
VDI2MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIpCj4gICAgLiBob3N0IGZp
cm13YXJlCj4gICAgLiAyIGNoaXAgc2VsZWN0IHBpbnMgKENFMCB+IENFMSkKPiAgICAuIGRpZmZl
cmVudCBzZWdtZW50IHJlZ2lzdGVyIGludGVyZmFjZQo+ICAgIC4gc2luZ2xlLCBkdWFsIGFuZCBx
dWFkIG1vZGUuCj4KPiAgKiBBU1QyNTAwIEZpcm13YXJlIFNQSSBNZW1vcnkgQ29udHJvbGxlciAo
Rk1DKQo+ICAgIC4gQk1DIGZpcm13YXJlCj4gICAgLiAzIGNoaXAgc2VsZWN0IHBpbnMgKENFMCB+
IENFMikKPiAgICAuIHN1cHBvcnRzIFNQSSB0eXBlIGZsYXNoIG1lbW9yeSAoQ0UwLUNFMSkKPiAg
ICAuIENFMiBjYW4gYmUgb2YgTk9SIHR5cGUgZmxhc2ggYnV0IHRoaXMgaXMgbm90IHN1cHBvcnRl
ZCBieSB0aGUgZHJpdmVyCj4gICAgLiBzaW5nbGUsIGR1YWwgbW9kZS4KPgo+ICAqIEFTVDI1MDAg
U1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIpCj4gICAgLiBob3N0IGZpcm13YXJl
Cj4gICAgLiAyIGNoaXAgc2VsZWN0IHBpbnMgKENFMCB+IENFMSkKPiAgICAuIHNpbmdsZSwgZHVh
bCBtb2RlLgo+Cj4gICogQVNUMjQwMCBOZXcgU3RhdGljIE1lbW9yeSBDb250cm9sbGVyIChhbHNv
IHJlZmVycmVkIGFzIEZNQykKPiAgICAuIEJNQyBmaXJtd2FyZQo+ICAgIC4gTmV3IHJlZ2lzdGVy
IHNldAo+ICAgIC4gNSBjaGlwIHNlbGVjdCBwaW5zIChDRTAg4oi8IENFNCkKPiAgICAuIHN1cHBv
cnRzIE5PUiBmbGFzaCwgTkFORCBmbGFzaCBhbmQgU1BJIGZsYXNoIG1lbW9yeS4KPiAgICAuIHNp
bmdsZSwgZHVhbCBhbmQgcXVhZCBtb2RlLgo+Cj4gRWFjaCBjb250cm9sbGVyIGhhcyBhIG1lbW9y
eSByYW5nZSBvbiB3aGljaCBmbGFzaCBkZXZpY2VzIGNvbnRlbnRzIGFyZQo+IG1hcHBlZC4gRWFj
aCBkZXZpY2UgaXMgYXNzaWduZWQgYSB3aW5kb3cgdGhhdCBjYW4gYmUgY2hhbmdlZCBhdCBib290
aW1lCj4gd2l0aCB0aGUgU2VnbWVudCBBZGRyZXNzIFJlZ2lzdGVycy4KPgo+IEVhY2ggU1BJIGZs
YXNoIGRldmljZSBjYW4gdGhlbiBiZSBhY2Nlc3NlZCBpbiB0d28gbW9kZXM6IENvbW1hbmQgYW5k
Cj4gVXNlci4gV2hlbiBpbiBVc2VyIG1vZGUsIFNQSSB0cmFuc2ZlcnMgYXJlIGluaXRpYXRlZCB3
aXRoIGFjY2Vzc2VzIHRvCj4gdGhlIG1lbW9yeSBzZWdtZW50IG9mIGEgZGV2aWNlLiBXaGVuIGlu
IENvbW1hbmQgbW9kZSwgbWVtb3J5Cj4gb3BlcmF0aW9ucyBvbiB0aGUgbWVtb3J5IHNlZ21lbnQg
b2YgYSBkZXZpY2UgZ2VuZXJhdGUgU1BJIGNvbW1hbmRzCj4gYXV0b21hdGljYWxseSB1c2luZyBh
IENvbnRyb2wgUmVnaXN0ZXIgZm9yIHRoZSBzZXR0aW5ncy4KPgo+IFRoaXMgaW5pdGlhbCBwYXRj
aCBhZGRzIHN1cHBvcnQgZm9yIFVzZXIgbW9kZS4gQ29tbWFuZCBtb2RlIG5lZWRzIGEgbGl0dGxl
Cj4gbW9yZSB3b3JrIHRvIGNoZWNrIHRoYXQgdGhlIG1lbW9yeSB3aW5kb3cgb24gdGhlIEFIQiBi
dXMgZml0cyB0aGUgZGV2aWNlCj4gc2l6ZS4gSXQgd2lsbCBjb21lIGxhdGVyIHdoZW4gc3VwcG9y
dCBmb3IgZGlyZWN0IG1hcHBpbmcgaXMgYWRkZWQuCj4KPiBTaW5nbGUgYW5kIGR1YWwgbW9kZSBS
WCB0cmFuc2ZlcnMgYXJlIHN1cHBvcnRlZC4gT3RoZXIgdHlwZXMgdGhhbiBTUEkKPiBhcmUgbm90
IHN1cHBvcnRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IENoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19r
dW9AYXNwZWVkdGVjaC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4KClJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
