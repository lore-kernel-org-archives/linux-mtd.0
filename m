Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D582C54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEimJhaocWeRjXgya4mpGXF6OBPk64KosAx7YEZyQ+U=; b=ttSDK/ZJMK1KnK
	Xr1QscR9qyXQV9+i/HfH5azxceoFL83ZEG4T45nvkSPQx+0l1PjJu0ohe+tXT9XNlkp5QXOD8aX4+
	9WveJqnWlA3SlyEziGylByBDRxnI5WUgsFnBZ5alnNtab1YqkgRNzI/bLi1iU2rQgf0GsiBI1mfHO
	4XcLsUe2vXQ1JDMhlX3diPfdaaMuHEvveR+oiTpx1EorCw8k6SwCRjjhAdvxbRPlq/ZxRTWeOeU7f
	sR1XcEmKp/phvCEQt/9ii1eU5drvMj6sybGS7WYe2nW8VMlMES9SW2X5TuwDQLTdXnimBi6GZ/oE4
	FF6bpzOtsJRuQHbnsH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtLM-0000000Ahae-3o5i;
	Tue, 27 May 2025 12:23:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtLL-0000000AhZV-0NPC
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 12:23:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so537501166b.0
        for <linux-mtd@lists.infradead.org>; Tue, 27 May 2025 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748348621; x=1748953421; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sv4wuXSLD/+kZTuRxA6+oQJ5op5SeTKVQQWAFxZa5Rs=;
        b=cS7VpFNY7TAFcrnmzpIYOuYPX35wOQ1X4V2NIVun47GBOgFl2v6sOUPT3ntNxFPTlB
         JcJ9h/3UJbjScvVEzpyxdfidMrNkawG0n5M49oVyd9292VSrWjUPQFkV5Jok7TuJnmYE
         UgVEcXbh14RvJlbFtXemGdAf2e6ntZl5yDz889cok889UgYrnkO/MBRj/2gvK4/h83Ry
         q43yJatS/z+E5d1rwi24YGSQxNS8pb5IFC+IUH7rUt/nKNzomDW28bJRVo3z2d220+V7
         7kQrVAnu/RmvQSLcuca/B76tyq8WfIHj3923b5FcxmAB5mUcemQpXghsHRR2mfiNV+/f
         VhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348621; x=1748953421;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv4wuXSLD/+kZTuRxA6+oQJ5op5SeTKVQQWAFxZa5Rs=;
        b=eGMqmxniJu43w9B97C5f6On+FERw3KOpNvIBlkmS0tcaL51VXfjanJy6mcdTZjt6Yw
         i0qWgyl0+VdlIXwQXmU3tF/jSKgJWzserNSXbr+EXjiAbBHoaLohhJlPnGn9SkxH8poY
         GJcxllEOavIkKKicFkuAHZbvcG8Kh21s3LNrxTtzWpGEGgsloPpO44+bsquHOH9RpV2n
         HY0UgVmOcNAgQKNrjW1erQW0mqcLoTynKSI/SezbzPb+bT0MPSHxRAjsFwyuZx3xlFbP
         soMJ/LrHh0vMMsx8fjRU9aR57DNfD8FHCEB1/LOmtHv+rw8RwiaK8QV2rQLlUzcjxr16
         bRKA==
X-Forwarded-Encrypted: i=1; AJvYcCVDV+Ysg1kZ2r1bCaRTvwSXokIHzqnyxetgrb1K+KT0p3HwnpYDBh/zTWmHwWnblmD2FAmYwz6m/iY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRDdsLI/0SzyGI+uzmraGZOf7vgb9egCJZ+a6YoqUbCUMbtL/r
	Ayk7qzHhmUTAE2+PIUSsHiMyOtNJ0sF35z4AC8PeKqPz3c0sR7DDG/Ms
X-Gm-Gg: ASbGncvdGN7hnrHot8rMp82p7WzjOlwgkObRTHgZkAGAoD/0ZJeybmaNat891y56hbI
	sUUILbHQV/ibuB34lLtqoe9T0apzwP+/Qy1ynv+U7IoNWmuDc0uWztrvClFKHo6tEolrF7B9DiC
	Hh4yA/asVNb4GpnwBn9SHv3sllMxFDbUOoKxTRLTvjNhGcHZ7bZusBRwg44rVeZlJ+abtJfBaOe
	zjgpXYqTpADo9FVLIcpdmOodyuXRr/ob0JJH3DJ2aqzO45vz9DKw1M7q7mr6yLDhjKnKM6dQ0E9
	pshCOG1HBNtZDkgC9BQjPDXsFg7W6gOwolMmyvDOxTsibS2GewY+vMWwvOeTbXsBmMw5477GiyP
	7G1RXV+N0kNdfAj4XdXP0vZsR6C0=
