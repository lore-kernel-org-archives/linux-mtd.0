Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EB6C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 01:54:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1C1206DF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 01:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmim7JwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1C1206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mo4M8jEcYQRH6mSzMFIBkHzkiwp4qmy22nvTVnPWx8=; b=gmim7JwDMhgxnz
	OEWNiIXDmuvKU6lR+mCVWSERmo1bpt8DwXX5CB1GrOu2MhDu2rhqZVl1g7n2iuCiFKcxiUJcm+my5
	AJwfEnoURVkyUdezHIuLEW60R8VX9ygkTsxsrbqMSBfPpD539oIgfjTi7mfYQK319NIdQ+rYhO7R/
	kIhaiVMndATOUxDqp85qq22lENTxpX6BXp74jsmx/Wy8DUe3I29vqOA/s4ypxgFN0/o+fwJRd6N9I
	VCdLbInO3yOk1dOCpXwCI2W8Ld9sD6uv1vlLWabjcxEoW0CyAtXRRMXmah3A71U9bPRnjs/TgJVZu
	OTK3d0fTV9Zn9YinKw5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM0vO-0005H2-JY; Thu, 02 May 2019 01:54:14 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM0vL-0005GI-MR
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 01:54:13 +0000
Received: by mail-ot1-f67.google.com with SMTP id b18so683958otq.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 18:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vVw1C6lqqEObhIEkQJZC6varaqiUoICZFVm+SicOMFc=;
 b=Mc44bvHRvMCROpcCrRwvblqsOd3HESXx2ukA98vDxvdyHmnyGyAr2I+LaEa5bPlLtb
 P0QeCihzLVkQ8MGpSSFufDfuL22H2HZxn2sH+h1qeWM3DdfIIjgchJiSjECbQOwPQWs/
 Log818qbcvQcEjW9D640Ze2j7TGPtdSzuP6gd501qThWTPD6T+IUmjoXQHBv2xTDa6Cb
 ITOaYwMEVvTbRvZrvQukFdsDBYQW2teaYaJTs+mbEYNUgKJqHs2WazEZPIleo5IaXm+h
 1pCLQ8YwNTWiGLQIxSRh5gs2n6dknljdVaZ3eJW9DAsthAT4D2k2E+s54FMQv6/FpWbl
 fzgw==
X-Gm-Message-State: APjAAAX/B8A355bnF1boOsI4ApTQAALasrNAXzrUgOs3QME/mH4fpItx
 0L5YykvIB/TcFVzt3BUyow==
X-Google-Smtp-Source: APXvYqyvSe6l1vLK4cJ5ZxTy/PVn9hSglfwCtCezdanzmXnY1wQ1v0aNKpAxBDRzN1UG/UMo5gmWdg==
X-Received: by 2002:a9d:6c07:: with SMTP id f7mr740077otq.339.1556762050377;
 Wed, 01 May 2019 18:54:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f17sm8630963oto.5.2019.05.01.18.54.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 18:54:09 -0700 (PDT)
