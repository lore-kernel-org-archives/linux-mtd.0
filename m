Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB0BC4167D
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZNG2KTYldofBXSspRalcFtClsa4bRR7b/nPwp9/5ow=; b=vHWqC3DJovd9yE
	GXp8LKUvDToCWa8adMutsBTUAqJylS0JvSUmpb0/NzULskfiCm43TxTf4nqAVi1r9kcKVBFmh3Ipr
	RCAlN12Rz5snlyeDDU24cZdan3LWRThnGrHc2Ifjr4O/XRyt5z/QWWD0fJhh2Xqu5tWOKto59A0Jo
	3EaW2I2zBK62Br1gr05axWV3KWXjIBLhcD9H8/d82rn8DDF+uxu29m1DcXFddahQqARt+uUp3DnYX
	5scpVx+ME1DW6as1UpEizwDYw3WuvE2ohu7X+1AiQKQUMv1HAWft+mAHkRKBD+jCWoo5Yl6E2TB0u
	pH9agRuxXB5qntWwwoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj2u-00HU6Y-0n;
	Thu, 14 Dec 2023 10:34:24 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj2p-00HU2t-2m
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 10:34:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B26C3240008;
	Thu, 14 Dec 2023 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702550052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jugSzKA5RANlnPt+1c8lwCcp54ROkWZ7TeiH8CT7p/A=;
	b=brU8mEhL7FkhQ9ky50byWcLBDM0D5qpw0kEMSokgUJptsEhuGASnYkJylJIguGZ6nO/q5J
	FVbxguP1/E1tO9XDiuTLGfldOsfc1FU4ii0sRUurXO/55O7AXbGT89jWBc+J7WVxs2w79q
	2QtfsWgH7gzMiZPFWmwUC1JzHH/bLPKnS+4d0kNRG1yZgoJqPzgqgQwkO4FXsqlo4xa/yl
	jTYFvc/Sf9BuQTy8+ZkRNEvv0ynT3nNW18Y796+iQIBUbNCr+ZVPDtWI8HLD3zWC22fhb7
	Z6myHK497Hh5VFtbSEr1R1E7GtDYKK4nPwYj7nf4pyOjEAD3W0B+Pa8LBbu5WA==
Date: Thu, 14 Dec 2023 11:34:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Romain Gantois <romain.gantois@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Ard Biesheuvel <ardb@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina
 <herve.codina@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] Add GPT parser to MTD layer
Message-ID: <20231214113407.484e24a5@xps-13>
In-Reply-To: <cykfpuff32nuq3t27vd5tv463cx32phri473fjnrruvom5dk5u@uao5e3ml73ai>
References: <20231211151244.289349-1-romain.gantois@bootlin.com>
 <cykfpuff32nuq3t27vd5tv463cx32phri473fjnrruvom5dk5u@uao5e3ml73ai>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023420_179944_A66C9F58 
X-CRM114-Status: GOOD (  33.94  )
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

