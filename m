Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EEFD12D51
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ7BVZ9TP5OfEQyrqgsdb/xlGiT7kk/Y85WEhGV/Mt4=; b=cJK+ESQpBGElE1
	LqIrdjsAXa75sGuqOPcIh5XKwS0aonnPG2OvlKjzoQBupktLKpfozFludMa3/sn1aZLJICh3xXod3
	xKa+qmMdEebW3nCWFCzqXPPQ63xLbHhyWkSQ95eXuYPfSLrZcST34DbDmCG4BTCGtPPe5pZfwHgkv
	alAiJSoJ+9BXKZiEB3a4iRubiXpdMpf0BVEU8MfRU/EIp59pvzL9rOAfF2Cj7Cg8/8imFpug7eT57
	I6dHZa1uRer3JdKsoRIUo0XgD6ipMys5lYmZHZKIwK+4MWtjhB0+hmGyA1lRYtt+3mWndYMxinA3m
	PhDwi8nd7s+Ly9LKoseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAW2c-00000000Pea-2pVI;
	Mon, 11 Nov 2024 15:09:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAW1b-00000000PRX-12b0
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 15:08:20 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so3535101a91.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731337697; x=1731942497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cSTqbyRS0iVUQaRFBZSTCX92EcpY3QPDhrLSR3Ycjc=;
        b=PsUTZXLaFGmyudaQ9NAEL240boRyrwm0Dlxc/IRTm6v3gDZC1TA6b4JCmalT54Ppxg
         kMUj5qe9MWBHpCr6KZTz5Mx5fe41wXT2deMX9SOaq8UiraY/qouQx+98WbI+B89sOHt2
         +3P+8R42Ra3jKZeHk+9z1LUmi1o35Q4+gPyy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731337697; x=1731942497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cSTqbyRS0iVUQaRFBZSTCX92EcpY3QPDhrLSR3Ycjc=;
        b=YwHiVQ5vK4GUiPYu7HRrMAvE9UWUoM12XLeW4hkIp+FCeODpieeIPl74lF9sZeqh9l
         BE3Um9J9aBSMuD/rKRHRjRpGSuuAhzVhX5D0iV6wlghKgo4fP6frLrQ0I75MElMW2teU
         UPM0AEpgYtCVdDA6AG9A1UIm3hHaYKGEOmLVEVsu9rz34blu2LZ80q9t5E6Kka+Hp4UL
         IdqhodIg5ccuIhCuQpphMFAxW0nEE4zjAIkzMKTTLxjc8Ka9O2vtj6VBIPuLJWWMqoAH
         YptK8gIXkujWaNN5FhNJyjOAC4nYmyN+a+sBCSBMK3JWB9HvoX9FpIYGPlgf8HANXfPO
         yLmQ==
X-Gm-Message-State: AOJu0YywLG9T/qTHtleqgVE8zvldS6GSv7W32oGN8z9iFs9GLrggIn0M
	QLmhrLIeHaaIBYtAJXekaQ+WunniHP3wJjpEvF67D2C2ex+qaY2gRcbGxY6Hj3jrM9l+Xxn17KW
	FrbxLNhuV8WtyjX/pnaJpTrvnQPjTh+dy3hyEk9Q1ItYoAJCR
X-Google-Smtp-Source: AGHT+IFBecI311Um9FC/mBa8q/0F/7SQbjdAdduMe0xlFacOSpGHWdVMGv/ZuNel1TDErBLwld8FXwBO4TBK6RGOpw4=
X-Received: by 2002:a17:90b:524a:b0:2e2:c00c:cb79 with SMTP id
 98e67ed59e1d1-2e9b165597dmr16728757a91.3.1731337696812; Mon, 11 Nov 2024
 07:08:16 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com>
 <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com>
In-Reply-To: <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 11 Nov 2024 16:08:05 +0100
Message-ID: <CAOf5uwm=nLLcyvtc7EGK=rdu6N+j6t6_hYyCWcB3QMACOAEx2A@mail.gmail.com>
Subject: Re: Some information about direct-io support on ubifs
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070819_343432_4CC1E1F3 
X-CRM114-Status: GOOD (  21.74  )
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

