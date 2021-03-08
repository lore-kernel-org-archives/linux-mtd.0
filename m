Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A0DC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:32:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEED164DA3
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEED164DA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JaxJWTISWOnyoRwlpwSiOKeJlDTJyGnooOTIskcjiyc=; b=TCWnoVgV5ZSNcnKdDaoqugfew
	nIbi5R6hhQgYY2iDq14jPliuF6leClvCAAZkeohFiSvdHe6CcPrR+hzBhQCA+p54ZpCArgpeXMI7A
	FWiVfveTyh1Wb3HXTj8B2yi3x+NT0c03RrKtyCsA4/8e8Jqhm8NWSu2/Utlsz5xGI/5lTzOaWyhos
	41Og1ZqT6TcLhS8dsTftdZuSM6GKFLaCi4myTpMKb80DJKjf3HQWKVwD+D41H/NpxFD+3Co3AT5EG
	VFlwyuqoBRhjChd61wb+ZQiUwA7XguDxFUFsOOyy4x4IY6QFPnDHDYwoCiGltvwcRTk2hFUSZ9AwY
	7oEXiFgMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJFzj-00HTH6-Bf; Mon, 08 Mar 2021 13:32:24 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJFzd-00HTEr-Gn
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 13:32:21 +0000
Received: by mail-lj1-x234.google.com with SMTP id m11so16045458lji.10
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 05:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Eep1QcznjPuYsexkb4E/ZfaTf97lrmmqC3yW5OUegjs=;
 b=B/1bmCGRRuXpC7NVzINvwDzAHg6sA1EMBkFPT7WvGyiqa+mVp833/AI2mt2mMVvE1r
 +xHxG+jrJiBiJIgKz7XcYLlUEtql21p9EFVk3jI2ZBO9mJaZDTBsLGKQbzWa7Alpp5dx
 QaeaQmKryyHF0JtOd2QTxfBUWFPlIxyH/1h4gnG6U8H3Mue/MrIFlB23ihn0TNZ/10lr
 SUqPnTUgH3e/iE/pa3wBbISmNE9PpsqZ7X1EefLH9pOuOh06EePyOYevCnMbqTA0LsSL
 avel9J8MwYfMLpzUWuuu4jVHRKnwDnD0KSzShHXsfF+LjNvvEKhub+Vo4x9owjsXcIPU
 u8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eep1QcznjPuYsexkb4E/ZfaTf97lrmmqC3yW5OUegjs=;
 b=DNyOmht9d+maVBs5yMSCLFklYs19rw4UyOszAFZyGohC4KJRQSNW77MNOjnwwGjqCu
 347/Jp4paghcA68Rk+DKgyIS5zoRNAQ8iM3/czHd7tphSco3HSfUyqRAz4TRSLcnEKbM
 +Enf4IKei/F1QuCQ4WHZyTB7vJr0lQ0jLTQAWa6XrizL8RQVZsdja8CKFNEFThFhdMHH
 rQ9YDGPA8VUPLQmfb2/7BTXC46fn44wl+pY1O+4bolvz6OWASa9PfvAejPaO6SwQzva7
 h0r33Ur5OTapY7vzuCiaCwVaWdpRTIEd/nb+GZrRNSeTVzhuhMw18riykeg+pr/ZciM0
 RqVw==
X-Gm-Message-State: AOAM531eTmqW7Hk/phL+GP0DB8DUUwhWhfPqzp0UyClVH81mi1a4gF5N
 rG3OKcTWwvWpspoqCWfk2ir63/4MOoI=
X-Google-Smtp-Source: ABdhPJzScDlDq/qIK+QD1GR7aQMtVguQKejzQ1InCUAPUJ0aH0u6GnQJBEb0iN9THzJ0dmsdgfqZQg==
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr14312383ljk.161.1615210336796; 
 Mon, 08 Mar 2021 05:32:16 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id i22sm1499138ljg.37.2021.03.08.05.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:32:16 -0800 (PST)
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Document use of nvmem-partitions
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-4-ansuelsmth@gmail.com>
 <ee596471-db9b-43e4-c085-9bd938101587@gmail.com>
 <YEUHsoC4V+H6PCHL@Ansuel-xps.localdomain>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <6e1ef2eb-adb4-4341-f671-0d21fadda3e9@gmail.com>
Date: Mon, 8 Mar 2021 14:32:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YEUHsoC4V+H6PCHL@Ansuel-xps.localdomain>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_133219_739502_E3259DBF 
X-CRM114-Status: GOOD (  17.96  )
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

T24gMDcuMDMuMjAyMSAxODowNCwgQW5zdWVsIFNtaXRoIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDA4
LCAyMDIxIGF0IDEwOjQ4OjMyQU0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gT24g
MTYuMDIuMjAyMSAyMjoyNiwgQW5zdWVsIFNtaXRoIHdyb3RlOgo+Pj4gRG9jdW1lbnQgbnZtZW0t
cGFydGl0aW9ucyBjb21wYXRpYmxlIHVzZWQgdG8gdHJlYXQgbXRkIHBhcnRpdGlvbnMgYXMgYQo+
Pj4gbnZtZW0gcHJvdmlkZXIuCj4+Cj4+IEknbSBqdXN0IHdvbmRlcmluZyBpZiAibnZtZW0tcGFy
dGl0aW9ucyIgaXMgYWNjdXJhdGUgZW5vdWdoLiBQYXJ0aXRpb25zCj4+IGJpdCBzb3VuZHMgYSBi
aXQgYW1iaWd1b3VzIGluIHRoZSBtdGQgY29udGV4dC4KPj4KPj4gV2hhdCBkbyB5b3UgdGhpbmsg
YWJvdXQgIm10ZC1udm1lbS1jZWxscyIgb3IganVzdCAibnZtZW0tY2VsbHMiPwo+IAo+IEkgcmVh
ZCBzb21ld2hlcmUgdGhhdCBtdGQgaXMgbm90IHNvIHN0YW5kYXJkIHNvICJudm1lbS1jZWxscyIg
c2hvdWxkIGJlIHRoZQo+IHJpZ2h0IGNvbXBhdGlibGUuCj4gVG8gc3VtIHVwLCB3aXRoIHYyIEkg
c2hvdWxkIGNoYW5nZSB0aGUgY29tcGF0aWJsZSBuYW1lIGFuZCBqdXN0IHB1c2ggdGhlCj4gMiBh
bmQgMyBwYXRjaC4gKHdhaXRpbmcgeW91ciBmaXggdG8gYmUgYWNjZXB0ZWQpIENvcnJlY3Q/CgpJ
J20gYWxzbyBxdWl0ZSBzdXJlIHlvdSdyZSBmaW5lIHRvIHNlbmQgVjIgbm93LCBpZiB5b3UganVz
dCBsZXQKbWFpbnRhaW5lcnMga25vdyAoZS5nLiBpbiBhIGNvbW1lbnQgYmVsb3cgYSAtLS0gdGVh
ciBsaW5lKSB0aGF0IGl0CmRlcGVuZHMgb24gdGhlOgpbUEFUQ0hdIG10ZDogcGFyc2Vyczogb2Zw
YXJ0OiBsaW1pdCBwYXJzaW5nIG9mIGRlcHJlY2F0ZWQgRFQgc3ludGF4CgpJbiBvdGhlciB3b3Jk
czogeW91IGRvbid0IG5lZWQgdG8gd2FpdCBmb3IgbXkgcGF0Y2ggdG8gZ2V0IGFjY2VwdGVkLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
