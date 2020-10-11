Return-Path: <SRS0=teGx=DS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FA1C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 20:43:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20EF20578
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 20:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xMmlym7l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20EF20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nmbfdWdJgcC14ZlJBpQzXfMQ0QUQWdNfy3pHeh5D2Xw=; b=xMmlym7lTjWX3DC3ZtJ5la5Ux
	Hl/5dPYiD/YpiPXktvikqPMY0YLq4J70UbI4C1KWugi+noLRbnBlaywS5LMB9144bzhT9rzLgBbem
	VAtQWTWxE0kjIj+yi1azttxbgXpI95XyJHndHg7/GMS2uOJkO25yjyEXodlyUV0AnLF9ymQDxRPbc
	qmQEYcZYVkstxNElShcJntctzuPx6zkE1UsSEth7kEUbqDYBHCKZypBRqKZa0sVhtFrYk0Drr9z3Z
	nwB22TuKVw0IA9LvK62SCAGA/NttV1YnV+5UrjW4RFEDhQqbv5035Gb7W2cUlTVh6GjCr+qoOBl8v
	t1xPO3m6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRiAr-0007Xk-8z; Sun, 11 Oct 2020 20:42:33 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRiAo-0007X0-LQ
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2020 20:42:31 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D6DE4608311C;
 Sun, 11 Oct 2020 22:42:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Vk7LBuj7zF23; Sun, 11 Oct 2020 22:42:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 45B1B6125F28;
 Sun, 11 Oct 2020 22:42:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zdT26Yw3CUUg; Sun, 11 Oct 2020 22:42:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 27D70608311C;
 Sun, 11 Oct 2020 22:42:28 +0200 (CEST)
Date: Sun, 11 Oct 2020 22:42:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1014092673.185630.1602448948127.JavaMail.zimbra@nod.at>
In-Reply-To: <f91ae16f-7995-aa27-c2ff-4e519929417e@ti.com>
References: <f91ae16f-7995-aa27-c2ff-4e519929417e@ti.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.10
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: spi-nor: Changes for 5.10
Thread-Index: lU776dfWHInZWpXlHj9Fwa2+QBU+HA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_164230_808805_6929D793 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VmlnbmVzaCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJWaWduZXNo
IFJhZ2hhdmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPgo+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlR1
ZG9yIEFtYmFydXMiCj4gPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4KPiBDQzogImxpbnV4
LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IEdlc2VuZGV0OiBGcmVpdGFn
LCA5LiBPa3RvYmVyIDIwMjAgMTQ6MjI6NTMKPiBCZXRyZWZmOiBbR0lUIFBVTExdIG10ZDogc3Bp
LW5vcjogQ2hhbmdlcyBmb3IgNS4xMAoKPiBIaSBNaXF1ZWwsIFJpY2hhcmQKPiAKPiBQbGVhc2Ug
cHVsbCBTUEkgTk9SIGNoYW5nZXMgZm9yIDUuMTAtcmMxLgo+IAo+IFJlZ2FyZHMKPiBWaWduZXNo
Cj4gCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBiYTRmMTg0ZTEyNmI3
NTFkMWJmZmFkNTg5N2YyNjMxMDhiZWZjNzgwOgo+IAo+ICBMaW51eCA1LjktcmM2ICgyMDIwLTA5
LTIwIDE2OjMzOjU1IC0wNzAwKQoKU2FtZSBxdWVzdGlvbi4gU2VlIG90aGVyIG1haWwuCiAKPiBh
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQKPiAgdGFncy9z
cGktbm9yL2Zvci01LjEwCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDlhMzQy
MmExMTBjODY4ZTUxMTM4N2E4MWRmMjVhMzE1ZWFhM2E3Yjg6Cj4gCj4gIFJldmVydCAibXRkOiBz
cGktbm9yOiBQcmVmZXIgYXN5bmNocm9ub3VzIHByb2JlIiAoMjAyMC0xMC0wNiAxMDo0NjowNyAr
MDUzMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gU1BJIE5PUiBjb3JlIGNoYW5nZXM6Cj4gLSBTdXBwb3J0IGZv
ciBXaW5ib25kIHcyNXE2NGp3bSBmbGFzaAo+IC0gRW5hYmxlIDRLIHNlY3RvciBzdXBwb3J0IGZv
ciBteDI1bDEyODA1ZAo+IAo+IFNQSSBOT1IgY29udHJvbGxlciBkcml2ZXJzIGNoYW5nZXM6Cj4g
LSBpbnRlbC1zcGk6Cj4gICAtIEFkZCBBbGRlciBMYWtlLVMgUENJIElECj4gCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IERvdWdsYXMgQW5kZXJzb24gKDEpOgo+ICAgICAgbXRkOiBzcGktbm9yOiBQcmVmZXIgYXN5bmNo
cm9ub3VzIHByb2JlCj4gCj4gSWtqb29uIEphbmcgKDEpOgo+ICAgICAgbXRkOiBzcGktbm9yOiB3
aW5ib25kOiBBZGQgc3VwcG9ydCBmb3IgdzI1cTY0andtCj4gCj4gTWlrYSBXZXN0ZXJiZXJnICgx
KToKPiAgICAgIG10ZDogc3BpLW5vcjogaW50ZWwtc3BpOiBBZGQgc3VwcG9ydCBmb3IgSW50ZWwg
QWxkZXIgTGFrZS1TIFNQSSBzZXJpYWwgZmxhc2gKPiAKPiBSb2JlcnQgTWFya28gKDEpOgo+ICAg
ICAgbXRkOiBzcGktbm9yOiBtYWNyb25peDogQWRkIFNFQ1RfNEsgdG8gbXgyNWwxMjgwNWQKPiAK
PiBWaWduZXNoIFJhZ2hhdmVuZHJhICgxKToKPiAgICAgIFJldmVydCAibXRkOiBzcGktbm9yOiBQ
cmVmZXIgYXN5bmNocm9ub3VzIHByb2JlIgo+IAo+IGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJv
bGxlcnMvaW50ZWwtc3BpLXBjaS5jIHwgMSArCj4gZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25p
eC5jICAgICAgICAgICAgICAgICAgfCAyICstCj4gZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25k
LmMgICAgICAgICAgICAgICAgICAgfCA5ICsrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClB1bGxlZCwgdGhhbmtzIGEgbG90IQoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
