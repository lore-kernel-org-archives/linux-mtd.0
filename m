Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01E1C64EC4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vC4vgZ0rySqTH0KLkPJHQICcSTkiW7uaXFhgp/2o6w=; b=mkiLKSDiM6ivc0
	h7zk+jodt2B1BDTfNm4eMPIZstofwzSrvhg6jtxhxvplvcGyQRND/IXx9jcJTd5Wxj72bbk01dJsK
	raDKOQAxI8zTGTRVTI3czeDRqxD9dwtEtpcvScJYWtAfoFQj3dZXJ7T2ORRZT8+bV2THg2bAybzWH
	6ya4IdWSLWIkPdYNqcRFFq0yUt6i8AfQ2UO5wDFgpXGZhQg83PJGr7zF8yljA0KN7QViI2kN7/TzT
	Lr+E4YYlzQ5j2sYxxVUmXyEn3zi+9QUZ8Ptg+8F/eBAXMqbd4BBO95vr3aoIRvVZNcYRV8ZlebQ6W
	+dthK4oMtrmU5IUPiBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paH8D-00ASXm-Hw; Thu, 09 Mar 2023 14:20:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paH7t-00ASMl-6X; Thu, 09 Mar 2023 14:20:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j2so2017123wrh.9;
        Thu, 09 Mar 2023 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678371608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
        b=pQ8rH9hmAvMGPdlWLtsaiCL1tbAk6J5Bet/1wrFc3yD0T50sPxhzJap0s2h/tEDON1
         ZyckrHIm+7bwS9K33CaoBmOEZv2I7afmQGc2Er54g/6BTDs+CyEWTFawrPc5lAPk872n
         dmirs2Ttda4PnqKgROjUd7CIwz9tdnPCkSyzGIlnzIK6bEyGRSqA1H7/Ze090yaenbxK
         iPzeJNvkLQF6jNvmwsa7eHyXANDHZkBWQs6sisMepYXK+3QyecdSDDX0uIOJQsDjVcfx
         gAyo8YDxkCaJ9wJqVQYaGvOmMuszKOMwbyHS/bu+S6gVRzJL6eI6sGaSbulGjMzjlnVQ
         sYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
        b=6DzZp3nIGFGMlm16cyDfhH3cgGODNK9id0K2SPEYKLkT6lBuf6kiioLWMlOkNYmBI1
         G4WnB5MG8VUj3BmajiWiT5Y/1QD4UCXGRd2DBsWpay6oWGKQNXdqxOmg4E4i9pnEiOSd
         8+Bfo4uA0sEk9oV73zZ5nMvZ7OOkKWGqr3hDtHkE0HimmkI9wIL2AnVZtF6a3UjjskAy
         MVaKRNeLwO3jezjgg1p4dxqg9XKi0aUoEevf2+ouCxipnzqCoBDtuA5DAZ0odFei1EAD
         EQAuFbIk5vtYfl0F/sDamEGHRyuKnjMZ2Qd5tVU4utl4n9GCJO0J6B8TcLbK6Dh9Q/XI
         h+xQ==
X-Gm-Message-State: AO0yUKWKdN5mg3JgVNbCBrVMYEg6pdctFmu/ySIPBxPxxxPpnS+6dgYh
	xoG6IELcKYIPrPVHeGpx4k3xSJEWUM4BMRExyEBVG2/dBTjcIA==
X-Google-Smtp-Source: AK7set+Yd9KrImooA6uxrXUVmDh+Rcs9q/1b8CgKBFtf9L4gNgxW+NQjjkIdwpsMyntXGCBQF88sBj/dwaEvM3BdnWg=
X-Received: by 2002:adf:dd4f:0:b0:2c5:5297:1f9a with SMTP id
 u15-20020adfdd4f000000b002c552971f9amr4901402wrm.14.1678371608475; Thu, 09
 Mar 2023 06:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation> <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation> <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc> <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc> <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc> <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc> <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
In-Reply-To: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 9 Mar 2023 22:19:55 +0800
Message-ID: <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Sergiu.Moga@microchip.com, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, 
	Claudiu.Beznea@microchip.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org, 
	joel@jms.id.au, andrew@aj.id.au, kdasu.kdev@gmail.com, han.xu@nxp.com, 
	john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com, 
	yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, michal.simek@xilinx.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062013_311075_DEDF1065 
X-CRM114-Status: GOOD (  21.57  )
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

