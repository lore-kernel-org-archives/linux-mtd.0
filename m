Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63633C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 15:21:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3620F2054F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 15:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfYyLSCO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ar8D3WWo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3620F2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mqwNtx/G+ZHBgsHYP/m8ed/a8N15Wf20zG9/wzMhBU=; b=VfYyLSCOYaFt29
	pqdYc5k6CC0jTAFAX/yLQgosIIh9ceDy/DgpwpUJBKmNsprLWv+Fo9TuK1ve3GHSXm78HbKEubFGj
	UxhwyydstnePphUNrLZuq5pk8dtY9IEfpIyqYywgOxnSA08pJuhdnfcsLludFOA22rqjlU1VrQUxl
	zx9UMUr+mFkO3Fx0ZqarE1SFVohkKWUf2F4OMK063R9b05py+/w95T04AXd5f5KLCLv5uOp8lx+Sb
	FRQmdPissDVJnybXcRmDjcQv9tVIJ/L4e3qoQ8tSLFLLo+ITMMSOJimO/2JyZEYd5RXqqmx5l/+KA
	YHZu3cUNstE7ZJol7Z5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVcts-00008E-VL; Mon, 04 May 2020 15:20:56 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVctp-00007e-Oj
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 15:20:55 +0000
Received: by mail-io1-xd42.google.com with SMTP id z2so12690304iol.11
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T6E4sa47WiUWY45YJzDn9sg5wskjTrREH+XL57J4HjA=;
 b=ar8D3WWowhf3TqhMXvosjX37VL5Q3PMOE23J1QCv7tuISdMTJC0n0Cv+q8afrpkrBK
 MKxDhD6taHPoUUGb8UZSZ3Vtw298CeT6gMiCExHKX2Mk1wMVRxgj9sxzLAxB1nkKcRsX
 r7OkHfZwH5rTo0FRaf5ydWedH4FqyaGGOkkRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T6E4sa47WiUWY45YJzDn9sg5wskjTrREH+XL57J4HjA=;
 b=SZvzeh7udRz8AJBp4RL3ywUFb8P98cyCCwdWJoDHyVgrSu9kNpna+w+NtWluscORX5
 I7pgDskEhXbqs26ZQOaQrvnDU3GssGhZNUxgKieV/2M+hgQWDqdkep0SubYpcIH2e9cd
 ttp9YDNd+T/TYOE/PcR13jV2dyJe28wdwWGGLBafP9/qVDRy1+BAK4jIirFlEqiSNVG/
 477H4nImLiwi8/jyc8S6VPM+tDADUkxXqzLFD7fbTg0hrDvHLsTchBizrjWgm5yshQMq
 fL6v74N10b7gxgz21gCo46WV8t5vpgmWwyEMdSqJ5LJOOsZGIJKEC1dxoqBd0dIcdDnY
 He3w==
X-Gm-Message-State: AGi0PuYz7ICqIEDDEdbwMfr213Wkanh91tUFoUlUFQuAMe9i10J0zWuQ
 UwGzxBXPO2wKKQwi/aLiFeKdlNP+ZUJvUkYCCoJ/Hg==
X-Google-Smtp-Source: APiQypKVjWID+3rjrtFjLcSSUH+W8buTUh3xgn1YhjYKIoTsozCZ0Fz29P55Fk0GHlGltBqh//rR3Tiv8gGmRnIpECo=
X-Received: by 2002:a6b:3e0a:: with SMTP id l10mr2587371ioa.112.1588605652380; 
 Mon, 04 May 2020 08:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
 <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
 <20200109160352.6080e1e5@xps13>
 <CAKekbeucdjZgttQfHeiXH6S92He2qkKGsQcEqz_4_okHzDK16A@mail.gmail.com>
 <20200109182807.04c8866a@xps13> <20200502200806.1d6b1cba@xps13>
