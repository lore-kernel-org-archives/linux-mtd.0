Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413EFC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:57:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C2464E85
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C2464E85
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7plmYUr6f5EOW+CF22e8ESYQK2JdXwT4mUdhJKCEKGU=; b=MG9vSG94MdWoqsMsvGhAmI8mb
	1NLUKz3CObfw4wKYnmZoZrRi7jORVtPlh1lpfvf8ikTRSEgAH5CLphsVAMrgBJcptdtHoILzCfIMo
	k+46O/kzldWCyCRgCSyRZK4E3tDaPw6RzQgzsa+W6lUaDzTDJ16TYQrKp6kA+VnSpdzfnyS03mhkY
	n2YCBpcib30Y9ziSZ1HaWgD4q8AbbSgcdfFmTP7lS738hbs6nxba8ejT3DEnR563nnJ+8/daC08Ic
	+5bunyxh9+eMhG/QfMuQ0Sq5uF1TEn6IGRgFXm9OGxgAeStPRwx7XcMqApkUJ9RkhpYMlSDkZCVzg
	m2vxghf8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEbv4-0003Qe-In; Tue, 23 Feb 2021 17:56:22 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEbuz-0003On-As
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 17:56:20 +0000
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 66CD2240006;
 Tue, 23 Feb 2021 17:56:12 +0000 (UTC)
Date: Tue, 23 Feb 2021 18:56:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210223185610.7f495406@xps13>
In-Reply-To: <20210223174546.GA27945@work>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
 <20210223174922.052f9776@xps13> <20210223174546.GA27945@work>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_125617_491334_2FCD3CE7 
