Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990C0CF3185
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qlO8B30i43M3Je0uPQX4P8IgqTn3Hvx4kKRIvvPIXE=; b=SCc1yqoSoKNFWW
	C9M7Ly1mZXW1vh8NdZFEnZmL5qgxJ7lsle+ahVQu0i/62ujRzKTmw78ZcPUv2tbGDLRcTzaxKIQdd
	PtSU2droLhnBXxMdFpq6NlHPYmyPYjZ80wkVyOuvY3UMEW+3V+pTweLf9MfOJNXSR4ZH4rPWl2U8R
	+7c6mKvny9IUJuROEvq1bjS2219VLIA4ESkPRYyREVvNuZqX6HV4rkf2XBWu64kWK5+eugGwooa6e
	p2CNnNVH3d7b4DQnHP20beMTDWE40+Yi9IxqpFaRe44lJ0Ag+cDM8Ge0Vq0BFTll+crAg3h+X8NZN
	771hGsFrEN/mG7dGEgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLegI-00000002t6o-397x;
	Wed, 19 Nov 2025 09:40:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLegE-00000002t6M-3tBr
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 09:40:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9BA1FC11186;
	Wed, 19 Nov 2025 09:40:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C791960720;
	Wed, 19 Nov 2025 09:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBB4610371A18;
	Wed, 19 Nov 2025 10:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763545247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YNfgpMCjX3EWPNrJzZiFqR8Dz+zI867xnpEghzkIq5w=;
	b=TrvcdYfXtwknUIvU/1kqKB+3XMQlBX/Rg45Uoe/MYTKTa5mtTTwCkID0SC60bDxwtmL5qC
	aWn9VVRV0J9ysa2ztYe9FK89PHhFbXtRr4AMIM/FjzcMZhVWF9R+ihskpypxaWBIvv+drC
	YX5TxUSkR/ul+q+hgfK6UauZItNFwJZvtTlI1fMI5lQhypfYDYItAzF5kDZSyRnV05V2l8
	c9Hsz2rlqaMyudndrcK1ooCoafh8Qpvmg4bKz5Zqt0NXcdoDvlTr2oXVtJxYz1KgE/VlY7
	PSyFVQiZbNNsPOfw8aTO7vv27jRFlE9z7jFjuaxF40CyhgWXbRH/K6csVanwTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 16/19] mtd: spi-nor: Add steps for testing locking support
In-Reply-To: <DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 13:24:02 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com>
	<DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:40:42 +0100
Message-ID: <87tsyqcqcl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_014051_268233_C2E489CC 
X-CRM114-Status: GOOD (  25.19  )
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

