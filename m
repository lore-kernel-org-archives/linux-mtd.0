Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA71C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 13:34:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193C420715
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 13:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OVvmGXzo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QPMTT57i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193C420715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fGzjkyZB8Jx8H28XtHI3zIbpHSMd+76tiDpwGPSzWqk=; b=OVvmGXzodTFxfi27qj227k44t
	/lBvNaniw0Z98uTW+Lec1W0GBtPyekIlCDFSrrgIkygMvazHip8xt6sHKNvtv7D3QE6dORj8NlY32
	JRwb613RQgXgmOC+20X7bS2Bc51+PhzvDiLruZ8Vm0uLijDjg7WDS9NLYXL72zm8LTIXikz6qwrhx
	LH4wgO1ingRqU4s4ini6i1TGLRRd8oMmQmkWVaraKK0qNKQTgEeWNCI8Y3lN5OG12ebh3rB6xIBlW
	aPe96XnrddMBOLcOyEFsGkNkHpxQ4M+Xs35SSYXy4NzERuX+D+vSok9vj6oaUA+E/HaEnfw1DrM4k
	DAmT1KQyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb1rP-0004Tg-6l; Fri, 06 Nov 2020 13:32:59 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb1rJ-0004TB-1V
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 13:32:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id a3so1312006wrx.13
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=w8s8ntm2MEeIEI9ayWbc8zocfTuCuxT7Pca+ADb+7Qc=;
 b=QPMTT57iu7yE57KwXd2MSuIoF8zeMW6dlOjE29Zt9x9bL7xLRdpukPDMRe9JJTEgoE
 z2iIiLfgwgx1ow66QG/inALdJe+CDzdxlyltDJQzuC00MaqXrcNrVL+gbkLL4N5N6GxV
 gv6e4iwpqr0IRo3025RiRJZMPjSGubVGS7XstCtVJSYGLb8IAB37o2fxtH8WIl/eNSd3
 PufoIT4Q7KmRiSYxVJ8XU2JoHIF9ILcfSnhS2YrA8hI/cc6X0URCLdBlTL+ds9RpWtDy
 BHU0GYhyyaiBAdMQHumOniY0biwr+MMISfgdeimNoXVSdq9feD4bdPvu7No50vDrQX7y
 bH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w8s8ntm2MEeIEI9ayWbc8zocfTuCuxT7Pca+ADb+7Qc=;
 b=sy6DHGlg8Hcqg00XPOle29+wWhuwPz8uC+EibcgcJ6P+VU5/oJlxO6sUcAPqKqchF4
 GRb7Qx7/9E3MxAvr4J0Yt7ii91m5FyImvBFJHAYNbKpmik7PLHIOMVpgFs9IyKOKGHIu
 qoX2r/WE6Ipq8WW/sb/7bLrjOms3aqWYLCvhjArC6x8WSZygk54d0Sri1Ll5LR3fUH2S
 NvLtDV45hgkIoVsFqSYWWLsKA3fqLy5LxumGYxSgFDj0we4c0oBBRz/Hxk4VKYEjMIsC
 F4vO5X5B1/YsMabKFScObecDE6zyvv8eybsjCFpjPjiAPcDrjZ1sCoswvIG569xcKUYz
 H/MA==
X-Gm-Message-State: AOAM530Ius8tzC5/aCp1Ig5YKm8CPV8JcjhmTs/NylP+EI6AVwrBGMB4
 /meh0M+OGvuXY30nME/9/o+Gvg==
X-Google-Smtp-Source: ABdhPJxeXGa3R+8smOLhstaSz3/5YQ4z71LspuSmfI64m1Y6cCR8hwn0U8R3qzR3KdqsDWMxHPyZuQ==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr2749293wrv.30.1604669569911; 
 Fri, 06 Nov 2020 05:32:49 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id u81sm2624297wmb.27.2020.11.06.05.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 05:32:49 -0800 (PST)
