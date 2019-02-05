Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD7DC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC59820811
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+pRp2Gf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vC1gCk8Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC59820811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8QApJ6gQvHzuOzaCkrTx7WFaobUFEglkgOAY9hzZzY=; b=t+pRp2GfMSm6qH
	C2xZnZQcsi885pGyve/iAtf1QUfMsmS8DE5TX6lfdxmQNOqxkIhazv8C3xREw0h21jARiMVVv1hlF
	LRc15mLdsp3mqxaVYyO4EVvh0J0V3Z2S3Du+bT2NqXSdUzsS8lFNkDaQRBipragRmQHRhZgOs6aNh
	D/TM9Tqv3aYwX4HfbiUJG/KLYDIjqoHCUM0Ns4gQmd5N1OxnZDh/DfSw/j4nfAb316A8lBqv95PnP
	F4pPzx1BHv7bWZQRnQz5/aMAAX5mv4ydXzLQlC21Bos2WFS+I87yXdTUFtnCbunMpC2cNNSFCyQ6E
	jRyYbYptkJNJuA5Ip1HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr2Ym-0002zp-Eu; Tue, 05 Feb 2019 15:22:52 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr2Yj-0002zM-Qo
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 15:22:51 +0000
Received: by mail-ot1-x343.google.com with SMTP id u16so6233300otk.8
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2019 07:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MozAZbg/lc3xRWjn6YkeFHkBJ7fte+FJbAP94vyT2DE=;
 b=vC1gCk8Y6BgYigpxi6FqH3CqGfZ7qty0mSF+MqpXRSReqO/VEffTyluiTt29AFWM/V
 qF+lY+iMsFTYy/bDOSHVKoWHfLa2gWzez4fMPxYmeUa+cv9v5kTiodlx/Bn8aHOAoHEL
 ABG6etRJucV+w/8M0nHQAC1mVJ4zyTiN82wn9wlkhxesYjTKPO3Lvr6SbwCTWIG/eR4p
 Y6CBzOIQwoorFrZgv5STBHaC62tVa/KzAx5U3TlMIlg/4NapxH23lwDktH6F71tlolAF
 4XN3iEa2KFAIwAyuocT9d9dJnkJyTPO5CN5gU6rXl7a8p4pZcVsI9P4AKJ+sfpZL4DBx
 HN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MozAZbg/lc3xRWjn6YkeFHkBJ7fte+FJbAP94vyT2DE=;
 b=inOlKq5mAdOVr4pXT7UWD/6/PqqYZcvOHFeaR9BdCGp6P6L8Ph1DdDoJDbGXslaEMe
 a7LIICNQPAoeZv1nPAnZkqp4e61LRG79B/5/zvcNaiGjEukL0qJpwNi+B0Yd2yLSL5y9
 8FwaMJyIncIFSnGM6RzueIM3KLus5FUM+h9DRsankYT/aNYGkpgcv9daZPdOQOoQIGTU
 Qrn+4HhJzvwi7I/I7HvERbTc+KZpmVcq0cxrHVKDghJPKqPZiK/PsKIm9CGEJzhjCCn2
 eOMXh6q5/Xbe+1kMca1KttQ9HBzIVzVNee5GpnDGyxmNW1LetNFJ4MT9RYLxHFXQ0B5g
 O+oA==
X-Gm-Message-State: AHQUAuaAbNN9PS0wJk15CHpT3LVawlNTiYCLTAyQd6xGn3+r2t3qbVFl
 P/5TFFZbvt6Jj74dCa8J2gkX8Wh7wz6XI/8yfdk=
X-Google-Smtp-Source: AHgI3IZyuu54aF9Yoh5JlDJTWhxeiN/6pBGEYytsssnL0XRLMPlS2SK87Jv3AYnEPKeXjuGOxEWqBnx4GbUSI01zM/c=
X-Received: by 2002:aca:ab57:: with SMTP id u84mr2717592oie.87.1549380168611; 
 Tue, 05 Feb 2019 07:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20190129153700.18717-1-martink@posteo.de>
 <20190205135946.64eda55c@xps13>
In-Reply-To: <20190205135946.64eda55c@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 5 Feb 2019 13:22:45 -0200
Message-ID: <CAOMZO5Cbhr-Wxu8W-oCKBP9NS3UN92=NUfYdkyYp-yy2oy12SQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_072249_892792_6891B2E2 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: bbrezillon@kernel.org, Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 Richard Weinberger <richard@nod.at>,
 Martin Kepplinger <martin.kepplinger@ginzinger.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Martin Kepplinger <martink@posteo.de>, Han Xu <han.xu@nxp.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgNSwgMjAxOSBhdCAxMTowMCBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1hcnRpbiwKPgo+IE1hcnRpbiBLZXBwbGlu
