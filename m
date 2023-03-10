Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A496CC64EC4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOrDD6HXG/ZqxqWTGdK+9y1fHBAOJSU5hfXnygna0vY=; b=q42HohCJ0sVjBe
	fIvsm8aZNON2WenTn6il1kuta7JZ5wA5rsvlG3951ou0bz4iKXjMMdyObhA+L7n5lIzWqYKMqK4O4
	TmqIuoX4+2Ale3QR9qme5Qr7DG4vMFV+RQYNtLyJtZcan3S4EFuchTaRxOZRKrZXwgCMxhJxoem5e
	ACerJznvMoC2NPzphjmjc7NDnrniHb0vn3LJRLALLdAV+c4asjIDH+9Xd/naOUq0GQ88FQ1Jn/K2M
	KDv2LBajKFIsBxH5E5XTszwDDkmrsmddEftuiFig0p8GzHD8zZnmKDW3pEUEsJBVonPt3qEnZVaAF
	dmbCdsvVaxVmi9wfoIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pad75-00EeO6-6J; Fri, 10 Mar 2023 13:48:51 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pad71-00EeNM-6P
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 13:48:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EB859240009;
	Fri, 10 Mar 2023 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678456122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HB/pbQhDhg7B7QwfyKv1SCZm0Tn/atunyx/ifJpw/FI=;
	b=l8BtWiMIBPishNyfN2XkcAhzEoCELEatIGy3uNHLtZrfy80CSHAAHG8trCJB6CXSVnq/8l
	5yaOpLOpO2JnaSxDlvbDSw+l9CUt9C9dVmPdyPJvrg07SbG+1R5y44QboMKl+BOxFI7nOL
	PhatGwcOAZp87VxkE0vYKejqyYw5g5/w+Di3HbSqMpVC0iEXl1MRBLD3q7GIme8ZovIG68
	/v3tLpH687kv1DwHgUpeJGzwfz81mXbmdhw0NyGhFa8RwxQFSZjmY+3uxGS+UOllTC+UH9
	LQSuzfi6dXx1veLw+J5Mof8aYRWWng9f4secjTO6DJC+ztegJdDWZ7j6S9pqRQ==
Date: Fri, 10 Mar 2023 14:48:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michael Walle <michael@walle.cc>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: nvmem: allow MTD to be explicitly an NVMEM
 provider
