Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2E7C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:51:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5264601FC
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5264601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bnlL8k4QTWhZQef8RQDk/pRTjZOYbmMg/3ycwDLWtDg=; b=EFsxRxJqSK8A4beE5LMvjKef4
	bawXMEeE5tjF2dMC66aCbtwfnVgxA0Qh60GUThhuGahI3wWAx+eUxwPSYWSmfZ4JdW/pGOPJq9Ehi
	tX+DEUReZme+vwTsKEsqqh1shcB9d9bzSoKu7Ga1bkuyS5TqnCcHaetQYONz/jWKmvO5EVvnR5Tar
	XS4sD4fgXPVrVdj+D/QPYE+YpBrtCc+Pxu/Zmv4tOfTvjCFF9yh9ymVO9ZF2HrNYLZ6SeDwdcOK3M
	jzfbLvFRTEK9NygSWSyOPSmTT1CufkzyTdQMJfTGh9v/0MuelU3EDCtXeS3NdKl7gQpRF2msFZJ/c
	3tokG4z1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4RA-00E97I-Dr; Mon, 10 May 2021 11:51:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3za-00E4Dl-36
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 11:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=m8WvOrHAGSF7Lu3uywVD8UXaaeSdhlGLfigIYHimD4Y=; b=VRShuQXekoVUC8MkZvBwlj9fRr
 wEJamRm4uXJb7Tv+8i7NWxDIEDGASkC7ZboWcdA0BLaERkihbu/hyM1BiLnWkCYpiN7Yg+zb4IEro
 qYd7Una4/sCkLnurH7StnBpdYSqoI/hHLGzlqsHss9512yhTXkNZvzOTJ+hoeKyElpZSlJNgxf7xD
 jDO2R2JK2342OWCRdjVyXiRWAY8+UKmfxMxvu5ntHokgtkXI1eqcUyU2FXM+7AXtUUf5L4XX2qT7C
 nb+pCZ7Nvo44HfHyiOJ0BM9dIRrV/gY8enopcMBBtJCC/oXA/p2mdrKQMzuVCNzMS8Gwu8s6wiOGx
 9RggVx3g==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3zW-008buW-K7
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 11:22:28 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BC1652224F;
 Mon, 10 May 2021 13:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620645744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8WvOrHAGSF7Lu3uywVD8UXaaeSdhlGLfigIYHimD4Y=;
 b=O9bO48d9dXcQQ9+n5ra2gRJSvEQk78HJWaHK+eeWKvEdbAdFYFvY5YeO1SOz2BU/0Fg1H/
 9W94skVmsIPbBmZrc6xflO3BeLMHul1hzStSC1AsTdPuCE4xCoQ/rQESofKKyMPpFQm9sY
 PCtRFhyNZck9PyCWluFFwSeUfO2quVQ=
MIME-Version: 1.0
Date: Mon, 10 May 2021 13:22:24 +0200
From: Michael Walle <michael@walle.cc>
To: David Bauer <mail@david-bauer.net>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
In-Reply-To: <f79a55f2-3f89-55a9-5cee-ae50d1fc0a47@david-bauer.net>
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
 <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
 <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
 <f79a55f2-3f89-55a9-5cee-ae50d1fc0a47@david-bauer.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <bccdfd0008c0f5482ae9f1b78dba3624@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_042226_993975_FF5B39EE 
X-CRM114-Status: GOOD (  31.00  )
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

