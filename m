Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD176C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C5CC20678
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l+UPaZ/D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Z5TA87WP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C5CC20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+sKq+soIweZUP2S2+ygsNRx09hRzpXfOssnAeaWVZs=; b=l+UPaZ/DVcQ3px
	JZEQ8YPCRyT/9YiO1ysd3ltlXSnkp7TXYUD5PKNz8Fcnd+YTFirl4rYxsih9pl5h+H/KQv4Bj2Ep3
	8Z0boRsoSeEf7P0u9augGpzODnGTlrV3WXJ3m7ZLYB94D5q75XZVSW6pH+fs2VcA14Vw+rvEDAIMn
	WfTqQ3L6EKiXCJoJUc08ntDKrirjyfWD5FlHG2d4oEAmRmjGKpyivnEPmmp8Rtf4P/R6sCyMFaNH9
	oQ3a5vGQ+PVgklBvjSwvhk8TC7NoEgOVPrKQCi+/Qrr+YATJs68SDibO7AkYpWDR18p4RUf16+Vga
	krPgdoeosOmfki+3pPrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipbvo-0001j4-1y; Thu, 09 Jan 2020 17:49:16 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipbvl-0001ih-4w
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 17:49:14 +0000
Received: by mail-ua1-x936.google.com with SMTP id a12so2852908uan.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2020 09:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nbFOkjAHGlPbvL4EIYUXL9UZ6FXUNSH5r7L+gxgnITA=;
 b=Z5TA87WP/RGBcuGbkvo72LKsly3T5mUaqjlhFcCJM89a65qk6QmgTdXWDv6OdouuWa
 vcibypJkYhdKXUHAkVA8VF+iHyk+LZ/QdPukSQlvz9oWgjkve2vAcTNjDzgtF/e8Gyj5
 DqybAFiRjxcqpOIMrDAtpNr8RZYyMSIFefFnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nbFOkjAHGlPbvL4EIYUXL9UZ6FXUNSH5r7L+gxgnITA=;
 b=muNJrCCXHPeKhxssDoXZbusrHvsogs07kzU4VbCORUjsL9gtObhFpSYFYZD25ekmUt
 bn6s2KWHzsDBeYaYp4IStpmoadMDR0HezdqAj90GHptZEN7zmOmOrpT1VoSb3LXX6LS6
 xBSnMmTbGvyQ+hhckr40FCR1N+HupQnpR39Ohp3Rj+w+OWU+PEyQOM68EZbIjENKvaX/
 R7yX/MaBzibmLQSPT+Fb4snniaIU8W0zqNKkpFZ8jR7d+G1/LSUwAEJ/zn8nBAf0vVVX
 hzhfx9Bh7to+UhVmzIdOT1QHGfcpXFdvKtUzwGmXDChd/GYTDONU2kW6e7m8GizSkRuj
 Zumw==
X-Gm-Message-State: APjAAAUO+bKDl9pKfQXPpuUe4+Ny2nPXpgjCpBHuBv8/ZRhq2NtxJLVO
 mprO+7es/GIZuvSVSs7M/eOHwufEsN8aDp7987O1Gg==
X-Google-Smtp-Source: APXvYqyvRKf8UeRd6w8+1/UUuiM8iOTcrGbs2toeerMFt3ku7Z9dytGkKCM+LQVnJeng3zLd/vO7/C8UfIFa8whhGzQ=
X-Received: by 2002:ab0:740e:: with SMTP id r14mr7991135uap.104.1578592151208; 
 Thu, 09 Jan 2020 09:49:11 -0800 (PST)
MIME-Version: 1.0
References: <CAMm8Nh0+BgomkSMrDHgzA5SkQZczp5CVAJefE79z=vfoPrui_Q@mail.gmail.com>
 <20200109173632.618fe684@xps13>