Date: Fri, 6 Nov 2020 13:32:47 +0000
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH 00/23] Rid W=1 warnings in MTD
Message-ID: <20201106133247.GI2063125@dell>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_083253_154467_5F3BFD60 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBUaGlzIHNldCBpcyBwYXJ0IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFu
LXVwIFc9MQo+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5n
bHkgcmlkZGxlZCB3aXRoCj4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiAKPiBMZWUgSm9uZXMg
KDIzKToKPiAgIG10ZDogbXRkcGFydDogRml4IG1pc2RvY3VtZW50ZWQgZnVuY3Rpb24gcGFyYW1l
dGVyICdtdGQnCj4gICBtdGQ6IGRldmljZXM6IHBocmFtOiBGaWxlIGhlYWRlcnMgYXJlIG5vdCBn
b29kIGNhbmRpZGF0ZXMgZm9yCj4gICAgIGtlcm5lbC1kb2MKPiAgIG10ZDogbmFuZDogb25lbmFu
ZDogb25lbmFuZF9iYXNlOiBGaXggZXhwZWN0ZWQga2VybmVsLWRvYyBmb3JtYXR0aW5nCj4gICBt
dGQ6IGRldmljZXM6IGRvY2czOiBGaXgga2VybmVsLWRvYyAnYmFkIGxpbmUnIGFuZCAnZXhjZXNz
aXZlIGRvYycKPiAgICAgaXNzdWVzCj4gICBtdGQ6IG10ZGNvcmU6IEZpeCBtaXNzcGVsbGVkIGZ1
bmN0aW9uIHBhcmFtZXRlciAnc2VjdGlvbicKPiAgIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFu
ZF9iYnQ6IEZpeCBleHBlY3RlZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKPiAgIG10ZDogc3BpLW5v
cjogY29udHJvbGxlcnM6IGhpc2ktc2ZjOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRv
Ywo+ICAgbXRkOiB1Ymk6IGJ1aWxkOiBEb2N1bWVudCAndWJpX251bScgaW4gc3RydWN0IG10ZF9k
ZXZfcGFyYW0KPiAgIG10ZDogbmFuZDogc3BpOiB0b3NoaWJhOiBEZW1vdGUgbm9uLWNvbmZvcm1h
bnQga2VybmVsLWRvYyBoZWFkZXIKPiAgIG10ZDogdWJpOiBrYXBpOiBDb3JyZWN0IGRvY3VtZW50
YXRpb24gZm9yICd1YmlfbGViX3JlYWRfc2cncyAnc2dsJwo+ICAgICBwYXJhbWV0ZXIKPiAgIG10
ZDogdWJpOiBlYmE6IEZpeCBhIGNvdXBsZSBvZiBtaXNkb2N1bWVudGF0aW9uIGlzc3Vlcwo+ICAg
bXRkOiB1Ymk6IHdsOiBGaXggYSBjb3VwbGUgb2Yga2VybmVsLWRvYyBpc3N1ZXMKPiAgIG10ZDog
bmFuZDogcmF3OiBicmNtbmFuZDogYnJjbW5hbmQ6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJu
ZWwtZG9jCj4gICAgIGhlYWRlcnMKPiAgIG10ZDogdWJpOiBnbHVlYmk6IEZpeCBtaXNuYW1lZCBm
dW5jdGlvbiBwYXJhbWV0ZXIgZG9jdW1lbnRhdGlvbgo+ICAgbXRkOiBuYW5kOiByYXc6IGRpc2tv
bmNoaXA6IE1hcmtpbmcgdW51c2VkIHZhcmlhYmxlcyBhcwo+ICAgICBfX2Fsd2F5c191bnVzZWQK
PiAgIG10ZDogbmFuZDogcmF3OiBjYWZlX25hbmQ6IFJlbW92ZSBzdXBlcmZsdW91cyBwYXJhbSBk
b2MgYW5kIGFkZAo+ICAgICBhbm90aGVyCj4gICBtdGQ6IG5hbmQ6IHJhdzogczNjMjQxMDogQWRk
IGRvY3VtZW50YXRpb24gZm9yIDIgbWlzc2luZyBzdHJ1Y3QKPiAgICAgbWVtYmVycwo+ICAgbXRk
OiBuYW5kOiByYXc6IG9tYXBfZWxtOiBGaW5pc2ggaGFsZiBwb3B1bGF0ZWQgZnVuY3Rpb24gaGVh
ZGVyLAo+ICAgICBkZW1vdGUgZW1wdHkgb25lcwo+ICAgbXRkOiBuYW5kOiByYXc6IG9tYXAyOiBG
aXggYSBidW5jaCBvZiBrZXJuZWwtZG9jIG1pc2RlbWVhbm91cnMKPiAgIG10ZDogbmFuZDogcmF3
OiBzdW54aV9uYW5kOiBEb2N1bWVudCAnc3VueGlfbmZjJ3MgJ2NhcHMnIG1lbWJlcgo+ICAgbXRk
OiBuYW5kOiByYXc6IGFyYXNhbi1uYW5kLWNvbnRyb2xsZXI6IERvY3VtZW50ICdhbmZjX29wJ3Mg
J2J1ZicKPiAgICAgbWVtYmVyCj4gICBtdGQ6IG5hbmQ6IG9uZW5hbmQ6IG9uZW5hbmRfYmFzZTog
Rml4IHNvbWUga2VybmVsLWRvYyBtaXNkZW1lYW5vdXJzCj4gICBtdGQ6IGRldmljZXM6IHBvd2Vy
bnZfZmxhc2g6IEFkZCBmdW5jdGlvbiBuYW1lcyB0byBoZWFkZXJzIGFuZCBmaXgKPiAgICAgJ2Rl
dicKCk1heSBJIGFzazsgd2hhdCBpcyB0aGUgcGxhbiBmb3IgdGhlc2UgcGF0Y2hlcyBwbGVhc2U/
CgpEbyB5b3UgcGxhbiBvbiB0YWtpbmcgdGhlIG9uZXMgdGhhdCBkbyBub3QgcmVxdWlyZSByZS13
b3JrLCByYXRoZXIKdGhhbiBmaXhpbmcgdXAgYW5kIHJlLXN1Ym1pdHRpbmcgdGhlIHdob2xlIHNl
dC4gIEl0IHdvdWxkIGNlcnRhaW5seQpzYXZlIGEgbG90IG9mIG1haWxpbmcgbGlzdCBjaHVybiBp
ZiB0aGF0IHdlcmUgdGhlIGNhc2UuCgpFaXRoZXIgd2F5LCBsZXQgbWUga25vdyBhbmQgSSB3aWxs
IGFiaWRlIGJ5IHlvdXIgZGVjaXNpb24uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
