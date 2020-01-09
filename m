Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634ACC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2983A2067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIQTcoQv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2983A2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJkQ2zWmKeNd7X37ssUS3IsjDzpIj/F4eJ5x5km/Bio=; b=pIQTcoQvp6TyDU
	NRihnJ2fRab6YSwRIns7yRILQvvwB56EV9onKRwnlhafRoGhO3yOEAML62iUpbaC7no52lQ8zY1OU
	V6U1a5Eml8r2KQ6UwqEpSuj3wsGOqFPZBq7qAQEfqWtX4sjiPE1cHjGoSlXqYXNyzpXNjNEBMkbnG
	iYLPS+A3vaQ/G4K2PMRfTtrKkglx1jLC6Uw5uv0zuXqBqebp5uCQQOK6cwv83mwXNoZu1a0DBKvii
	Ljvxxl4GBYrtwfVgcUUjsknsIkZdUX2VM2ixIj3+vhqylxmze6tQHobudqwg+LQlGNclsWRI5etHo
	/U+zmIcGCeHLtlHfsflg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipahi-0007NK-7F; Thu, 09 Jan 2020 16:30:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipahc-00079s-Sa
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:30:36 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E41DA2000E;
 Thu,  9 Jan 2020 16:30:29 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:30:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix NAND device
 bindings
Message-ID: <20200109173028.09de5f08@xps13>
In-Reply-To: <1571902807-10388-3-git-send-email-masonccyang@mxic.com.tw>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
 <1571902807-10388-3-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_083033_067991_5D6D4A78 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
VGh1LCAyNCBPY3QgMjAxOSAxNTo0MDowNworMDgwMDoKCj4gRG9jdW1lbnQgdGhlIGJpbmRpbmdz
IHVzZWQgYnkgdGhlIE1hY3Jvbml4IE5BTkQgZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1h
c29uIFlhbmcgPG1hc29uY2N5YW5nQG14aWMuY29tLnR3Pgo+IC0tLQo+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQgICAgICAgIHwgMjAgKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNy
b25peC50eHQKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAuLmNiNjAzNTgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dAo+IEBAIC0wLDAgKzEsMjAg
QEAKPiArTWFjcm9uaXggTkFORHMgRGV2aWNlIFRyZWUgQmluZGluZ3MKPiArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK01hY3Jvbml4IE5BTkRzIHN1cHBvcnQgcmFu
ZG9taXplciBvcGVyYXRpb24gZm9yIHVzZXIgZGF0YSBzY3JhbWJsZWQsCj4gK3doaWNoIGNhbiBi
ZSBlbmFibGVkIHdpdGggYSBTRVRfRkVBVFVSRS4gVGhlIHBlbmFsdHkgb2YgcmFuZG9taXplcgo+
ICtpcyBzdWJwYWdlIGFjY2Vzc2VzIHByb2hpYml0ZWQuIEJ5IGFkZGluZyBhIG5ldyBzcGVjaWZp
YyBwcm9wZXJ0eQo+ICtpbiBjaGlsZHJlbiBub2RlcyB0byBlbmFibGUgcmFuZG9taXplciBmdW5j
dGlvbi4KCllvdSBkb24ndCBtZW50aW9uIHRoZSBwZXJmb3JtYW5jZSBwZW5hbHR5IG5vciB0aGUg
YmVuZWZpdHMgb2Ygc3VjaApvcGVyYXRpb24uCgpQbGVhc2UgYWxzbyBpbnNpc3Qgb24gdGhlIGZh
Y3QgdGhhdCB0aGlzIGlzIGEgb25lIHRpbWUgcGVyc2lzdGVudCwgbm9uCnJldmVyc2libGUgb3Bl
cmF0aW9uIGFuZCB0aGUgdXNlIHNob3VsZCB1c2UgdGhpcyBwcm9wZXJ0eSBvbmx5IGlmIHRoZXkK
a25vdyB3aGF0IHRoZXkgYXJlIGRvaW5nIQoKPiArCj4gK1JlcXVpcmVkIE5BTkQgY2hpcCBwcm9w
ZXJ0aWVzIGluIGNoaWxkcmVuIG1vZGU6Cj4gKy0gcmFuZG9taXplciBlbmFibGU6IHNob3VsZCBi
ZSAibXhpYyxlbmFibGUtcmFuZG9taXplci1vdHAiCj4gKwo+ICtFeGFtcGxlOgo+ICsKPiArCW5h
bmQ6IG5hbmQtY29udHJvbGxlckB1bml0LWFkZHJlc3Mgewo+ICsKPiArCQluYW5kQDAgewo+ICsJ
CQlyZWcgPSA8MD47Cj4gKwkJCW14aWMsZW5hYmxlLXJhbmRvbWl6ZXItb3RwOwo+ICsJCX07Cj4g
Kwl9OwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
