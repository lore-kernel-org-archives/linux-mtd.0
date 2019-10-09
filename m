Return-Path: <SRS0=yFhR=YC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4510ECE58C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2019 20:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EFA6206B6
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2019 20:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ed58kXfy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EFA6206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyMBwBmmYxshPmpsX0zaqa2wEiIM3u6W6uRzetkeqwg=; b=Ed58kXfygu7UEe
	IpZy/WQ2gp04+Enh2ttdaJJa79ecO1bCMMLIM/tGaF0dYGmDBoAMTcp2t9m51uFghgIY5dv1GS7b7
	9GtKjMIEWkOjPq4J0mNlv96Rp9+nOzQKwM/Cjqtw04CcmpKwhHZa8QVb9H1tw9Rt6eGHq612m4Haj
	4hwSJ5NPs7OJ+q/xE4RDO3HCmTRc1QhkFDQkaDj0Slf7nfwvTVXEOrvQo+w8yZlKX/038Vy0rcn0v
	/0Um8cbydAznPtHMvTBmH12PtIv5i5o9FqzKC+G5I2gWFMhl0zi2hQ8nY06kn1kLencAWFoFbx5eJ
	o7IiyP2e57cnw0vsSK9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIJ0K-00036C-BU; Wed, 09 Oct 2019 20:56:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIJ07-0002ya-U8; Wed, 09 Oct 2019 20:56:05 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 89B7C2603FE;
 Wed,  9 Oct 2019 21:55:58 +0100 (BST)
