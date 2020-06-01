Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C5EC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 14:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4681320738
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 14:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CIgYU5SN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSx0giQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4681320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wb/a4EoIb/lnSAC+VXbUnXjZ0IdkrRH3yAjju5UjBrc=; b=CIgYU5SNQAnJxQ
	TFr9RNdlYASwX+4YfWFAz6PYvX6jmkREeIvlZZfBHJbRYGrS/gUfjofOyiuG/49EeiKzVhJSg91ho
	YgEor+CFZIgBnIE2MQhIRol36gYivb3qEaPdePV/bSC2FWmiY+ArNUeSjQvg7Kq0Jv9dYLFFmGosI
	GcummxL+jdO3MNNX+WuUPb2Yi32GqS4vYAX262LdDUrDKM7uGBBf+aKiq3cpvk0bmmBtnx9x4icYB
	PSDN1NfglhBrO+hmdKhlqPruyiHLt0cHoeJu4LfPR3m5zFyCY1b6JGA1F6tpNuItlXWZootgaN61B
	kASeQTgk+Nj4cLVY4RAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfl8Z-0000LN-6b; Mon, 01 Jun 2020 14:09:59 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfl8V-0000KS-Tj
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 14:09:57 +0000
Received: by mail-qt1-x844.google.com with SMTP id u17so6618049qtq.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2020 07:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fbZdYm4tTM0Wf8wHGSlW2NhyIxRchTNsSSc7i/vJwUY=;
 b=kSx0giQCmk8jKz9zLHENY9L49nkWaOdhf+miZFc4fUnYnH7yS+vGn2/UTMyAtN0saj
 Tttps9HZ5cPkvO6Bp3q0M1JMTVSHO/b7dPGrON3WScYc42ArduTtXxavwG2byBagNkyS
 uZnAeV9585cA4t/2Qmm92YBK/7TrZzb7LRxbIYIms66qvQ/5NearRkjNwbxF0SfKoyQ6
 dnfNen+c0Y+/0Vv8AK04BshId5yeqj+4zxYRQ/wfvMDTi6leZvlxQ90wJYne/qfy4ooP
 0u0jHEf8Zo85zsMRwArtNNk3iDF73CPaNSlUbNqFxaXMmC5zvH+0WITyHmP2bbf4JkYS
 MeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fbZdYm4tTM0Wf8wHGSlW2NhyIxRchTNsSSc7i/vJwUY=;
 b=MHSuBvPte68jGN5Jd6/4BYsScs0k410j3Ep1twnyFo9vxgKgMBWugGA93WmsusGoLg
 iubOuStVss/l6/kN0J2eNkVDCuESXLtYvpUH9PzqzU0nLCIbdkLQuZqJej9x2dOnwmFk
 0+s4nK4EluJy8SFt+I8WGjdWAee15k6GkyTXjkCk4OTIaU8RZO281QF7lmZDdSkxtvVg
 aoh0oj8xgjrXHUfW8XZ3q2s6NHvmCwz9DqTU0lDEk8sk5Qa1Jn2JkDWhU7ZMzWoLsX2Y
 NVn0E4wW6V2ktFzmer7pR4wq+9KiOPqgTi5cr9beGn/t+WII60UHWw2sjK8aRGluor7+
 h3Cw==
X-Gm-Message-State: AOAM533Ug8hUS0DQowqAljpiM3exNEyvOoxFYdms2VFRk+JRFdbwtvCD
 +GC0ZUz50tAqIX6trnheyS6ntJ07qrbCUI8v35U=
X-Google-Smtp-Source: ABdhPJwGW2ZENsU+eUl90VzY2ukI4PYEvzXgVI2JyhW55CHCb4hCQO0fv4p5gwypjw2JD23oGBIulQwZc2NO51VKkdk=
X-Received: by 2002:aed:2ca5:: with SMTP id g34mr6557125qtd.13.1591020593557; 
 Mon, 01 Jun 2020 07:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
 <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
 <4fe27809-552e-ea98-ba1f-cbf68e625d22@web.de>
