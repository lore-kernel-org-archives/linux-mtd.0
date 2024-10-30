Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27045D7495E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 07:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkYrLp6rnkVGETaeGcm6ul6jmL2N1onXhVITfAnyZ+Y=; b=bUVEXlwzBvE5Wz
	LZ9snXGkhWM+YJnz0b3UQg+gnKSMCYfN0W/mCB0/WarkiwJ4uocMWVYCSKiFpyYBp/gNwMfJ30slM
	oe1HHmRJYy92c4or6Za5CiDuouh9+J/O+C8UILkQcVOfV3DrwwDeLx7Eavy9VYe5a3mG2+72mqcm0
	UbzGRHx8RE0lIdJZOAir0EyLjAmLJFJumTd52pu1sVOmD3KeuynFlxAcwAGyfF/A1hFuO+jEUgdZ5
	Ps9EyIytz4tonlT8ers1NbKFO+jdqEkYIl9aht1gG2k+sbGkxon+RwkvPNrlByBi7Gq2zSk//URU4
	1VcN9QBcMaGUih0hTZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63Nz-0000000HC3k-0tah;
	Wed, 30 Oct 2024 07:44:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63MT-0000000HBPU-1mNa
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 07:43:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so4119464f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2024 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730274203; x=1730879003; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YArs62SLFVbBhxDoxdcxEnSLD2gqspuosa4yM1X4YqE=;
        b=jr7qT1xfmDjgphm9nip5Pht+k2LIGhD3wQ3E6JQK/2WDt686xBP9Lhwo1aIvd3PwO0
         itSIO5uvSmJ+KXhIM2mN/gtCXCNe4OPpqdLQmiFjJo/hypEZjpOQ1Y0JVuUctIhO/qbe
         12h2Xjae+OD4KCSopjNOC9FupkT/TN9n/phTSqPpft2yF6lPyqSFMehL0W5sdxlWA+15
         DWZcTDxk/509lJGlYTfMpDynVZEqxjLbNDZP7udv18kDNtOTMTQxiZyNoWcPYLbRsBvn
         NWNpMehPIEB/Ly5ph4PxjMubIgV20ePbVRAk+P0l4+pwrUNPAW12fdycmNEaOLGoe8cx
         19zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730274203; x=1730879003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YArs62SLFVbBhxDoxdcxEnSLD2gqspuosa4yM1X4YqE=;
        b=I4VEd6itnEQfl8LrHCmEqwRoF52fQaO/5qnMltTka8hDcEc1mUMtAt+H9wzcWOnJjX
         U/rtRUbjYwJW75GRNk+M8kzKsNfuIcPPlkbq7UknRIMWHZn21q032wfNKL4etniVNTCx
         o85Joafm3X+5zUJNx+6W2FqBkZNqJR5Cb8bhKG8Fx306T+I0RCAr3c0v6z5CanZOxsaN
         GCTSXAJMc7BKeSlrwZrFdv0LNlYybDgJVKvV9+spD5uVorDDq25kr2DkqlRtLoRqFEkY
         J/ypzWQP2Z/RY2QlPIDHIkPr+MjuT1RcY061+9fY06MjjzBq6Qf87RfMTOmN671NmlGm
         XuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1o0yUBQmQOl9hnCrqJqN+23s0a+6yEi2Z7E0xfBw4gcr8yJlkdENlS21Ug0uoUf9KmrHeDnEB/7k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNB5+Z76LJEpjGndSFgGzrgUTXcbVECY0w+bTEA9hAhmCpGz3/
	S7/n/WgZ08zidC5yH8O/Aph9JDX3X8M1yeLOzX56EJ3wVtcC6tCmcctCo+SUl8s=
X-Google-Smtp-Source: AGHT+IFWQRjUTiGM84bWIK7VbEw3CFseHHrAQKgIOZUGcHD8dS8vTtszQXMb8MBg3SYqNXqy5EEvLg==
X-Received: by 2002:a5d:4c90:0:b0:37d:370a:5248 with SMTP id ffacd0b85a97d-380611e0c2amr10320365f8f.39.1730274203431;
        Wed, 30 Oct 2024 00:43:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm14591895f8f.49.2024.10.30.00.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:43:23 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:43:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jffs2: remove redundant check on outpos > pos
Message-ID: <a81d5fbc-e66a-4de0-a015-e9a6b73c2ed8@stanley.mountain>
References: <20241029222015.3069873-1-colin.i.king@gmail.com>
 <cf07a880-1429-cc75-657e-55b32841cc00@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf07a880-1429-cc75-657e-55b32841cc00@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_004325_502171_8C639945 
X-CRM114-Status: GOOD (  15.96  )
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

T24gV2VkLCBPY3QgMzAsIDIwMjQgYXQgMTI6NDU6NDJQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzEwLzMwIDY6MjAsIENvbGluIElhbiBLaW5nIOWGmemBkzoKPiA+IFRo
ZSBjaGVjayBmb3Igb3V0cG9zID4gcG9zIGlzIGFsd2F5cyBmYWxzZSBiZWNhdXNlIG91dHBvcyBp
cyB6ZXJvCj4gPiBhbmQgcG9zIGlzIGF0IGxlYXN0IHplcm87IG91dHBvcyBjYW4gbmV2ZXIgYmUg
Z3JlYXRlciB0aGFuIHBvcy4KPiA+IFRoZSBjaGVjayBpcyByZWR1bmRhbnQgYW5kIGNhbiBiZSBy
ZW1vdmVkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5r
aW5nQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9qZmZzMi9jb21wcl9ydWJpbi5jIHwgNSAt
LS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2ZzL2pmZnMyL2NvbXByX3J1YmluLmMgYi9mcy9qZmZzMi9jb21wcl9ydWJpbi5jCj4g
PiBpbmRleCA1NTZkZTEwMGViZDUuLjk4NTQyNTNkMDEwOCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2pm
ZnMyL2NvbXByX3J1YmluLmMKPiA+ICsrKyBiL2ZzL2pmZnMyL2NvbXByX3J1YmluLmMKPiA+IEBA
IC0yNzYsMTEgKzI3Niw2IEBAIHN0YXRpYyBpbnQgcnViaW5fZG9fY29tcHJlc3MoaW50IGJpdF9k
aXZpZGVyLCBpbnQgKmJpdHMsIHVuc2lnbmVkIGNoYXIgKmRhdGFfaW4sCj4gPiAgIAllbmRfcnVi
aW4oJnJzKTsKPiAKPiBNYXliZSB0aGlzIGNoZWNrIGNvdWxkIGRldGVjdCB0aGUgb3ZlcmZsb3cg
b2YgJ3BvcycsIEkgZ3Vlc3MuCgoicG9zIiBpcyBhIG51bWJlciBiZXR3ZWVuIDAgYW5kIDQuICBJ
dCBjYW4ndCBvdmVyZmxvdy4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
