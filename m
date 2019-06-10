Return-Path: <SRS0=IRBa=UJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58389C31E43
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jun 2019 17:35:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C9AE20820
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jun 2019 17:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tRg2vZO2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgHt6UxA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C9AE20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtgkV5wJsScxQqnQ/+/wZhYm8rWV+xgh9togGWNz2oY=; b=tRg2vZO25ULfuI
	ts4/ZNfe1XmqAf7p2rAh5x61ZUwww1C5/YSCwYDj217qgqTFr9MJP47M27GoE9oaA25Q0c2kyNQkY
	gDwd7FyyRkSwMBRqfDQH3F9fgOym+Hs8V/l64Ki0gvWKnot4Yxl4anWG8sPBpiijCPC/3Od3Fq8ZV
	NTURFmxwHmq/Pj+Q0Vy6TLIQpPwV1EYWuHkNw7lQW8HPvUMRjrp3rGuqdy1IVD6S4c8DHKe2C8Tj5
	xhXnOpSVJRA4SHtmveTtb/uHeNs31RbXmhGXdXuNZ96SGrGkNDUhwAootON2CIZVeMaGqk4a3sAEm
	GySbOD0iAKf9+MRxOO2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haOCK-0000M4-6e; Mon, 10 Jun 2019 17:35:08 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haOCH-0008JM-SP
 for linux-mtd@lists.infradead.org; Mon, 10 Jun 2019 17:35:07 +0000
Received: by mail-pg1-x542.google.com with SMTP id a3so5409538pgb.3
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jun 2019 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YPZsrhh8xdphj6kY/HU7HzmBPcCgASPSW2QDsj7N1cg=;
 b=LgHt6UxAoxGiOoolvM+Eclo4zgmkI5hAf91cyxO7JHH4rl0FIfBTPuV0vQ1zzgHEoJ
 eexk+9q797xYgx1sxI1agKYgXxDAoxZ+4YFUhzDh9RLI6v8+Te1YAzLmdzbuTtCNlkSu
 bZu6h2y7c72ndor4qMx6RgyrTeBto72OxVZUQV3Oo0ZjnHS6SoPWIQmz5ZpwLGjHjIUn
 BRwjJgYuiFF19HNyTVDhAB+xYfipUMjGduIqheJHOeNObyEm4LfvUa/gzr467L0BgDpl
 M6uhAMjsMe9FGkxAXtKv9zCS/YeL0BQgTgtKL8yK9eunvd1KSIP4qPIPq16JSK2K/Cq9
 qpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YPZsrhh8xdphj6kY/HU7HzmBPcCgASPSW2QDsj7N1cg=;
 b=KKerugHIEetBf5Is4ezqopVrcXAQwWG80T/ZNOGxvE1lRtQOwvE+5kT1FmZFnum28z
 Ajz4/NDv5ApiO480CDO/g5l999khBdSnCJ9z8Eh2Wy53oELXo0DKhIrVtvXkx5IdzK9j
 ieOQvcxpn0Ic9RDROuPP7RtMxkxsD9L/yIqsIR/B84Y2Eu9/4bTkMJtw1L6otMnDPZBG
 sTlw50RLvS50QgrGtVchtVrV5O6xrhEaG4ioD18FwUYADEf0XhD6sOF/NYYRcrbVNukr
 KuPT+FgY+7pyea4SsXIsaOhrUxB29THiAh2C4PObQEY3nY023vNIXy3BhAXwus5Qhk4f
 W65w==
X-Gm-Message-State: APjAAAXBWQJky9sfB+XhlDPtNS+qZH6nNrIUyC+CKxFeShHf4AMV7y40
 PD7V9lERvJ3rG1ym+WD/QPKvc4elpcXJAFpUIduxSLRK
X-Google-Smtp-Source: APXvYqwK7ZFD2PfIVv37pSazZY7T13zvcVUvk2fHhw4cV6DYbWYd+Eyj41jZJmA0fOktvTKc1EReaNlw5xcnqd3xeWg=
X-Received: by 2002:a17:90a:24ac:: with SMTP id
 i41mr335453pje.124.1560188104720; 
 Mon, 10 Jun 2019 10:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190601104322.57inoggnek3crg55@flow>
 <CAO1O6sdeY6ZY_PhoZrVuqCg20F0Dt3Y_mXXr-OYUMD4HZMihvg@mail.gmail.com>
 <1380627689.233779.1559939049026.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <1380627689.233779.1559939049026.JavaMail.zimbra@sigma-star.at>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Mon, 10 Jun 2019 19:34:53 +0200
