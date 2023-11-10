Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67FCC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=It6vKYygCukUKbI8cf/5oCCUAa3BgYbuncXpyMbz9k8=; b=FgvMNTJLFWgKH9
	VS0MI9Oy0vWRKUoaYvqLbv4JNFkG+SF0qE3NjZ0izXuNcxrE+c+2/2GgvxTskFZysFL4vkvZMX/n/
	Z4e7BL2+06HYwXRY6PE5xVM7g7TUeW2x48puCdgefowvivZULJvX/rdQCl0jbeR1deqbh1BO0P0R6
	4vwGAq0c9CpGr6EKAFonVDwWGzqNJzarO7AM3zb1kCAxReROj3bJPSMGL/Nqy8LEC9SF9ccr0d0DZ
	VrV6YqgrkpbVPN3R9pKmjrMp/GoqgXM2RSPWeCwxTO+YtuSQMh7vgMQX+HVVh1qlbYsUnm3S3Zw0X
	Ebx12YMHkEjz+XxC6qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1adk-009bel-2z;
	Fri, 10 Nov 2023 23:10:16 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1adi-009beE-0y
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 23:10:15 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d648679605so440022a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2023 15:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1699657812; x=1700262612; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UN5WfZbH4HRFj65BWwdm3V3ZrQp6mFTsH/WbTV4zQM=;
        b=g1aff82OZsbS/UemfOSJPqeq7caowN4pGJtWWEZRPEC1W1GsAOrGMe8ABIz8Q3r1cb
         6Vw33zq+lUVBH8oGGZoC4K6e7Vsgw5bUy9TUqX8QjAUkp62H9iLO+/446zTT3MAp2z8R
         XnEuPvVdWJqdAI/ndiNB4OMCVqOnZ7pX22Kiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699657812; x=1700262612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UN5WfZbH4HRFj65BWwdm3V3ZrQp6mFTsH/WbTV4zQM=;
        b=YIIZGBcOy+WHL+N8k4GXC420kM0pzUkbWuFGyHQE8aF6vudQdH5kRtqPovyeBxQkJG
         tS25QBdBIN8Qmhvpl3723LbgzZsrr+Fk1nym/J9eAJwnGDZyU4JizjMZHIFeeXx52suJ
         f1ksZV3XSu4u4bIDwAgDxiXrezGnvZMT1ldPe1BdiwyQws1pswjcnxWF+YRvVJAeA9qM
         s2+FYrGx2dVIo6oxA7z4P6yvfnV7XKUzKPIDPigPdhLZTtUosUDnd2sz9nTTmVzyF3jr
         koh13D7WXXzUmT+RKrhaSx39kVlHAvVfs2nqiRvv0Hgpm/y+AVlYvr+gVYNFKu8jd6gV
         7x9w==
X-Gm-Message-State: AOJu0Yy0pTRgin/v6pUyhRXWoAlEs+PscZ/Lg2OeBO1OGRE/tVQ0Y6Wt
	T1GTeJzVlYzCwpid0caOas0Pi4M1kAlwFQhomYKwrA==
X-Google-Smtp-Source: AGHT+IEbhgCtAskIwRk7JxB3AKFfhNJT1eDR9JswGI5DNZN3BWmbwrSfyyQv4P+OXmj2JsxRgXI4li1v7rVpwnjByKc=
X-Received: by 2002:a9d:7509:0:b0:6b7:6e07:4951 with SMTP id
 r9-20020a9d7509000000b006b76e074951mr501906otk.25.1699657811950; Fri, 10 Nov
 2023 15:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20231023171444.322311-1-dregan@broadcom.com> <15d09a16-249b-55a9-55ab-8bfa66c7e4de@broadcom.com>
In-Reply-To: <15d09a16-249b-55a9-55ab-8bfa66c7e4de@broadcom.com>
From: David Regan <dregan@broadcom.com>
Date: Fri, 10 Nov 2023 15:10:01 -0800
Message-ID: <CAA_RMS4HJ--eAwUoktMZS_rVS7+RhMhaYVPLGZmsXvcX6D2Ltw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] mtd: rawnand: Add destructive operation
To: William Zhang <william.zhang@broadcom.com>
Cc: David Regan <dregan@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-mtd@lists.infradead.org, f.fainelli@gmail.com, rafal@milecki.pl, 
	Joel Peshkin <joel.peshkin@broadcom.com>, computersforpeace@gmail.com, 
	Dan Beygelman <dan.beygelman@broadcom.com>, frieder.schrempf@kontron.de, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, 
	bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_151014_425083_584F7073 
X-CRM114-Status: GOOD (  16.94  )
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

SGkgTWlxdcOobCwKCkNhbiB5b3UgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgdXBkYXRlPwpU
aGlzIHBhdGNoIGhhcyBub3QgcmVjZWl2ZWQgYW55IGNoYW5nZSByZXF1ZXN0cyBhZnRlciB0d28g
d2Vla3MgYnV0CmxldCBtZSBrbm93IGlmIHlvdSBzZWUgYW55dGhpbmcgdGhhdCBzaG91bGQgYmUg
Zml4ZWQuCgpUaGFua3MhCgotRGF2ZQoKT24gV2VkLCBPY3QgMjUsIDIwMjMgYXQgNToyNeKAr1BN
IFdpbGxpYW0gWmhhbmcKPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPiB3cm90ZToKPgo+Cj4K
PiBPbiAxMC8yMy8yMDIzIDEwOjE0IEFNLCBkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlOgo+ID4g
RnJvbTogQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+Cj4gPgo+ID4gRXJh
c2UgYW5kIHByb2dyYW0gb3BlcmF0aW9ucyBuZWVkIHRoZSB3cml0ZSBwcm90ZWN0ICh3cCkgcGlu
IHRvIGJlCj4gPiBkZS1hc3NlcnRlZCB0byB0YWtlIGVmZmVjdC4gQWRkIHRoZSBjb25jZXB0IG9m
IGRlc3RydWN0aXZlCj4gPiBvcGVyYXRpb24gYW5kIHBhc3MgdGhlIGluZm9ybWF0aW9uIHRvIGV4
ZWNfb3AoKSBzbyBjb250cm9sbGVycyBrbm93Cj4gPiB3aGVuIHRoZXkgc2hvdWxkIGRlLWFzc2Vy
dCB0aGlzIHBpbiB3aXRob3V0IGhhdmluZyB0byBkZWNvZGUKPiA+IHRoZSBjb21tYW5kIG9wY29k
ZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2Vy
bmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20u
Y29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHY0OiBub25lCj4gPgo+ID4gQ2hhbmdlcyBpbiB2
MzogdXBkYXRlZCBjb21tZW50cyBhbmQgZW1haWwgYWRkcmVzcwo+ID4KPiA+IENoYW5nZXMgaW4g
djI6IGdhdmUgY3JlZGl0IHRvIEJvcmlzIEJyZXppbGxvbgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgNiArKysrLS0KPiA+ICAgaW5jbHVkZS9saW51eC9t
dGQvcmF3bmFuZC5oICAgICAgfCA5ICsrKysrKysrKwo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IFdpbGxp
YW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