SGkhCgpPbiBUaHUsIE1hciA5LCAyMDIzIGF0IDEwOjA04oCvUE0gTWljaGFlbCBXYWxsZSA8bWlj
aGFlbEB3YWxsZS5jYz4gd3JvdGU6Cj4KPiBBbSAyMDIzLTAzLTA5IDE0OjU0LCBzY2hyaWViIFR1
ZG9yIEFtYmFydXM6Cj4gPiBPbiAwOS4wMy4yMDIzIDE1OjMzLCBNaWNoYWVsIFdhbGxlIHdyb3Rl
Ogo+ID4+Pj4+IFRoZSBjb250cm9sbGVycyB0aGF0IGNhbiB0YWxrIGluIGR1bW15IG5jeWNsZXMg
ZG9uJ3QgbmVlZCB0aGUKPiA+Pj4+PiBkdW1teS57YnVzd2lkdGgsIGR0cn0gZmllbGRzLgo+ID4+
Pj4+Cj4gPj4+Pj4gVGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuJ3QgdGFsayBpbiBkdW1teSBjeWNs
ZXMsIGJ1dCBvbmx5IG9uIGEKPiA+Pj4+PiAiYnl0ZSIKPiA+Pj4+PiBib3VuZGFyeSBuZWVkIGJv
dGggYnVzd2lkdGggYW5kIGR0ciBmaWVsZHMuIEFzc3VtZSBhIGZsYXNoIG5lZWRzIDMyCj4gPj4+
Pj4gZHVtbXkgY3ljbGVzIGZvciBhbiBvcCBvbiA4RC04RC04RCBtb2RlLiBJZiB0aGUgY29udHJv
bGxlciBkb2VzIG5vdAo+ID4+Pj4+IGhhdmUKPiA+Pj4+PiB0aGUgYnVzd2lkdGggYW5kIGR0ciBp
bmZvLCBpdCBjYW4ndCBjb252ZXJ0IHRoZSBkdW1teSBuY3ljbGVzIHRvCj4gPj4+Pj4gbmJ5dGVz
Lgo+ID4+Pj4+IElmIGhlIGtub3dzIG9ubHkgdGhhdCBidXN3aWR0aCBpcyA4LCBpdCB3aWxsIGNv
bnZlcnQgbmN5Y2xlcyB0byA0Cj4gPj4+Pj4gYnl0ZXMuCj4gPj4+Pj4gSWYgZHRyIGlzIGFsc28g
c3BlY2lmaWVkIGl0IGNvbnZlcnRzIG5jeWNsZXMgdG8gMiBieXRlcy4KPiA+Pj4+Cj4gPj4+PiBO
byB0aGV5IGRvbid0IG5lZWQgaXQuIExldHMgdGFrZSB5b3VyIHNlbXBlciBmbGFzaCBhbmQgYXNz
dW1lIGl0Cj4gPj4+PiBuZWVkcwo+ID4+Pj4gMTIgbGF0ZW5jeSBjeWNsZXMuIFNQSS1OT1Igd2ls
bCBzZXQgbmN5Y2xlcyB0byAxMiAqcmVnYXJkbGVzcyBvZiB0aGUKPiA+Pj4+IG1vZGUKPiA+Pj4+
IG9yIGR0ciBzZXR0aW5nKi4gVGhlIGNvbnRyb2xsZXIgdGhlbiBrbm93cyB3ZSBuZWVkIDEyIGNs
b2NrIGN5Y2xlcy4KPiA+Pj4+IEl0IGhhcwo+ID4+Pj4gdGhlbiB0byBmaWd1cmUgb3V0IGhvdyB0
aGF0IGNhbiBiZSBhY2hpZXZlZC4gRS5nLiBpZiBpdCBjYW4gb25seSBkbwo+ID4+Pj4gdGhlCj4g
Pj4+PiAib2xkIiBieXRlIHByb2dyYW1taW5nIGFuZCBpcyBpbiBxdWFkIG1vZGUsIGdvb2QgZm9y
IGl0LiBJdCB3aWxsCj4gPj4+PiBzZW5kIDYKPiA+Pj4+IGR1bW15IGJ5dGVzLCB3aGljaCB3aWxs
IHJlc3VsdCBpbiAxMiBkdW1teSBjbG9jayBjeWNsZXMsIGJlY2F1c2UgMQo+ID4+Pj4gYnl0ZQo+
ID4+Pj4gdGFrZXMgdHdvIGNsb2NrIGN5Y2xlcyBpbiBxdWFkIFNEUiBtb2RlLiBJZiBpdHMgaW4g
b2N0YWwgbW9kZSwgc2VuZAo+ID4+Pj4gMTIKPiA+Pj4+IGJ5dGVzLiBJZiBpdHMgaW4gZHVhbCBt
b2RlLCBzZW5kIDMgYnl0ZXMuIE9iaW91c2x5LCBpdCBjYW5ub3QgYmUgaW4KPiA+Pj4+IHNpbmds
ZSBiaXQgbW9kZSwgYmVjYXVzZSBpdCBjYW5ub3Qgc2VuZCAxLjUgYnl0ZXMuLgo+ID4+Pj4KPiA+
Pj4KPiA+Pj4gWW91IG1pc3MgdGhlIGZhY3QgdGhhdCB5b3UgY2FuIGhhdmUgMS0xLTQuIFdoYXQg
YnVzd2lkdGggZG8geW91IHVzZQo+ID4+PiBmb3IgZHVtbXksIHRoZSBhZGRyZXNzIGJ1c3dpZHRo
IG9yIHRoZSBkYXRhIGJ1c3dpZHRoPwo+ID4+Cj4gPj4gRG9lc24ndCBtYXR0ZXIsIGRvZXMgaXQ/
IFRoZSBkcml2ZXIgaXMgZnJlZSB0byBjaG9zZSwgMSwgNCwgb3IKPiA+PiBhbnl0aGluZwo+ID4+
IGVsc2UuIFlvdSBkb24ndCBzYW1wbGUgYW55IGRhdGEgZHVyaW5nIHRoZSBkdW1teSBwaGFzZS4K
PiA+PiBUbyBhbnN3ZXIgeW91ciBxdWVzdGlvbjogc2luZ2xlIGZvciBpbnN0cnVjdGlvbiwgc2lu
Z2xlIGZvciBhZGRyZXNzLAo+ID4+IHdoYXRldmVyIHlvdSBjaG9vc2UgZm9yIGR1bW15IGFzIGxv
bmcgYXMgdGhlcmUgYXJlIG5jeWNsZXMgc3BhY2UKPiA+PiBiZXR3ZWVuCj4gPj4gYWRkcmVzcyBh
bmQgZGF0YSwgYW5kIHF1YWQgZm9yIGRhdGEuCj4gPgo+ID4gSHVoPyBIb3cgZG9lcyB0aGUgY29u
dHJvbGxlciBjaG9zZSwgYmFzZWQgb24gd2hhdD8KPgo+IEJhc2VkIG9uIGl0cyBvd24gY2FwYWJp
bGl0aWVzLiBJdCBjYW4gY2hvb3NlIGVpdGhlciB3YXkuIEluIHRoZSBlbmQKPiB3aGF0IG1hdHRl
cnMgaXMgaG93IG1hbnkgY2xvY2sgY3ljbGVzIHRoZXJlIGFyZSBiZXR3ZWVuIHRoZSBhZGRyZXNz
Cj4gYW5kIGRhdGEgcGhhc2UuIEFuZCB5b3Ugb25seSBuZWVkIHRvIGNvbnZleSB0aGF0IGluZm9y
bWF0aW9uIHRvIHRoZQo+IFNQSSBjb250cm9sbGVyIC0geW91ciBuZXcgbmN5Y2xlcy4KCkl0IGRv
ZXMgbWF0dGVyLiBDb250cm9sbGVyIG1heSBiZSBkZXNpZ25lZCB0byBhY3RpdmVseSBkcml2ZQpN
T1NJL1dQL0hPTEQgZHVyaW5nIHNpbmdsZS1zcGkgZHVtbXkgY3ljbGVzIGFuZCBXUC9IT0xECmR1
cmluZyBkdWFsLXNwaSBkdW1teSBjeWNsZXMuIElmIHRoZSBwaW4gbW9kZXMgYmV0d2VlbiB0aGUK
Y29udHJvbGxlciBhbmQgZGV2aWNlIG1pc21hdGNoZWQsIHdvcnN0IGNhc2Ugc2NlbmFyaW8KdGhl
IGNoaXAgbWF5IGdldCBmcmllZC4KCi0tIApSZWdhcmRzLApDaHVhbmhvbmcgR3VvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
