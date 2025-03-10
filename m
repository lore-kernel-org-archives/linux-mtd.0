Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1075BC28B2F
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Mar 2025 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msZ6vAii3H4Qqrd+tUE+laQwSLLJRDUeEkOoHP5FzxE=; b=xkBkqy9OOTjdbQ
	IQKgqdKLDBw0AeNa8JIBZwmJ8fuyiiUJxgiVtNpbDYEWRa7MkAUbZhcUkR/kN1MUhOMi0jlz/YKG+
	x0xihzTiF1oMLX4gMUuUofeIk/FlmdN651FF5fM+1PMCtux0ofGPjm8/mq8xI+cwlExprFheHtdSz
	CCE14EXcIyQx1hSM1IrpWnjnvv8LQAEC2gABFV+6MoU9vSTbRNXsLqd9+1HmW6HBEI2qv8iSkyhqj
	Ham6Q9cbIvUewryIsh2W7akyHWJNGOREYUgxJ0iyz+E1SikaNaSYUxxKDMKyR1EmaRP1JsqMlb6ek
	HtNJnSDf7tsaANSBXvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSLI-00000001P7z-3ET2;
	Mon, 10 Mar 2025 01:54:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trSLE-00000001P7Z-3mis
	for linux-mtd@lists.infradead.org;
	Mon, 10 Mar 2025 01:54:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso6011619a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Mar 2025 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741571644; x=1742176444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaSBUV8N/ebDsE7fpzXbVC4hqASSEdkTygvbNPsCwaM=;
        b=dCPETo6EN6IpfPJCEfhO9kzPezi3U+44FnGH6QaPAyAK7Q7SSk5ysBHV4lhh9RP3W3
         fEzRtNw0Giu/fgJg/GMk9p5GM7SyytP/Xdo2/f7ybV0mfrtZ2aqH2Lt2eqY1R93QnAmx
         oinQhUfSDloLN9tdy79ZEbIkoYH/LX/P886b+3eOMs1hP2qBagr+VDARQIjHwNP+zeL+
         C2l43C/PHeQExhs6qGcFoDbMNbaQvS1O2nOoxIBoHSUxbj6MB5m5B9x9QJIo+xCOOeF0
         WcHihkEp8bvsGmLOg2GSLzAlEJpCMqntR3AA4ZdxV84yuftFsNacVxNd9ezi00c2x5Mq
         zQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741571644; x=1742176444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaSBUV8N/ebDsE7fpzXbVC4hqASSEdkTygvbNPsCwaM=;
        b=ql5SmtXIBctXmYdBaVOm9KOItWBTEjCH95dZR4SFniNo9eLyD15UzQNfxmGrmlA+C5
         g0SqhPncV/ayUee6n9wZU9scE8AN87XtMtDmjqgotBBUilJv3zwRRQm6K3OWGFGzP9fb
         yKNVP2rXaqAQbFCVslkGX2/lBfAREOhl5PmWDfSw1ZAY8E0SLotSZ2JsZCd4yyD75EOL
         uf4ve07c5lQkepVQ9+fKmI9ZEnzEKTnWjXzXpEvH1EXujY2779Jua12HfhxfDoCu/AY8
         PtGDNQWM+5EYTKFMD0MwUSPSmnsNKMLjJjcEs3lZ73ECmoYe7hJ3o2yViFi308Vrr+yh
         4RIw==
X-Forwarded-Encrypted: i=1; AJvYcCUT2+XEhImVdJghedFb5M2HNhpo2+iEPe3WVsOFnM4MXPy8ssxhvPTwxut8Mx2LTqseKblHB2HbccM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOzJd0DvNA0hTiFd8n3HOrKDxGQC/4zEeEIdMGvaaoNPo0r+SY
	WI6tj2+mXzUgoOSNkUeqknHyiKouzg6IN9QCMjnbE93DLy0YikL4WrhMKQazeVdP7+WfoW9t3uP
	H3jQE0VFgnNkMKh1XVkSgWv6K+MA=