SGkgRGF2aWQsCgpBbSAyMDIxLTA1LTEwIDEzOjA0LCBzY2hyaWViIERhdmlkIEJhdWVyOgo+IE9u
IDUvMTAvMjEgMTI6NTYgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IEFtIDIwMjEtMDUtMTAg
MTI6MjcsIHNjaHJpZWIgRGF2aWQgQmF1ZXI6Cj4+PiBPbiA1LzEwLzIxIDExOjM1IEFNLCBNaWNo
YWVsIFdhbGxlIHdyb3RlOgo+Pj4+IEFtIDIwMjEtMDUtMTAgMTE6MjgsIHNjaHJpZWIgRGF2aWQg
QmF1ZXI6Cj4+Pj4+IE9uIDUvMTAvMjEgMTA6MDAgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGUKPj4+
Pj4gCj4+Pj4+IFsuLi5dCj4+Pj4+IAo+Pj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNo
X2luZm8gYm9ob25nX3BhcnRzW10gPSB7Cj4+Pj4+Pj4gK8KgwqDCoCAvKiBCb0hvbmcgTWljcm9l
bGVjdHJvbmljcyAqLwo+Pj4+Pj4+ICvCoMKgwqAgeyAiYmgyNXExMjhhcyIsIElORk8oMHg2ODQw
MTgsIDAsIDY0ICogMTAyNCwgMjU2LAo+Pj4+Pj4gCj4+Pj4+PiBJIGNvdWxkbid0IGZpbmQgIkJv
SG9uZyIgaW4gSkVQMTA2QkMuIDB4NjggKHdpdGhvdXQgY29udGludWF0aW9uIAo+Pj4+Pj4gY29k
ZXMpCj4+Pj4+PiBpcyAiQ29udmV4IENvbXB1dGVyIi4gU28gdGhpcyBpcyB3cm9uZy4gT1RPSCBJ
J20gbm90IHN1cmUsIGhvdyAKPj4+Pj4+IG1hbnkKPj4+Pj4+IFNQSSBmbGFzaGVzICJjb252ZXgg
Y29tcHV0ZXIiIGhhdmUsIGlmIGFueSA7KSBUaGlzIGNvbXBhbnkgd2FzIAo+Pj4+Pj4gYnJvdWdo
dAo+Pj4+Pj4gYnkgSFAgaW4gdGhlIGVuZC4KPj4+Pj4+IAo+Pj4+Pj4gSW4gYW55IGNhc2UsIHRo
aXMgcGF0Y2ggZGVwZW5kcyBvbiBob3cgd2UgaGFuZGxlIGNvbnRpbnVhdGlvbiAKPj4+Pj4+IGNv
ZGVzIG9yCj4+Pj4+PiBpZiB3ZSBjYW4gaGFuZGxlIHRoZW0gYXQgYWxsLiBPciBpZiB0aGlzIGZs
YXNoIGp1c3QgbGllIGFib3V0IGl0cwo+Pj4+Pj4gbWFudWZhY3R1cmVyIGlkIGFuZCBkb24ndCBh
bmQgQ0MuCj4+Pj4+IAo+Pj4+PiBGaXJzdCBvZiBhbGwsIEJvSG9uZyBhbmQgQm95YSBtaWNyb2Vs
ZWN0cm9uaWNzIHNlZW1zIHRvIGJlIHRoZSBzYW1lCj4+Pj4+IGNvbXBhbnksIGFzIHRoZWlyIGRh
dGFzaGVldHMgc2VlbSB0byBjb3B5IGVhY2ggb3RoZXIuIFRoZXJlJ3Mgbm90IAo+Pj4+PiBtdWNo
Cj4+Pj4+IGluZm9ybWF0aW9uIGFib3V0IGVpdGhlciBvZiBib3RoLCBzbyBJJ2Qgc2F5IHRoYXQn
cyBhIGZhaXIgCj4+Pj4+IGFzc3VtcHRpb24uCj4+Pj4+IAo+Pj4+PiBSZWdhcmRpbmcgdGhlIGNv
bnRpbnVhdGlvbiBjb2RlcywgQm95YSBpcyBsaXN0ZWQgaW4gYmFuayBuaW5lLCAKPj4+Pj4gaG93
ZXZlcgo+Pj4+PiBpbiB0aGlzIGNhc2UgSSBzaG91bGQgY3VycmVudGx5IHJlYWQgYW4gYWxsIDB4
N2YgSUQgc2hvdWxkbid0IEk/Cj4+Pj4gCj4+Pj4gSSdkIGd1ZXNzIHNvLCB5ZXMuCj4+Pj4gCj4+
Pj4+IFRoZSBkYXRhc2hlZXQgYWxzbyBvbmx5IHNwZWNpZmllcyAzIGJ5dGVzIGFzIGEgcmV0dXJu
IHZhbHVlIGZvcgo+Pj4+PiByZWdpc3RlciAweDlmaCA6KAo+Pj4+IAo+Pj4+IFllYWguIFNvLCB0
aGlzIGZsYXNoIGZhbGxzIGludG8gdGhlIHNhbWUgY2F0ZWdvcnkgInNpbXBseSBoaWphY2tzCj4+
Pj4gYSBtYW51ZiBpZCIgYXMgYWxsIHRoZSBvdGhlciBmbGFzaGVzLgo+Pj4gCj4+PiBGcm9tIGEg
cXVpY2sgY2hlY2ssIHRoaXMgaXMgYWxzbyBiZSB0aGUgY2FzZSBmb3IgR2lnYURldmljZXMgYW5k
IFhNQy4KPj4+IAo+Pj4gTXkgc3BvbnRhbmVvdXMgaWRlYSB3b3VsZCBiZSB0byBleHRlbmQgc3Vw
cG9ydCBmb3IgSkVERUMgSURzIHRvIHJlYWQKPj4+IHRoZSB1cCB0byA5IGJhbmtzIG9mIHRoZSB2
ZW5kb3IgSUQgYW5kIGZpeCB1cCB0aGUgZXhpc3Rpbmcgb2ZmZW5kZXJzLgo+PiAKPj4geW91IG1l
YW4gZ2lnYWRldmljZXMgYW5kIHhtYz8gSSdkIHByZXN1bWUgdGhleSBhcmUgYWxzbyBsYWNraW5n
IHRoZQo+PiBjb250aW51YXRpb24gYnl0ZXMuCj4gCj4gQ29ycmVjdCwgc2FtZSBzdG9yeSB3aXRo
IHRoZW0uCj4gCj4+IAo+Pj4gVG8gbm90IGJyZWFrIGV4aXN0aW5nIGJvYXJkcywgd2UgY291bGQg
ZWl0aGVyIHNraXAgdGhlIGNvbnRpbnVhdGlvbgo+Pj4gYnl0ZXMgb2YgdGhlIGtlcm5lbCBJRCBk
ZWZpbml0aW9ucyBmb3IgYWxsIGZsYXNoIGNoaXBzIG9yIGZsYWcgdGhlCj4+PiBhbHJlYWR5IGV4
aXN0aW5nIG9uZXMgYW5kIG9ubHkgcGVyZm9ybSB0aGlzIG9uIHN1Y2ggZmxhZ2dlZCBjaGlwcy4K
Pj4+IAo+Pj4gUGVyc29uYWxseSwgSSdkIHNheSB0aGF0IG9ubHkgcGVyZm9ybWluZyB0aGlzIG9u
IGV4aXN0aW5nIGNoaXBzIHdvdWxkCj4+PiBiZSBiZXR0ZXIsIGFzIG5ldyB2ZW5kb3JzIHdpdGgg
dGhpcyB2aW9sYXRpb24gc2NoZW1lIG1pZ2h0IHByb2JhYmx5Cj4+PiBhcHBlYXIgYW5kIGNhdXNl
IGNvbmZsaWN0cy4KPj4+IAo+Pj4gQXMgd2Ugc3RpbGwgbGFjayBhdXRvIGRldGVjdGlvbiBmb3Ig
bmV3IGNoaXBzIHdpdGggdGhhdCwgY29uZmlndXJpbmcKPj4+IHRoZSBmbGFzaCBjaGlwIHVzZWQg
d2l0aCB0aGUgY2hpcCBuYW1lIHZpYSBEVCB3b3VsZCBhbGxvdyB0byBzZXQgdGhlCj4+PiBleGFj
dCBjaGlwIHVzZWQgYW5kIGFsc28gdmFsaWRhdGUgaWYgdGhlIG1hbnVmYWN0dXJlciAvIHByb2R1
Y3QgYWZ0ZXIKPj4+IHRoZSBjb250aW51YXRpb24gYml0cyBtYXRjaGVzIHRoZSBvbmUgcmVhZCBm
cm9tIHRoZSBjaGlwLgo+Pj4gCj4+PiBXaGF0IGRvIHlvdSB0aGluaz8KPj4gCj4+IElmIHlvdSdk
IGFzayBtZSwgdW5sZXNzIHRoZXJlIGlzIGEgcmVhbCB3b3JsZCBjb25mbGljdCwgSSdkIGp1c3Qg
Z28KPj4gYWhlYWQgYW5kIGFkZCB0aGVtIGFzIGlzLiBJZiB0aGVyZSBpcyBhIGNvbmZsaWN0IHdl
J2QgbmVlZCB0byBmaW5kCj4+IGEgcGVyIGRldmljZSByZXNvbHV0aW9uIGZvciBpdC4KPiAKPiBP
a2F5LCBJJ2xsIHJlc2VuZCBhIHYyIHdpdGggdGhlIHJlbW92ZWQgY29weXJpZ2h0IHRoZW4uCgpD
b3VsZCB5b3UgYWxzbyBhcHBseSBteSBTRkRQIHBhdGNoIFsxXSBhbmQgc2VuZCB0aGUgZHVtcCAo
aWYgdGhlcmUKaXMgYW55KT8gVW5mb3J0dW5hdGVseSwgSSBjYW4ndCB0aGluayBvZiBhIGdvb2Qg
d2F5IHRvIGRvIHRoYXQgYWxvbmcKd2l0aCB0aGUgcGF0Y2ggYW5kIGlmIHRoaXMgaW4gc29tZSB3
YXkgcmVnYXJkZWQgYXMgY29weXJpZ2h0ZWQgbWF0ZXJpYWwuClNvIGZlZWwgZnJlZSB0byBzZW5k
IGl0IHRvIG1lIHByaXZhdGVseS4gSSdtIHN0YXJ0aW5nIHRvIGJ1aWxkIGEKZGF0YWJhc2UuCgo+
PiBUaGVyZSBpcyBhbm90aGVyIHByb2JsZW06IHNoYXJlZCBkZXZpY2UgaWRzIHBlciB2ZW5kb3Iu
IFNvbWUgKG1vc3Q/KQo+PiBmbGFzaCB2ZW5kb3Igc2hhcmUgZGV2aWNlIGlkcyBvbiAic2ltaWxh
ciIgZmxhc2hlcywgd2hpY2ggd2Ugc3RpbGwKPj4gbmVlZCB0ZWxsIGFwYXJ0IGluIHRoZSBrZXJu
ZWwuIFNvIHRlY2huaWNhbGx5LCB0aGlzIGlzIHRoZSBzYW1lIAo+PiBwcm9ibGVtCj4+IGFzIHdp
dGggbm9uLWV4aXN0aW5nIGNvbnRpbnVhdGlvbiBieXRlcy4gVHdvIGRpZmZlcmVudCBmbGFzaGVz
IHNoYXJpbmcKPj4gdGhlIHNhbWUgaWQuIEZvciBub3csIHdlIGxvb2sgZm9yIGRpZmZlcmVuY2Vz
IGluIHRoZSBTRkRQLgo+PiAKPj4gUmlnaHQgbm93LCB0aGUgZmxhc2ggaXMgcHJvYmVkIGZpcnN0
IGJ5IGl0cyBpZCBhbmQgdGhlIHRoZSBTRkRQIGlzCj4+IHJlYWQgYW5kIHBhcnNlZC4gVGhlcmUg
YXJlIGlkZWFzIHRvIGZpcnN0IHJlYWQgdGhlIFNGRFAuIEhhdmluZyB0aGlzCj4+IG1pZ2h0IGNv
bWUgaW4gaGFuZHkgaGVyZSwgdG9vLiBFZy4gd2UgY291bGQgZmluZ2VycHJpbnQgdGhlIGZsYXNo
Cj4+IGJ5IGl0cyBTRkRQLgo+IAo+IEkgd2FzIGFsc28gdGhpbmtpbmcgYWJvdXQgdGhhdCBhbmQg
d2UncmUgYWxzbyBhbHJlYWR5IGJpdHRlbiBieSAKPiBpZGVudGljYWwKPiBKRURFQyBJRHMgZm9y
IGRpZmZlcmVudCBtb2RlbHMuIEl0J3MgcmVhbGx5IGEgcGl0eSB0aGF0IHRoZXJlIGlzIG5vIAo+
IHJlYWwKPiB1bmlxdWUgbW9kZWwgaWRlbnRpZmllciBmb3IgdXMgdG8gdXNlLCB3aGljaCBpcyBu
b3QgaGFja2VkIHRvIHN1cHBvcnQKPiBsZWdhY3kgaW1wbGVtZW50YXRpb25zIGxpa2Ugd2l0aCB0
aGlzIGNoaXAgOigKClVuZm9ydHVuYXRlbHksIHRoZXkgYXJlbid0IGxlZ2FjeSBhbmQgbmV3IGNo
aXBzIHN0aWxsIGhhdmUgdGhpcwpiZWhhdmlvci4uCgotbWljaGFlbAoKWzFdIApodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMTA1MDMxNTU2NTEuMzA4ODktMS1taWNoYWVsQHdh
bGxlLmNjLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
