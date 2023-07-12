Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33236EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4zRSZxqwxSFnQN9EbzioqooeAd4FS82ReUDsit8j44=; b=enxder3ZU6lx9j
	3SwgyBybHIdKtEiZFoPXv3hzKBQdwzzMKNBOxGdR7PV7QsWLVV/3BjMW1tgu0+mIROS8yBxwBZzug
	pFWfi32LmVU+zsv1BVHZ18R/250MFum51Il5fARcFcVoswgWlGDYmpOjnXsmlNcewxmBIyos7uPuS
	IM6Y6X8Td4IO2KuyWTOar3roqQ0pHp6Se+L6NiHNI3T1fL4BYPbNjtOHZMeCTvEHAFH2Dj1rYjvaR
	HO8GkoEAkJ9BeiVEi/ZfsEdP6CzSQOGrDvRaDkGpP6HrAQppWEQO4T0OWLrcnivww7TkS0+5J/pLd
	NiLbnIhDXDSTbZLsOoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeXG-000syi-2Q;
	Wed, 12 Jul 2023 18:25:58 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeXD-000sxp-3C
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 18:25:57 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-440b4b0147bso1755430137.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689186353; x=1691778353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sOcI2jxuVJp353RgogKNfvCVFy7OwS+eMp4jITy9DY=;
        b=kggsOn6JcSO57G7NFHcUbcsHJOaMIK5tz1Mxw/dr95Sj8bB41AgzwvX0PcQm9Uwm3V
         zYtTkNvklyoK++BatlmLLgCo9PlvV6NeJVRKWjcVw+IUlCTAXDBt0lWS4QBpuZT3ooAO
         pSQCpdXFq2/T7F735GQEuInuPJdHTDtWkl4toBR1TAJ5zxgB8Nikggw88ts1nhxp/RCL
         /bC+p0sVVo8jiztLH2xJbvkYdWWFTw9GKmgnJOSWHwI/2YWajkOEJ6WvpF0mrn1Ssbxc
         eQr2kziE3zttEIVWwlNKTA1nnKGRiX28DUQj1iCrtnc2B1okbRMzZLuJiuNW0ZL+o4kp
         WoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689186353; x=1691778353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sOcI2jxuVJp353RgogKNfvCVFy7OwS+eMp4jITy9DY=;
        b=IeYqz2HicO4huR6l4IoNX3HGls3b29gnavMPxM3txK3Xa9I5Asuh0zNU5j7X9v5Wx/
         BWc9xWkl+KV34SZxsk33SdqigtD9dw2zrWxELBiNLi8rjpixShSGPdiZUKWB8LO4GTbt
         DtLnHYnCmNcFuI3flsmqnkfOrH5FwYeWY5nu99VmBqZ9mw1NoMyHzcboNeceZ5iRXkYm
         arKo0EDnDRDoYRfGswQX+yynt6WWSdz2aQR2Lon42TCbyoaIaUt/wvwdw10U8jh/gKqV
         t7Qcf8Nw7+LO+17gvDzS2LkDyillOsbExBUOjbwih80GK+hhhklgGsPdtLaAigKQ6CY6
         YRgA==
X-Gm-Message-State: ABy/qLaEcSFnTFYdrQfSevYWN9IyFWsl5+yOyTKWmtV49+mYGFJNpm4u
	WSJgrCtFRU8x/MNpfneL6AOgfn4rFYcE2qzYH3suBfI/dLN7yCoX
X-Google-Smtp-Source: APBJJlHyRxqI+3+chJwIFnAoBNpNOha/JYdUdI8l5xO8mEtpGJFTnFIwYDBcfPZI75Pja6vysb+v/1GzB2oqO6hPIdw=
X-Received: by 2002:a67:eb84:0:b0:443:7572:598b with SMTP id
 e4-20020a67eb84000000b004437572598bmr6648863vso.13.1689186353314; Wed, 12 Jul
 2023 11:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLizjBp_8ceKq=RLznXdsHD-+N55RoPh_D7_Mpkg7M-BwQ@mail.gmail.com>
 <877cr5yzjc.fsf@miraculix.mork.no>