X-Gm-Gg: ASbGncvulz123L0Qj3JK7SmdZAILYcoozo4PeuwklIlNrrExRdrPJ36UvGgvF9JycuU
	BMXVoa4ic3ntvKeF+Lfm0FGcmyl5XCpP4qzue24voRBYSEBeAo6iY0ckk34OTjyyeKO60YYqhbc
	xHLedTMtyshbWZlvZjjxRrwX1Qng==
X-Google-Smtp-Source: AGHT+IE8NzjtBSV3cZ0KaECQneUGiXO4kldgQPmQU052CjW33SbT5GMLvacughdx9blP9lVGeDjGlhE9MkslZOBxYHE=
X-Received: by 2002:a17:90a:da8b:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-2ffbc15b91dmr11948511a91.7.1741571643482; Sun, 09 Mar 2025
 18:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250211063028.382169-1-linchengming884@gmail.com> <174132918169.12801.10830790202971847088.b4-ty@linaro.org>
In-Reply-To: <174132918169.12801.10830790202971847088.b4-ty@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Mar 2025 09:49:11 +0800
X-Gm-Features: AQ5f1Jr8Y_iiAIyEIGB7CcDNQGieP3avmmbG2sucJTdF2G0_pofHf3LacdZvPt8
Message-ID: <CAAyq3SaWnxgW+Zy84mSW5BROxHYhFstEVa7P8-eC6noVjc7V6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for Quad Input Page Program
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_185404_942294_67FE5C2F 
X-CRM114-Status: GOOD (  12.06  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI15bm0M+aciDfml6Ug6YCx5LqUIOS4i+WNiDI6MzXlr6vpgZPvvJoKPgo+Cj4gT24gVHVlLCAx
MSBGZWIgMjAyNSAxNDozMDoyNiArMDgwMCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gPiBTdXBw
b3J0IGZvciB0aGUgUXVhZCBJbnB1dCBQYWdlIFByb2dyYW0gZmVhdHVyZS4KPiA+Cj4gPiBTb21l
IE1hY3Jvbml4IE5PUiBmbGFzaCBzdXBwb3J0IHRoZSBRdWFkIElucHV0IFBhZ2UgUHJvZ3JhbSBm
ZWF0dXJlLCBidXQKPiA+IHRoZSA0LUJ5dGUgQWRkcmVzcyBJbnN0cnVjdGlvbiBUYWJsZSBkZWZp
bml0aW9uIGluIHRoZSBTRkRQIGlzIGluY29ycmVjdC4KPiA+IFRvIHByb3Blcmx5IGVuYWJsZSB0
aGlzIGZlYXR1cmUsIGEgcG9zdF9zZmRwIGZpeHVwcyBpbXBsZW1lbnRhdGlvbiBpcwo+ID4gaW50
cm9kdWNlZC4KPiA+Cj4gPiBbLi4uXQo+Cj4gUGxlYXNlIHJudSAuL3NjcmlwdHMvY2hlY2twYXRj
aCAtLXN0cmljdCBiZWZvcmUgc3VibWl0dGluZy4gRml4ZWQgYWxpZ25tZW50Cj4gdG8gbWF0Y2gg
b3BlbiBwaGFyZW50aGVzaXMsIHVwZGF0ZWQgY29tbWl0IHN1YmplY3QuCgpHb3QgaXQsIHRoYW5r
cyBmb3IgdGhlIHJlbWluZGVyLiBJJ2xsIG1ha2Ugc3VyZSB0byBkbyB0aGF0IGZyb20gbm93IG9u
LgoKPiBBcHBsaWVkLCB0aGFua3MhCj4KPiBbMS8yXSBtdGQ6IHNwaS1ub3I6IG1hY3Jvbml4OiBB
ZGQgcG9zdF9zZmRwIGZpeHVwcyBmb3IgUXVhZCBJbnB1dCBQYWdlIFByb2dyYW0KPiAgICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL210ZC9jLzc5OGFhZmVmZmIzNgo+IFsyLzJdIG10ZDogc3Bp
LW5vcjogbWFjcm9uaXg6IEFkZCBzdXBwb3J0IGZvciBNYWNyb25peCBOT1IgRmxhc2gKPiAgICAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL210ZC9jLzc5N2JiYWE3NTMxZgo+Cj4gQmVzdCByZWdh
cmRzLAo+IC0tCj4gVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgoKVGhh
bmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
