Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E8AC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:25:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF5C61924
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF5C61924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XyzJdOSbC5tNSG9cV8jYjFactqWwZcLWgm8/hN+7X4E=; b=pjyzNLQ+wiKiu7UnIIpzaR7Ny
	gRRX5Z0NMbkMA2LVqQgtoeDo5Sd8DKvECyCSoDF/dB/cSjgxnM9LrO8HFB+n2QTkFml/c00ZmRJ5c
	WdqMzTm8AvACUGtDN36yluiY5YAOy8XYxcrnd408iwgqZuYj1KozLwBhvK/MlrZCNhhlnOZQVEiNA
	hpgbUeQ5j6d+3/sFeK6HGSeHqb/b/j4/oSQtTibao0fkR3ri1W3HdvwnKTmdEwiULyvjp9dsDmU9S
	fRYIzGDv5kwDJvBhu9fcWttdzoxIM/P7hUpHB+EIJqb4XhHAxjbH3wy3s7s9q3rTHt6gSXZbh60+T
	wLGE55OIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPDm-00CFZZ-61; Mon, 22 Mar 2021 18:24:10 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPDJ-00CFWN-SQ
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 18:23:44 +0000
Received: by mail-lf1-x12f.google.com with SMTP id w37so22768084lfu.13
 for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2021 11:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q6RlBpvSM4KQsvCRX2Pe6voGFi20o2BL3ntCy9+OJUk=;
 b=E5omZ1uoR6lb58ufBdK0nlTUs0fbsiTglphdfuhYsoksJhaZgva1bP/+NvpAOZKEFn
 KwpNjXhzuh+K/On0FSD7ct9P0Q7JYTzrMRNH2XbPkPwiHc71bFIMnYNMKb7sRfhE5fVn
 +7nK9ExfZKfH7ldwNRMJPP51Ej52vRs43GRzam6UFlTK4U04193G3noNwbm8svLO+KpG
 iv8HVx0U7xXCJTvEhwMS5Jgtq89tNpujiltkfltB1fHVFbzKP+pAPd99GpDAE2Pvw+6/
 GvHxPtrqy3xnAORjb/WivRGDtruIwrAzxpNMIstiPOmrxpAb45mznTfNQbSDmRAfQZl0
 lAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q6RlBpvSM4KQsvCRX2Pe6voGFi20o2BL3ntCy9+OJUk=;
 b=rEegww5tiJHMiBA8S2GtKNWSvGJqRpRvj8zxgGp3W9YpjVZJ04xvg7dtNd8E/goSpG
 al1LtyJyD+4ujcCDL5C0+wMV/soce1/a8BrQOGYvspfnHLqJLvYrUuotHrBVwB3KHGpK
 oWVNi3fR3/yNSxNhGWwEhYcbUc+9sEMl0+a9pLHi1nSfCstWHboClEMZM6A6u62yniH0
 jH5gw6uGQ1DLPkyVd6jLKy1DHzBMD4ggSQmuV4oo+6N5wflk48IxXe4HX2IxB50gsyw5
 /cPYp63OFXfSZ2wr5fGyZpsMqGwNGIUsGVMvTPy9AJXzCp6qBchfaMeg7nXy7kE+ZI5Q
 mRFQ==
X-Gm-Message-State: AOAM532D0ZFFQfhltmBgYutRe7B0pS1yMa53PGptdcKozW3/++nRMJ6k
 /BcEgmEc7QDTKV1AYAioaKihLfdLoaHx2Q==
X-Google-Smtp-Source: ABdhPJyi37ir3zPanMhxK3gML8E8Fkw6WDn+d+DujJ0QVA2read0WxlbkVyES+ymyvZfW7cdldcJTQ==
X-Received: by 2002:ac2:5e21:: with SMTP id o1mr337803lfg.435.1616437420625;
 Mon, 22 Mar 2021 11:23:40 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id x21sm1635584lfe.193.2021.03.22.11.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 11:23:39 -0700 (PDT)