SGkKCk9uIE1vbiwgTm92IDExLCAyMDI0IGF0IDM6MTXigK9QTSBaaGloYW8gQ2hlbmcgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPgo+IOWcqCAyMDI0LzExLzExIDE3OjM3LCBNaWNo
YWVsIE5henphcmVubyBUcmltYXJjaGkg5YaZ6YGTOgo+ID4gSGkgYWxsCj4gPgo+ID4gSSB3b3Vs
ZCBsaWtlIHRvIGhhdmUgc29tZSBpbmZvcm1hdGlvbiBvbiBob3cgdG8gaW1wbGVtZW50IGRpcmVj
dC1pbwo+ID4gc3VwcG9ydCBpbiB1Ymlmcy4gSSBoYXZlIHRyaWVkIHRvIG1vdW50IHNxdWFzaGZz
IGltYWdlIGFzIGZpbGUgaW4KPiA+IHViaWZzIHVzaW5nIGxvb3BiYWNrIGFuZCBkaXJlY3QtaW8g
YnV0IGl0IHNlZW1zIHRoYXQgbG9vcCBjYW4gbm90Cj4gPiBoYW5kbGUgd2hlbiB0aGlzIGlzIG9u
IHRvcCBvZiB1Ymlmcy4gRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBmcm9tIHRoZQo+ID4gY29kZSBp
dCBzZWVtcyB0aGF0IHRoZSByZXF1aXJlbWVudCBpcyB0aGF0IHRoZSBkaXJlY3QtaW8gaXMKPiA+
IGltcGxlbWVudGVkIGluIHRoZSBmaWxlc3lzdGVtIHdoZXJlIHRoZSBmaWxlIGlzIHN0b3JlZC4g
SSBoYXZlCj4gPiBzaW11bGF0ZWQgdXNpbmcgbmFuZCBzaW0uIFRoZSBpZGVhIGlzIHRvIHJlZHVj
ZSB0aGUgYnVmZmVyaW5nLiBJJ20KPiA+IG9wZW4gdG8gaGF2ZSBvdGhlciBzdWdnZXN0aW9ucyBy
ZWdhcmRpbmcgdGhpcyB0b28uCj4gPgo+ID4gTWljaGFlbAo+ID4gLgo+ID4KPiBIaSBNaWNoYWVs
LAo+IFRoZXJlIGlzIGEgZGlzY3Vzc2lvbig5IHllYXJzIGFnbykgYWJvdXQgdWJpZnMgZGlvWzFd
LCBvZiBjb3Vyc2Ugd2UKPiBjYW5ub3QgaW1wbGVtZW50IGl0IGFzIGEgZmFrZSBpbnRlcmZhY2Ug
bm93Lgo+IEJlZm9yZSB0YWxraW5nIGFib3V0IGFkZGluZyBkaW8gc3VwcG9ydCBmb3IgVUJJRlMs
IGxldCBtZSBrbm93IHNvbWUKPiBiYWNrZ3JvdW5kIGluZm9ybWF0aW9uLiBXaGF0J3MgdGhlIHB1
cnBvc2Ugb2YgdXNpbmcgZGlvIGZvciBvcGVuaW5nCj4gc3F1YXNoZnMgaW1hZ2UgZmlsZT8gV2hh
dCdzIHRoZSBnb2FsIG9mIHJlZHVjaW5nIGJ1ZmZlciB5b3UgbWVudGlvbmVkCj4gYWJvdmUsIEJl
dHRlciBwZXJmb3JtYW5jZT8gTGVzcyBtZW1vcnkgdXNhZ2U/Cj4KPgo+IFsxXQo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMTQ0MDAxNjU1My0yNjQ4MS0yLWdpdC1zZW5kLWVtYWlsLXJp
Y2hhcmRAbm9kLmF0LwoKClRoZSBnb2FsIGlzIGxlc3MgbWVtb3J5IHVzYWdlLiBFYWNoIHNxdWFz
aGZzIGlzIG1vdW50ZWQgdXNpbmcgbG9vcGJhY2sKZGV2aWNlLCBzbyBhY2NvcmRpbmcKdG8gc29t
ZSB0aHJlYWQgb24gZGlyZWN0LWlvLCBJIHVuZGVyc3RhbmQgdGhhdCB3ZSB0aGVuIG5vdCBoYXZl
CmJ1ZmZlcmluZyB0d28gdGltZXMgb24gdWJpZnMgbGV2ZWwgYW5kIGxvb3AKbGV2ZWwsIGJ1dCB0
aGUgdGhyZWFkIHdhcyBub3QgY2xlYXIgdG8gbWUuIFRoZSBkZXZpY2UgaGFzIHZlcnkgbGltaXRl
ZApjYXBhYmlsaXR5IGFuZCBtZW1vcnkuIEkgaGF2ZSBkb25lIHNvbWUKdGVzdCB3aXRoIGZ1c2Ug
IGJ1dCBJIGRpZCBub3QgaGF2ZSBudW1iZXJzIHRvIGNvbXBhcmUgdGhlbQoKCk1pY2hhZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
