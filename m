Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A1DC35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 17:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CFAA20659
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 17:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jO3hhKVb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgLaOlAg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CFAA20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WHRsfRRlGzw9qiKXHBByxP17njBXWxM2FhFzZQ6P5uY=; b=jO3hhKVbAzL/mQ7YQaUHaGaBJj
	aC5v2pZEtVWJQHnmcG6zRgdbh+hru4H+dwFRI9TIrEFXO/XiWMirnw914kh7bHZuMMFRP3bu0B8iO
	napzNRIekBBJ7nr1JtEQGwUC5K1zbb6OkhYmJxrAfkbTxz3dY6MiFu+j9vDhvPC3Wy7M4AUE/1EOE
	c6B7657QHI8iq+XJCb2f89j5+TaoVzZkk3bjca1cOUC78STyJYeSnOrQ/5g8f6cyXdkyXiJ27l5Uo
	wBmg/IwqDLgo6otP0sOXp8KLGnWY3RU19nYk7jH8BWf2p4ltbBAWmnFInKcgC0tT2cZqkYQU3HAF/
	RBgK73bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izOaF-0005E6-Iq; Wed, 05 Feb 2020 17:35:27 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izOaB-00058D-9t
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 17:35:24 +0000
Received: by mail-vs1-xe42.google.com with SMTP id p6so1857566vsj.11
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 09:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=HrQYBi9rXU3VAeyuNlVTDYddC4KlHKguXPGAINk6SAs=;
 b=fgLaOlAgbBXquEhw5JJqU8NTO2l1EDbw/0QQT7R460icTQ4N8VB/SM0hUX97jVX5NF
 0bCbaUGBY7YLY8I6P0pjo6tGH2TxmYzegNM1M9xD0MnnurAYJLoAqihaPPRIcKPKkCKD
 F9MpXAO/KbQuFNMGgwL89j8qA7GAS3MU01iaorH8mB9jDOouFPREdvTy2RG7vZwasQTn
 g8oklwL9nTA/Cbafz8dewisWQb9x7CrCNCsGSEc7qYGHDgdF90QdKL5HmSr7oF/VXrod
 OuhzXwQoDwN6+mJljgKDY1uMBNenpO9D2kvj8bOS8+hEcV8e40t7ivVrcPx5XAlyJJRr
 SAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=HrQYBi9rXU3VAeyuNlVTDYddC4KlHKguXPGAINk6SAs=;
 b=Yq5CC50z9XQCHgncWPgq1be+Q1bMeSGPM8yO1N5Y6vmLd3uKv/d51v5exFRHIuICS9
 1filzihNrH7ERoKSYBZLUnqHJbXdttgAiz+TpjbJ9saiJBOH1GYf1wLtSlbTx0rDBl4L
 HcY5C6PnsmFZlfReCUeodbtVrVZXN0iITrHFU+iXHLbGRYqAR7hVNevz2BKRRIkYQTz3
 eyTJO/gIP1qRgwn2FNw8ugQmb/FUxAGAF15xxjYoEtWf6F3fYp0inopA7VxGU2cgUhN0
 6C6qv8i9ug/ezWvZCyt+DC0UCjfzllr+q1l2F0EYmuDLgZv7M24dDbOS6pIntewi5Hb+
 Mv4g==
X-Gm-Message-State: APjAAAWrk57ObqB0e8N3o5FIaEYbwdT+5yrUfscehZTrTXkgUbELppfV
 72HQ4ofb0FbyfuELEYbgkFB0NQ7Iw9hahmtee0oFL913
X-Google-Smtp-Source: APXvYqyfs6AViuoW5RDWCbAuXIJd3A6qd5CwX3L7xS8VxBurOt8pXx5b1Dzc4crMkUFVYjzIaS+KZTiF/dZsXTZT3KI=
X-Received: by 2002:a05:6102:a10:: with SMTP id
 t16mr23002623vsa.130.1580924121940; 
 Wed, 05 Feb 2020 09:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20191126212511.1218-1-brunompena@gmail.com>
 <449b471c-3604-ffab-b75a-47ed119a5ba8@gmail.com>
