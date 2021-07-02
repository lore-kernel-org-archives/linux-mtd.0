Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F1AC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 09:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFCFF613EA
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 09:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFCFF613EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PD4J2r6fHEeepaScsz8DlcwJc59L8tCGUhv7/L2mXqk=; b=el3vv1ZTqUUYqmRh3kGMW11dfo
	dL1ID0Dp15H5dt9mZDzJ7xMQQG3xuWRKHnkHxy8GWB8AtpTtJH0zydh4A1nnCLjODn99WAjMP0jyw
	XFMwmiADhVbgRiS8DKrpUqY8FpweMC8pmWhN97ErTaPISo2J20HEs3c9UC5kzVGSgHkOl7wnl5hJq
	lmXEo8JmM5cVDlTpreIqNYZCvcLltpJwH4hdlpJYqfEn0aVG5fECtvkq+DOx1ynGsEjAz951OoXkF
	tDC9Sr2F/tedPmsy5U+VHXKoUtd2Oppkcjz+exN7Dd8+ppsZ/8hu7ZsdbRKTPSPt/7j7WDbDkPEqu
	rnLD646w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzFYo-002duY-8j; Fri, 02 Jul 2021 09:34:10 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFYa-002dpi-O8
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 09:33:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5A18722249;
 Fri,  2 Jul 2021 11:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625218433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIgpNtb6bk7Xip9BGn8GnsVHJ/WF1JakLymLgy2KJk8=;
 b=vXXDkhNWvpBcLBM8QHfOVJrNveocFevI0aNqo7+KH7yxb8jtCBDkFe6ywlDnqZnmU33PIB
 IPkPWUsKu+G054p7+1WZFel7W1hLym/PvYufL8YYAjBKSR2r1tvEoJFCzdQfbB57xy9QCg
 oMlJNs0xrND8IVHhmZ7zh4zTMprfC6Q=
MIME-Version: 1.0
Date: Fri, 02 Jul 2021 11:33:53 +0200
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 5/5] mtd: core: add OTP nvmem provider support
In-Reply-To: <e89da7a0-2e46-349c-9b25-f0b555a72b46@roeck-us.net>
References: <20210424110608.15748-1-michael@walle.cc>
 <20210424110608.15748-6-michael@walle.cc>
 <20210701213420.GA1131789@roeck-us.net>
 <f48661d2d54b37db395fb73af8b52359@walle.cc>
 <e89da7a0-2e46-349c-9b25-f0b555a72b46@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5ce79af321eb04e33178b78e4e3f45f0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_023357_010395_8BD7C828 
