Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00B2C28B23
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bs8d/9bDOatfSnYDUDba8aRNTeRarilaGXFbNcnOSOA=; b=x0j9cfdjYd6Mmd
	l9FKQH/4qBQ6/L2ZTQzE801rM38i/S6hIC2sQi1LeEFBaMJ2glkBiZn9vM+HVQLVBRTvIsjND0QVO
	RnwjEqn90Au8MWcATY0m26ZtNz/K+pFvCiNBS4CyPdxOMWW0xcdL/itA4UFc4+0ouBGDoEsQam8nx
	DH+6asAb3OHEkKUHlcxds1CqVZ/Y18OeCssIqs0xZwvznW86qVTBb+cc7ieM43jXKUXxYUHz3O848
	XJP1ANwEMtp/06uvnbc3oPdKSyakLz7qjc4spmNOuRsB0nUmzCtdnuLP44SJp+2/GkADufRaxecp/
	sKwjTzYeDDb8DHagJyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAHv-0000000AugT-1KAB;
	Thu, 06 Mar 2025 12:25:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Zs-0000000AoSm-0zbh
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 11:39:49 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ff6ae7667dso871310a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 03:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741261187; x=1741865987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9sq4YJ2DQyZHH2kbpoDNtjyXycKYdNphmP6Nz8SeIk=;
        b=OaazP25PUSl1s2TEJZeMWzOdL/zcLzWdoT4g/3IMG0wZ787x3fEMHl4+NZ/dC+jVV0
         5MixLjI5SfMfpkQgaT9ywQGoJFjYItc+VnFtSgylMpVMcLo262/kZDiyEDyzBgjd0KRs
         Ym+yKz9tNGls7DQVGUFknMZWFpJnk/adc69/O0D4X6ahCxaRNR9rPusl2xAi87n095Ie
         E+ypoD8/T43No6RTHrtHpLqt0nb+4KjYdYD6giR0w81iUXQIIP3BUQnmrQ5t5nRuLA+4
         xhYmuCFBORL9OSI0sYwl9gtS+7BEIYLi6HQfkI56Urtc9entsi7CLwfK+e+WEmIhfxJR
         HF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741261187; x=1741865987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9sq4YJ2DQyZHH2kbpoDNtjyXycKYdNphmP6Nz8SeIk=;
        b=DkO8CA60Lo3QD2+xDh5bEKPSJSDwqZXCBouqT8q8dLfzfAsY1Fj0RMFcLP3IxGBEbp
         Pqb42Xew1+EBhHrba4ER45p08fjkC0EedJX4LvRj1RTvNp3Gw69pDJqQLez9O9m4LUGO
         d4Bbf+D1/iTs8mybx6Zu5DcYM9Yexsw2WrMB0A+pg8kZq5D54JC1o0vr/ig7b3/Dx7WC
         NXcUXb0xrZNo/zDMBunVrQeeXyFCe8e3iTrPAXFNTDestC4cHzkfBKjdYuePPBKJZsJe
         v7fGJyEzEoS8uvi5IcChQ0gxB0ZLmlsZLuEnuAfLRzMWuWWIOO0JM1J3A4GI5+7yoVne
         t7wA==
X-Forwarded-Encrypted: i=1; AJvYcCVXuLJaEfnp6zfDcyAHEBqG7lyh1a5TKvh76palRcpX+ciiwbCYEeSnq6pcs1o4v0cLmU4IS2Q7I1U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQMMAPTrne6DV48oQNcAYWzbki8rs0aLhgSLfFVo1f2p7S3/bX
	sioIgV5T5VUsTLi/uODsosYmAEwXGp2O9+YZJi4mH0VaV8v+u2fMZGKx8gBkdMGLvUgpi/GXIlj
	XJrduFI1CXZVDZf0G73+rIV+aELs=
