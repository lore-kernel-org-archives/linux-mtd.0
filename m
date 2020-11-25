Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF70C56202
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 18:19:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C14762075A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 18:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZmBCPXUL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="u1N93bDH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C14762075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pdwOyVjleLMxPVLgUXMVu0hlHCgjiEF7k35FTfay60I=; b=ZmBCPXULCIRLj6icpGPCzwZyc
	XbBaRz3MfbKf1Ao2iYqutDCG3v9wBZteTWRZffL9aL+qxe9ajQJ77sWEZkWN8dm/QGoG52up8Ymal
	LZ2xGTtgCoYKWJ23H+ozqh5Ygp6IG/kSdzxX4h7pP2aU+2UjGQYx+I18XPsZ+h/1FuOtWstIYtAK7
	DMZHoLt2rMCT+2vWeugtBYCXOJKBXnnDnhc2C2qBpIWOpPacoUrbz0/Yg0KxURZGyKiTBUJIo11kk
	lchKgvhd02qrgrQtOcNHzdydxyk1cDtpwIr/oVsP31jpKaP6Bzzi7UEkQNrQUkIJbVri3ormL2M5A
	0SVBqIv7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khzMn-0001Nt-3g; Wed, 25 Nov 2020 18:18:09 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khzMk-0001Ly-T8
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 18:18:08 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A8B4122FEB;
 Wed, 25 Nov 2020 19:17:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606328278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0kuIvFihZoeqWGQmI7Xv7pq6wumViJEtZy5++CA2uM=;
 b=u1N93bDHH7F/rYWm4kfztU9JIq39mvMuoIiTh/Ugk463yKAMakfw2vnwTntWbYwC7Xnpjc
 nIo3v39LbH8sF1WZUI3JFmZyrTQed0uYGvnIOove4XZXC1qOTWaY0pSp/Z8uXG+2FAsebY
 lpxP53FK5p84aT4hayKU36nf1BcXaas=
MIME-Version: 1.0
Date: Wed, 25 Nov 2020 19:17:57 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v5 1/3] mtd: spi-nor: atmel: remove global protection flag
In-Reply-To: <7b5159c1-5457-b43c-2bf2-1a17ed6df34a@microchip.com>
References: <20201003153235.29762-1-michael@walle.cc>
 <20201003153235.29762-2-michael@walle.cc>
 <7b5159c1-5457-b43c-2bf2-1a17ed6df34a@microchip.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <f9724ff71809557283beb7c8c4d4b356@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_131807_221298_169D0FD6 
