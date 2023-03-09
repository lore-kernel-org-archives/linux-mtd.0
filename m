Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9A5C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSP9Ve5LtUP6vKtbGetQD89TaC7hs20sI6RmSEv5XKI=; b=q+DB90JCDhXmAbXuGELCr5llyI
	vty8U/VXIoPu5e2wivlXKZgGkV060OxpzV2Y2cLe9xCfyt22ae5KgBM9nHJiG92jRVI2x9A73c64z
	GrfI4A1mPKTUbjzJGbbynjKU1I5iEj/RTyADnITbr1r1Rq4hBSeOpgWBCveW1nvvffbymsVsjMQ7y
	VGGz1vE7gsR5itlND3MIV5Mqfj/RqmH39EQ0Ne0gvN/i1WAqKeLCN3D7AzG93IcN209fP2/h72cv/
	Ft/wXJzUbPjbaT2AXxh4XwiYxIryxJ2bc50AjE7Y7aKG2x3R5fDZTPpoZQRWkKXkOaV4REuLA6VvF
	uPOAc/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paFUz-009tBw-El; Thu, 09 Mar 2023 12:35:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paFUk-009t90-Nj; Thu, 09 Mar 2023 12:35:48 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AB60AD5A;
	Thu,  9 Mar 2023 13:35:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678365335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YkbL6egC+tLS7Ekib2vq6k/gQvvMNd5aYQVsJy/3LI=;
	b=bws+pQkVyr4zuAoqJt1XiD0qkswr4UwqWsh7Q8g/iTCsdijXujtyR0vGjUKRs5vGFDrL/M
	sh8LIIH6TBghtFfKY9ovpIv/HoXYyWIgtw26RL0nVmBpoc1bUj6ns3BaWDCgNdTAVsvkX2
	Ft0xU7peSsWfmrHI8QrFLurdfSO4cTAOEb9xQC1Gz1KawG/jCXUmVXyyAYz8rJTlSka5nF
	vlT9dcdmpLW4tWDT1y4oYA8VvMPAOp7JsDGfKq0q8YMctBfoaUH2rgDIZTrRszOaQG2Ro1
	3jKOFDnBBiT8KjunvovcZ0hx7boRaLbReOPK1K4Hu9l1ameEMBhx8pIQEpWg8Q==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 13:35:35 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com, Mark
 Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Claudiu.Beznea@microchip.com,
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, joel@jms.id.au, andrew@aj.id.au,
 kdasu.kdev@gmail.com, han.xu@nxp.com, john.garry@huawei.com,
 matthias.bgg@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, haibo.chen@nxp.com, yogeshgaur.83@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 michal.simek@xilinx.com, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <03a9f117316ab81f1b5a18100f771e65@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_043542_945115_8E4A718F 
X-CRM114-Status: GOOD (  28.42  )
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

