Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30578C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 16:48:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7241233E2
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 16:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7241233E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j30ckVs0wHzH+zYDu4gbwAU53yIkQC6ra9xmm1C2UV8=; b=ifXxitwACOXh6qBp1fGb/8Sjb
	iX/jPVB+Mf+jgM6lJYio0cI1EsM69npmJaJi1NIpkwiIp3cab7xwUW/Z8RQkt5pT7Yxtv/qXIZHKe
	WDXTmrp4cucVObn0LdRtPaDaPmOQ0Q3+OKnaBiHq74cfKY84OEIcwSNRLjf7dhQTar3WiokbFspCN
	NpE1mv8o7IASWtig18p4TcG2Jwb23VHA/TjLl6HtDDF8wfQSAUMUzcmHoByupyXSA5rBRVHJLO5Ha
	KK8OpZ6rGictiJavayM5ephxA/CFU6T4XwdQ3Z+RGFRqlRmOVOvaniQvVEyl2X5G1OcN0vTFSk4Je
	lRiS4xMEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Gdq-0005Ju-DW; Wed, 20 Jan 2021 16:47:34 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Gdn-0005IX-1s
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 16:47:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D72EE22727;
 Wed, 20 Jan 2021 17:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611161246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4wx+DAuNXnn48tFtGcIcB1I4EME04LspQ3CfIceYDY=;
 b=dHh95gnl5GLBDRo3Z5fa/8fhWWMxqKQ89fCrkyEnESYB2/l7R23AGYxeaHB4Fyt9XhiSGU
 NhMkKiLgTBnyXQfJF2+TA3xKMi4gEeK9HBrH+mjnyEjhDxFQAS2PmScyf74BUThpFFIrfB
 3NgdV7M9kUOikDrNuwFbYbPX/+JFLBw=
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 17:47:25 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
In-Reply-To: <6c4adaa7-9397-2373-16aa-a3dd2775c63f@microchip.com>
References: <20210120131914.277363-1-tudor.ambarus@microchip.com>
 <20210120131914.277363-2-tudor.ambarus@microchip.com>
 <b3a61abec8927c7229c27415d2c769a8@walle.cc>
 <ad0cc416-73b7-f626-115f-d192fac17957@microchip.com>
 <447aca9c61a45b05f7869b9747e2c301@walle.cc>
 <8a0e7885-4b9e-be62-eb46-1af74c65afa8@microchip.com>
 <e1e5f647fd9e91538fd730c626beff52@walle.cc>
 <6c4adaa7-9397-2373-16aa-a3dd2775c63f@microchip.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <c62393288e9d82b08d14d74a9a8389ad@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_114731_197629_65B8FAE6 
