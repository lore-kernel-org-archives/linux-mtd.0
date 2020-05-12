Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51034C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:59:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 202F6206D6
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FdiZZhoM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 202F6206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8T4doHWnCsK/kTNU8BMF5+rp+vDchwkEUpHz5oti3iM=; b=FdiZZhoMNVfsJr
	n/UukXAI4Y0KdEWPUjFsi23rLUQSSJ2Y9MrGOkxyNh3z2Z0DMcKCDTV8ZxR9rAyOXX1fSUaNciAMZ
	O3uZZAg3MwZhTw5Z1t+K3rL1q8Zhnjo11+faSH9g7ySN3NKECnmtATMdS1iFB30RL+WQfQrDRxu/f
	ke85nbtFUAXQ7YuBMrAkBhvX/dynwFcA9V4mdCa3otDPNRIut3RZBDykroyTslPoNeqYWNGjbhnQJ
	6oJz3FjaPdL0fS7xxQYc8+Hbj8uvkt3bOXuZJgYm/+N5Xy3DmpUncLGq49GREaGObuMxaDR7ZWpNM
	rrxUrhoCQKP8KaT/W2bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYOt3-0004Qr-DO; Tue, 12 May 2020 06:59:33 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYOt0-0004Po-Km
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 06:59:32 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A607E20006;
 Tue, 12 May 2020 06:59:24 +0000 (UTC)
Date: Tue, 12 May 2020 08:59:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v4 04/10] mtd: rawnand: stm32_fmc2: cleanup
Message-ID: <20200512085922.3fc3e4dd@xps13>
In-Reply-To: <49c51a13-96a1-0241-f4d1-c5ff7d52921d@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-5-git-send-email-christophe.kerello@st.com>
 <20200511223900.030fe5f4@xps13>
 <49c51a13-96a1-0241-f4d1-c5ff7d52921d@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_235930_821295_4E0148D1 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gVHVlLCAxMiBNYXkKMjAyMCAwODo0OTo1NCArMDIwMDoKCj4gSGkgTWlx
dWVsLAo+IAo+IE9uIDUvMTEvMjAgMTA6MzkgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiAK
PiA+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGUg
b24gV2VkLCA2IE1heSAyMDIwCj4gPiAxMToxMToxMyArMDIwMDoKPiA+ICAgCj4gPj4gVGhpcyBw
YXRjaCByZW5hbWVzIGZ1bmN0aW9ucyBhbmQgbG9jYWwgdmFyaWFibGVzLgo+ID4+IFRoaXMgY2xl
YW51cCBpcyBkb25lIHRvIGdldCBhbGwgZnVuY3Rpb25zIHN0YXJ0aW5nIGJ5IHN0bTMyX2ZtYzJf
bmZjCj4gPj4gaW4gdGhlIEZNQzIgcmF3IE5BTkQgZHJpdmVyIHdoZW4gYWxsIGZ1bmN0aW9ucyB3
aWxsIHN0YXJ0IGJ5Cj4gPj4gc3RtMzJfZm1jMl9lYmkgaW4gdGhlIEZNQzIgRUJJIGRyaXZlci4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5r
ZXJlbGxvQHN0LmNvbT4KPiA+PiBSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gIAo+ID4gCj4gPiBBcHBsaWVkIHRvIG5hbmQvbmV4dCBhcyB3ZWxs
IGJ1dCBmb3IgYW4gdW5rbm93biByZWFzb24gSSBoYWQgdG8gZG8gaXQKPiA+IGJ5IGhhbmQgYmVj
YXVzZSB0aGUgcGF0Y2ggd291bGQgbm90IGFwcGx5Lgo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1
w6hsCj4gPiAgIAo+IFRoaXMgaXMgc3RyYW5nZSwgSSBjYW4gYXBwbHkgdGhpcyBwYXRjaCBvbiBt
eSB0cmVlIHdpdGhvdXQgYW55IGNvbmZsaWN0cy4KPiBUaGVyZSBpcyBhIGNvbXBpbGF0aW9uIGlz
c3VlIGxpbmUgMTMwMS4KPiAKPiBAQCAtMTMwMiw0NCArMTI5OCw0NSBAQCBzdGF0aWMgdm9pZCBz
dG0zMl9mbWMyX3dyaXRlX2RhdGEoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qgdm9pZCAq
YnVmLAo+IAo+ICAgCWlmIChmb3JjZV84Yml0ICYmIGNoaXAtPm9wdGlvbnMgJiBOQU5EX0JVU1dJ
RFRIXzE2KQo+ICAgCQkvKiBSZWNvbmZpZ3VyZSBidXMgd2lkdGggdG8gMTYtYml0ICovCj4gLQkJ
c3RtMzJfZm1jMl9zZXRfYnVzd2lkdGhfMTYoZm1jMiwgdHJ1ZSk7Cj4gKwkJc3RtMzJfZm1jMl9u
ZmNfc2V0X2J1c3dpZHRoXzE2KG5mYywgdHJ1ZSk7Cj4gICB9Cj4gCj4gSSB3aWxsIHJlYmFzZSBv
biB0b3Agb2YgbmFuZC9uZXh0IHRvZGF5IHRvIGNoZWNrIHRoYXQgdGhlcmUgaXMgbm8gaXNzdWVz
IHdpdGggdGhlIGRyaXZlci4KCkkgaGFkIHRvIGRvIHNvbWUgY2hhbmdlcyBtYW51YWxseSwgbWFp
YmUgSSBtaXNzZWQgdGhpcyBvbmUsIGJ1dCBJIGRvbid0CnJlbWVtYmVyIHRvdWNoaW5nIHRoaXMg
aGVscGVyLgoKQW55d2F5LCBJIGp1c3QgZHJvcHBlZCB0aGUgdHdvIGxhc3QgcGF0Y2hlcyBvZiB5
b3VyIHNlcmllcywgcGxlYXNlCnJlYmEmc2Ugbm93IG9uIG5hbmQvbmV4dCBhbmQganVzdCByZXNl
bmQgcGF0Y2hlcyA0IGFuZCA1LgoKQWxzbywgd2hpbGUgYXQgaXQsIHdvdWxkIHlvdSBtaW5kIGNo
YW5naW5nIHRoZSBjb21taXQgdGl0bGUgdG8Kc29tZXRoaW5nIG1vcmUgbWVhbmluZ2Z1bD8gImNs
ZWFudXAiIGlzIGEgYml0IHZhZ3VlIGFuZCBub3QgdmVyeQphY2N1cmF0ZS4gTWF5YmUgc29tZXRo
aW5nIGxpa2UgIkNvc21ldGljIGNoYW5nZSB0byB1c2UgbmZjIGluc3RlYWQgb2YKZm1jMiB3aGVy
ZSByZWxldmFudCIuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