X-CRM114-Status: GOOD (  23.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wNy0wMiAwMzo1NSwgc2NocmllYiBHdWVudGVyIFJvZWNrOgo+IE9uIDcvMS8yMSAz
OjEwIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBIaSBHdWVudGVyLAo+PiAKPj4gQW0gMjAy
MS0wNy0wMSAyMzozNCwgc2NocmllYiBHdWVudGVyIFJvZWNrOgo+Pj4gSGksCj4+PiAKPj4+IE9u
IFNhdCwgQXByIDI0LCAyMDIxIGF0IDAxOjA2OjA4UE0gKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3Jv
dGU6Cj4+Pj4gRmxhc2ggT1RQIHJlZ2lvbnMgY2FuIGFscmVhZHkgYmUgcmVhZCB2aWEgdXNlciBz
cGFjZS4gU29tZSBib2FyZHMgCj4+Pj4gaGF2ZQo+Pj4+IHRoZWlyIHNlcmlhbCBudW1iZXIgb3Ig
TUFDIGFkZHJlc3NlcyBzdG9yZWQgaW4gdGhlIE9UUCByZWdpb25zLiBBZGQKPj4+PiBzdXBwb3J0
IGZvciB0aGVtIGJlaW5nIGEgKHJlYWQtb25seSkgbnZtZW0gcHJvdmlkZXIuCj4+Pj4gCj4+Pj4g
VGhlIEFQSSB0byByZWFkIHRoZSBPVFAgZGF0YSBpcyBhbHJlYWR5IGluIHBsYWNlLiBJdCBkaXN0
aW5ndWlzaGVzCj4+Pj4gYmV0d2VlbiBmYWN0b3J5IGFuZCB1c2VyIE9UUCwgdGh1cyB0aGVyZSBh
cmUgdXAgdG8gdHdvIGRpZmZlcmVudAo+Pj4+IHByb3ZpZGVycy4KPj4+PiAKPj4+PiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+Pj4gCj4+PiBUaGlzIHBh
dGNoIGNhdXNlcyBhIGJvb3QgZmFpbHVyZSB3aXRoIG9uZSBvZiBteSBxZW11IHRlc3RzLgo+Pj4g
V2l0aCB0aGUgcGF0Y2ggaW4gcGxhY2UsIHRoZSBmbGFzaCBmYWlscyB0byBpbnN0YW50aWF0ZS4K
Pj4+IAo+Pj4gW8KgwqDCoCAxLjE1NjU3OF0gQ3JlYXRpbmcgMyBNVEQgcGFydGl0aW9ucyBvbiAi
cGh5c21hcC1mbGFzaCI6Cj4+PiBbwqDCoMKgIDEuMTU3MTkyXSAweDAwMDAwMDAwMDAwMC0weDAw
MDAwMDA0MDAwMCA6ICJVLUJvb3QgQm9vdGxvYWRlciIKPj4+IFvCoMKgwqAgMS4xODQ2MzJdIDB4
MDAwMDAwMDQwMDAwLTB4MDAwMDAwMDYwMDAwIDogIlUtQm9vdCBFbnZpcm9ubWVudCIKPj4+IFvC
oMKgwqAgMS4yMDE3NjddIDB4MDAwMDAwMDYwMDAwLTB4MDAwMDAwODAwMDAwIDogIkZsYXNoIgo+
Pj4gW8KgwqDCoCAxLjIyMjMyMF0gRGVsZXRpbmcgTVREIHBhcnRpdGlvbnMgb24gInBoeXNtYXAt
Zmxhc2giOgo+Pj4gW8KgwqDCoCAxLjIyMjc0NF0gRGVsZXRpbmcgVS1Cb290IEJvb3Rsb2FkZXIg
TVREIHBhcnRpdGlvbgo+Pj4gW8KgwqDCoCAxLjMwMzU5N10gRGVsZXRpbmcgVS1Cb290IEVudmly
b25tZW50IE1URCBwYXJ0aXRpb24KPj4+IFvCoMKgwqAgMS4zNjg3NTFdIERlbGV0aW5nIEZsYXNo
IE1URCBwYXJ0aXRpb24KPj4+IFvCoMKgwqAgMS40MzA2MTldIHBoeXNtYXAtZmxhc2g6IHByb2Jl
IG9mIHBoeXNtYXAtZmxhc2ggZmFpbGVkIHdpdGggCj4+PiBlcnJvciAtNjEKPj4+IAo+Pj4gLTYx
IGlzIC1FTk9EQVRBLgo+Pj4gCj4+PiBPdGhlciBib290IHRlc3RzIHdpdGggZGlmZmVyZW50IGZs
YXNoIGNoaXBzIGNhbiBzdGlsbCBib290Lgo+Pj4gUmV2ZXJ0aW5nIHRoaXMgcGF0Y2ggKGFzIHdl
bGwgYXMgdGhlIGZvbGxvdy11cCBwYXRjaGVzKSBmaXhlcwo+Pj4gdGhlIHByb2JsZW0uCj4+PiAK
Pj4+IEkgZG8gbm90IGtub3cgaWYgdGhpcyBpcyBhIHByb2JsZW0gd2l0aCBxZW11IG9yIGEgcHJv
YmxlbSB3aXRoIHRoZQo+Pj4gcGF0Y2gsIGJ1dCwgYXMgSSBtZW50aW9uZWQsIG90aGVyIGZsYXNo
IGNoaXBzIGRvIHN0aWxsIGluc3RhbnRpYXRlLgo+Pj4gCj4+PiBEbyB5b3UgaGF2ZSBhbiBpZGVh
IHdoYXQgdG8gbG9vayBmb3Igd2hlbiBJIHRyeSB0byB0cmFjayBkb3duIHRoZSAKPj4+IHByb2Js
ZW0gPwo+PiAKPj4gSSdkIHN0YXJ0IGJ5IGxvb2tpbmcgYXQgdGhlIHJldHVybiBjb2RlIG9mIG10
ZF9vdHBfc2l6ZSgpIGJlY2F1c2UgdGhhdAo+PiBzaG91bGQgYmUgdGhlIG9ubHkgZnVuY3Rpb24g
d2hpY2ggY29tbXVuaWNhdGVzIHdpdGggdGhlIGZsYXNoIGF0IHByb2JlCj4+IHRpbWUuCj4+IAo+
PiBDYW4geW91IHNoYXJlIGhvdyB0byByZXByb2R1Y2UgdGhhdCBwcm9ibGVtPyBMaWtlIHRoZSBx
ZW11IGNvbW1hbmRsaW5lCj4+IGFuZCBpbnZvbHZlZCBpbWFnZXM/Cj4+IAo+IAo+IHFlbXUtc3lz
dGVtLWFybSAtTSB6MiAta2VybmVsIGFyY2gvYXJtL2Jvb3QvekltYWdlIC1uby1yZWJvb3QgXAo+
ICAgICAtc25hcHNob3QgLWRyaXZlIGZpbGU9L3RtcC9mbGFzaCxmb3JtYXQ9cmF3LGlmPXBmbGFz
aCBcCj4gICAgIC0tYXBwZW5kICJyb290PS9kZXYvbXRkYmxvY2syIGNvbnNvbGU9dHR5UzAiIFwK
PiAgICAgLW5vZ3JhcGhpYyAtbW9uaXRvciBudWxsIC1zZXJpYWwgc3RkaW8KPiAKPiBUaGlzIGlz
IHdpdGggcWVtdSB2Ni4wIGFuZCBweGFfZGVmY29uZmlnLiBUaGUgYWN0dWFsIGZsYXNoIGltYWdl
IAo+IGRvZXNuJ3QKPiByZWFsbHkgbWF0dGVyIChhbiBlbXB0eSBmaWxlIHdpdGggYSBzaXplIG9m
IDEwMjQqMTAyNCo4IGJ5dGVzIGlzIAo+IHN1ZmZpY2llbnQpLgoKRm9yIGNvbXBsZXRlbmVzczog
d2l0aCBweGFfZGVmY29uZmlnLCBJIGd1ZXNzLgoKPiBEZWJ1Z2dpbmcgc2hvd3MgdGhhdCAtRU5P
REFUQSBpcyByZXBvcnRlZCBieSBjZmlfaW50ZWxleHRfb3RwX3dhbGsoKSwKPiB0aGFua3MgdG86
CgpUaGFua3MgZm9yIGFscmVhZHkgbG9va2luZyBpbnRvIHRoaXMuCgo+IAo+IFsgICAgMC43Mzcy
NDRdICMjIyMgRmVhdHVyZVN1cHBvcnQ6IDB4MCBOdW1Qcm90ZWN0aW9uRmllbGRzOiAxCj4gCj4g
d2hpY2ggc2VlbXMgdG8gc3VnZ2VzdCB0aGF0IHRoZXJlIGFyZSBpbmRlZWQgZmxhc2ggY2hpcHMg
d2hpY2ggZG9uJ3QgCj4gc3VwcG9ydAo+IE9UUCBkYXRhLiBXaXRoIHRoaXMgaW4gbWluZCwgaXMg
aXQgaW5kZWVkIGFwcHJvcHJpYXRlIHRvIGRpc2FibGUgCj4gc3VwcG9ydCBmb3IKPiBhbGwgZmxh
c2ggY2hpcHMgd2hpY2ggZG9uJ3Qgc3VwcG9ydCBPVFAgZGF0YSA/CgpZZXMgb2YgY291cnNlLiBU
aGUgU1BJIE5PUiBkcml2ZXJzIGRvZXNuJ3QgcmVnaXN0ZXIgdGhlIGNhbGxiYWNrcyBpZgp0aGVy
ZSBpcyBubyBPVFAgc3VwcG9ydC4gVGhlIG90aGVycyByZXR1cm4gRU5PREFUQSwgd2hpY2ggSSBt
aXNzZWQuCgpJJ2xsIHNlbmQgYSBwYXRjaCBzaG9ydGx5LgoKLW1pY2hhZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