Date: Wed, 1 May 2019 20:54:08 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
Message-ID: <20190502015408.GA11612@bogus>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_185411_734970_E104E2E7 
X-CRM114-Status: GOOD (  19.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, marek.vasut@gmail.com,
 kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDY6NDI6MjNQTSArMDIwMCwgUGF3ZcWCIENobWllbCB3
cm90ZToKPiBGcm9tOiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgo+IAo+IFRo
aXMgcGF0Y2ggYWRkcyBkdC1iaW5kaW5ncyBmb3IgU2Ftc3VuZyBPbmVOQU5EIGRyaXZlci4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNv
bT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL210ZC9zYW1zdW5nLW9uZW5hbmQudHh0ICAgICAgICAg
IHwgNDYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9zYW1zdW5nLW9uZW5hbmQudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNDFkOTdjYzE1MTMKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9z
YW1zdW5nLW9uZW5hbmQudHh0Cj4gQEAgLTAsMCArMSw0NiBAQAo+ICtEZXZpY2UgdHJlZSBiaW5k
aW5ncyBmb3IgU2Ftc3VuZyBTb0MgT25lTkFORCBjb250cm9sbGVyCj4gKwo+ICtSZXF1aXJlZCBw
cm9wZXJ0aWVzOgo+ICsgLSBjb21wYXRpYmxlIDogdmFsdWUgc2hvdWxkIGJlIGVpdGhlciBvZiB0
aGUgZm9sbG93aW5nLgo+ICsgICAoYSkgInNhbXN1bmcsczNjNjQwMC1vbmVuYW5kIiAtIGZvciBv
bmVuYW5kIGNvbnRyb2xsZXIgY29tcGF0aWJsZSB3aXRoCj4gKyAgICAgICBTM0M2NDAwIFNvQywK
PiArICAgKGIpICJzYW1zdW5nLHMzYzY0MTAtb25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250cm9s
bGVyIGNvbXBhdGlibGUgd2l0aAo+ICsgICAgICAgUzNDNjQxMCBTb0MsCj4gKyAgIChjKSAic2Ft
c3VuZyxzNXBjMTAwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxl
IHdpdGgKPiArICAgICAgIFM1UEMxMDAgU29DLAo+ICsgICAoZCkgInNhbXN1bmcsczVwdjIxMC1v
bmVuYW5kIiAtIGZvciBvbmVuYW5kIGNvbnRyb2xsZXIgY29tcGF0aWJsZSB3aXRoCj4gKyAgICAg
ICBTNVBDMTEwL1M1UFYyMTAgU29Dcy4KPiArCj4gKyAtIHJlZyA6IHR3byBtZW1vcnkgbWFwcGVk
IHJlZ2lzdGVyIHJlZ2lvbnM6Cj4gKyAgIC0gZmlyc3QgZW50cnk6IGNvbnRyb2wgcmVnaXN0ZXJz
Lgo+ICsgICAtIHNlY29uZCBhbmQgbmV4dCBlbnRyaWVzOiBtZW1vcnkgd2luZG93cyBvZiBwYXJ0
aWN1bGFyIE9uZU5BTkQgY2hpcHM7Cj4gKyAgICAgZm9yIHZhcmlhbnRzIGEpLCBiKSBhbmQgYykg
b25seSBvbmUgaXMgYWxsb3dlZCwgaW4gY2FzZSBvZiBkKSB1cCB0bwo+ICsgICAgIHR3byBjaGlw
cyBjYW4gYmUgc3VwcG9ydGVkLgo+ICsKPiArIC0gaW50ZXJydXB0LXBhcmVudCA6IHBoYW5kbGUg
b2YgaW50ZXJydXB0IGNvbnRyb2xsZXIgdG8gd2hpY2ggdGhlIE9uZU5BTkQKPiArICAgY29udHJv
bGxlciBpcyB3aXJlZCwKClRoaXMgaXMgaW1wbGllZCBhbmQgY2FuIGJlIHJlbW92ZWQuCgo+ICsg
LSBpbnRlcnJ1cHRzIDogc3BlY2lmaWVyIG9mIGludGVycnVwdCBzaWduYWwgdG8gd2hpY2ggdGhl
IE9uZU5BTkQgY29udHJvbGxlcgo+ICsgICBpcyB3aXJlZDsgc2hvdWxkIGNvbnRhaW4ganVzdCBv
bmUgZW50cnkuCj4gKyAtIGNsb2NrLW5hbWVzIDogc2hvdWxkIGNvbnRhaW4gdHdvIGVudHJpZXM6
Cj4gKyAgIC0gImJ1cyIgLSBidXMgY2xvY2sgb2YgdGhlIGNvbnRyb2xsZXIsCj4gKyAgIC0gIm9u
ZW5hbmQiIC0gY2xvY2sgc3VwcGxpZWQgdG8gT25lTkFORCBtZW1vcnkuCgpJZiB0aGUgY2xvY2sg
anVzdCBnb2VzIHRvIHRoZSBPbmVOQU5EIGRldmljZSwgdGhlbiBpdCBzaG91bGQgYmUgaW4gdGhl
IApuYW5kIGRldmljZSBub2RlIHJhdGhlciB0aGFuIHRoZSBjb250cm9sbGVyIG5vZGUuCgo+ICsg
LSBjbG9jazogc2hvdWxkIGNvbnRhaW4gbGlzdCBvZiBwaGFuZGxlcyBhbmQgc3BlY2lmaWVycyBm
b3IgYWxsIGNsb2NrcyBsaXN0ZWQKPiArICAgaW4gY2xvY2stbmFtZXMgcHJvcGVydHkuCj4gKyAt
ICNhZGRyZXNzLWNlbGxzIDogbXVzdCBiZSAxLAo+ICsgLSAjc2l6ZS1jZWxscyA6IG11c3QgYmUg
MS4KClRoaXMgaW1wbGllcyBzb21lIGNoaWxkIG5vZGVzLiBXaGF0IGFyZSB0aGUgY2hpbGQgbm9k
ZXM/Cgo+ICsKPiArRm9yIHBhcnRpdGlvbiB0YWJsZSBwYXJzaW5nIChvcHRpb25hbCkgcGxlYXNl
IHJlZmVyIHRvOgo+ICsgWzFdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9uLnR4dAo+ICsKPiArRXhhbXBsZSBmb3IgYW4gczVwdjIxMCBib2FyZDoKPiArCj4g
KwlvbmVuYW5kQGIwNjAwMDAwIHsKPiArCQljb21wYXRpYmxlID0gInNhbXN1bmcsczVwdjIxMC1v
bmVuYW5kIjsKPiArCQlyZWcgPSA8MHhiMDYwMDAwMCAweDIwMDA+LCA8MHhiMDAwMDAwMCAweDIw
MDAwPjsKPiArCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZ2aWMxPjsKPiArCQlpbnRlcnJ1cHRzID0g
PDMxPjsKPiArCQljbG9jay1uYW1lcyA9ICJidXMiLCAib25lbmFuZCI7Cj4gKwkJY2xvY2tzID0g
PCZjbG9ja3MgTkFORFhMPiwgPCZjbG9ja3MgRE9VVF9GTEFTSD47Cj4gKwkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4gKwkJI3NpemUtY2VsbHMgPSA8MT47Cj4gKwl9Owo+IC0tIAo+IDIuMjAuMQo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