SGkgRGF2aWRsb2hyLAoKZGF2ZUBzdGdvbGFicy5uZXQgd3JvdGUgb24gTW9uLCAxMSBEZWMgMjAy
MyAxNjo0Mzo1OCAtMDgwMDoKCj4gT24gTW9uLCAxMSBEZWMgMjAyMywgUm9tYWluIEdhbnRvaXMg
d3JvdGU6Cj4gCj4gPkhlbGxvIGV2ZXJ5b25lLAo+ID4KPiA+TVREIGRldmljZXMgd2VyZSBoaXN0
b3JpY2FsbHkgcGFydGl0aW9uZWQgdXNpbmcgZml4ZWQgcGFydGl0aW9ucyBzY2hlbWVzCj4gPmRl
ZmluZWQgaW4gdGhlIGtlcm5lbCBkZXZpY2UgdHJlZSBvciBvbiB0aGUgY21kbGluZS4gTW9yZSBy
ZWNlbnRseSwgYSBidW5jaAo+ID5vZiBkeW5hbWljIHBhcnNlcnMgaGF2ZSBiZWVuIGludHJvZHVj
ZWQsIGFsbG93aW5nIHBhcnRpdGlvbmluZyBpbmZvcm1hdGlvbgo+ID50byBiZSBzdG9yZWQgaW4t
YmFuZC4gSG93ZXZlciwgdW5saWtlIGRpc2tzLCBwYXJzZXJzIGZvciBNVEQgZGV2aWNlcyBkbyBu
b3QKPiA+c3VwcG9ydCBydW50aW1lIGRpc2NvdmVyeSBvZiB0aGUgcGFydGl0aW9uIGZvcm1hdC4g
VGhpcyBmb3JtYXQgaXMgaW5zdGVhZAo+ID5uYW1lZCBpbiB0aGUgZGV2aWNlLXRyZWUgdXNpbmcg
YSBjb21wYXRpYmxlIHN0cmluZy4KPiA+Cj4gPlRoZSBHVUlEIFBhcnRpdGlvbiBUYWJsZSBpcyBv
bmUgb2YgdGhlIG1vc3QgY29tbW9uIHdheXMgb2YgcGFydGl0aW9uaW5nIGEKPiA+YmxvY2sgZGV2
aWNlLiBBcyBvZiBub3csIHRoZXJlIGlzIG5vIHN1cHBvcnQgaW4gdGhlIE1URCBsYXllciBmb3Ig
cGFyc2luZwo+ID5HUFQgdGFibGVzLiBJbmRlZWQsIHVzZSBjYXNlcyBmb3IgbGF5b3V0cyBsaWtl
IEdQVCBvbiByYXcgRmxhc2ggZGV2aWNlcyBhcmUKPiA+cmFyZSwgYW5kIGZvciBnb29kIHJlYXNv
biBzaW5jZSB0aGVzZSBwYXJ0aXRpb25pbmcgc2NoZW1lcyBhcmUgc2Vuc2l0aXZlIHRvCj4gPmJh
ZCBibG9ja3MgaW4gc3RyYXRlZ2ljIGxvY2F0aW9ucyBzdWNoIGFzIExCQSAyLiAgTW9yZW92ZXIs
IHRoZXkgZG8gbm90Cj4gPmFsbG93IHByb3BlciB3ZWFyLWxldmVsaW5nIHRvIGJlIHBlcmZvcm1l
ZCBvbiB0aGUgZnVsbCBzcGFuIG9mIHRoZSBkZXZpY2UuCj4gPgo+ID5Ib3dldmVyLCBhbGxvd2lu
ZyBHUFQgdG8gYmUgdXNlZCBvbiBNVEQgZGV2aWNlcyBjYW4gYmUgcHJhY3RpY2FsIGluIHNvbWUK
PiA+Y2FzZXMuIEluIHRoZSBjb250ZXh0IG9mIGFuIEEvQiBPVEEgdXBncmFkZSB0aGF0IGNhbiBh
Y3Qgb24gZWl0aGVyIE5PUiBvZgo+ID5lTU1DIGRldmljZXMsIGhhdmluZyB0aGUgc2FtZSBwYXJ0
aXRpb24gdGFibGUgZm9ybWF0IGZvciBib3RoIGtpbmRzIG9mCj4gPmRldmljZXMgY2FuIHNpbXBs
aWZ5IHRoZSB0YXNrIG9mIHRoZSB1cGRhdGUgc29mdHdhcmUuCj4gPgo+ID5UaGlzIHNlcmllcyBh
ZGRzIGEgZnVsbHkgd29ya2luZyBNVEQgR1BUIHBhcnNlciB0byB0aGUga2VybmVsLiBVc2Ugb2Yg
dGhlCj4gPnBhcnNlciBpcyByZXN0cmljdGVkIHRvIE5PUiBmbGFzaCBkZXZpY2VzLCBzaW5jZSBO
QU5EIGZsYXNoZXMgYXJlIHRvbwo+ID5zdXNjZXB0aWJsZSB0byBiYWQgYmxvY2tzLiBUbyBlbnN1
cmUgY29oZXJlbmNlIGFuZCBjb2RlLXJldXNlIGJldHdlZW4KPiA+c3Vic3lzdGVtcywgSSd2ZSBm
YWN0b3JlZCBkZXZpY2UtYWdub3N0aWMgY29kZSBmcm9tIHRoZSBibG9jayBsYXllciBHUFQKPiA+
cGFyc2VyIGFuZCBtb3ZlZCBpdCB0byBhIG5ldyBnZW5lcmljIGxpYnJhcnkgaW4gbGliL2dwdC5j
LiBObyBmdW5jdGlvbmFsCj4gPmNoYW5nZSBpcyBpbnRlbmRlZCBpbiB0aGUgYmxvY2sgbGF5ZXIg
cGFyc2VyLgo+ID4KPiA+SSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBjYW4gc2VlbSBsaWtlIGEgc3Ry
YW5nZSBmZWF0dXJlIGZvciBNVEQgZGV2aWNlcywgYnV0Cj4gPndpdGggdGhlIHJlc3RyaWN0aW9u
IHRvIE5PUiBkZXZpY2VzLCB0aGUgcGFydGl0aW9uIHRhYmxlIGNhbiBiZSBmYWlybHkKPiA+cmVs
aWFibGUuIE1vcmVvdmVyLCB0aGlzIGFkZGl0aW9uIGZpdHMgbmljZWx5IGludG8gdGhlIE1URCBw
YXJzZXIgbW9kZWwuCj4gPlBsZWFzZSB0ZWxsIG1lIHdoYXQgeW91IHRoaW5rLiAgCj4gCj4gSSBh
bSBub3QgYSBmYW4gb2YgdGhpcy4gVGhlIHVzZWNhc2Ugc2VlbXMgdmVyeSBoYWNreSBhbmQgYWQt
aG9jIHRvIGp1c3RpZnkKPiBkZWNvdXBsaW5nIGZyb20gdGhlIGJsb2NrIGxheWVyLAoKVGhlIHVz
ZSBjYXNlIGluZGVlZCBpcyBhIGJpdCBhZC1ob2MsIGFzIGl0IGlzIGFuIE9UQSB0b29sIHdoaWNo
IG1ha2VzCml0IHBhaW5mdWwgdG8gaGFuZGxlIHR3byBzZXBhcmF0ZSB0eXBlcyBvZiBwYXJ0aXRp
b25pbmcgYmV0d2VlbiBibG9ja3MKYW5kIG10ZCBkZXZpY2VzLCBzbyBiZWluZyBhYmxlIHRvIHBh
cnNlIGEgR1BUIG9uIGFuIG10ZCBkZXZpY2Ugd291bGQKaGVscCBhIGxvdC4KCj4gbm90IHRvIG1l
bnRpb24gbW92ZSBjb21wbGV4aXR5IG91dCBvZgo+IHVzZXJzcGFjZSBhbmQgaW50byB0aGUga2Vy
bmVsIChuZXcgcGFyc2VyKSBmb3Igc29tZXRoaW5nIHRoYXQgaXMgYWxyZWFkeQo+IGJlaW5nIGRv
bmUvd29ya2VkIGFyb3VuZC4KClRoaXMgaXMgdGhlIHBhcnQgSSBkb24ndCBmdWxseSBhZ3JlZSB3
aXRoLiBUaGVyZSBpcyBubyBhZGRlZApjb21wbGV4aXR5LCB0aGUgcGFyc2VyIGV4aXN0cyBhbmQg
aXMga2VwdCB1bnRvdWNoZWQgKGFwYXJ0IGZyb20gdGhlCmNvc21ldGljIGNoYW5nZXMpLiBGb3Ig
YSBsb25nIHRpbWUgbXRkIHBhcnRpdGlvbmluZyBpbmZvcm1hdGlvbiB3YXMKa2VwdCBvdXQgb2Yg
dGhlIHN0b3JhZ2UgKHRocm91Z2ggZml4ZWQtcGFydGl0aW9ucykgYnV0IGl0J3MgYmVlbiBxdWl0
ZQpzb21lIHRpbWUgc2luY2UgdGhlIG5lZWQgZm9yIG1vcmUgZmxleGlibGUgYXBwcm9hY2hlcyBh
cmlzZWQsIHNvIHdlIGRvCmhhdmUgImR5bmFtaWMiIHBhcnRpdGlvbiBwYXJzZXJzIGFscmVhZHkg
YW5kIHRoZSBvbmUgcHJvcG9zZWQgYnkgUm9tYWluCmxvb2tzIHZlcnkgc3RyYWlnaHRmb3J3YXJk
IGFuZCBpcyB0aHVzIG5vdCBhIHByb2JsZW0gdG8gbWUuIEl0CmJhc2ljYWxseSBqdXN0IGV4dGVu
ZHMgdGhlIGxpc3Qgb2YgcGFydGl0aW9uIHRhYmxlcyBtdGQgZGV2aWNlcyBrbm93CmFib3V0IHdp
dGggYSB2ZXJ5IGNvbW1vbiBhbmQgcG9wdWxhciBmb3JtYXQuCgpUbyBiZSBob25lc3QgSSBkbyBu
b3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIG9uIHdoZXRoZXIgdGhpcyBzaG91bGQgYmUKbWVyZ2Vk
IG9yIG5vdCBidXQgbXkgcmVsdWN0YW5jZSBpcyBtb3JlIGFib3V0IHRoZSBtaXggb2Ygc3R5bGVz
IGJldHdlZW4KJ2Jsb2NrJyBhbmQgJ210ZCcuIFBlb3BsZSBzaGFsbCBub3QgdHJlYXQgdGhlbSBz
aW1pbGFybHkgZm9yIGEgbnVtYmVyCm9mIHJlYXNvbnMsIGFuZCB0aGlzIHBhcnNlciBpcyBhbiBv
YnZpb3VzIHN0ZXAgdG93YXJkcyBhIG1vcmUgY29tbW9uCmhhbmRsaW5nLCBrbm93aW5nIHRoYXQg
aXQncyBiZWVuIGV4Y2x1c2l2ZWx5IHVzZWQgb24gYmxvY2tzIGZvcgpkZWNhZGVzLgoKPiBBbHNv
LCB3aGF0IG90aGVyIHVzZXIgd291bGQgY29uc3VtZSB0aGlzIG5ldyBncHQKPiBsaWIgYWJzdHJh
Y3Rpb24gaW4gdGhlIGZ1dHVyZT8gSSBkb24ndCB0aGluayBpdCBpcyB3b3J0aCBpdC4KCldlbGws
IGFnYWluIEkgZG9uJ3QgZmVlbCBsaWtlIHRoaXMgaXMgYSBwcm9ibGVtLCBzaGFyaW5nIGNvZGUg
YmV0d2Vlbgp0d28gcGFydGllcyBpcyBhbHJlYWR5IGEgd2luIGFuZCB0aGUgY2hvaWNlIGZvciBh
IGxpYiBzb3VuZHMgcmF0aW9uYWwKdG8gbWUuIFRoZSBxdWVzdGlvbiBiZWluZywgc2hhbGwgd2Ug
ZG8gaXQvZG8gd2Ugd2FudCB0byBkbyBpdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