X-CRM114-Status: GOOD (  20.60  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMC0xMS0yNCAyMDowOSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMTAvMy8yMCA2OjMyIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBUaGlzIGlzIGNvbnNpZGVyZWQgYmFk
IGZvciB0aGUgZm9sbG93aW5nIHJlYXNvbnM6Cj4+ICAoMSkgV2Ugb25seSBzdXBwb3J0IHRoZSBi
bG9jayBwcm90ZWN0aW9uIHdpdGggQlBuIGJpdHMgZm9yIHdyaXRlCj4+ICAgICAgcHJvdGVjdGlv
bi4gTm90IGFsbCBBdG1lbCBwYXJ0cyBzdXBwb3J0IHRoaXMuCj4+ICAoMikgTmV3bHkgYWRkZWQg
Zmxhc2ggY2hpcCB3aWxsIGF1dG9tYXRpY2FsbHkgaW5oZXJpdCB0aGUgImhhcwo+PiAgICAgIGxv
Y2tpbmciIHN1cHBvcnQgYW5kIHRodXMgbmVlZHMgdG8gZXhwbGljaXRseSB0ZXN0ZWQuIEJldHRl
cgo+PiAgICAgIGJlIG9wdC1pbiBpbnN0ZWFkIG9mIG9wdC1vdXQuCj4+ICAoMykgVGhlcmUgYXJl
IGFscmVhZHkgc3VwcG9ydGVkIGZsYXNoZXMgd2hpY2ggZG9lc24ndCBzdXBwb3J0Cj4+ICAgICAg
dGhlIGxvY2tpbmcgc2NoZW1lLiBTbyBJIGFzc3VtZSB0aGlzIHdhc24ndCBwcm9wZXJseSB0ZXN0
ZWQKPj4gICAgICBiZWZvcmUgYWRkaW5nIHRoYXQgY2hpcDsgd2hpY2ggZW5mb3JjZXMgbXkgcHJl
dmlvdXMgYXJndW1lbnQKPj4gICAgICB0aGF0IGxvY2tpbmcgc3VwcG9ydCBzaG91bGQgYmUgYW4g
b3B0LWluLgo+PiAKPj4gUmVtb3ZlIHRoZSBnbG9iYWwgZmxhZyBhbmQgYWRkIGluZGl2aWR1YWwg
ZmxhZ3MgdG8gYWxsIGZsYXNoZXMgd2hpY2gKPj4gc3VwcG9ydHMgQlAgbG9ja2luZy4gSW4gcGFy
dGljdWxhciB0aGUgZm9sbG93aW5nIGZsYXNoZXMgZG9uJ3Qgc3VwcG9ydAo+PiB0aGUgQlAgc2No
ZW1lOgo+PiAgLSBBVDI2RjAwNAo+PiAgLSBBVDI1U0wzMjEKPj4gIC0gQVQ0NURCMDgxRAo+PiAK
Pj4gUGxlYXNlIG5vdGUsIHRoYXQgc29tZSBmbGFzaGVzIHdoaWNoIGFyZSBtYXJrZWQgYXMgU1BJ
X05PUl9IQVNfTE9DSyAKPj4ganVzdAo+PiBzdXBwb3J0IEdsb2JhbCBQcm90ZWN0aW9uLCBpLmUu
IG5vdCBvdXIgc3VwcG9ydGVkIGJsb2NrIHByb3RlY3Rpb24KPj4gbG9ja2luZyBzY2hlbWUuIFRo
aXMgaXMgdG8ga2VlcCBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIHRoZQo+PiBjdXJyZW50
ICJ1bmxvY2sgYWxsIGF0IGJvb3QiIG1lY2hhbmlzbS4gSW4gcGFydGljdWxhciB0aGUgZm9sbG93
aW5nCj4+IGZsYXNoZXMgZG9lc24ndCBoYXZlIEJQIGJpdHM6Cj4+ICAtIEFUMjVERjA0MUEKPj4g
IC0gQVQyNURGMzIxCj4+ICAtIEFUMjVERjMyMUEKPj4gIC0gQVQyNURGNjQxCj4+ICAtIEFUMjZE
RjA4MUEKPj4gIC0gQVQyNkRGMTYxQQo+PiAgLSBBVDI2REYzMjEKPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4gCj4gUmV2aWV3ZWQtYnk6IFR1
ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4KPiAKPj4gLS0tCj4+IGNo
YW5nZXMgc2luY2UgdjQ6Cj4+ICAtIG5vbmUKPj4gCj4+IGNoYW5nZXMgc2luY2UgdjMvdjIvdjE6
Cj4+ICAtIHRoZXJlIHdhcyBubyBzdWNoIHZlcnNpb24gYmVjYXVzZSB0aGlzIHBhdGNoIHdhcyBi
dW5kbGVkIHdpdGggCj4+IGFub3RoZXIKPj4gICAgcGF0Y2gKPj4gCj4+IGNoYW5nZXMgc2luY2Ug
UkZDOgo+PiAgLSBtZW50aW9uIHRoZSBmbGFzaGVzIHdoaWNoIGp1c3Qgc3VwcG9ydCB0aGUgIkds
b2JhbCBVbnByb3RlY3QiIGluIAo+PiB0aGUKPj4gICAgY29tbWl0IG1lc3NhZ2UKPj4gCj4+ICBk
cml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMgfCAyOCArKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkK
Pj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2F0bWVsLmMKPj4gaW5kZXggM2Y1ZjIxYTQ3M2E2Li40OWQzOTJjNmM4YmMg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYwo+PiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMKPj4gQEAgLTEwLDM3ICsxMCwyNyBAQAo+PiAKPj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBhdG1lbF9wYXJ0c1tdID0gewo+PiAgICAgICAg
IC8qIEF0bWVsIC0tIHNvbWUgYXJlIChjb25mdXNpbmdseSkgbWFya2V0ZWQgYXMgIkRhdGFGbGFz
aCIgKi8KPj4gLSAgICAgICB7ICJhdDI1ZnMwMTAiLCAgSU5GTygweDFmNjYwMSwgMCwgMzIgKiAx
MDI0LCAgIDQsIFNFQ1RfNEspIH0sCj4+IC0gICAgICAgeyAiYXQyNWZzMDQwIiwgIElORk8oMHgx
ZjY2MDQsIDAsIDY0ICogMTAyNCwgICA4LCBTRUNUXzRLKSB9LAo+PiArICAgICAgIHsgImF0MjVm
czAxMCIsICBJTkZPKDB4MWY2NjAxLCAwLCAzMiAqIDEwMjQsICAgNCwgU0VDVF80SyB8IAo+PiBT
UElfTk9SX0hBU19MT0NLKSB9LAo+IAo+IGh0dHBzOi8vZGF0YXNoZWV0c3BkZi5jb20vcGRmLWZp
bGUvNTg3MTY0L0FUTUVMQ29ycG9yYXRpb24vQVQyNUZTMDEwLzEKPiBCUCBiaXRzIGFyZSBhdCBi
aXQgMiwgMywgNSBhbmQgNi4KPiBCUDAsIEJQMSwgQlAzLCBCUDQgYW5kIFdQRU4sIGFyZSBub252
b2xhdGlsZSBjZWxscwo+IAo+PiArICAgICAgIHsgImF0MjVmczA0MCIsICBJTkZPKDB4MWY2NjA0
LCAwLCA2NCAqIDEwMjQsICAgOCwgU0VDVF80SyB8IAo+PiBTUElfTk9SX0hBU19MT0NLKSB9LAo+
IAo+IGh0dHBzOi8vZGF0YXNoZWV0c3BkZi5jb20vcGRmLWZpbGUvNTg3MTY1L0FUTUVMQ29ycG9y
YXRpb24vQVQyNUZTMDQwLzEKPiBCUCBiaXRzIGFyZSBhdCBiaXQgMiwgMywgNCwgNSwgYW5kIDYu
Cj4gQlAwLCBCUDEsIEJQMiwgQlAzLCBCUDQgYXJlIG5vbnZvbGF0aWxlIGNlbGxzCj4gCj4+IAo+
PiAtICAgICAgIHsgImF0MjVkZjA0MWEiLCBJTkZPKDB4MWY0NDAxLCAwLCA2NCAqIDEwMjQsICAg
OCwgU0VDVF80SykgfSwKPj4gLSAgICAgICB7ICJhdDI1ZGYzMjEiLCAgSU5GTygweDFmNDcwMCwg
MCwgNjQgKiAxMDI0LCAgNjQsIFNFQ1RfNEspIH0sCj4+IC0gICAgICAgeyAiYXQyNWRmMzIxYSIs
IElORk8oMHgxZjQ3MDEsIDAsIDY0ICogMTAyNCwgIDY0LCBTRUNUXzRLKSB9LAo+PiAtICAgICAg
IHsgImF0MjVkZjY0MSIsICBJTkZPKDB4MWY0ODAwLCAwLCA2NCAqIDEwMjQsIDEyOCwgU0VDVF80
SykgfSwKPj4gKyAgICAgICB7ICJhdDI1ZGYwNDFhIiwgSU5GTygweDFmNDQwMSwgMCwgNjQgKiAx
MDI0LCAgIDgsIFNFQ1RfNEsgfCAKPj4gU1BJX05PUl9IQVNfTE9DSykgfSwKPiAKPiBodHRwczov
L2RhdGFzaGVldHNwZGYuY29tL3BkZi1maWxlLzk3NTMzMS9BZGVzdG8vQVQyNURGMDQxQS8xCj4g
R2xvYmFsIFByb3RlY3QvVW5wcm90ZWN0IHVzaW5nIFdyaXRlIFNSIGNvbW1hbmQ6Cj4gR2xvYmFs
IFVubG9jazogd3JpdGUgMHgwMCB0byBTUgo+IEdsb2JhbCBMb2NrOiBSZWFkIFNSLiBJZiBTUi5T
UFJMIGlzIDEgd3JpdGUgMHhmZiB0byBTUiwgZWxzZSB3cml0ZSAKPiAweDdmLgoKVGhhdCBpcyBu
b3QgbXkgdW5kZXJzdGFuZGluZy4gUXVvdGU6CiAgIFRvIHBlcmZvcm0gYSBHbG9iYWwgUHJvdGVj
dCwgdGhlIGFwcHJvcHJpYXRlIFdQIHBpbiBhbmQgU1BSTAogICBjb25kaXRpb25zIG11c3QgYmUg
bWV0LCBhbmQgdGhlIHN5c3RlbSBtdXN0IHdyaXRlIGEgbG9naWNhbCDigJwx4oCdCiAgIHRvIGJp
dHMgNSwgNCwgMywgYW5kIDIgb2YgdGhlIFN0YXR1cyBSZWdpc3Rlci4KCkFuZAogICBDb252ZXJz
ZWx5LCB0byBwZXItZm9ybSBhIEdsb2JhbCBVbnByb3RlY3QsIHRoZSBzYW1lIFdQIGFuZCBTUFJM
CiAgIGNvbmRpdGlvbnMgbXVzdCBiZSBtZXQgYnV0IHRoZSBzeXN0ZW0gbXVzdCB3cml0ZSBhIGxv
Z2ljYWwg4oCcMOKAnSB0bwogICBiaXRzIDUsIDQsIDMsIGFuZCAyIG9mIHRoZSBTdGF0dXMgUmVn
aXN0ZXIKCktlZXAgaW4gbWluZCB0aGF0IGJpdCA1LCA0LCAzIGFuZCAyIGlzIGV4YWN0bHkgdGhl
CkFUTUVMX1NSX0dMT0JBTF9QUk9URUNUX01BU0suIFRoZSBTUFJMIGJpdCBpcyBoYW5kbGVkIGlu
IHRoZSB1bmxvY2soKQpmdW5jdGlvbi4gQWNjb3JpbmcgdG8gdGFibGUgOS4yIHlvdSBhbHNvIGhh
dmUgdG8gZmlyc3QgZGlzYWJsZSB0aGUgU1BSTApiaXQgYW5kIHRoZW4gd3JpdGUgdGhlIEJQIGJp
dHMgdG8gemVyby4KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