X-CRM114-Status: GOOD (  31.04  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFR1ZSwKMjMgRmViIDIwMjEgMjM6MTU6NDYgKzA1MzA6
Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBUdWUsIEZlYiAyMywgMjAyMSBhdCAwNTo0OToyMlBNICsw
MTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgTWFuaXZhbm5hbiwKPiA+IAo+ID4gTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3Jv
dGUgb24gTW9uLAo+ID4gMjIgRmViIDIwMjEgMTc6MzI6NTggKzA1MzA6Cj4gPiAgIAo+ID4gPiBP
biBhIHR5cGljYWwgZW5kIHByb2R1Y3QsIGEgdmVuZG9yIG1heSBjaG9vc2UgdG8gc2VjdXJlIHNv
bWUgcmVnaW9ucyBpbgo+ID4gPiB0aGUgTkFORCBtZW1vcnkgd2hpY2ggYXJlIHN1cHBvc2VkIHRv
IHN0YXkgaW50YWN0IGJldHdlZW4gRlcgdXBncmFkZXMuCj4gPiA+IFRoZSBhY2Nlc3MgdG8gdGhv
c2UgcmVnaW9ucyB3aWxsIGJlIGJsb2NrZWQgYnkgYSBzZWN1cmUgZWxlbWVudCBsaWtlCj4gPiA+
IFRydXN0em9uZS4gU28gdGhlIG5vcm1hbCB3b3JsZCBzb2Z0d2FyZSBsaWtlIExpbnV4IGtlcm5l
bCBzaG91bGQgbm90Cj4gPiA+IHRvdWNoIHRoZXNlIHJlZ2lvbnMgKGluY2x1ZGluZyByZWFkaW5n
KS4KPiA+ID4gCj4gPiA+IFNvIGxldCdzIGFkZCBhIHByb3BlcnR5IGZvciBkZWNsYXJpbmcgc3Vj
aCBzZWN1cmUgcmVnaW9ucyBzbyB0aGF0IHRoZQo+ID4gPiBkcml2ZXIgY2FuIHNraXAgdG91Y2hp
bmcgdGhlbS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZh
bSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwgfCA3ICsr
KysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20s
bmFuZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxu
YW5kYy55YW1sCj4gPiA+IGluZGV4IDg0YWQ3ZmYzMDEyMS4uNzUwMGUyMGRhOWMxIDEwMDY0NAo+
ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFu
ZGMueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3Fjb20sbmFuZGMueWFtbAo+ID4gPiBAQCAtNDgsNiArNDgsMTMgQEAgcGF0dGVyblByb3BlcnRp
ZXM6Cj4gPiA+ICAgICAgICAgIGVudW06Cj4gPiA+ICAgICAgICAgICAgLSA1MTIKPiA+ID4gIAo+
ID4gPiArICAgICAgcWNvbSxzZWN1cmUtcmVnaW9uczoKPiA+ID4gKyAgICAgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5Cj4gPiA+ICsgICAgICAg
IGRlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgICAgIFJlZ2lvbnMgaW4gdGhlIE5BTkQgbWVtb3J5
IHdoaWNoIGFyZSBwcm90ZWN0ZWQgdXNpbmcgYSBzZWN1cmUgZWxlbWVudAo+ID4gPiArICAgICAg
ICAgIGxpa2UgVHJ1c3R6b25lLiBUaGlzIHByb3BlcnR5IGNvbnRhaW5zIHRoZSBzdGFydCBhZGRy
ZXNzIGFuZCBzaXplIG9mCj4gPiA+ICsgICAgICAgICAgdGhlIHNlY3VyZSByZWdpb25zIHByZXNl
bnQgKG9wdGlvbmFsKS4gIAo+ID4gCj4gPiBXaGF0IGRvZXMgdGhpcyAiKG9wdGlvbmFsKSIgbWVh
bnM/IElmIHlvdSBtZWFuIHRoZSBwcm9wZXJ0eSBpcyBvcHRpb25hbAo+ID4gdGhlbiBpdCBzaG91
bGQgYmUgZGVzY3JpYmVkIGFjY29yZGluZ2x5IGluIHRoZSB5YW1sIGZpbGUsIG9yIGFtIEkKPiA+
IG1pc3Npbmcgc29tZXRoaW5nPwo+ID4gICAKPiAKPiBJSVVDLCBpZiBhIHByb3BlcnR5IGlzIG5v
dCBsaXN0ZWQgdW5kZXIgInJlcXVpcmVkIiBzZWN0aW9uIHRoZW4gaXQgaXMKPiBvcHRpb25hbC4g
QnV0IEkndmUgYWRkZWQgdGhlIHF1b3RlIGhlcmUgdG8ganVzdCBtYWtlIGl0IGV4cGxpY2l0LgoK
QWJzb2x1dGVseSwgSSB3YXMganVzdCB3b25kZXJpbmcgd2h5IHlvdSBtZW50aW9uZWQgaXQgaGVy
ZS4gSSBkb24ndAp0aGluayBpdCdzIHVzZWZ1bCwgeW91IGNhbiBkcm9wIGl0LgoKPiAKPiA+IEkg
d29uZGVyIGlmIGl0IHdvdWxkbid0IGJlIGJldHRlciB0byBtYWtlIHRoaXMgYSBOQU5EIGNoaXAg
bm9kZQo+ID4gcHJvcGVydHkuIEkgZG9uJ3QgdGhpbmsgYSBxY29tIHByZWZpeCBpcyBuZWVkZWQg
YXMgcG90ZW50aWFsbHkgbWFueQo+ID4gb3RoZXIgU29DcyBtaWdodCBoYXZlIHRoZSBzYW1lICJm
ZWF0dXJlIi4KPiA+IAo+ID4gSSdtIGZpbmUgYWRkaW5nIHN1cHBvcnQgZm9yIGl0IGluIHRoZSBx
Y29tIGRyaXZlciBvbmx5IHRob3VnaC4KPiA+ICAgCj4gCj4gSG1tLCBzb3VuZHMgZ29vZCB0byBt
ZS4KPiAKPiBUaGFua3MsCj4gTWFuaQo+IAo+ID4gPiArCj4gPiA+ICBhbGxPZjoKPiA+ID4gICAg
LSAkcmVmOiAibmFuZC1jb250cm9sbGVyLnlhbWwjIgo+ID4gPiAgICAKPiA+IAo+ID4gVGhhbmtz
LAo+ID4gTWlxdcOobCAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