In-Reply-To: <877cr5yzjc.fsf@miraculix.mork.no>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 12 Jul 2023 23:55:41 +0530
Message-ID: <CAOuPNLhUtVtrOQQ1Z_rA0NAerG5PSfA26=hoenuCtCBDvz1CJA@mail.gmail.com>
Subject: Re: MTD: Lots of mtdblock warnings on bootup logs
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc: open list <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-fsdevel@kvack.org, ezequiel@collabora.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_112556_027721_03C161DA 
X-CRM114-Status: GOOD (  24.13  )
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

RGVhciBCam9ybiBhbmQgTWlxdWVsLAoKVGhhbmsgeW91IHNvIG11Y2ggZm9yIHlvdXIgaGVscCEK
UGxlYXNlIHNlZSBteSByZXBseSBpbmxpbmUuCgpPbiBXZWQsIDEyIEp1bCAyMDIzIGF0IDE5OjU4
LCBCasO4cm4gTW9yayA8Ympvcm5AbW9yay5ubz4gd3JvdGU6Cj4KPiBQaW50dSBBZ2Fyd2FsIDxw
aW50dS5waW5nQGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4gPiBLZXJuZWw6IDUuMTUgOyBhcm02NCA7
IE5BTkQgKyB1YmkgKyBzcXVhc2hmcwo+ID4gV2UgaGF2ZSBzb21lIFJBVyBwYXJ0aXRpb25zIGFu
ZCBvbmUgVUJJIHBhcnRpdGlvbiAod2l0aCB1Ymlmcy9zcXVhc2hmcyB2b2x1bWVzKS4KPiA+Cj4g
PiBXZSBhcmUgc2VlaW5nIGxhcmdlIG51bWJlcnMgb2YgdGhlc2UgbG9ncyBvbiB0aGUgc2VyaWFs
IGNvbnNvbGUgdGhhdAo+ID4gaW1wYWN0IHRoZSBib290IHRpbWUuCj4gPiBbLi4uLl0KPiA+IFsg
ICAgOS42NjcyNDBdWyAgICBUOV0gQ3JlYXRpbmcgNTggTVREIHBhcnRpdGlvbnMgb24gIjFjOTgw
MDAubmFuZCI6Cj4gPiBbLi4uLl0KPiA+IFsgICAzOS45NzU3MDddWyAgVDUxOV0gbXRkYmxvY2s6
IE1URCBkZXZpY2UgJ3VlZmlfYScgaXMgTkFORCwgcGxlYXNlCj4gPiBjb25zaWRlciB1c2luZyBV
QkkgYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgo+ID4gWyAgIDM5Ljk3NTcwN11bICBUNTE5XSBtdGRi
bG9jazogTVREIGRldmljZSAndWVmaV9iJyBpcyBOQU5ELCBwbGVhc2UKPiA+IGNvbnNpZGVyIHVz
aW5nIFVCSSBibG9jayBkZXZpY2VzIGluc3RlYWQuCj4gPiBbLi4uLl0KPiA+Cj4gPiBUaGlzIHdh
cyBhZGRlZCBhcyBwYXJ0IG9mIHRoaXMgY29tbWl0Ogo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvZHJpdmVy
cy9tdGQvbXRkYmxvY2suYz9oPXY1LjE1LjEyMCZpZD1mNDFjOTQxOGM1ODk4YzAxNjM0Njc1MTUw
Njk2ZGEyOTBmYjg2Nzk2Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL210ZC9tdGRibG9jay5j
P2g9djUuMTUuMTIwJmlkPWUwNzQwM2E4YzZiZTAxODU3ZmY3NTA2MGIyZGY5YTFhYTgzMjBmZTUK
Pgo+IFlvdSBoYXZlIDUuMTUud2hhdCBleGFjdGx5PyAgY29tbWl0IGY0MWM5NDE4YzU4OTggd2Fz
IGFkZGVkIGluIHY1LjE1LjQ2Lgo+IFlvdXIgbG9nIGxvb2tzIGxpa2UgaXQgaXMgbWlzc2luZy4K
PgpNeSBleGFjdCBLZXJuZWwgdmVyc2lvbiBpczogNS4xNS43OApBbmQgSSBzZWUgdGhhdCB0aGUg
YmVsb3cgY29tbWl0IGlzIGFsc28gcHJlc2VudDoKY29tbWl0IGY0MWM5NDE4YzU4OThjMDE2MzQ2
NzUxNTA2OTZkYTI5MGZiODY3OTYKbXRkYmxvY2s6IHdhcm4gaWYgb3BlbmVkIG9uIE5BTkQKCj4g
RldJVywgY29tbWl0IGY0MWM5NDE4YzU4OTggd2FzIHN1cHBvc2VkIHRvIGZpeCBleGFjdGx5IHRo
YXQgcHJvYmxlbSB3aXRoCj4gY29tbWl0IGUwNzQwM2E4YzZiZTAxLgo+Cj4gQnV0IHRvIGNhdGNo
IGFjdHVhbCBtb3VudHMgaXQgd2lsbCBzdGlsbCB3YXJuIGlmIHRoZSBtdGRibG9jayBkZXZpY2Ug
aXMKPiBvcGVuZWQuICBUaGlzIGNhbiBvYnZpb3VzbHkgY2F1c2UgZmFsc2UgcG9zaXRpdmVzIGlm
IHlvdSBlLmcgaGF2ZSBzb21lCj4gc2NyaXB0IHJlYWRpbmcgZnJvbSB0aGUgbXRkYmxvY2sgZGV2
aWNlcy4gIElmIHlvdSBhcmUgcnVubmluZyB2NS4xNS40NiBvcgo+IGxhdGVyIHRoZW4gdGhlcmUg
KmlzKiBzb21ldGhpbmcgYWNjZXNzaW5nIHRob3NlIGRldmljZXMuIFlvdSdsbCBoYXZlIHRvCj4g
ZmlndXJlIG91dCB3aGF0IGl0IGlzIGFuZCBzdG9wIGl0IHRvIGF2b2lkIHRoZSB3YXJuaW5nLgo+
CllvdSBtZWFuLCBpZiBzb21lb25lIGlzIHVzaW5nICJtb3VudCAuLiAvZGV2L210ZGJsb2NrKiIg
dGhlbiBvbmx5IHdlCmdldCB0aGVzZSB3YXJuaW5ncyA/Ck9yLCBpZiBzb21lb25lIGlzIHRyeWlu
ZyB0byBhY2Nlc3MgdGhlIG5vZGUgdXNpbmcgb3BlbigiL2Rldi9tdGRibG9jayoiKSAuCgpCdXQg
aW4gdGhpcyBjYXNlLCB0aGVyZSBzaG91bGQgYmUgb25seSAxLDIsMyBlbnRyaWVzIGJ1dCBoZXJl
IEkgYW0Kc2VlaW5nIGZvciBhbGwgdGhlIE5BTkQgcGFydGl0aW9ucy4KT3IsIGlzIGl0IHBvc3Np
YmxlIHRoYXQgc3lzdGVtZC11ZGV2ZCBpcyB0cnlpbmcgdG8gYWNjZXNzIHRoZXNlIG5vZGVzID8K
CkNhbiB3ZSB1c2UgdWJpYmxvY2sgZm9yIG1vdW50IHViaWZzIChydykgdm9sdW1lcywgb3IgaGVy
ZSB3ZSBoYXZlIHRvCnVzZSBtdGRibG9jayA/CldlIGhhdmUgYSBtaXh0dXJlIG9mIHNxdWFzaGZz
IChybykgYW5kIHViaWZzIChydykgdWJpIHZvbHVtZXMuCkN1cnJlbnRseSwgd2UgYXJlIHVzaW5n
IHRoZSB1YmlibG9jayB3YXkgb2YgbW91bnRpbmcgZm9yIHNxdWFzaGZzIGJ1dAptdGRibG9jayBt
b3VudGluZyBmb3IgdWJpZnMuCgo+PiBDT05GSUdfTVREX0JMT0NLPXkKPj4gQ09ORklHX01URF9V
QklfQkxPQ0s9eQo+Pgo+IElmIHlvdSBkb24ndCBuZWVkIGJvdGgsIHRoZW4geWVzLgoKV2UgYWN0
dWFsbHkgbmVlZCBib3RoIG9mIHRoZW0gYmVjYXVzZSBvZiBzZXZlcmFsIGRlcGVuZGVuY2llcy4K
ClRoZXJlIGFyZSBmZXcgYXBwbGljYXRpb25zIHRoYXQgYXJlIHRyeWluZyB0byByZWFkIGNvbnRl
bnQgZnJvbSAvcHJvYy9tdGQuCklzIHRoaXMgYWxzbyBhIHByb2JsZW0gaWYgd2UgZGlzYWJsZSBN
VERfQkxPQ0sgPwoKClRoYW5rcywKUGludHUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
