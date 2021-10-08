Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71387C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 09:57:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD1160EE3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 09:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FD1160EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5H6NCnpEtR+92UPcDwHma/me6Z0lhwglt9Vl8v7OeGM=; b=B/tPWfiejCE7Kr
	HBch+4NBv2lfZaHIllBn85T6V+nkryYbru9HXDARKxaw2ZqcscOL8CcBUhKAjORAPlP5QCAqg9xeO
	cen4TMz2ncXLaD1d00z0fCUoPCzHn9oi8wbwlmks+UTjD8xoz+th8Apsx+Du1Bn6Fz0Vi1mlZAcDP
	OhTFhQhPP1r4m/lF35q2GeVZq9BcZFtDWQm5TVFAGF8fjjn6Eq6EpF1WBaJ63pIUrQQO9zpUz8jz1
	KzsLPjEcBDoE82e78qY8/rE5vUitIxtq2vBQp+RxuQRnM4xDTvk0GGrShG8/I95i9wsXQznV5TgoP
	U3ZkdFMOCFtkoi/YjzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYmcB-002ILJ-1Q; Fri, 08 Oct 2021 09:56:31 +0000
Received: from mailout08.rmx.de ([94.199.90.85])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYmc7-002IGP-3C
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 09:56:30 +0000
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout08.rmx.de (Postfix) with ESMTPS id 4HQk981wxMzMqyQ;
 Fri,  8 Oct 2021 11:56:12 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin01.retarus.com (Postfix) with ESMTPS id 4HQk8s5hrXz2xlQ;
 Fri,  8 Oct 2021 11:55:57 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.55.107) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 8 Oct
 2021 11:55:57 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
CC: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 <linux-mtd@lists.infradead.org>, Greg Ungerer <gerg@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Stefan Riedmueller <s.riedmueller@phytec.de>,
 Christian Hemp <c.hemp@phytec.de>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Fri, 8 Oct 2021 11:55:56 +0200
Message-ID: <2091909.Mh6RI2rZIc@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211004160620.3guajv5vvtfjrl7c@umbrella>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211004173351.36a66ccb@xps13> <20211004160620.3guajv5vvtfjrl7c@umbrella>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.107]
X-RMX-ID: 20211008-115557-QCyTLBSxTQYd-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_025627_366776_8D952AFD 
X-CRM114-Status: GOOD (  19.51  )
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