T24gMTgvMTEvMjAyNSBhdCAxMzoyNDowMiArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmkgTm92IDE0LCAyMDI1IGF0IDY6NTMgUE0gQ0VULCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBBcyByZWNlbnRseSByYWlzZWQgb24gdGhlIG1haWxpbmcg
bGlzdCwgaXQgbWF5IGJlIHVzZWZ1bCB0byBwcm9wb3NlIGEKPj4gbGlzdCBvZiBzdGVwcyB0byBn
byB0aHJvdWdoIGluIG9yZGVyIHRvIHByb292ZSB0aGUgZGV2aWNlcyBoYXZlIGJlZW4KPj4gZGVz
Y3JpYmVkIGNvcnJlY3RseSwgZXNwZWNpYWxseSBzaW5jZSBhbGwgdGhlIGJsb2NrIHByb3RlY3Rp
b24KPj4gaW5mb3JtYXRpb24gaXMgbm90IHN0b3JlZCBpbiBhbnkga2luZCBvZiB0YWJsZSBhbmQg
aXMgaW5zdGVhZCBmaWxsZWQKPj4gbWFudWFsbHkgYnkgZGV2ZWxvcHBlcnMuCj4+Cj4+IFVzZSB0
aGUgZGVidWdmcyBvdXRwdXQgdG8gZWFzZSB0aGUgY29tcGFyaXNvbiBiZXR3ZWVuIGV4cGVjdGF0
aW9ucyBhbmQKPj4gcmVhbGl0eS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2RyaXZl
ci1hcGkvbXRkL3NwaS1ub3IucnN0IHwgMTE4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL210ZC9zcGktbm9yLnJzdCBiL0RvY3VtZW50YXRp
b24vZHJpdmVyLWFwaS9tdGQvc3BpLW5vci5yc3QKPj4gaW5kZXggMTQ4ZmE0Mjg4NzYwYjZiYTQ3
ZDUzMGVkNzJjNWVmODEzOTdkNTk4Zi4uZDU2ZmY1YzQyYTk4YWYyM2E2NTA5N2M5Yjc3Y2QyMGVm
MjUwNGE0OSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL210ZC9zcGkt
bm9yLnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0
Cj4+IEBAIC0yMDMsMyArMjAzLDEyMSBAQCBzZWN0aW9uLCBhZnRlciB0aGUgYGAtLS1gYCBtYXJr
ZXIuCj4+ICAgICAgbXRkLndyaXRlc2l6ZSA9IDEKPj4gICAgICBtdGQub29ic2l6ZSA9IDAKPj4g
ICAgICByZWdpb25zID0gMAo+PiArCj4+ICs1KSBJZiB5b3VyIGZsYXNoIHN1cHBvcnRzIGxvY2tp
bmcsIGFsc28gZm9sbG93IHRoZSBmb2xsb3dpbmcgdGVzdAo+PiArICAgcHJvY2VkdXJlIHRvIG1h
a2Ugc3VyZSBpdCBjb3JyZWN0bHkgYmVoYXZlcy4gVGhlc2UgdGVzdHMgbXVzdCBiZQo+PiArICAg
Y29uZHVjdGVkIHdpdGggI1dQIGhpZ2ggKG5vIGhhcmR3YXJlIHByb3RlY3Rpb24pIG9yIHRoZSBg
bm8td3BgCj4+ICsgICBwcm9wZXJ0eSBpbiB0aGUgRFQgbm9kZS4KPgo+IE9yPyBJZiBXUG4gaXMg
bG93LCB0aGUgbm8td3AgcHJvcGVydHkgZG9lc24ndCBtYXR0ZXIuCj4gSXQncyBoYXJkd2FyZSB3
cml0ZSBwcm90ZWN0ZWQuCgpUaGlzIGlzIG9ubHkgY29ycmVjdCBpZiB0aGUgU1JQIGJpdCBpcyBz
ZXQuIElmIHRoZSBTUlAgYml0IGlzIHVuc2V0LCAjV1AKbG93IHN0aWxsIGhhcyBubyBpbXBhY3Qu
IEFuZCB0aGlzIGlzIHdoeSBzZXR0aW5nIHRoZSBuby13cCBwcm9wZXJ0eQptYXR0ZXJzLCBiZWNh
dXNlIG90aGVyd2lzZSB0aGUgU1JfU1JXRCBiaXQgZ2V0cyBzZXQgYXQgdGhlIGZpcnN0IGxvY2tp
bmcKY29tbWFuZC4KCkkgZGlzbGlrZWQgdGhpcyBiZWhhdmlvdXIgYXMgSSBhY3R1YWxseSBnb3Qg
YWxtb3N0IGxvY2tlZCB3aXRoCmEgbm9uIGRyaXZhYmxlICNXUCBwaW4gYW5kIGhhZCB0byBwbGF5
IHdpdGggcGluY3RybCBpbiBvcmRlciB0byBmb3JjZSBpdApoaWdoIGFuZCBhbGxvdyBtZSB0byBv
dmVyd3JpdGUgdGhlIFNSX1NSV0QgYml0IGJhY2suCgo+IEFsc28gdGhlcmUgaXMgdGhhdCBjb3Ju
ZXIgY2FzZSwgd2hlcmUgeW91IGNhbgo+IGFjdHVhbGx5IGZ1bGx5IGxvY2sgeW91ciBmbGFzaDog
V1BuIGhhcmQgdGllZCB0byBsb3cuIEJlIGF3YXJlLCB0aGF0Cj4geW91IGNhbiBlbmFibGUgbG9j
a2luZyBldmVuIGlmIFdQbiBpcyB0aWVkIGxvdy4gVGhhdCBoYXMgdGhlIHVzZQo+IGNhc2UgdG8g
aW5pdGlhbGx5IHByb2dyYW0gdGhlIGZsYXNoIGFuZCB0aGVuIGxvY2sgaXQgZm9yZXZlci4gU28g
d2UKPiBtaWdodCBhZGQgYSB3YXJuaW5nIG5vdGUsIHRoYXQgV1BuIHNob3VsZCBzb21laG93IGJl
IGNvbnRyb2xsYWJsZQo+IChvciBiZSBzdXJlIHRoYXQgaXMgdGllZCBoaWdoKSBiZWZvcmUgY29u
ZHVjdGluZyB0aGUgbG9ja2luZyB0ZXN0cy4KClllcywgdGhhdCBpcyB0aGUgc2l0dWF0aW9uIEkg
bWV0LCBpdCBpcyBub3QgZG9jdW1lbnRlZCBhbnl3aGVyZSBleGNlcHQKdGhlIGNvZGUuCgpNeSBp
bnRlbnQgd2l0aCB0aGlzIHBhcmFncmFwaCB3YXMgdG8gaGludCBwZW9wbGUgbm90IHRvIGNvbmR1
Y3QgdGhlc2UKdGVzdHMgdW5kZXIgY2VydGFpbiBzaXR1YXRpb25zLCBidXQgd2UgY2FuIGRlZmlu
aXRlbHkgaW1wcm92ZSB0aGF0LiBXaGF0CmFib3V0OgoKNSkgSWYgeW91ciBmbGFzaCBzdXBwb3J0
cyBsb2NraW5nLCBwbGVhc2UgZ290IHRocm91Z2ggdGhlIGZvbGxvd2luZyB0ZXN0CiAgIHByb2Nl
ZHVyZSB0byBtYWtlIHN1cmUgaXQgY29ycmVjdGx5IGJlaGF2ZXMuCgogICBXYXJuaW5nOiBUaGVz
ZSB0ZXN0cyBtYXkgaGFyZCBsb2NrIHlvdXIgZGV2aWNlISBNYWtlIHN1cmU6CiAgIC0gVGhlIGRl
dmljZSBpcyBub3QgaGFyZCBsb2NrZWQgYWxyZWFkeSAoI1dQIHN0cmFwcGVkIHRvIGxvdyBhbmQK
ICAgICBTUl9TUldEIGJpdCBzZXQpCiAgIC0gSWYgeW91IGhhdmUgYSAjV1AgcGluLCB5b3UgbWF5
IHdhbnQgdG8gc2V0IGBuby13cGAgaW4geW91ciBEVCBmb3IKICAgICB0aGUgdGltZSBvZiB0aGUg
dGVzdCwgdG8gb25seSBtYWtlIHVzZSBvZiBzb2Z0d2FyZSBwcm90ZWN0aW9uLgoKUGxlYXNlIGFt
ZW5kIHRoaXMgdGV4dCBpZiB5b3Ugc3RpbGwgdGhpbmsgaXQgaXMgbWlzc2luZyBoaXMgZ29hbC4K
Cj4+ICsgICAgcm9vdEAxOn4jIGZsYXNoX2xvY2sgLXUgL2Rldi9tdGQwCj4+ICsgICAgcm9vdEAx
On4jIGZsYXNoX2xvY2sgLWwgL2Rldi9tdGQwICQoKCRzaXplIC0gKDIgKiAkYnMpKSkgMiAjIGxh
c3QgdHdvCj4+ICsgICAgcm9vdEAxOn4jIHNob3dfc2VjdG9ycwo+PiArICAgIHNvZnR3YXJlIGxv
Y2tlZCBzZWN0b3JzCj4+ICsgICAgIHJlZ2lvbiAoaW4gaGV4KSAgIHwgc3RhdHVzICAgfCAjYmxv
Y2tzCj4+ICsgICAgIC0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tLS0tCj4+ICsg
ICAgIDAwMDAwMDAwLTAzZmRmZmZmIHwgdW5sb2NrZWQgfCAxMDIyCj4+ICsgICAgIDAzZmUwMDAw
LTAzZmZmZmZmIHwgICBsb2NrZWQgfCAyCj4+ICsgICAgcm9vdEAxOn4jIGZsYXNoX2xvY2sgLXUg
L2Rldi9tdGQwICQoKCRzaXplIC0gKDIgKiAkYnMpKSkgMSAjIGxhc3Qgb25lCj4KPiBodWg/IHNo
b3VsZG4ndCB0aGF0IGJlIDEgKiAkYnM/CgpJIGRvbid0IHRoaW5rIHNvOgotIGZpcnN0IHdlIGxv
Y2sgdGhlIGxhc3QgdHdvIGJsb2NrcyAob2Zmc2V0OiBzaXplIC0gMiBibG9ja3MsIGxlbmd0aDog
MgogIGJsb2NrcykKLSB0aGVuIHdlIHVubG9jayB0aGUgcGVudWx0aW1hdGUgYmxvY2sgc28gdGhh
dCBvbmx5IHRoZSBsYXN0IGJsb2NrCiAgcmVtYWlucyBsb2NrZWQgKG9mZnNldDogc2l6ZSAtIDIg
YmxvY2tzLCBsZW5ndGggMSkuCgpJIHdlIHdlcmUgZG9pbmcgZmxhc2hfbG9jayAtdSA8bXRkPiAk
KCgkc2l6ZSAtICgxICogJGJzKSkpIDEsIHdlIHdvdWxkCmJlIGFza2luZyB0byB1bmxvY2sgdGhl
IHZlcnkgbGFzdCBibG9jayBhbmQga2VlcCBvbmx5IHRoZSBwZW51bHRpbWF0ZQpibG9jayBsb2Nr
ZWQsIHdoaWNoIHdvdWxkIG5vdCBiZSBzdXBwb3J0ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