X-CRM114-Status: GOOD (  19.62  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kavyasree.Kotagiri@microchip.com,
 miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wMS0yMCAxNzoyNSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMS8yMC8yMSA1OjQ5IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIxLTAxLTIwIDE2OjM5LCBz
Y2hyaWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4+IE9uIDEvMjAvMjEgNTowMiBQ
TSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSAKPj4+PiBrbm93Cj4+Pj4gdGhl
IGNvbnRlbnQgaXMgc2FmZQo+Pj4+IAo+Pj4+IEFtIDIwMjEtMDEtMjAgMTU6NTIsIHNjaHJpZWIg
VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOgo+Pj4+PiBPbiAxLzIwLzIxIDQ6MDUgUE0sIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc3N0LmMgCj4+Pj4+Pj4gYi9kcml2ZXJzL210ZC9zcGktbm9yL3NzdC5jCj4+Pj4+Pj4gaW5k
ZXggMDBlNDhkYTA3NDRhLi5kNmUxMzk2YWJiOTYgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zc3QuYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0
LmMKPj4+Pj4+PiBAQCAtOCw2ICs4LDM5IEBACj4+Pj4+Pj4gCj4+Pj4+Pj4gwqAjaW5jbHVkZSAi
Y29yZS5oIgo+Pj4+Pj4+IAo+Pj4+Pj4+ICtzdGF0aWMgaW50IHNzdDI2dmZfbG9jayhzdHJ1Y3Qg
c3BpX25vciAqbm9yLCBsb2ZmX3Qgb2ZzLCAKPj4+Pj4+PiB1aW50NjRfdAo+Pj4+Pj4+IGxlbikK
Pj4+Pj4+PiArewo+Pj4+Pj4+ICvCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pj4+Pj4g
K30KPj4+Pj4+PiArCj4+Pj4+Pj4gK3N0YXRpYyBpbnQgc3N0MjZ2Zl91bmxvY2soc3RydWN0IHNw
aV9ub3IgKm5vciwgbG9mZl90IG9mcywKPj4+Pj4+PiB1aW50NjRfdAo+Pj4+Pj4+IGxlbikKPj4+
Pj4+PiArewo+Pj4+Pj4+ICvCoMKgwqDCoCBpZiAob2ZzID09IDAgJiYgbGVuID09IG5vci0+cGFy
YW1zLT5zaXplKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHNwaV9u
b3JfZ2xvYmFsX2Jsb2NrX3VubG9jayhub3IpOwo+Pj4+Pj4gCj4+Pj4+PiAKPj4+Pj4+IFNvbWUg
YmxvY2tzIG1pZ2h0IG5vdCBiZSB1bmxvY2tlZCBiZWNhdXNlIHRoZXkgYXJlIHBlcm1hbmVudGx5
Cj4+Pj4+PiBsb2NrZWQuIERvZXMgaXQgbWFrZSBzZW5zZSB0byByZWFkIEJQTlYgb2YgdGhlIGNv
bnRyb2wgcmVnaXN0ZXIKPj4+Pj4+IGFuZCBhZGQgYSBkZWJ1ZyBtZXNzYWdlIGhlcmU/Cj4+Pj4+
IAo+Pj4+PiBJdCB3b3VsZCwgeWVzLiBJZiBhbnkgYmxvY2sgaXMgcGVybWFuZW50bHkgbG9ja2Vk
IGluIHRoZSB1bmxvY2tfYWxsCj4+Pj4+IGNhc2UsCj4+Pj4+IEknbGwganVzdCBwcmludCBhIGRi
ZyBtZXNzYWdlIGFuZCByZXR1cm4gLUVJTlZBTC4gU291bmRzIGdvb2Q/Cj4+Pj4gCj4+Pj4gc3Bp
X25vcl9zcl91bmxvY2soKSwgYXRtZWxfYXQyNWZzX3VubG9jaygpIGFuZAo+Pj4+IGF0bWVsX2ds
b2JhbF91bnByb3RlY3QoKQo+Pj4+IHdpbGwgcmV0dXJuIC1FSU8gaW4gY2FzZSB0aGUgU1Igd2Fz
bid0IHdyaXRhYmxlLgo+Pj4gCj4+PiBZb3UgbWVhbiBpbiB0aGUgc3BpX25vcl93cml0ZV9zcl9h
bmRfY2hlY2soKSBjYWxscy4gLUVJTyBpcyBmaW5lCj4+PiB0aGVyZSBpZiB3aGF0IHdlIHdyb3Rl
IGlzIGRpZmZlcmVudCB0aGFuIHdoYXQgd2UgcmVhZCBiYWNrLCBpdCB3b3VsZAo+Pj4gaW5kaWNh
dGUgYW4gSU8gZXJyb3IuCj4+PiAKPj4+IEdCVUxLIGNvbW1hbmQgY2xlYXJzIGFsbCB0aGUgd3Jp
dGUtcHJvdGVjdGlvbiBiaXRzIGluIHRoZSBCbG9jawo+Pj4gUHJvdGVjdGlvbiByZWdpc3Rlciwg
ZXhjZXB0IGZvciB0aG9zZSBiaXRzIHRoYXQgaGF2ZSBiZWVuIHBlcm1hbmVudGx5Cj4+PiBsb2Nr
ZWQgZG93bi4gU28gZXZlbiBpZiB3ZSBoYXZlIGZldyBibG9ja3MgcGVybWFuZW50bHkgbG9ja2Vk
LCBpLmUuCj4+PiBDUi5CUE5WID09IDEsIHRoZSBHQlVMSyBjYW4gY2xlYXIgdGhlIHByb3RlY3Rp
b24gZm9yIHRoZSByZW1haW5pbmcKPj4+IGJsb2Nrcy4gU28gbm90IHJlYWxseSBhbiBJTyBlcnJv
ciwgYnV0IHJhdGhlciBhbiAtRUlOVkFMLCBiZWNhdXNlCj4+PiB0aGUgdXNlciBhc2tzIHRvIHVu
bG9jayBtb3JlIHRoYW4gd2UgY2FuLgo+PiAKPj4gRG9lc24ndCBFSU5WQUwgaW5kaWNhdGUgd3Jv
bmcgcGFyYW1ldGVycywgYnV0IGRvZXMgbm90aGluZz8gSW4gdGhpcwo+PiBjYXNlLCB1bmxvY2sg
d291bGQgYmUgcGFydGlhbGx5IHN1Y2Nlc3NmdWwuCj4+IAo+IHllcywgdGhhdCdzIHdoYXQgSSBz
YWlkIEknbGwgZG86ICJJZiBhbnkgYmxvY2sgaXMgcGVybWFuZW50bHkgbG9ja2VkCj4gaW4gdGhl
IHVubG9ja19hbGwgY2FzZSwgSSdsbCBqdXN0IHByaW50IGEgZGJnIG1lc3NhZ2UgYW5kIHJldHVy
biAKPiAtRUlOVkFMIiwKPiB3aXRob3V0IHNlbmRpbmcgYSBHQlVMSyBjbWQuIENhbGxlciB3cm9u
Z2x5IGFza3MgdG8gdW5sb2NrIGFsbCwgd2hlbiB3ZQo+IGNhbiBqdXN0IHVubG9jayBwYXJ0aWFs
IG1lbW9yeS4KCkRvaCwgSSd2ZSBtaXNzZWQgdGhhdCB5b3Ugd2lsbCBkbyBpdCBiZWZvcmVoYW5k
LiBZZXMgdGhlbiBFSU5WQUwKaXMgZmluZSBieSBtZS4KCkJ1dCB5b3Ugd29uJ3QgdW5sb2NrIHRo
ZSBmbGFzaCBkdXJpbmcgc3RhcnR1cCAoZ2l2ZW4gdGhlIGNvbmZpZyBvcHRpb24KaXMgZW5hYmxl
ZCkgaWYgYW55IGJsb2NrcyBoYXMgYmVlbiBwZXJtYW5lbnRseSBsb2NrZWQuIFRodXMgaWYganVz
dCB0aGUKdG9wbW9zdCA0ayBibG9jayBpcyBwZXJtYW5lbnRseSBsb2NrZWQgZG93biwgdGhlIHdo
b2xlIGZsYXNoIHdvdWxkbid0IGJlCndyaXRhYmxlLCByaWdodD8uIEkgZG9uJ3QgaGF2ZSBhIHN0
cm9uZyBvcGluaW9uIG9uIHRoYXQuCgotbWljaGFlbAoKPiAKPiBJdCdzIHNpbWlsYXIgdG8gd2hh
dCBpcyBhdDoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0L3RyZWUvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM/aD1zcGktbm9y
L25leHQjbjE5NDYKPiAKPj4gSW4gYW55IGNhc2UsIG15IHBvaW50IHdhcyB0aGF0IGRlcGVuZGlu
ZyBvbiB0aGUgdW5kZXJseWluZyBsb2NraW5nCj4+IG9wcywgZWl0aGVyIC1FSU8gb3IgLUVJTlZB
TCBpcyByZXR1cm5lZCBpZiBzcGlfbm9yX3VubG9jaygpIGZhaWxzCj4+IGZvciB0aGUgc2FtZSBy
ZWFzb24sIHRoYXQgaXMgdW5sb2NrKCkgd2Fzbid0IHBvc3NpYmxlIGJlY2F1c2Ugb2YKPj4gc29t
ZSBzb3J0IG9mIGhhcmR3YXJlIHdyaXRlIHByb3RlY3Rpb24uIEFuZCBJTUhPIGl0IHNob3VsZCBy
ZXR1cm4KPj4gdGhlIHNhbWUgZXJybm8gKHdoYXRldmVyIHRoZSBjb3JyZWN0IGVycm5vIGlzIGlu
IHRoaXMgY2FzZSkuCj4+IAo+IAo+IEJ1dCB0aGUgcmVhc29ucyBhcmUgZGlmZmVyZW50OiAxL2Nh
bGxlciB3cm9uZ2x5IGFza3MgdG8gdW5sb2NrCj4gbW9yZSB0aGFuIHdlIGNhbiwgdGh1cyAtRUlO
VkFMIDIvIC1FSU8gd2hlbiB3ZSBkb24ndCByZWFkIHdoYXQKPiB3ZSBleHBlY3QgdG8gcmVhZC4K
Ci1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