QW0gMjAyMy0wMy0wOSAxMzowOSwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+IE9uIDMvOS8yMyAx
MDo1NiwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gQW0gMjAyMy0wMy0wOSAxMTo0Miwgc2Nocmll
YiBUdWRvciBBbWJhcnVzOgo+Pj4gT24gMDkuMDMuMjAyMyAxMDozOCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPj4+Pj4gSW4gYW4gaWRlYWwgd29ybGQsIHdoZXJlIGJvdGggdGhlIGNvbnRyb2xsZXIg
YW5kIHRoZSBkZXZpY2UgdGFsayAKPj4+Pj4gYWJvdXQKPj4+Pj4gZHVtbXkgbnVtYmVyIG9mIGN5
Y2xlcywgSSB3b3VsZCBhZ3JlZSB3aXRoIHlvdSwgYnVzd2lkdGggYW5kIGR0ciAKPj4+Pj4gc2hv
dWxkCj4+Pj4+IG5vdCBiZSByZWxldmFudCBmb3IgdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMu
IEJ1dCBpdCBzZWVtcyB0aGF0IAo+Pj4+PiB0aGVyZQo+Pj4+PiBhcmUgb2xkIGNvbnRyb2xsZXJz
IChlLmcuIHNwaS1oaXNpLXNmYy12M3h4LmMsIHNwaS1tdDY1eHguYywKPj4+Pj4gc3BpLW14aWMu
YykKPj4+Pj4gdGhhdCBzdXBwb3J0IGJ1c3dpZHRocyA+IDEgYW5kIHdvcmsgb25seSB3aXRoIGR1
bW15IG5ieXRlcywgdGhleSAKPj4+Pj4gYXJlCj4+Pj4+IG5vdAo+Pj4+PiBjYXBhYmxlIG9mIHNw
ZWNpZnlpbmcgYSBzbWFsbGVyIGdyYW51bGFyaXR5IChuY3ljbGVzKS4gVGh1cyB0aGUgCj4+Pj4+
IG9sZGVyCj4+Pj4+IGNvbnRyb2xsZXJzIHdvdWxkIGhhdmUgdG8gY29udmVydCB0aGUgZHVtbXkg
bmN5Y2xlcyB0byBkdW1teSAKPj4+Pj4gbmJ5dGVzLgo+Pj4+PiBTaW5jZSBtaXhlZCB0cmFuc2Zl
ciBtb2RlcyBhcmUgYSB0aGluZyAoc2VlIGplc2QyNTEsIGl0IHRhbGtzIGFib3V0Cj4+Pj4+IDRT
LTRELTREKSwgd2hlcmUgc2luZ2xlIHRyYW5zZmVyIG1vZGUgKFMpIGNhbiBiZSBtaXhlZCB3aXRo
IGRvdWJsZQo+Pj4+PiB0cmFuc2ZlciBtb2RlIChEKSBmb3IgYSBjb21tYW5kLCB0aGUgY29udHJv
bGxlciB3b3VsZCBoYXZlIHRvIGd1ZXNzIAo+Pj4+PiB0aGUKPj4+Pj4gYnVzd2lkdGggYW5kIGR0
ciBvZiB0aGUgZHVtbXkuIFNoYWxsIHRoZXkgcmVwbGljYXRlIHRoZSBidXN3aWR0aCAKPj4+Pj4g
YW5kCj4+Pj4+IGR0cgo+Pj4+PiBvZiB0aGUgYWRkcmVzcyBvciBvZiB0aGUgZGF0YT8gVGhlcmUn
cyBubyBydWxlIGZvciB0aGF0Lgo+Pj4+IAo+Pj4+IEJ1dCBpbiB0aGUgZW5kIHRoYXQgZG9lc24n
dCBtYXR0ZXIgYmVjYXVzZSB0aGV5IGFyZSBqdXN0IGR1bW15IGNsb2NrCj4+Pj4gY3ljbGVzIGFu
ZCB0aGUgbW9kZSB3aWxsIG9ubHkgYWZmZWN0IHRoZSBkYXRhL2FkZHJlc3MvY29tbWFuZC4KPj4+
PiBUaGVyZWZvcmUsCj4+Pj4gdGhlIGNvbnRyb2xsZXIgaXMgZnJlZSB0byBjaG9vc2UgdGhlIG1v
ZGUgdGhhdCBzdWl0cyBpdCBiZXN0Lgo+Pj4+IMKgPiBCdXQgdGhhdCBiZWdzIHRoZSBxdWVzdGlv
biwgaXMgbmN5Y2xlcyBpbiByZWdhcmQgdG8gRFRSIG9yIFNEUj8KPj4+PiBUaGF0IGlzLAo+Pj4+
IGFyZSB5b3UgY291bnRpbmcganVzdCBvbmUgdHlwZSBvZiBlZGdlcyBvciBib3RoIHRoZSBmYWxs
aW5nIGFuZCAKPj4+PiByaXNpbmcKPj4+PiBlZGdlcy4gVGhlIHNtYWxsZXN0IGdyYW51bGFyaXR5
IHdvdWxkIGJlIG5jeWNsZXMgaW4gcmVnYXJkIG9mIERUUi4gCj4+Pj4gVG8KPj4+PiBtZSwKPj4+
PiBpdCdzIG5vdCBvYnZpb3VzIHdoYXQgdGhlIFNFTVBFUiBOYW5vIEZsYXNoIFsxXSB1c2VzLiBJ
J2Qgc2F5IHdlIAo+Pj4+IGNob29zZQo+Pj4+IHRoZSBzbWFsbGVzdCBncmFudWxhcnR5IGluIHNw
aS1tZW0gdG8gYmUgZnV0dXJlIHByb29mIGFuZCBtYXliZSAKPj4+PiBwcm92aWRlCj4+Pj4gc29t
ZSBzcGktbWVtIGhlbHBlciB0byBoZWxwIHNldHRpbmcgdGhlIGN5Y2xlcyBmb3IgU0RSL0RUUi4g
QXMgYW4KPj4+PiBleGFtcGxlLAo+Pj4+IGlmIHlvdSB3YW50IHRvIHdhaXQgNCBjeWNsZXMgaW4g
U0RSIHlvdSdkIGhhdmUgbmN5Y2xlcz04IGluIHNwaS1tZW0uCj4+Pj4gCj4+PiAKPj4+IE5vLCB3
ZSBjYW4ndCBpbnZlbnQgb3VyIG93biBtZWFzdXJpbmcgdW5pdHMuIFdlIGhhdmUgY3ljbGVzIGFu
ZCBoYWxmCj4+PiBjeWNsZXMgKHJlZ2FyZGxlc3Mgb2YgdGhlIHRyYW5zZmVyIG1vZGUgdXNlZCAo
U1RSLCBEVFIpKS4KPj4gCj4+IFRoYXQgaXMgYmFzaWNhbGx5IHdoYXQgSSB3YXMgc2F5aW5nLCBq
dXN0IHVzaW5nIHRoZSBjb3JyZWN0IHRlcm0uCj4+IE9rLiBTbyB3ZSBkb24ndCBuZWVkIHRoZSBk
dHIgcHJvcGVydHksIHJpZ2h0PyBJJ20gc3RpbGwgbm90IHN1cmUsCj4gCj4gV2UgZG8uCj4gCj4g
QXMgb2Ygbm93IHlvdSBjYW4ndCBzcGVjaWZ5IDIwIGR1bW15IGN5Y2xlcyBmb3IgUkVBRElEIGlu
IDhELThELThEIG1vZGUKPiBiZWNhdXNlIGFsbCB0aGUgbGF5ZXJzIHRyZWF0cyBkdW1teSBhcyBi
eXRlcywgd2hlcmVhcyB0aGV5IHNob3VsZCB0cmVhdAo+IGl0IGFzIGN5Y2xlcy4gT25lIGR1bW15
IGJ5dGUgaW4gOEQtOEQtOEQgbWVhbnMgMTYgZHVtbXkgY3ljbGVzLiAyMCAKPiBkdW1teQo+IGN5
Y2xlcyBpbiA4RC04RC04RCBtZWFucyBvbmUgYnl0ZSBhbmQgYSBxdWFydGVyPyBUaGlzIGlzIGEg
bm9uLXNlbnNlLgoKQWdyZWVkLgoKPiBBcyB0aGUgY29kZSBpcyBub3csIFNQSSBOQU5EIHVzZXMg
ZHVtbXkgY3ljbGVzIHRoYXQgYXJlIG11bHRpcGxlIG9mIDguCj4gU1BJIE5PUiByZXF1aXJlcyBh
IHZhcmlhYmxlIG51bWJlciBvZiBkdW1teSBjeWNsZXMsIHRoZXJlJ3Mgbm8KPiByZXN0cmljdGlv
bnMuIEluIFNQSSBOT1Igd2UgZ2V0IGZyb20gU0ZEUCBvciBkYXRhc2hlZXRzIHRoZSBudW1iZXIg
b2YKPiBkdW1teSBjeWNsZXMsIGFuZCBpbiB0aGUgY29kZSB3ZSBjb252ZXJ0IHRoZW0gdG8gZHVt
bXkgbmJ5dGVzLiBUaGVuIAo+IHdoZW4KPiB3ZSBnZXQgYXQgdGhlIGNvbnRyb2xsZXIgc2lkZSwg
dGhlIG1ham9yaXR5IG9mIHRoZSBjb250cm9sbGVycyB1bmRvIHRoZQo+IG9wZXJhdGlvbiwgdGhl
eSB0YWtlIHRoZSBkdW1teSBuYnl0ZXMgYW5kIGNvbnZlcnQgdGhlbSB0byBkdW1teSAKPiBuY3lj
bGVzLgo+IElzbid0IGJldHRlciB0byB1c2UgZHVtbXkgbmN5Y2xlcyBmcm9tIHRoZSBiZWdpbm5p
bmc/CgpZZXMsIGJ1dCBub3cgd2Ugc2hvdWxkIGRlZmluZSB3aGF0ICpvbmUqIGN5Y2xlIGlzLiBB
bmQgdGhhdCBpdCBpcyAKZGVmaW5lZApyZWdhcmRsZXNzIG9mIHRoZSBtb2RlLCBiZWNhdXNlIHRo
ZSBtb2RlIG9ubHkgYWZmZWN0cyB0aGUgSU8gbGluZXMuIEJ1dAphIGNsb2NrIGN5Y2xlIHJlZmVy
cyB0byB0aGUgY2xvY2sgbGluZS4gW2NvbWluZyBiYWNrIHRvIGhlcmVdIEFuZCBhcyB5b3UKc2Fp
ZCBvbmUgY3ljbGUgaXMgb25lIGZ1bGwgY2xvY2sgY3ljbGUsIGl0IGlzIGFsc28gaW5kZXBlbmRl
bnQgb2YgdGhlIApkdHIKc2V0dGluZy4KCj4gVGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuIHRhbGsg
aW4gZHVtbXkgbmN5Y2xlcyBkb24ndCBuZWVkIHRoZQo+IGR1bW15LntidXN3aWR0aCwgZHRyfSBm
aWVsZHMuCj4gCj4gVGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuJ3QgdGFsayBpbiBkdW1teSBjeWNs
ZXMsIGJ1dCBvbmx5IG9uIGEgImJ5dGUiCj4gYm91bmRhcnkgbmVlZCBib3RoIGJ1c3dpZHRoIGFu
ZCBkdHIgZmllbGRzLiBBc3N1bWUgYSBmbGFzaCBuZWVkcyAzMgo+IGR1bW15IGN5Y2xlcyBmb3Ig
YW4gb3Agb24gOEQtOEQtOEQgbW9kZS4gSWYgdGhlIGNvbnRyb2xsZXIgZG9lcyBub3QgCj4gaGF2
ZQo+IHRoZSBidXN3aWR0aCBhbmQgZHRyIGluZm8sIGl0IGNhbid0IGNvbnZlcnQgdGhlIGR1bW15
IG5jeWNsZXMgdG8gCj4gbmJ5dGVzLgo+IElmIGhlIGtub3dzIG9ubHkgdGhhdCBidXN3aWR0aCBp
cyA4LCBpdCB3aWxsIGNvbnZlcnQgbmN5Y2xlcyB0byA0IAo+IGJ5dGVzLgo+IElmIGR0ciBpcyBh
bHNvIHNwZWNpZmllZCBpdCBjb252ZXJ0cyBuY3ljbGVzIHRvIDIgYnl0ZXMuCgpObyB0aGV5IGRv
bid0IG5lZWQgaXQuIExldHMgdGFrZSB5b3VyIHNlbXBlciBmbGFzaCBhbmQgYXNzdW1lIGl0IG5l
ZWRzCjEyIGxhdGVuY3kgY3ljbGVzLiBTUEktTk9SIHdpbGwgc2V0IG5jeWNsZXMgdG8gMTIgKnJl
Z2FyZGxlc3Mgb2YgdGhlIAptb2RlCm9yIGR0ciBzZXR0aW5nKi4gVGhlIGNvbnRyb2xsZXIgdGhl
biBrbm93cyB3ZSBuZWVkIDEyIGNsb2NrIGN5Y2xlcy4gSXQgCmhhcwp0aGVuIHRvIGZpZ3VyZSBv
dXQgaG93IHRoYXQgY2FuIGJlIGFjaGlldmVkLiBFLmcuIGlmIGl0IGNhbiBvbmx5IGRvIHRoZQoi
b2xkIiBieXRlIHByb2dyYW1taW5nIGFuZCBpcyBpbiBxdWFkIG1vZGUsIGdvb2QgZm9yIGl0LiBJ
dCB3aWxsIHNlbmQgNgpkdW1teSBieXRlcywgd2hpY2ggd2lsbCByZXN1bHQgaW4gMTIgZHVtbXkg
Y2xvY2sgY3ljbGVzLCBiZWNhdXNlIDEgYnl0ZQp0YWtlcyB0d28gY2xvY2sgY3ljbGVzIGluIHF1
YWQgU0RSIG1vZGUuIElmIGl0cyBpbiBvY3RhbCBtb2RlLCBzZW5kIDEyCmJ5dGVzLiBJZiBpdHMg
aW4gZHVhbCBtb2RlLCBzZW5kIDMgYnl0ZXMuIE9iaW91c2x5LCBpdCBjYW5ub3QgYmUgaW4Kc2lu
Z2xlIGJpdCBtb2RlLCBiZWNhdXNlIGl0IGNhbm5vdCBzZW5kIDEuNSBieXRlcy4uCgpJZiBpdCdz
IGZyZWVseSBwcm9ncmFtbWFibGUsIGl0IHdpbGwganVzdCB0ZWxsIHRoZSBoYXJkd2FyZSB0byBp
bnNlcnQKMTIgZHVtbXkgY2xvY2sgY3ljbGVzLgoKPj4gd2hhdCB0aGUgc2VtcGVyIG5hbm8gZmxh
c2ggdXNlcy4gSGFsZiBjeWNsZXM/IEJ1dCBhY2NvcmRpbmcgdG8geW91cgo+IAo+IHRoZXJlJ3Mg
bm8gc3BpbWVtIGZsYXNoIGNvZGUgdGhhdCB1c2UgaGFsZiBjeWNsZXMgZm9yIG5vdy4KCkFoaCwg
SSBqdXN0IHNhdyB0aGUgc2VtcGVyIGZsYXNoIGRvZXNuJ3Qgc3VwcG9ydCBEVFIgYXQgYWxsLiBP
ayB0aGVuLAptYWtlcyB0aGluZ3MgZXZlbiBzaW1wbGVyLgoKPj4gbmFtaW5nIHlvdSdkIHNwZWNp
ZnkgZnVsbCBjeWxjZXM/Cj4gCj4gQSBjbG9jayBwZXJpb2QsIHllcy4KCk9rLgoKLW1pY2hhZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