KyBzZXQgUEhZVEVDIGRldmVsb3BlcnMgb24gKEIpQ0MKCk9uIE1vbmRheSwgNCBPY3RvYmVyIDIw
MjEsIDE4OjA2OjIwIENFU1QsIEhhbiBYdSB3cm90ZToKPiAKPiBDb3VsZCB5b3UgcGxlYXNlIHRy
eSB0byBhZGQgY2xvY2sgZGlzL2VuYWJsZSB3aGVuIHNldHRpbmcgY2xvY2sgcmF0ZSwgaW4gY2Fz
ZQo+IGNsb2NrIGdsaXRjaGVzLgo+IAo+IGNsa19kaXNhYmxlX3VucHJlcGFyZShyLT5jbG9ja1sw
XSk7Cj4gY2xrX3NldF9yYXRlKHItPmNsb2NrWzBdLCBody0+Y2xrX3JhdGUpOwo+IGNsa19wcmVw
YXJlX2VuYWJsZShyLT5jbG9ja1swXSk7Cj4gCgpXaXRoIHRoaXMgY2hhbmdlLCB3ZSBtYWRlIG92
ZXIgMjAwMCBzdWNjZXNzZnVsIHJlYm9vdHMgd2l0aG91dCBhbnkgR1BNSSBETUEKdGltZW91dCBw
cm9ibGVtcyEKCkZyb20gUEhZVEVDIChvdXIgQlNQIHN1cHBsaWVyKSwgSSBnb3Qgc29tZSBwb3Nz
aWJsZSBiYWNrZ3JvdW5kIGZvciB0aGlzCnByb2JsZW0uIEZvciBvbGRlciByZXZpc2lvbnMgb2Yg
SU1YNkRRIHRoZXJlIHdhcyBhbiBlcnJhdGEgKEVSUjAwNzExNywgWzFdKQppbiB0aGUgUk9NIGJv
b3Rsb2FkZXIgd2hpY2ggdHJpZ2dlcnMgYSBzaW1pbGFyIC8gdGhlIHNhbWUgYmVoYXZpb3I6Cgo+
IEZvciByYXcgTkFORCBib290LCBST00gc3dpdGNoZXMgdGhlIHNvdXJjZSBvZiBlbmZjX2Nsa19y
b290IGZyb20gUExMMl9QRkQyCj4gdG8gUExMMy4gVGhlIHJvb3QgY2xvY2sgaXMgcmVxdWlyZWQg
dG8gYmUgZ2F0ZWQgYmVmb3JlIHN3aXRjaGluZyB0aGUgc291cmNlCj4gY2xvY2suIElmIHRoZSBy
b290IGNsb2NrIGlzIG5vdCBnYXRlZCwgY2xvY2sgZ2xpdGNoZXMgbWlnaHQgYmUgcGFzc2VkIHRv
Cj4gdGhlIGRpdmlkZXIgdGhhdCBmb2xsb3dzIHRoZSBjbG9jayBtdXgsIGFuZCB0aGUgZGl2aWRl
ciBtaWdodCBiZWhhdmUKPiB1bnByZWRpY3RhYmx5Lgo+IC4uLgo+IFRoaXMgcHJvYmxlbSBjYW4g
YWxzbyBvY2N1ciBlbHNld2hlcmUgaW4gYXBwbGljYXRpb24gY29kZSBpZiB0aGUgcm9vdCBjbG9j
awo+IGlzIG5vdCBwcm9wZXJseSBnYXRlZCB3aGVuIHRoZSBjbG9jayBjb25maWd1cmF0aW9uIGlz
IGNoYW5nZWQuCgpJbiBteSBjYXNlIChMaW51eCBib290IG9uIGkuTVg2VUxMKSwgSSByZWNvZ25p
emVkIHRoYXQgb24gdGhlIDNyZCBjYWxsIG9mCmdwbWlfbmZjX2FwcGx5X3RpbWluZ3MoKSwgdGhl
IHJhdGUgb2Ygci0+Y2xvY2tbMF0gaXMgY2hhbmdlZCAKCi0gZnJvbTogMjIgTUh6IChDUzJDRFI6
OkVORkNfQ0xLX1BSRUQ9NiBhbmQgQ1MyQ0RSOjpFTkZDX0NMS19QT0RGPTMpCi0gdG86ICAxMDAg
TUh6IChDUzJDRFI6OkVORkNfQ0xLX1BSRUQ9NCBhbmQgQ1MyQ0RSOjpFTkZDX0NMS19QT0RGPTEp
CgpUaGUgcHJvcG9zYWwgZnJvbSBmcm9tIEhhbiBYdQo+IGNsa19kaXNhYmxlX3VucHJlcGFyZShy
LT5jbG9ja1swXSk7Cj4gY2xrX3NldF9yYXRlKHItPmNsb2NrWzBdLCBody0+Y2xrX3JhdGUpOwo+
IGNsa19wcmVwYXJlX2VuYWJsZShyLT5jbG9ja1swXSk7CmRpc2FibGVzIG9ubHkgQ0NHUjQ6OkNH
MTQgW1JBV05BTkRfVV9HUE1JX0JDSF9JTlBVVF9HUE1JX0lPX0NMS19FTkFCTEVdIGR1cmluZwp0
aGUgcmF0ZSBjaGFuZ2UuIFdoaWxlIHRoaXMgd29ya3MgdmVyeSBmaW5lIG9uIG15IHN5c3RlbSwg
dGhpcyBwcm9iYWJseSBkb2Vzbid0CmZ1bGZpbGwgdGhlIHJlcXVpcmVtZW50cyBpbiB0aGUgZXJy
YXRhIGRlc2NyaXB0aW9uOgoKPiBGb3Igb3RoZXIgb2NjdXJyZW5jZXMgaW4gYXBwbGljYXRpb24g
Y29kZSwgdGhlIGZvbGxvd2luZyBwcm9jZWR1cmUgc2hvdWxkIGJlCj4gZm9sbG93ZWQgdG8gY2hh
bmdlIHRoZSBjbG9jayBjb25maWd1cmF0aW9uIGZvciB0aGUgZW5mY19jbGtfcm9vdDoKPiAxKSBH
YXRlIChkaXNhYmxlKSB0aGUgR1BNSS9CQ0ggY2xvY2tzIGluIHJlZ2lzdGVyIENDTV9DQ0dSNC4K
PiAyKSBHYXRlIChkaXNhYmxlKSB0aGUgZW5mY19jbGtfcm9vdCBiZWZvcmUgY2hhbmdpbmcgdGhl
IGVuZmNfY2xrX3Jvb3Qgc291cmNlCj4gICAgb3IgZGl2aWRlcnMgYnkgY2xlYXJpbmcgQ0NNX0ND
R1IyW0NHN10gdG8gMuKAmWIwMC4gVGhpcyBkaXNhYmxlcyB0aGUKPiAgICBpb211eF9pcHRfY2xr
X2lvX2Nsay4KPiAzKSBDb25maWd1cmUgQ0NNX0NTMkNEUiBmb3IgdGhlIG5ldyBjbG9jayBzb3Vy
Y2UgY29uZmlndXJhdGlvbi4KPiA0KSBFbmFibGUgZW5mY19jbGtfcm9vdCBieSBzZXR0aW5nIEND
TV9DQ0dSMltDRzddIHRvIDLigJliMTEuIFRoaXMgZW5hYmxlcyB0aGUKPiAgICBpb211eF9pcHRf
Y2xrX2lvX2Nsay4KPiA1KSBFbmFibGUgdGhlIEdQTUkvQkNIIGNsb2NrcyBpbiByZWdpc3RlciBD
Q01fQ0NHUjQKCkkgZ290IGFub3RoZXIgc29sdXRpb24gZnJvbSBQSFlURUMgKFsyXSwgbm90IGxl
bmd0aHkgdGVzdGVkIHlldCksIHdoaWNoCmRpc2FibGVzIGFsbCBHUE1JL0JDSCBjbG9ja3Mgb24g
Q0NHUjQgKHZlcmlmaWVkIHdpdGggYSBKVEFHIGRlYnVnZ2VyKToKLSBDQ0dSNDo6Q0cxNSAgW1JB
V05BTkRfVV9HUE1JX0lOUFVUX0FQQl9DTEtfRU5BQkxFXQotIENDR1I0OjpDRzE0ICBbUkFXTkFO
RF9VX0dQTUlfQkNIX0lOUFVUX0dQTUlfSU9fQ0xLX0VOQUJMRV0KLSBDQ0dSNDo6Q0cxMyAgW1JB
V05BTkRfVV9HUE1JX0JDSF9JTlBVVF9CQ0hfQ0xLX0VOQUJMRV0KLSBDQ0dSNDo6Q0cxMiAgW1JB
V05BTkRfVV9CQ0hfSU5QVVRfQVBCX0NMS19FTkFCTEVdCi0gQ0NHUjQ6OkNHNiAgIFtQTDMwMV9N
WDZRUEVSMV9CQ0hDTEtfRU5BQkxFXQoKQ0NNX0NDR1IyW0NHN10gaXMgdXNlZCBmb3IgSU9NVVhf
SVBUX0NMS19JT19FTkFCTEUgb24gaS5NWDZVTEwsIHNvIHN0ZXAgMi4Kc2VlbXMgbm90IHRvIGFw
cGx5IGhlcmUuIEFjdHVhbGx5IEkgZG9uJ3Qga25vdyBob3cgdG8gZ2F0ZSBFTkZDX0NMS19ST09U
LgoKSSB3aWxsIGN5Y2xpYyB0ZXN0IHRoZSBzb2x1dGlvbiBmcm9tIFBIWVRFQyBvdmVyIHRoZSB3
ZWVrZW5kLgoKQEhhbiBYdTogU2hvdWxkIEkgcHJlZmVyIHRoZSBzb2x1dGlvbiBmcm9tIFBIWVRF
Qz8KQFN0ZWZhbiBSaWVkbXVlbGxlcjogQXJlIHlvdSB3aWxsaW5nIHRvIGNvbW1pdCB0aGlzIHVw
c3RyZWFtPwoKcmVnYXJkcwpDaHJpc3RpYW4KCgpbMV0gaHR0cHM6Ly93d3cubnhwLmNvbS9kb2Nz
L2VuL2VycmF0YS9JTVg2RFFDRS5wZGYKWzJdIGh0dHBzOi8vZ2l0LnBoeXRlYy5kZS9saW51eC1t
YWlubGluZS9jb21taXQvP2g9djUuMTAuNDgtcGh5JmlkPTg2NjkzOWVhODExMDc2NGQ5YzEyYWY5
NjBkNzQ2ZTJmN2Y1ZGViZTMKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