In-Reply-To: <449b471c-3604-ffab-b75a-47ed119a5ba8@gmail.com>
From: Bruno Pena <brunompena@gmail.com>
Date: Wed, 5 Feb 2020 18:34:43 +0100
Message-ID: <CADwgkMU9W3Ue8ckAPKNvOE-hgR45wNrqLxzhjWwD9RJaBPL9WA@mail.gmail.com>
Subject: Re: [PATCH] mtd: core: allow mask_flags to be set for
 mtd_add_partition
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_093523_378058_1BF0B410 
X-CRM114-Status: GOOD (  10.75  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKQSBwb3NzaWJsZSB1c2UgY2FzZSBpcyBtZW50aW9uZWQgb24gdGhlIGRlc2Ny
aXB0aW9uICJtYXNrIGNlcnRhaW4KZmxhZ3MgZm9yIG5ldyBwYXJ0aXRpb25zIChlLmcuIHRvIG1h
a2UgdGhlbSByZWFkLW9ubHkpIiAtIEkgYmVsaWV2ZQp0aGlzIGFuc3dlcnMgeW91ciAid2h5PyIg
cXVlc3Rpb24uCkFzIGZvciB5b3VyIGNvbW1lbnQgYWJvdXQgdXNlZnVsbmVzcywgeW91IGFyZSB2
ZXJ5IHdlbGwgYXdhcmUgdGhpcwpjb21lcyBmcm9tIHRoZSBPcGVuV3J0IHB1bGwgcmVxdWVzdCAy
NTM1IFsxXSB3aGVyZSB0aGlzIG5ldyBhcmd1bWVudAppcyB1c2VkLgpUaGUgb25seSByZWFzb24g
d2h5IHRoZSBmdWxsIHBhdGNoIHdhcyBub3Qgc2VudCBoZXJlIGlzIGJlY2F1c2UgaXQKZGVwZW5k
cyBvbiBPcGVuV3J0IHNwZWNpZmljIGNvZGUgWzJdIFszXSB0aGF0IGlzIHlldCB0byBiZSBtZXJn
ZWQgb24KdGhlIGtlcm5lbC4KRm9yIHRoaXMgcmVhc29uIC0gYW5kIGFzIHJlcXVlc3RlZCBvbiBP
cGVuV3J0IC0gSSBkZWNpZGVkIHRvIHN1Ym1pdCBhbgplbmFibGVyIHBhdGNoIGZvciB0aGUga2Vy
bmVsIGV4cG9ydGVkIEFQSSBtdGRfYWRkX3BhcnRpdGlvbi4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vb3BlbndydC9vcGVud3J0L3B1bGwvMjUzNQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL29wZW53
cnQvb3BlbndydC9ibG9iL21hc3Rlci90YXJnZXQvbGludXgvZ2VuZXJpYy9wZW5kaW5nLTQuMTQv
NDAxLW10ZC1hZGQtc3VwcG9ydC1mb3ItZGlmZmVyZW50LXBhcnRpdGlvbi1wYXJzZXItdHlwZXMu
cGF0Y2gKWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQvYmxvYi9tYXN0ZXIv
dGFyZ2V0L2xpbnV4L2dlbmVyaWMvcGVuZGluZy00LjE5LzQwMS1tdGQtYWRkLXN1cHBvcnQtZm9y
LWRpZmZlcmVudC1wYXJ0aXRpb24tcGFyc2VyLXR5cGVzLnBhdGNoCgpCZXN0IHJlZ2FyZHMsCkJy
dW5vIFBlbmEKCgpPbiBXZWQsIEZlYiA1LCAyMDIwIGF0IDk6MzEgQU0gUmFmYcWCIE1pxYJlY2tp
IDx6YWplYzVAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjYuMTEuMjAxOSAyMjoy
NSwgQnJ1bm8gUGVuYSB3cm90ZToKPiA+IFRoaXMgcGF0Y2hzIG1ha2VzIGl0IHBvc3NpYmxlIHRv
IG1hc2sgY2VydGFpbiBmbGFncyBmb3IgbmV3IHBhcnRpdGlvbnMgKGUuZy4gdG8gbWFrZSB0aGVt
IHJlYWQtb25seSkuCj4gPiBUaGUgY2hhbmdlIGNvbnNpc3RzIGluIHRoZSBhZGRpdGlvbiBvZiBh
IG5ldyBhcmd1bWVudCAibWFza19mbGFncyIgdG8gIm10ZF9hZGRfcGFydGl0aW9uIiB0aGF0IGlz
IHBhc3NlZCBvbiB0byB0aGUgImFsbG9jYXRlX3BhcnRpdGlvbiIuCj4KPiBZb3VyIGRlc2NyaXB0
aW9uIGFuc3dlcnMgIndoYXQ/IiBidXQgbm90ICJ3aHk/Ii4KPgo+IFRoaXMgcGF0Y2ggYWRkcyBh
IG5ldyBmdW5jdGlvbiBhcmd1bWVudCB0aGF0IGlzIG5ldmVyIHVzZWQuIFRoaXMgc2VlbXMKPiBx
dWl0ZSBwb2ludGxlc3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