Date: Wed, 9 Oct 2019 22:55:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Message-ID: <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_135604_236716_79A777D5 
X-CRM114-Status: GOOD (  21.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Andrew Jeffery <andrew@aj.id.au>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2VkcmljLAoKT24gRnJpLCAgNCBPY3QgMjAxOSAxMzo1OTowMyArMDIwMApDw6lkcmljIExl
IEdvYXRlciA8Y2xnQGthb2Qub3JnPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gVGhpcyBzZXJpZXMg
Zmlyc3QgZXh0ZW5kcyB0aGUgc3VwcG9ydCBmb3IgdGhlIEFzcGVlZCBBU1QyNTAwIGFuZAo+IEFT
VDI0MDAgU01DIGRyaXZlci4gSXQgYWRkcyBEdWFsIERhdGEgc3VwcG9ydCBhbmQgcmVhZCB0cmFp
bmluZyBnaXZpbmcKPiB0aGUgYmVzdCByZWFkIHNldHRpbmdzIGZvciBhIGdpdmVuIGNoaXAuIFN1
cHBvcnQgZm9yIHRoZSBuZXcgQVNUMjYwMAo+IFNvQyBpcyBhZGRlZCBhdCB0aGUgZW5kLgo+IAo+
IEkgdW5kZXJzdGFuZCB0aGF0IGEgbmV3IHNwaV9tZW0gZnJhbWV3b3JrIGV4aXN0cyBhbmQgSSBk
byBoYXZlIGFuCj4gZXhwZXJpbWVudGFsIGRyaXZlciB1c2luZyBpdC4gQnV0IHVuZm9ydHVuYXRl
bHksIGl0IGlzIGRpZmZpY3VsdCB0bwo+IGludGVncmF0ZSB0aGUgcmVhZCB0cmFpbmluZy4gVGhl
IEFzcGVlZCBjb25zdHJhaW50cyBhcmUgbm90IGNvbXBhdGlibGUKPiBhbmQgaSBoYXZlbid0IGhh
ZCB0aGUgdGltZSB0byBleHRlbmQgdGhlIGN1cnJlbnQgZnJhbWV3b3JrLgoKSG0sIEkgZG9uJ3Qg
dGhpbmsgdGhhdCdzIGEgZ29vZCByZWFzb24gdG8gcHVzaCBuZXcgZmVhdHVyZXMgdG8gdGhlCmV4
aXN0aW5nIGRyaXZlciwgZXNwZWNpYWxseSBzaW5jZSBJIGFza2VkIG90aGVycyB0byBtaWdyYXRl
IHRoZWlyCmRyaXZlcnMgdG8gc3BpLW1lbSBpbiB0aGUgcGFzdC4gSSBkbyB1bmRlcnN0YW5kIHlv
dXIgY29uY2VybnMsIGFuZCBJJ2xsCmxldCB0aGUgU1BJIE5PUi9NVEQgbWFpbnRhaW5lcnMgbWFr
ZSB0aGUgZmluYWwgY2FsbCwgYnV0IEkgdGhpbmsgaXQnZApiZSBiZXR0ZXIgZm9yIHRoZSBTUEkg
TUVNIGVjb3N5c3RlbSB0byB0aGluayBhYm91dCB0aGlzIGxpbmstdHJhaW5pbmcKQVBJIChWaWdu
ZXNoIG5lZWRzIGl0IGZvciB0aGUgQ2FkZW5jZSBkcml2ZXIgSUlSQykgcmF0aGVyIHRoYW4gcHVz
aGluZwp0aGlzIGtpbmQgb2YgZmVhdHVyZSB0byBzcGktbm9yIGNvbnRyb2xsZXIgZHJpdmVycy4K
Cj4gCj4gVGhpcyBwYXRjaHNldCBoYXMgYmVlbiBpbiB1c2UgZm9yIHNvbWUgdGltZSBpbiB0aGUg
T3BlbkJNQyBrZXJuZWwgb24KPiB0aGVzZSBzeXN0ZW1zIDoKPiAKPiAgKiBPcGVuUE9XRVIgUGFs
bWV0dG8gKEFTVDI0MDApCj4gICogRXZhbHVhdGlvbiBib2FyZCAoQVNUMjUwMCkgCj4gICogT3Bl
blBPV0VSIFdpdGhlcnNwb29uIChBU1QyNTAwKQo+ICAqIE9wZW5QT1dFUiBSb211bHVzIChBU1Qy
NTAwKQo+ICAqIE9wZW5QT1dFUiBaYWl1cyAoQVNUMjUwMCkKPiAgICBhbmQgbWFueSBvdGhlcnMK
PiAgCj4gYW5kIGl0IGlzIG5vdyBpbiB1c2Ugb24gdGhlc2UgYm9hcmRzIHdpdGggdGhlIG5ldyBT
b0MgOgo+IAo+ICAqIEV2YWx1YXRpb24gYm9hcmQgKEFTVDI2MDApIAo+ICAqIFRhY29tYSBib2Fy
ZCAoQVNUMjYwMCkgCj4gCj4gVGhhbmtzLAo+IAo+IEMuCj4gCj4gQWxleGFuZGVyIFNvbGRhdG92
ICgxKToKPiAgIG10ZDogc3BpLW5vcjogZml4IG9wdGlvbnMgZm9yIG14NjZsNTEyMzVmCj4gCj4g
Q8OpZHJpYyBMZSBHb2F0ZXIgKDE1KToKPiAgIG10ZDogc3BpLW5vcjogYXNwZWVkOiBVc2UgY29t
bWFuZCBtb2RlIGZvciByZWFkcwo+ICAgbXRkOiBzcGktbm9yOiBhc3BlZWQ6IEFkZCBzdXBwb3J0
IGZvciBTUEkgZHVhbCBJTyByZWFkIG1vZGUKPiAgIG10ZDogc3BpLW5vcjogYXNwZWVkOiBMaW5r
IGNvbnRyb2xsZXIgd2l0aCB0aGUgYWhiIGNsb2NrCj4gICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDog
QWRkIHJlYWQgdHJhaW5pbmcKPiAgIG10ZDogc3BpLW5vcjogYXNwZWVkOiBMaW1pdCB0aGUgbWF4
aW11bSBTUEkgZnJlcXVlbmN5Cj4gICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogQWRkIHN1cHBvcnQg
Zm9yIHRoZSA0QiBvcGNvZGVzCj4gICBtdGQ6IHNwaS1ub3I6IEFkZCBzdXBwb3J0IGZvciB3MjVx
NTEyanYKPiAgIG10ZDogc3BpLW5vcjogYXNwZWVkOiBJbnRyb2R1Y2UgYSBmaWVsZCBmb3IgdGhl
IEFIQiBwaHlzaWNhbCBhZGRyZXNzCj4gICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogSW50cm9kdWNl
IHNlZ21lbnQgb3BlcmF0aW9ucwo+ICAgZHQtYmluZGluZ3M6IG10ZDogYXNwZWVkLXNtYzogQWRk
IG5ldyBjb21wdGF0aWJsZSBmb3IgQVNUMjYwMAo+ICAgbXRkOiBzcGktbm9yOiBhc3BlZWQ6IEFk
ZCBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBBU1QyNjAwCj4gICBtdGQ6IHNwaS1ub3I6IGFzcGVl
ZDogQ2hlY2sgZm9yIGRpc2FibGVkIHNlZ21lbnRzIG9uIHRoZSBBU1QyNjAwCj4gICBtdGQ6IHNw
aS1ub3I6IGFzcGVlZDogSW50cm9kdWNlIHRyYWluaW5nIG9wZXJhdGlvbnMgcGVyIHBsYXRmb3Jt
Cj4gICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogSW50cm9kdWNlIGEgSENMSyBtYXNrIGZvciB0cmFp
bmluZwo+ICAgbXRkOiBzcGktbm9yOiBhc3BlZWQ6IEFkZCByZWFkIHRyYWluaW5nIHN1cHBvcnQg
Zm9yIHRoZSBBU1QyNjAwCj4gCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNtYy5jICAg
ICAgICAgICAgICB8IDU5MyArKysrKysrKysrKysrKysrLS0KPiAgZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGktbm9yLmMgICAgICAgICAgICAgICAgIHwgICA1ICstCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9hc3BlZWQtc21jLnR4dCAgICB8ICAgMiArCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NTUxIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
