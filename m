Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F3DC282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 14:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A1E24983
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 14:45:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fhrewqqY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iSRYrtqf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A1E24983
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1L2w4C1oKMWi0B9TuAPzG9t8rTQx7fagPJT6Ryb8lg=; b=fhrewqqYlO/4ew
	a+Skifw0aUoL1/7IEvxkqyCB5W8qnpinxYVlSHFjvx9cl4vGMNsjdJxzLg6uw91Vk1nkKxKrjwFxo
	Ytk52QRcANFAFhleY8iGrC/m3QYIgOBeneYAlt48u1uCHN+s51exu+QUstR/H/Kq1ZiE3jf3NXp4w
	aZVQ/5eQqGN5QhzxTgoBTW7758wiOhFs9T9WR8Ul7QomKJHmr3AAYz0eETWhraf9idE9bpC17j1LW
	N0dEsSfDBg7/eZHkhR1X+Cr/GtKjXeORJg01cHeR/oub+HNwW0v46/Ph58YKI+PywzbhWkaR1q2FM
	PgXbWZUOyGET8w7FkYtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYAgo-0006J2-AZ; Tue, 04 Jun 2019 14:45:26 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAgg-00069U-Bu
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 14:45:25 +0000
Received: by mail-pg1-x544.google.com with SMTP id e6so9235319pgd.9
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2019 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8kQJWWH20FmLV+D34/UlcFgcPuTQNqFlHhk2FqlLjKs=;
 b=iSRYrtqfNi6ssM9SlZbA4fGmokaRJAsxkcVcpGY8CiLBP2/HVranJB8xgQTGQA6DaH
 O6L0th9lpChMb0EBf5YxHaQLdDW9XRX1b1ADBlqSE27ssjDmRsQoTafplh4fksvVamKB
 2qPTWaA1GZhjZY+VkCuquleMbIT3Af1MhAzHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8kQJWWH20FmLV+D34/UlcFgcPuTQNqFlHhk2FqlLjKs=;
 b=K3Pr5tLtRH3cSSiOLiF/cwqNMykxKdsDh3yn/gNswZ5jHv6uB/KcgP/bkGj5SR2HW6
 Sp7n974vbATYOl6OitY5N5A7UUiHU1gDVMC2tgx+j1P5RawFYhxMtZSlHIHvy0HpYEC2
 TrN7CMJVYbyx1bFbXfixGnv2iFIeM3kofJsHCdc5d3Er5UlwyaFEKJC1KCRSqjVx770t
 aNdP0vFn1Hw42Phw8S9TQjMHlgijAoh8f/RXOLmgUZtdI2qjqQ2IlcyVZLdUBSRXurMi
 6xBBat6lvX12MB/JCzJLT58XxGaJZG3BjS9/sLJiM6qh4dxOe4rs+5sZr1grgCoeVq2U
 d7Cw==
X-Gm-Message-State: APjAAAXnuJ1JZvT0e5+fIG7WQA271pIorZ3hfjcDx2973YSL60OipOGl
 7RMifbdAmAsfELtPl3hk5uTwlg==
X-Google-Smtp-Source: APXvYqx9qVDV0aL129br1HvP76lImRIInL1ekOewwGewtN2/L6DHIclTxW/oSrWDb0LEZ2FL+WFJgQ==
X-Received: by 2002:a62:6d47:: with SMTP id i68mr39283857pfc.189.1559659517462; 
 Tue, 04 Jun 2019 07:45:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k22sm7663683pfk.178.2019.06.04.07.45.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 07:45:16 -0700 (PDT)
Date: Tue, 4 Jun 2019 07:45:15 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: onenand_base: Mark expected switch fall-through
Message-ID: <201906040745.B6AE4C6@keescook>
References: <20190604141737.GA1064@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604141737.GA1064@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_074519_013513_41BE1F62 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDk6MTc6MzdBTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBJbiBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0
aHJvdWdoLCBtYXJrIHN3aXRjaCBjYXNlcwo+IHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFs
bCB0aHJvdWdoLgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+
IAo+IGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYzogSW4gZnVuY3Rpb24g
4oCYb25lbmFuZF9jaGVja19mZWF0dXJlc+KAmToKPiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQv
b25lbmFuZF9iYXNlLmM6MzI2NDoxNzogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwg
dGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgdGhpcy0+b3B0aW9ucyB8PSBP
TkVOQU5EX0hBU19OT1BfMTsKPiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNl
LmM6MzI2NToyOiBub3RlOiBoZXJlCj4gICBjYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfNEdi
Ogo+ICAgXn5+fgo+IAo+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD0zCj4gCj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMg
dG8gZW5hYmxlCj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPiAKPiBDYzogSm9uYXRoYW4gQmFr
a2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNp
bHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgoKUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgoKLUtlZXMKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvb25l
bmFuZC9vbmVuYW5kX2Jhc2UuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFz
ZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCj4gaW5kZXggYmE0
NmQwY2Y2MGExLi5iZGI1ZjQ3MzNkMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9v
bmVuYW5kL29uZW5hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29u
ZW5hbmRfYmFzZS5jCj4gQEAgLTMyNjIsNiArMzI2Miw3IEBAIHN0YXRpYyB2b2lkIG9uZW5hbmRf
Y2hlY2tfZmVhdHVyZXMoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAlzd2l0Y2ggKGRlbnNpdHkp
IHsKPiAgCWNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV84R2I6Cj4gIAkJdGhpcy0+b3B0aW9u
cyB8PSBPTkVOQU5EX0hBU19OT1BfMTsKPiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPiAgCWNhc2Ug
T05FTkFORF9ERVZJQ0VfREVOU0lUWV80R2I6Cj4gIAkJaWYgKE9ORU5BTkRfSVNfRERQKHRoaXMp
KQo+ICAJCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTXzJQTEFORTsKPiAtLSAKPiAyLjIx
LjAKPiAKCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