Z2VyIDxtYXJ0aW5rQHBvc3Rlby5kZT4gd3JvdGUgb24gVHVlLCAyOSBKYW4gMjAxOQo+IDE2OjM3
OjAwICswMTAwOgo+Cj4gPiBGcm9tOiBNYXJ0aW4gS2VwcGxpbmdlciA8bWFydGluLmtlcHBsaW5n
ZXJAZ2luemluZ2VyLmNvbT4KPiA+Cj4gPiBEaXNhYmxlIEJDSCBzb2Z0IHJlc2V0IGFjY29yZGlu
ZyB0byBNWDIzIGVycmF0dW0gIzI4NDcgKCJCQ0ggc29mdAo+ID4gcmVzZXQgbWF5IGNhdXNlIGJ1
cyBtYXN0ZXIgbG9jayB1cCIpIGZvciBNWDI4IHRvby4gSXQgaGFzIHRoZSBzYW1lCj4gPiBwcm9i
bGVtLgo+ID4KPiA+IE9ic2VydmVkIHByb2JsZW06IG9uY2UgcGVyIDEwMCwwMDArIE1YMjggcmVi
b290cyBOQU5EIHJlYWQgZmFpbGVkIG9uCj4gPiBETUEgdGltZW91dCBlcnJvcnM6Cj4gPiBbICAg
IDEuNzcwODIzXSBVQkk6IGF0dGFjaGluZyBtdGQzIHRvIHViaTAKPiA+IFsgICAgMi43NjgwODhd
IGdwbWlfbmFuZDogRE1BIHRpbWVvdXQsIGxhc3QgRE1BIDoxCj4gPiBbICAgIDMuOTU4MDg3XSBn
cG1pX25hbmQ6IEJDSCB0aW1lb3V0LCBsYXN0IERNQSA6MQo+ID4gWyAgICA0LjE1NjAzM10gZ3Bt
aV9uYW5kOiBFcnJvciBpbiBFQ0MtYmFzZWQgcmVhZDogLTExMAo+ID4gWyAgICA0LjE2MTEzNl0g
VUJJIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtMTEwIHdoaWxlIHJlYWRpbmcgNjQKPiA+
IGJ5dGVzIGZyb20gUEVCIDA6MCwgcmVhZCBvbmx5IDAgYnl0ZXMsIHJldHJ5Cj4gPiBbICAgIDQu
MTcxMjgzXSBzdGVwIDEgZXJyb3IKPiA+IFsgICAgNC4xNzM4NDZdIGdwbWlfbmFuZDogQ2hpcDog
MCwgRXJyb3IgLTEKPiA+Cj4gPiBXaXRob3V0IEJDSCBzb2Z0IHJlc2V0IHdlIHN1Y2Nlc3NmdWxs
eSBleGVjdXRlZCAxLDAwMCwwMDAgTVgyOCByZWJvb3RzLgo+ID4KPiA+IEkgaGF2ZSBhIHF1b3Rl
IGZyb20gTlhQIHJlZ2FyZGluZyB0aGlzIHByb2JsZW0sIGZyb20gSnVseSAxOHRoIDIwMTY6Cj4g
Pgo+ID4gIkFzIHRoZSBpLk1YMjMgYW5kIGkuTVgyOCBhcmUgb2YgdGhlIHNhbWUgZ2VuZXJhdGlv
biwgdGhleSBzaGFyZSBtYW55Cj4gPiBjaGFyYWN0ZXJpc3RpY3MuIFVuZm9ydHVuYXRlbHksIGFs
c28gdGhlIGVycmF0YXMgbWF5IGJlIHNoYXJlZC4KPiA+IEluIGNhc2Ugb2YgdGhlIGRvY3VtZW50
ZWQgZXJyYXRhcyBhbmQgdGhlIHdvcmthcm91bmRzLCB5b3UgY2FuIGFsc28KPiA+IGFwcGx5IHRo
ZSB3b3JrYXJvdW5kIHNvbHV0aW9uIG9mIG9uZSBkZXZpY2Ugb24gdGhlIG90aGVyIG9uZS4gVGhp
cyBoYXZlCj4gPiBiZWVuIHJlcG9ydGVkLCBidXQgSeKAmW0gYWZyYWlkIHRoYXQgdGhlcmUgYXJl
IG5vdCBhbiBlc3RpbWF0ZWQgZGF0ZSBmb3IKPiA+IHVwZGF0aW5nIHRoZSBFcnJhdGEgZG9jdW1l
bnRzLgo+ID4gUGxlYXNlIGFjY2VwdCBvdXIgYXBvbG9naWVzIGZvciBhbnkgaW5jb252ZW5pZW5j
ZXMgdGhpcyBtYXkgY2F1c2UuIgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1hbmZyZWQgU2NobGFl
Z2wgPG1hbmZyZWQuc2NobGFlZ2xAZ2luemluZ2VyLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IE1h
cnRpbiBLZXBwbGluZ2VyIDxtYXJ0aW4ua2VwcGxpbmdlckBnaW56aW5nZXIuY29tPgoKRG9lcyB0
aGlzIGFsc28gbmVlZCBhIEZpeGVzIHRhZyBzbyB0aGF0IGl0IGNhbiBiZSBiYWNrcG9ydGVkIHRv
IHN0YWJsZT8KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