In-Reply-To: <4fe27809-552e-ea98-ba1f-cbf68e625d22@web.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 1 Jun 2020 16:09:42 +0200
Message-ID: <CAFLxGvzS+o0Q2w1at8aJkhJ6BAcemL_LO9rrOT0O-TKewB0gYw@mail.gmail.com>
Subject: Re: [1/2] ubifs: Fix potential memory leaks while iterating entries
To: Markus Elfring <Markus.Elfring@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_070955_960841_7A2C59E5 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: Yi Zhang <yi.zhang@huawei.com>, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMSwgMjAyMCBhdCA0OjAwIFBNIE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxm
cmluZ0B3ZWIuZGU+IHdyb3RlOgo+Cj4gPj4gSSBzdWdnZXN0IHRvIGF2b2lkIHRoZSBzcGVjaWZp
Y2F0aW9uIG9mIGR1cGxpY2F0ZSBmdW5jdGlvbiBjYWxscwo+ID4+IChhbHNvIGZvciB0aGUgZGVz
aXJlZCBleGNlcHRpb24gaGFuZGxpbmcpLgo+ID4+IFdpbGwgaXQgYmUgaGVscGZ1bCB0byBhZGQg
YSBmZXcganVtcCB0YXJnZXRzPwo+ID4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJv
Y2Vzcy9jb2Rpbmctc3R5bGUucnN0P2lkPTNkNzdlNmE4ODA0YWJjYzA1MDRjOTA0YmQ2ZTVjZGYz
YTVjZjgxNjIjbjQ1NQo+ID4gSSd2ZSB0aG91Z2h0IGFib3V0IHVzaW5nICJnb3RvIGVycl90YWdf
MiIgaW4ga2lsbF94YXR0cnMgY29kZSBibG9jayB0byByZWxlYXNlIHByZXYgeGVudCwKPgo+IEkg
cHJvcG9zZSB0byBjaG9vc2UgYmV0dGVyIGxhYmVscy4KPgo+Cj4gPiBidXQgbGF0ZXIgaXQgbmVl
ZHMgdG8ganVtcCB0byAnb3V0X3JlbGVhc2UgdGFn4oCYIGZvciByZWxlYXNpbmcgcHJldmlvdXNs
eSByZXF1ZXN0ZWQgbWVtb3J5LAo+ID4gd2hpY2ggY2FuIGNsdXR0ZXIgdGhlIGNvZGUuCj4KPiBX
b3VsZCB5b3UgbGlrZSB0byByZWNvbnNpZGVyIHRoaXMgdmlldz8KPgo+Cj4gPiBJdCBzZWVtcyB0
aGF0IHR3byBjb25zZWN1dGl2ZSAnZ290byB0YWdzJyB3aWxsIG1ha2UgdGhlIGNvZGUgbGVzcyBy
ZWFkYWJsZS4KPgo+IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gdHJ5IGFub3RoZXIgc29mdHdh
cmUgYWRqdXN0bWVudCBvdXQgaW4gc3VjaCBhIGRlc2lnbiBkaXJlY3Rpb24/Cj4KPgo+IENhbiBp
dCBtYWtlIHNlbnNlIHRvIGNvbWJpbmUgY2hhbmdlcyB0b2dldGhlciB3aXRoIHRoZSB1cGRhdGUg
c3RlcAo+IOKAnHViaWZzOiBkZW50OiBGaXggc29tZSBwb3RlbnRpYWwgbWVtb3J5IGxlYWtzIHdo
aWxlIGl0ZXJhdGluZyBlbnRyaWVz4oCdCj4gaW50byBhIHNpbmdsZSBwYXRjaD8KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMDA2MDEwOTEwMzcuMzc5NDE3Mi0yLWNoZW5n
emhpaGFvMUBodWF3ZWkuY29tLwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9w
YXRjaC8xMjUwNDU2LwoKTm8uIFBsZWFzZSBzdG9wIHRoaXMga2luZCBvZiBiaWtlc2hlZGRpbmcu
ClpoaWhhbywgZmVlbCBmcmVlIHRvIGlnbm9yZSBhbGwgImFkdmljZSIgZ2l2ZW4gYnkgTWFya3Vz
IEVsZnJpbmcuCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