Message-ID: <CAO1O6sc4RfdrDGiJgXYZaDeZ2e46Rr=PFhqFYYWB9Gqd8XH8NQ@mail.gmail.com>
Subject: Re: [PATCH v2] mkfs.ubifs: Add ZSTD compression
To: Richard Weinberger <richard@sigma-star.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_103505_927854_697F95C3 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKRGVuIGZyZSA3IGp1bmkgMjAxOSBrbCAyMjoyNCBza3JldiBSaWNoYXJkIFdlaW5i
ZXJnZXIgPHJpY2hhcmRAc2lnbWEtc3Rhci5hdD46Cj4KPiBFbWlsLAo+Cj4gLS0tLS0gVXJzcHLD
vG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gVGhlIG5ldyBtdGQtdXRpbHMgd2l0aCB0aGlzIHBhdGNo
IGRvZXNuJ3QgY29tcGlsZSBvbiBVYnVudHUgMTguMDQgTFRTCj4gPiBzaW5jZSBpdCB1c2VzIGEg
c2xpZ2h0bHkgb2xkZXIgdmVyc2lvbiBvZiB6c3RkICgxLjMuMykgdGhhdCBkaWRuJ3QKPiA+IGhh
dmUgdGhlIG1hY3JvIFpTVERfQ0xFVkVMX0RFRkFVTFQgZGVmaW5lZCwgd2hpY2ggd2FzIGludHJv
ZHVjZWQgaW4KPiA+IHZlcnNpb24gMS4zLjUuIENvdWxkIHlvdSBtYXliZSBjb25zaWRlciBhZGRp
bmcgdGhlIGZvbGxvd2luZyBsaW5lcyBpbgo+ID4gY29tcHIuYzoKPiA+Cj4gPiAjaWZuZGVmIFpT
VERfQ0xFVkVMX0RFRkFVTFQKPiA+ICNkZWZpbmUgWlNURF9DTEVWRUxfREVGQVVMVCAzCj4gPiAj
ZW5kaWYKPiA+Cj4gPiBvciBzaW1pbGFyLCB3aGljaCBtYWtlIGl0IGNvbXBpbGUgb24gc2xpZ2h0
bHkgb2xkZXIgZGlzdHJpYnV0aW9ucz8KPgo+IElmIEkgcmVhZCB0aGUgZG9jcyBjb3JyZWN0bHks
IHdlIGNhbiBqdXN0IHBhc3MgMCBhcyBjb21wcmVzc2lvbiBsZXZlbCwKPiB3aGljaCB3aWxsIGRl
ZmF1bHQgdG8gWlNURF9DTEVWRUxfREVGQVVMVC4KPiBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJv
b2svenN0ZC9wdWxsLzExNzQvY29tbWl0cy9lMzRjMDAwZTQ0NDQ0YjlmOGJkNjJlNWFmMGEzNTVl
ZTE4NmViMjFmCj4KPiBUaGlzIHNob3VsZCB3b3JrIG9uIGFsbCB6c3RkIHZlcnNpb25zLgoKQWZ0
ZXIgc29tZSBtb3JlIGludmVzdGlnYXRpb25zLCBhbHRob3VnaCBpbmNyZWFzaW5nIGNvbXByZXNz
aW9uIGxldmVsCmNlcnRhaW5seSBpbmNyZWFzZXMgY29tcHJlc3Npb24gdGltZSwgZGVjb21wcmVz
c2lvbiB0aW1lIGRvZXMgbm90IHNlZW0KdG8gYmUgaW5jcmVhc2VkIGJ5IGluY3JlYXNpbmcgY29t
cHJlc3Npb24gbGV2ZWwuIFNlZQpodHRwOi8vd3d3Lm9wZW4temZzLm9yZy93L2ltYWdlcy9iL2Iz
LzAzLU9wZW5aRlNfMjAxN18tX1pTdGFuZGFyZF9pbl9aRlMucGRmCnBhZ2UgOSBmb3IgYSBiZW5j
aG1hcmsuIFRoZSBiZW5jaG1hcmsgZXZlbiBzaG93cyB0aGlzIHNlZW1zIHRvIGFwcGx5CnRvIGd6
IGFzIHdlbGwuLi4KClNxdWFzaEZTIGhhcyBhbHNvIGFkZGVkIHN1cHBvcnQgZm9yIHpzdGQgYW5k
IHNxdWFzaGZzLXRvb2xzIHVzZXMgbGV2ZWwKMTUgYXMgdGhlIGRlZmF1bHQgbGV2ZWwgKHNlZQpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vZnMvc3F1YXNoZnMvc3F1YXNoZnMtdG9vbHMu
Z2l0L2NvbW1pdC8/aWQ9ZTM4OTU2YjkyZjczODUxOGMyOTczNDM5OTYyOWU3Y2RiMzMwNzJkMwph
dCB0aGUgYm90dG9tKS4KCldoaWxlIHRoZSBrZXJuZWwgY29tcHJlc3Npb24gbGV2ZWwgc2hvdWxk
IG1heWJlIHN0YXkgYXQgMywgZm9yCm1rZnMudWJpZnMgd2hlcmUgc3BlZWQgZG9lc24ndCBtYXR0
ZXIgdGhhdCBtdWNoLCBhIGhpZ2hlciBsZXZlbCBzdWNoCmFzIDE1IG1pZ2h0IG5vdCBiZSBiYWQg
YWZ0ZXIgYWxsLiBTbyBJIGhhdmUgdHdvIGRpZmZlcmVudCBwcm9wb3NhbHM6CmVpdGhlciBqdXN0
IHNldCBsZXZlbCAxNSBPUiBzZXQgbGV2ZWwgMTUgYW5kIGFsc28gcHJvdmlkZSBhbiBvcHRpb24K
Zm9yIG1rZnMudWJpZnMgdG8gb3ZlcnJpZGUgaXQgaWYgb25lIGZvciBzb21lIHJlYXNvbiB3YW50
cyB0byBnZW5lcmF0ZQp0aGUgaW1hZ2UgZmFzdGVyLgoKV2hhdCBkbyB5b3UgdGhpbms/CgovRW1p
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