Subject: Re: MTD partitioning & firmware installation on Broadcom devices
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
References: <CACna6rzeCFKVRuX++oUbdEvUFCVSD-YrHHDKz+3z7-6Dr4K9FQ@mail.gmail.com>
Message-ID: <b4dd9b66-764f-7964-d61b-8e2172419365@gmail.com>
Date: Mon, 22 Mar 2021 19:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CACna6rzeCFKVRuX++oUbdEvUFCVSD-YrHHDKz+3z7-6Dr4K9FQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_182342_557876_06F7359C 
X-CRM114-Status: GOOD (  18.75  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDguMDMuMjAyMSAxODozNywgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IFNvbHV0aW9uICMy
Cj4gRmxhc2hpbmcgZmlybXdhcmUgaW1hZ2UgYXMgaXMgKHdpdGggY2ZlcmFtLjAwMCkgYW5kIGFk
anVzdGluZyBpdC4KPiBUaGlzIHNob3VsZCBiZSBuaWNlciBhcyBtb3VudGluZyBKRkZTMiBNVEQg
cGFydGl0aW9uIGlzIHNpbXBsZS4gVGhlCj4gcHJvYmxlbSBpcyBwYXJ0aXRpb25pbmcuCj4gSSdk
IG5lZWQgdG8gcmVtb3ZlIE1URCBwYXJ0aXRpb25zIGFuZCB0cmlnZ2VyIHJlLXBhcnRpdGlvbmlu
ZyBvZgo+ICJmaXJtd2FyZSIgcGFydGl0aW9uLiBPbmx5IG9uY2UgSSBoYXZlIExpbnV4IGNyZWF0
ZSAiYm9vdGZzIiBhbmQgInViaSIKPiBwYXJ0aXRpb25zIGFnYWluIGZvciBtZSBJIGNvdWxkIG1v
dW50ICJib290ZnMiIGFuZCByZW5hbWUgdGhlIGZpbGUuCj4gVGhlcmUgaXMgbm8gc3VwcG9ydCBm
b3Igc3VjaCByZXBhcnRpdGlvbmluZyBhdCB0aGlzIHBvaW50IEFGQUlLLgoKSSd2ZSBpbXBsZW1l
bnRlZCB0aGF0IHNvbHV0aW9uLiBLZXJuZWwgcGFydCB3YXMgdHJpdmlhbCBhY3R1YWxseSwgSSBq
dXN0CndpcmVkIHVwIEJMS1JSUEFSVCBpb2N0bC4KClRoZSBwcm9ibGVtIGlzIGl0IGRvZXNuJ3Qg
d29yay4gRG9pbmcgIm12IGNmZXJhbS4wMDAgY2ZlcmFtLjEyMyIgcmVzdWx0cwppbiBtYXJraW5n
IGNmZXJhbS4wMDAgbm9kZSBhcyBkZWxldGVkIGFuZCBhZGRpbmcgYSBuZXcgY2ZlcmFtLjEyMyBu
b2RlCmhhcmRsaW5raW5nIHRvIHRoZSBvcmlnaW5hbCBjb250ZW50LiBTb3VuZHMgZ29vZCBidXQg
Q0ZFIGJvb3Rsb2FkZXIgaXMKdG9vIHN0dXBpZCBmb3IgdGhhdC4gSXQgZG9lc24ndCByZWNvZ25p
emUgZGVsZXRlZCBmaWxlcyAobm9kZXMpIGFuZApiZWxpZXZlcyBjZmVyYW0uMDAwIGlzIHN0aWxs
IHRoZXJlLgoKSSBkb24ndCB3YW50IHRvIGltcGxlbWVudCBKRkZTMiBoYWNrcyBjaGFuZ2luZyBp
dHMgcmVuYW1lIHN1cHBvcnQKaW1wbGVtZW50YXRpb24uIFNvIEkndmUgdG8gcHJvY2VlZCB3aXRo
IFNvbHV0aW9uICMxIGFuZCBqdXN0IHdyaXRlCnRvb2wgbW9kaWZ5aW5nIEpGRlMyIGltYWdlIGJl
Zm9yZSBmbGFzaGluZyBpdCB0byB0aGUgTVRELgoKLS0tIGEvZHJpdmVycy9tdGQvbXRkY2hhci5j
CisrKyBiL2RyaXZlcnMvbXRkL210ZGNoYXIuYwpAQCAtMTAxNSw4ICsxMDE1LDExIEBAIHN0YXRp
YyBpbnQgbXRkY2hhcl9pb2N0bChzdHJ1Y3QgZmlsZSAqZmkKCiAgCWNhc2UgQkxLUlJQQVJUOgog
IAl7Ci0JCS8qIE5vIHJlcmVhZCBwYXJ0aXRpb24gZmVhdHVyZS4gSnVzdCByZXR1cm4gb2sgKi8K
LQkJcmV0ID0gMDsKKwkJaW50IG5yX3BhcnRzOworCisJCWRlbF9tdGRfcGFydGl0aW9ucyhtdGQp
OworCQlucl9wYXJ0cyA9IHBhcnNlX210ZF9wYXJ0aXRpb25zKG10ZCwgTlVMTCwgTlVMTCk7CisJ
CXJldCA9IG5yX3BhcnRzIDwgMCA/IG5yX3BhcnRzIDogMDsKICAJCWJyZWFrOwogIAl9CiAgCX0K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
