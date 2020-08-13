Return-Path: <SRS0=wA1i=BX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAE0C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 10:32:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB5DE206A4
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 10:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lnzx9M7/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB5DE206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JxrYBZOMGEzCJjnO5L/x1mjSN5RZI2MerEb1o8I0vHI=; b=lnzx9M7/WbrWI2KT8BJMAzDcM
	cs7kHD40JW0JEOnFfZrwqypACfcT5NfNPaTEQBG+QTrbiZprLHe+cHs5/XDoBDNG3oWJTcaJpGEei
	9j7wjcwksFJI0V6BzdOAu37HEAhyc9qA+3Oy+Q75l2KRhX88kP/u5XNciyquxaMpBigaDAhZhOds2
	rnD2TSfFYX8XxKMcORTCQSLk51/3I5rnE3fKTGfBnDI1pr2rG6toSadviVG4NDWTVodjz1n+gNJ3+
	rOWtppcAdPwaMM3yWLRhoUEtmC+snAHauQ2QGct0MQ1R2q3KXLFhH8g9jbfxNTYcDUp7YH33bWlWZ
	w9T8LXwjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6AWH-0004EH-KG; Thu, 13 Aug 2020 10:31:37 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6AWE-0004D8-DA; Thu, 13 Aug 2020 10:31:35 +0000