Message-ID: <20230310144840.5203fe50@xps-13>
In-Reply-To: <20230310105330.14181-1-zajec5@gmail.com>
References: <20230310105330.14181-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_054847_565640_9F6E159E 
X-CRM114-Status: GOOD (  21.43  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDEwIE1hciAyMDIzIDEx
OjUzOjMwICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVGhlcmUgYXJlIGEgbG90IG9mIGRldmljZXMgd2l0aCBOVk1FTSBjb250ZW50IHN0b3Jl
ZCBpbiBNVEQgZGV2aWNlcyBpbgo+IHJlbGV2YW50IHBhcnRpdGlvbnMuIEFkZCBhIERUIGJpbmRp
bmcgZm9yIG1hcmtpbmcgc3VjaCBwYXJ0aXRpb25zLgo+IAo+IE5vdGU6IExpbnV4IGFscmVhZHkg
dHJlYXRzIGV2ZXJ5IE1URCBwYXJ0aXRpb24gYXMgTlZNRU0gcHJvdmlkZXIgc28gaW4KPiBnZW5l
cmFsIGl0IGRvZXNuJ3QgbmVlZCB0byBjYXJlIGFib3V0IHRoaXMgYmluZGluZy4gSXQncyBtZWFu
dCBqdXN0IHRvCj4gbWFrZSBEVCBjbGVhcmVyIGluIGRlc2NyaWJpbmcgaGFyZHdhcmUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+
IEFzIGV4cGxhaW5lZCBpbiBjb21taXQgYm9keSB0aGlzIGlzbid0IHJlYWxseSBuZWVkZWQgZm9y
IExpbnV4LiBJCj4gdGhvdWdodCBpdCdkIGJlIGEgc21hbGwgbmljZSBhZGRpdGlvbiBmb3Igd3Jp
dGluZyBjbGVhciBEVFMgZmlsZXMuCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252
bWVtL210ZC55YW1sICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDUyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9tdGQueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbXRkLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbXRkLnlhbWwKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzQzNWIyODAzY2Y5Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9tdGQueWFt
bAo+IEBAIC0wLDAgKzEsNTIgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9udm1lbS9tdGQueWFtbCMKPiArJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTog
TVREIGFjY2VzcyBiYXNlZCBOVk1FTQo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBNVEQgcGFy
dGl0aW9ucyBjYW4gYmUgTlZNRU0gcHJvdmlkZXJzLiBUaGlzIGJpbmRpbmcgYWxsb3dzIGV4cGxp
Y2l0bHkgbWFya2luZwo+ICsgIHN1Y2ggcGFydGl0aW9ucy4KCldlIGFscmVhZHkgaGF2ZSB0aGF0
LCBpdCdzIG52bWVtLWNlbGw/IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSB3YW50IHRvCmRvLCBidXQg
SSB0aGluayBpdCBzdWZmZXJzIGZyb20gYSBjb21tb24gcHJvYmxlbSwgc2VlIGJlbG93LgoKPiAr
ICBUaGUgZXhhY3Qgd2F5IG9mIGhhbmRsaW5nIE1URCBwYXJ0aXRpb24gY29udGVudCAoTlZNRU0g
Y2VsbHMpIHNob3VsZCBiZQo+ICsgIGRlc2NyaWJlZCB1c2luZyBhIHByb3BlciBOVk1FTSBsYXlv
dXQuCgpPayBzbyBJIGJlbGlldmUgdGhpcyBpcyBhbm90aGVyIHNvbHV0aW9uIGZvciB0aGUgbGF5
b3V0IG9mZnNldCBwcm9wb3NlZApieSBNaWNoYWVsLiBFeGNlcHQgdGhhdCBpdCBvbmx5IGZpeGVz
IGl0IGZvciBtdGQuIEkgdGhpbmsgSSB3b3VsZApwcmVmZXIgdGhlIGZvcm1lciBzb2x1dGlvbiB3
aGljaCBoYW5kbGVzIGFsbCBudm1lbSBjYXNlcy4KCj4gKwo+ICttYWludGFpbmVyczoKPiArICAt
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiArCj4gK2FsbE9mOgo+ICsgIC0g
JHJlZjogbnZtZW0ueWFtbCMKPiArICAtICRyZWY6IC9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL3Bh
cnRpdGlvbi55YW1sIwo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAg
Y29uc3Q6IG10ZC1udm1lbQo+ICsKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiAr
cmVxdWlyZWQ6Cj4gKyAgLSByZWcKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UK
PiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgcGFydGl0aW9ucyB7Cj4gKyAgICAgICAg
Y29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiArICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiArCj4gKyAgICAgICAgcGFy
dGl0aW9uQDAgewo+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm10ZC1udm1lbSI7CgpBY3R1
YWxseSB0aGVyZSBoYXMgYmVlbiB2YWxpZCBwdXNoLWJhY2sgZnJvbSBkZXZsaW5rIGd1cnVzIGFn
YWluc3Qgc3RhbGUKY29tcGF0aWJsZXMgKG9uIGEgZGV2aWNlLWRyaXZlciBwb2ludCBvZiB2aWV3
KSBsaWtlIHRoYXQuIE1heWJlCnNvbWV0aGluZyBsaWtlIHRoaXMgaW5zdGVhZDoKCglwYXJ0aXRp
b25AeHsKCQk8bXRkLW52bWVtLXByb3BlcnR5PgoKPwoKPiArICAgICAgICAgICAgcmVnID0gPDB4
MCAweDQwMDAwPjsKPiArICAgICAgICAgICAgbGFiZWwgPSAiZGV2aWNlLWRhdGEiOwo+ICsKPiAr
ICAgICAgICAgICAgbnZtZW0tbGF5b3V0IHsKPiArICAgICAgICAgICAgICAgIC8qIEp1c3QgYSBk
dW1teSBleGFtcGxlOiBLb250cm9uIGNhbiBiZSBmb3VuZCBvbiBPVFAgYWN0dWFsbHkgKi8KPiAr
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAia29udHJvbixzbDI4LXZwZCI7CgpUaGUgT25p
ZSB0bHYgY29tcGF0aWJsZSB3b3VsZCBwZXJmZWN0bHkgYXBwbHkgaGVyZS4KCj4gKyAgICAgICAg
ICAgIH07Cj4gKyAgICAgICAgfTsKPiArICAgIH07CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