In-Reply-To: <20200502200806.1d6b1cba@xps13>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Mon, 4 May 2020 11:20:16 -0400
Message-ID: <CAKekbevhWqsYSacTFCp+XEv7nBjL7tbo_wkOiCDZ1UYPf=RoeA@mail.gmail.com>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_082053_804214_1E7755D5 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBNYXkgMiwgMjAyMCBhdCAyOjA4IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgS2FtYWwsCj4KPiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBvbiBUaHUsIDkgSmFuIDIwMjAKPiAxODoy
ODowNyArMDEwMDoKPgo+ID4gSGkgS2FtYWwsCj4gPgo+ID4gS2FtYWwgRGFzdSA8a2FtYWwuZGFz
dUBicm9hZGNvbS5jb20+IHdyb3RlIG9uIFRodSwgOSBKYW4gMjAyMCAxMDoyNTo1OQo+ID4gLTA1
MDA6Cj4gPgo+ID4gPiBNaXF1ZWwsCj4gPiA+Cj4gPiA+IFllcyB0aGUgaXNzdWUgaXMgc3RpbGwg
b3Blbi4gSSB3YXMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIHN1Z2dlc3Rpb24KPiA+ID4gYW5k
IGRpZCBub3QgZ2V0IGEgcmVwbHkgb24gdGhlIHF1ZXN0aW9uIEkgaGFkCj4gPiA+Cj4gPiA+IFJp
Y2hhcmQgd3JvdGUgOgo+ID4gPiAiU28gdGhlIHJpZ2h0IGZpeCB3b3VsZCBiZSBzZXR0aW5nIHRo
ZSBwYXJlbnQncyBvb3BzX3BhbmljX3dyaXRlIGluCj4gPiA+IG10ZF9wYW5pY193cml0ZSgpLgo+
ID4gPiBUaGVuIHdlIGRvbid0IGhhdmUgdG8gdG91Y2ggbXRkcGFydC5jIgo+ID4gPgo+ID4gPiBI
b3cgZG8gSSBnZXQgYWNjZXNzIHRvIHRoZSBwYXJ0cyBwYXJlbnQgaW4gdGhlIGNvcmUgPy4gTWF5
YmUgSSBhbQo+ID4gPiBtaXNzaW5nIHNvbWV0aGluZy4KPiA+Cj4gPiBJIHRoaW5rIHRoZSBzb2x1
dGlvbiBpcyB0byBzZXQgdGhlIG9vcHNfcGFuaWNfd3JpdGUgb2YgdGhlIHJvb3QgcGFyZW50LCBp
bnN0ZWFkIG9mIHVwZGF0aW5nIHRoZSBmbGFnIG9mIHRoZSBtdGQgZGV2aWNlIGl0c2VsZiAod2hp
Y2ggaXMgbWF5YmUgYSBwYXJ0aXRpb24pLgo+ID4KPiA+IFdvdWxkIHRoaXMgaGVscD8KPiA+Cj4g
PiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1tdGQvbXNnMTA0NTQuaHRtbAo+
Cj4gSSdtIHBpbmdpbmcgeW91IGhlcmUgYXMgd2VsbCwgYXMgSSB0aGluayB5b3UgcmFpc2UgYSBy
ZWFsIGlzc3VlLCBhbmQgd2UKPiBhZ3JlZWQgb24gYSBzb2x1dGlvbiwgd2hpY2ggY2FuIG5vdyBi
ZSBlYXNpbHkgc2V0dXAgd2l0aCB0aGUgYWJvdmUKPiBjaGFuZ2Ugd2hpY2ggaGFzIGJlZW4gYXBw
bGllZCBhbmQgc3VwcG9ydCBmb3IgZnVuY3Rpb25zIGxpa2U6Cj4KPiAgICAgICAgIHN0YXRpYyBp
bmxpbmUgc3RydWN0IG10ZF9pbmZvICptdGRfZ2V0X21hc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKPiAgICAgICAgIHN0YXRpYyBpbmxpbmUgdTY0IG10ZF9nZXRfbWFzdGVyX29mcyhzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgdTY0IG9mcykKPiAgICAgICAgIHN0YXRpYyBpbmxpbmUgYm9vbCBtdGRf
aXNfcGFydGl0aW9uKGNvbnN0IHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAgICAgICAgc3RhdGlj
IGlubGluZSBib29sIG10ZF9oYXNfcGFydGl0aW9ucyhjb25zdCBzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKPgoKU28gSSBzaG91bGQgb25seSBzZXQgIG1hc3Rlci0+b29wc19wYW5pY193cml0ZSAgd2l0
aCB0aGUgbmV3IGNvZGUgPy4KCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpLYW1hbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