In-Reply-To: <20200109173632.618fe684@xps13>
From: Kursad Oney <kursad.oney@broadcom.com>
Date: Thu, 9 Jan 2020 12:49:00 -0500
Message-ID: <CAMm8Nh3dccj9iAQvHhXbRcO22ROhoSmQ48bFqCC80+NiBXoTDA@mail.gmail.com>
Subject: Re: Number of bytes for spi-nand bad block marker
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Regan <david.regan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_094913_191758_BB64D018 
X-CRM114-Status: GOOD (  25.53  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIFRodSwgSmFuIDksIDIwMjAgYXQgMTE6MzYgQU0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBLdXJzYWQsCj4KPiBL
dXJzYWQgT25leSA8a3Vyc2FkLm9uZXlAYnJvYWRjb20uY29tPiB3cm90ZSBvbiBNb24sIDEyIEF1
ZyAyMDE5Cj4gMTY6MjQ6NTcgLTA0MDA6Cj4KPiA+IEhpLAo+ID4KPiA+IFRoZSBzcGktbmFuZCBk
cml2ZXIgaW4gYm90aCBsaW51eCBhbmQgdS1ib290IGNoZWNrIDIgYnl0ZXMgZm9yIGJhZAo+ID4g
YmxvY2sgbWFya2VycyBpbiBzcGluYW5kX2lzYmFkKCkuIEhvd2V2ZXIsIHRoZSBkYXRhc2hlZXQg
Zm9yCj4gPiBXMjVOMDFHVnh4SUcgc2F5cyAnQSDigJxCYWQgQmxvY2sgTWFya2Vy4oCdIGlzIGEg
bm9uLUZGaCBkYXRhIGJ5dGUgc3RvcmVkCj4gPiBhdCBCeXRlIDAgb2YgUGFnZSAwIGZvciBlYWNo
IGJhZCBibG9jay4gQW4gYWRkaXRpb25hbCBtYXJrZXIgaXMgYWxzbwo+ID4gc3RvcmVkIGluIHRo
ZSBmaXJzdCBieXRlIG9mIHRoZSA2NC1CeXRlIHNwYXJlIGFyZWEuJyB3aGljaCBpcwo+ID4gYmFz
aWNhbGx5IG9uZSBieXRlIGZvciBCQk0gaW4gc3BhcmUuCj4gPgo+ID4gQm9yaXMgc2F5cyB0aGV5
IGhhdmUgdXNlZCB0aGUgc2FtZSBwYXR0ZXJuIGZvciBwYXJhbGxlbCBOQU5EIGJlY2F1c2UKPiA+
IHNvbWUgTkFORHMgYXJlIGludGVyZmFjZXMgdGhyb3VnaCBhIDE2LWJpdCBidXMuCj4gPgo+ID4g
SGVyZSBpcyB0aGUgc2l0dWF0aW9uIEkgYW0gZmFjaW5nOiBXZSByb2xsZWQgb3VyIG93biBvd24g
c3BpLW5hbmQKPiA+IGtlcm5lbC9ib290bG9hZGVyIGRyaXZlcnMgYmVmb3JlIHRoZSBrZXJuZWwg
c3BpLW5hbmQgZHJpdmVyIHdhcwo+ID4gaW50ZWdyYXRlZCwgYW5kIHNldCBCQk0gc2l6ZSB0byAx
IGJ5dGUgZm9yIHRoaXMgdHlwZSBvZiBmbGFzaC4gVGhpcwo+ID4gbWVhbnMgdGhlIDJuZCBieXRl
IGlzIGF2YWlsYWJsZSBmb3IgdXNlLiBTb21lIGRldmljZXMgaW4gdGhlIGZpZWxkCj4gPiB1dGls
aXplIHRoZSBleHRyYSBieXRlIGZvciB0aGUgamZmczIgY2xlYW4gbWFya2VyLgo+ID4KPiA+IFdl
IHdvdWxkIGxpa2UgdG8gbWlncmF0ZSB0byB0aGUgbWFpbmxpbmUgZHJpdmVycyBidXQgdGhpcyBw
cmVzZW50cyBhbgo+ID4gaXNzdWUuIFdoZW4gd2UgZmxhc2ggYW4gaW1hZ2Ugd2l0aCB0aGUgbWFp
bmxpbmUgdS1ib290IHNwaS1uYW5kCj4gPiBkcml2ZXIsIGl0IHRoaW5rcyB0aGUgY2xlYW5lZCBq
ZmZzMiBibG9ja3MgYXJlICJiYWQgYmxvY2tzIiBzaW5jZSBvbmUKPiA+IG9mIHRoZSBieXRlcyBp
bmNsdWRlcyB0aGUgY2xlYW4gbWFya2VyLgo+ID4KPiA+IE1hcmVrIHN1Z2dlc3RlZCB3ZSBkbyBh
IG9uZS10aW1lIHVwZ3JhZGUgc2NyaXB0IHdoZXJlIHdlIHJld3JpdGUgdGhlCj4gPiBPT0IgYnV0
IGl0J3MgYSByaXNreSBvcGVyYXRpb24sIGVzcGVjaWFsbHkgaW4gdGhlIGZpZWxkLiBCb3JpcyBh
c2tlZAo+ID4gbWUgdG8gZW1haWwgdGhlIE1URCBsaXN0IGFuZCBjb250aW51ZSB0aGUgZGlzY3Vz
c2lvbiBoZXJlLiBJCj4gPiBhcHByZWNpYXRlIGFueSBvcGluaW9ucy9zdWdnZXN0aW9ucy4KPgo+
IFNvcnJ5IGZvciB0aGUgdmVyeSB2ZXJ5IGxhdGUgcmVwbHkuCj4KPiBIb3cgZGlkIHlvdSBtYW5h
Z2UgdGhpcyBzaXR1YXRpb24/Cj4KCk5vIHByb2JsZW0gd2l0aCB0aGUgbGF0ZSByZXBseS4gSSBh
bSBhZGRpbmcgRGF2aWQgUmVnYW4gb24gY29weSB3aG8gaXMKbW9yZSBmYW1pbGlhciB3aXRoIG91
ciBTUEktTkFORCBkcml2ZXIgYW5kIHRoZSBwbGFucyBnb2luZyBmb3J3YXJkLgoKPiBBcyB5b3Ug
aGF2ZSBhIHZlcnkgc3BlY2lmaWMgbmVlZCB3aGljaCBpcyBub3QgYWN0dWFsbHkgcmVsYXRlZCB0
bwo+IGhhcmR3YXJlIHN1cHBvcnQgYnV0IG1vcmUgYSBwcm9ibGVtIG9mIGNvaGVyZW5jZSBiZXR3
ZWVuIHlvdXIgb2xkCj4gZHJpdmVycyBhbmQgbWFpbmxpbmUsIHdoYXQgYWJvdXQgd3JpdGluZyBz
dXBwb3J0IGZvciAxLWJ5dGUgQkJNIGluCj4gc3BpLW5hbmQ/IElmIGl0IGlzIHRvbyBpbnZhc2l2
ZSBJIGRvbid0IHRoaW5rIGl0IGNhbiBiZSBtYWlubGluZWQsIGJ1dAo+IGF0IGxlYXN0IHlvdSBj
b3VsZCB1c2UgYSBtYWlubGluZSBkcml2ZXIgd2l0aCBhIHNtYWxsIGNoYW5nZSBvbiB0b3Agb2YK
PiBpdCBvbiB5b3VyIG9sZC1ydW5uaW5nIGluLXRoZS1maWVsZCBib2FyZHM/Cj4KClllcywgZXhh
Y3RseS4gSSB0aGluayB0aGlzIG1pZ2h0IGJlIHRoZSB3YXkgd2Ugd2lsbCBnbyBmb3J3YXJkLiBB
cyBmb3IKbWFpbmxpbmluZywgdGhlcmUgd2VyZSBxdWVzdGlvbnMgYWJvdXQgd2hldGhlciB0aGlz
IGlzIHNvbWV0aGluZyB0aGF0CmNhbi9zaG91bGQgYmUgZG9uZSBpbiB0aGUgZGV2aWNlIHRyZWUg
b3IgYXMgYSBLY29uZmlnIG9yIHNvbWUgb3RoZXIKd2F5LiBJZiB0aGVyZSBpcyBhbiBhY2NlcHRh
YmxlIHNvbHV0aW9uLCB3ZSBjYW4gaW1wbGVtZW50IGFuZCBzZW5kIGl0CmZvciBhIHJldmlldy4K
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcyEKS3Vyc2FkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