X-Google-Smtp-Source: AGHT+IEurTuNxs4HzYvVoUQ2BdVp3evbNEzGLhzi7LgW1gOpzZB71RBOTVuWo+KUBIsoZlub08X7Ng==
X-Received: by 2002:a17:907:7ea8:b0:ad8:8c52:d61f with SMTP id a640c23a62f3a-ad88c52d729mr228815466b.35.1748348621226;
        Tue, 27 May 2025 05:23:41 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca3bdsm1826986466b.160.2025.05.27.05.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:23:40 -0700 (PDT)
Message-ID: <831876a9-4f2c-47af-aa4d-3151e13b6bef@gmail.com>
Date: Tue, 27 May 2025 14:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] spi: spi-qpic-snand: reallocate BAM transactions
Content-Language: hu
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
 <20250525-qpic-snand-avoid-mem-corruption-v1-1-5fe528def7fb@gmail.com>
 <cc53dca0-74d1-42d2-936a-adc383bd571a@sirena.org.uk>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <cc53dca0-74d1-42d2-936a-adc383bd571a@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_052343_125979_2E28BD14 
X-CRM114-Status: GOOD (  10.81  )
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

MjAyNS4gMDUuIDI3LiAxMzoyOCBrZWx0ZXrDqXNzZWwsIE1hcmsgQnJvd24gw61ydGE6Cj4gT24g
U3VuLCBNYXkgMjUsIDIwMjUgYXQgMDc6MDU6MzVQTSArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6
Cj4gCj4+ICAgIyByZWJvb3QKPj4gICBbICA4NzcuMTc4ODQ0XSBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCByZWFkIGZyb20gdW5yZWFkYWJsZSBtZW1vcnkgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAw
MDAwMDAwMDAwNzgKPj4gICBbICA4NzcuMTc4OTEzXSBNZW0gYWJvcnQgaW5mbzoKPj4gICBbICA4
NzcuMTg2NzY3XSAgIEVTUiA9IDB4MDAwMDAwMDA5NjAwMDAwNQo+PiAgIFsgIDg3Ny4xODk1MDhd
ICAgRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzCj4+ICAgWyAgODc3
LjE5MzMxMl0gICBTRVQgPSAwLCBGblYgPSAwCj4+ICAgWyAgODc3LjE5ODc4MF0gICBFQSA9IDAs
IFMxUFRXID0gMAo+IAo+IFBsZWFzZSB0aGluayBoYXJkIGJlZm9yZSBpbmNsdWRpbmcgY29tcGxl
dGUgYmFja3RyYWNlcyBpbiB1cHN0cmVhbQo+IHJlcG9ydHMsIHRoZXkgYXJlIHZlcnkgbGFyZ2Ug
YW5kIGNvbnRhaW4gYWxtb3N0IG5vIHVzZWZ1bCBpbmZvcm1hdGlvbgo+IHJlbGF0aXZlIHRvIHRo
ZWlyIHNpemUgc28gb2Z0ZW4gb2JzY3VyZSB0aGUgcmVsZXZhbnQgY29udGVudCBpbiB5b3VyCj4g
bWVzc2FnZS4gSWYgcGFydCBvZiB0aGUgYmFja3RyYWNlIGlzIHVzZWZ1bGx5IGlsbHVzdHJhdGl2
ZSAoaXQgb2Z0ZW4gaXMKPiBmb3Igc2VhcmNoIGVuZ2luZXMgaWYgbm90aGluZyBlbHNlKSB0aGVu
IGl0J3MgdXN1YWxseSBiZXR0ZXIgdG8gcHVsbCBvdXQKPiB0aGUgcmVsZXZhbnQgc2VjdGlvbnMu
CgpTb3JyeSBhYm91dCB0aGF0LiBJIHRyeSB0byBhdm9pZCBkb2luZyB0aGF0IGluIHRoZSBmdXR1
cmUuCgotR2Fib3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
