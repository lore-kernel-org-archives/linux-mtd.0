Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BD0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 07:17:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE742073E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 07:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XI+26FP3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE742073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EsOaunjKuMvDml2ZvIJlict7d8tBZzVZIVjGQTAU3e8=; b=XI+26FP3xzJQwJZwU/Dfv4dJK
	oWG/D5+scs2i5kN1EKY83CKFBg/bGr2z1WMuLCE7xVK/2y96dvS2cvWD4JoV7jIikyva+7zd5pmIh
	na0nuGnCxuE9dQLCSow3N/9N6htz4nl6eRjjtJD+gmyxv2bC1Fi6J0MxC4vR+3LJ5F3Df+ipLmXyY
	b2+e/lLPaIK7wb7CwUxVIQL3B+Q58d0qGPJ1h+Ix+cUsIU668nCWURZzGXBaMAWM7FpwexWRSbQb5
	bMzlMbZ8soZ2gxZ4AKvXuV43Xx4Tfc3TEkPYENHg1hpWAXYOfT9EV8SuVcYNgnvDAxaJfLuBts3FL
	YwoNKJShg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqAUX-0002Sf-2C; Tue, 30 Jun 2020 07:15:41 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqAUV-0002SN-A4
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 07:15:40 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C091020003;
 Tue, 30 Jun 2020 07:15:32 +0000 (UTC)
Date: Tue, 30 Jun 2020 09:15:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 2/2] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200630091530.34043726@xps13>
In-Reply-To: <20200629230800.GA3136006@bogus>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
 <20200626071357.21421-3-miquel.raynal@bootlin.com>
 <20200629230800.GA3136006@bogus>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gTW9uLCAyOSBK
dW4gMjAyMCAxNzowODowMCAtMDYwMDoKCj4gT24gRnJpLCBKdW4gMjYsIDIwMjAgYXQgMDk6MTM6
NTdBTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IERvY3VtZW50IG5hbmQtdXNlLXNv
ZnQtZWNjLWVuZ2luZSBhbmQgbmFuZC1uby1lY2MtZW5naW5lIHByb3BlcnRpZXMuCj4gPiBUaGUg
Zm9ybWVyIGlzIGhlcmUgdG8gZm9yY2Ugc29mdHdhcmUgY29ycmVjdGlvbiwgdGhlIGxhdHRlciBw
cmV2ZW50cwo+ID4gYW55IGNvcnJlY3Rpb24gdG8gaGFwcGVuLgo+ID4gCj4gPiBUaGVzZSBwcm9w
ZXJ0aWVzIChhbG9uZyB3aXRoIG5hbmQtZWNjLWVuZ2luZSkgYXJlIHN1cHBvc2VkIHRvIGJlIG1v
cmUKPiA+IGFjY3VyYXRlIHRoYW4gdGhlIGN1cnJlbnQgbmFuZC1lY2MtbW9kZXMgd2ljaCBpcyB2
ZXJ5IG1pc2xlYWRpbmcgYW5kCj4gPiB2ZXJ5IG9mdGVuIHBlb3BsZSB0aGluayBpdCBpcyBtYW5k
YXRvcnkgd2hpbGUgdGhlIGNvcmUgc2hvdWxkIGJlCj4gPiByZWxpZWQgdXBvbiB0byBkZWNpZGUg
d2hpY2ggY29ycmVjdGlvbiB0byBoYW5kbGUuCj4gPiAKPiA+IG5hbmQtZWNjLW1vZGUgd2FzIGFs
cmVhZHkgaW5hY3VyYXRlLCBidXQgaXQgYmVjb21lcyB0b3RhbGx5Cj4gPiBwcm9ibGVtYXRpYyB3
aXRoIHNldHVwcyB3aGVyZSB0aGVyZSBhcmUgc2V2ZXJhbCBoYXJkd2FyZSBlbmdpbmVzLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9u
YW5kLWNvbnRyb2xsZXIueWFtbCB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwKPiA+IGluZGV4IDA5NjlkMmU2
NzIwYi4uYTM3NTA5NzhlYmI4IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbAo+ID4gQEAg
LTY4LDYgKzY4LDEyIEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAzLyBUaGUg
RUNDIGVuZ2luZSBpcyBleHRlcm5hbCwgaW4gdGhpcyBjYXNlIHRoZSBwaGFuZGxlIHNob3VsZAo+
ID4gICAgICAgICAgICByZWZlcmVuY2UgdGhlIHNwZWNpZmljIEVDQyBlbmdpbmUgbm9kZS4KPiA+
ICAKPiA+ICsgICAgICBuYW5kLXVzZS1zb2Z0LWVjYy1lbmdpbmU6IHRydWUKPiA+ICsgICAgICAg
IGRlc2NyaXB0aW9uOiBVc2UgYSBzb2Z0d2FyZSBFQ0MgZW5naW5lLgo+ID4gKwo+ID4gKyAgICAg
IG5hbmQtbm8tZWNjLWVuZ2luZTogdHJ1ZQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IERvIG5v
dCB1c2UgYW55IEVDQyBjb3JyZWN0aW9uLgo+ID4gKyAgCj4gCj4gU3RpbGwgdGhlIHNhbWUgcHJv
YmxlbSBhcyB2MTAuCgpJIGFtIHZlcnkgc29ycnkgZm9yIHRoZSBlcnJvciwgSSBmaXhlZCBib3Ro
IGNvbW1pdHMgd2l0aCBhIGZpeHVwIQpjb21taXQgYXQgdGhlIGVuZCBvZiBteSBzZXJpZXMgYW5k
IGZvcmdvdCB0byBzcXVhc2ggdGhlbSBiZWZvcmUKc2VuZGluZy4uLgoKSSdsbCByZXNlbmQgdGhl
IHByb3BlciBwYXRjaGVzLiBBZ2Fpbiwgc29ycnkgZm9yIHRoZSB0aW1lIGxvc3QuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