X-Gm-Gg: ASbGncuFKHHRiF9zYO+a0CeRY/AmJ48YHywqwiGqjRBIKjRG1v73A/IS6wW5ABt1Nb4
	lEWYJY1Tb5aq36xx/prA80usqEjNstff7RMfyFcSfUVLgBlzLwNqYRDPd4R7+tILQRRvFgxOLvZ
	HTEVTpFCPBmGG5DgBJYKWug6MBZw==
X-Google-Smtp-Source: AGHT+IGs0+c/x0S+rEnB9r9arTUQu+Vq33cCnvRawv0eZWYUAB4OlHgVB6iO4SL5SpyXzI91b16wKcUF2KfbZN7iDSg=
X-Received: by 2002:a17:90b:2494:b0:2ff:556f:be1 with SMTP id
 98e67ed59e1d1-2ff556f0c2amr6549409a91.1.1741261186979; Thu, 06 Mar 2025
 03:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20250211063028.382169-1-linchengming884@gmail.com>
 <20250211063028.382169-2-linchengming884@gmail.com> <e5458a0e-528f-44ec-a0f0-543472ad3b85@linaro.org>
 <bb9f8a80-4662-4ab1-b9ad-6899977c3827@linaro.org>
In-Reply-To: <bb9f8a80-4662-4ab1-b9ad-6899977c3827@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 6 Mar 2025 19:39:34 +0800
X-Gm-Features: AQ5f1Jp7ftJJkR8tfGcMH27z_ma1ePnjFVkBFADoZ0Hv_21ZXLggZXYjswmbA0A
Message-ID: <CAAyq3SamyhtCkd47939dKWCZN3ejaDvM6EJzwizWVqhNW=27bA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033948_333373_628DAACF 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
MDI15bm0M+aciDbml6Ug6YCx5ZubIOS4i+WNiDc6MDHlr6vpgZPvvJoKPgo+Cj4KPiBPbiAyLzEx
LzI1IDc6MjAgQU0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gPiBPbiAyLzExLzI1IDY6MzAgQU0s
IENoZW5nIE1pbmcgTGluIHdyb3RlOgo+ID4+ICAgICAgICAgICAgICAuZml4dXBfZmxhZ3MgPSBT
UElfTk9SXzRCX09QQ09ERVMsCj4gPj4gKyAgICAgICAgICAgIC5maXh1cHMgPSAmbWFjcm9uaXhf
cXBwNGJfZml4dXBzLAo+ID4gRm9yIHlvdXIgbmV4dCBwYXRjaCB0aGF0J2xsIGRyb3AgdGhlIHJl
ZHVuZGFudCBmbGFzaCBpbmZvIGZpZWxkcywgeW91Cj4gPiBjYW4gZHJvcCBTUElfTk9SXzRCX09Q
Q09ERVMgYXMgd2VsbCBpZiB0aGVzZSBmbGFzaGVzIGRlZmluZSB0aGUgNGJhaXQKPiA+IHNmZHAg
dGFibGUuCj4KPiBBbnkgcGxhbiBpbiBkb2luZyB0aGlzLCBwbGVhc2U/CgpTb3JyeSBmb3IgdGhl
IGxhdGUgcmVwbHkuCgpUaGlzIG1hdHRlciBpcyBjdXJyZW50bHkgaW4gcHJvZ3Jlc3MuIFNpbmNl
IGNvbGxlY3RpbmcgYWxsIHRoZSBjaGlwcwp3aWxsIHRha2Ugc29tZSBtb3JlIHRpbWUsIHRoZSBw
cm9qZWN0IGhhcyBiZWVuIGRlbGF5ZWQuIE9uY2UgSQpoYXZlIGFsbCB0aGUgY2hpcHMsIEkgd2ls
bCBzdGFydCB0aGUgdmVyaWZpY2F0aW9uIHByb2Nlc3MgaW1tZWRpYXRlbHkuClRoYW5rcyBmb3Ig
dGhlIHJlbWluZGVyLgoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