Received: from [37.161.87.136] (port=46755 helo=[192.168.42.162])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <luca@lucaceresoli.net>)
 id 1k6AW9-000FlW-5k; Thu, 13 Aug 2020 12:31:29 +0200
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20200812203618.2656699-1-robh@kernel.org>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <d5808e9c-07fe-1c28-b9a6-a16abe9df458@lucaceresoli.net>
Date: Thu, 13 Aug 2020 12:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812203618.2656699-1-robh@kernel.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_063134_570234_5C664AC2 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKT24gMTIvMDgvMjAgMjI6MzYsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IENsZWFuLXVw
IGluY29ycmVjdCBpbmRlbnRhdGlvbiwgZXh0cmEgc3BhY2VzLCBsb25nIGxpbmVzLCBhbmQgbWlz
c2luZwo+IEVPRiBuZXdsaW5lIGluIHNjaGVtYSBmaWxlcy4gTW9zdCBvZiB0aGUgY2xlYW4tdXBz
IGFyZSBmb3IgbGlzdAo+IGluZGVudGF0aW9uIHdoaWNoIHNob3VsZCBhbHdheXMgYmUgMiBzcGFj
ZXMgbW9yZSB0aGFuIHRoZSBwcmVjZWRpbmcKPiBrZXl3b3JkLgo+IAo+IEZvdW5kIHdpdGggeWFt
bGxpbnQgKHdoaWNoIEkgcGxhbiB0byBpbnRlZ3JhdGUgaW50byB0aGUgY2hlY2tzKS4KClsuLi5d
Cgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
aWR0LHZlcnNhY2xvY2s1LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svaWR0LHZlcnNhY2xvY2s1LnlhbWwKPiBpbmRleCAzZDRlMTY4NWNjNTUuLjI4YzY0NjFi
OWE5YSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xv
Y2svaWR0LHZlcnNhY2xvY2s1LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svaWR0LHZlcnNhY2xvY2s1LnlhbWwKPiBAQCAtOTUsMTAgKzk1LDEwIEBA
IGFsbE9mOgo+ICAgICAgICAjIERldmljZXMgd2l0aG91dCBidWlsdGluIGNyeXN0YWwKPiAgICAg
ICAgcHJvcGVydGllczoKPiAgICAgICAgICBjbG9jay1uYW1lczoKPiAtICAgICAgICAgICAgbWlu
SXRlbXM6IDEKPiAtICAgICAgICAgICAgbWF4SXRlbXM6IDIKPiAtICAgICAgICAgICAgaXRlbXM6
Cj4gLSAgICAgICAgICAgICAgZW51bTogWyB4aW4sIGNsa2luIF0KPiArICAgICAgICAgIG1pbkl0
ZW1zOiAxCj4gKyAgICAgICAgICBtYXhJdGVtczogMgo+ICsgICAgICAgICAgaXRlbXM6Cj4gKyAg
ICAgICAgICAgIGVudW06IFsgeGluLCBjbGtpbiBdCj4gICAgICAgICAgY2xvY2tzOgo+ICAgICAg
ICAgICAgbWluSXRlbXM6IDEKPiAgICAgICAgICAgIG1heEl0ZW1zOiAyCgpUaGFua3MgZm9yIG5v
dGljaW5nLCBMR1RNLgoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi90b3VjaHNjcmVlbi55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3RvdWNoc2NyZWVu
LnlhbWwKPiBpbmRleCBkN2RhYzE2YTM5NjAuLjM2ZGM3YjU2YTQ1MyAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vdG91Y2hz
Y3JlZW4ueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1
dC90b3VjaHNjcmVlbi90b3VjaHNjcmVlbi55YW1sCj4gQEAgLTMzLDggKzMzLDggQEAgcHJvcGVy
dGllczoKPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
Mgo+ICAKPiAgICB0b3VjaHNjcmVlbi1taW4tcHJlc3N1cmU6Cj4gLSAgICBkZXNjcmlwdGlvbjog
bWluaW11bSBwcmVzc3VyZSBvbiB0aGUgdG91Y2hzY3JlZW4gdG8gYmUgYWNoaWV2ZWQgaW4gb3Jk
ZXIgZm9yIHRoZQo+IC0gICAgICAgICAgICAgICAgIHRvdWNoc2NyZWVuIGRyaXZlciB0byByZXBv
cnQgYSB0b3VjaCBldmVudC4KPiArICAgIGRlc2NyaXB0aW9uOiBtaW5pbXVtIHByZXNzdXJlIG9u
IHRoZSB0b3VjaHNjcmVlbiB0byBiZSBhY2hpZXZlZCBpbiBvcmRlcgo+ICsgICAgICBmb3IgdGhl
IHRvdWNoc2NyZWVuIGRyaXZlciB0byByZXBvcnQgYSB0b3VjaCBldmVudC4KCk91dCBvZiBwZXJz
b25hbCB0YXN0ZSwgSSBmaW5kIHRoZSBvcmlnaW5hbCBsYXlvdXQgbW9yZSBwbGVhc2FudCBhbmQK
cmVhZGFibGUuIFRoaXMgdGhpcmQgb3B0aW9uIGlzIGFsc28gZ29vZCwgZXNwZWNpYWxseSBmb3Ig
bG9uZyBkZXNjcmlwdGlvbnM6CgogIGRlc2NyaXB0aW9uOgogICAgbWluaW11bSBwcmVzc3VyZSBv
biB0aGUgdG91Y2hzY3JlZW4gdG8gYmUgYWNoaWV2ZWQgaW4gb3JkZXIgZm9yIHRoZQogICAgdG91
Y2hzY3JlZW4gZHJpdmVyIHRvIHJlcG9ydCBhIHRvdWNoIGV2ZW50LgoKQXQgZmlyc3QgZ2xhbmNl
IHlhbWxsaW50IHNlZW1zIHRvIHN1cHBvcnQgZXhhY3RseSB0aGVzZSB0d28gYnkgZGVmYXVsdDoK
Cj4gV2l0aCBpbmRlbnRhdGlvbjoge3NwYWNlczogNCwgY2hlY2stbXVsdGktbGluZS1zdHJpbmdz
OiB0cnVlfQo+IAo+IHRoZSBmb2xsb3dpbmcgY29kZSBzbmlwcGV0IHdvdWxkIFBBU1M6Cj4gCj4g
QmxhaXNlIFBhc2NhbDoKPiAgICAgSmUgdm91cyDDqWNyaXMgdW5lIGxvbmd1ZSBsZXR0cmUgcGFy
Y2UgcXVlCj4gICAgIGplIG4nYWkgcGFzIGxlIHRlbXBzIGQnZW4gw6ljcmlyZSB1bmUgY291cnRl
Lgo+IAo+IHRoZSBmb2xsb3dpbmcgY29kZSBzbmlwcGV0IHdvdWxkIFBBU1M6Cj4gCj4gQmxhaXNl
IFBhc2NhbDogSmUgdm91cyDDqWNyaXMgdW5lIGxvbmd1ZSBsZXR0cmUgcGFyY2UgcXVlCj4gICAg
ICAgICAgICAgICAgamUgbidhaSBwYXMgbGUgdGVtcHMgZCdlbiDDqWNyaXJlIHVuZSBjb3VydGUu
Cj4gCj4gdGhlIGZvbGxvd2luZyBjb2RlIHNuaXBwZXQgd291bGQgRkFJTDoKPiAKPiBCbGFpc2Ug
UGFzY2FsOiBKZSB2b3VzIMOpY3JpcyB1bmUgbG9uZ3VlIGxldHRyZSBwYXJjZSBxdWUKPiAgIGpl
IG4nYWkgcGFzIGxlIHRlbXBzIGQnZW4gw6ljcmlyZSB1bmUgY291cnRlLgo+IAooaHR0cHM6Ly95
YW1sbGludC5yZWFkdGhlZG9jcy5pby9lbi9zdGFibGUvcnVsZXMuaHRtbCNtb2R1bGUteWFtbGxp
bnQucnVsZXMuaW5kZW50YXRpb24pCgoKLS0gCkx1Y2EKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
