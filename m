Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07470C388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 14:24:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB1E24770
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 14:24:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNqXSlJq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB1E24770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9S8u8vkg/kbjaNt5er8iMTCqjxrbABPuPbezG8ogIuU=; b=WNqXSlJqGBfUtsTXsnROw9IXu
	kE0oeQn1vD/hxWPLnt3bS9lOX9vbkEHWyE5uXtSpJdQ4+OHWjKA6XgLbuskeSupyKMywmBZB0/zj8
	8OyiEdkhMNoQjxu0xAaWWHoVgefV+vaYzSfbD/737NlsN2CancgEjUoHRV2RhFSFhgm3LvAfFmMdl
	xj1h7A2pAcIwUbh5EmU10bygBerJQqqjMxbExb+/HNu9SPo/Qom2z853cp4/GNx2igel01KI/PsjS
	r1I6pZW1NQe6T2B7E8kyfab0MiO+v0n1g8kQlXOOHzQyRSnyZDREJoA6pbKosBsQhrC8aDSqXG3rc
	LyDgrTfKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXmM4-00032n-Ey; Wed, 28 Oct 2020 14:23:12 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXmM0-00032L-Uv
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 14:23:10 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C3CD91BF20B;
 Wed, 28 Oct 2020 14:23:04 +0000 (UTC)
Date: Wed, 28 Oct 2020 15:23:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Praveenkumar I <ipkumar@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix DMA sync on FLASH_STATUS
 register read
Message-ID: <20201028152302.2f830077@xps13>
In-Reply-To: <24a781a3-488c-b638-1b92-0f279807446f@codeaurora.org>
References: <1602230872-25616-1-git-send-email-ipkumar@codeaurora.org>
 <20201028110835.2f319c0a@xps13>
 <24a781a3-488c-b638-1b92-0f279807446f@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_102309_107257_F07678D0 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: kathirav@codeaurora.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 sivaprak@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpQcmF2ZWVua3VtYXIgSSA8aXBrdW1hckBjb2RlYXVyb3JhLm9yZz4gd3JvdGUgb24g
V2VkLCAyOCBPY3QgMjAyMAoxOTo0ODozNCArMDUzMDoKCj4gSGkgTWlxdWVsLAo+IAo+IFBsZWFz
ZSBmaW5kIHRoZSBpbmxpbmUgcmVwbHkuCj4gCj4gVGhhbmtzLAo+IFByYXZlZW5rdW1hciBJCj4g
Cj4gCj4gT24gMTAvMjgvMjAyMCAzOjM4IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGVs
bG8sCj4gPgo+ID4gUHJhdmVlbmt1bWFyIEkgPGlwa3VtYXJAY29kZWF1cm9yYS5vcmc+IHdyb3Rl
IG9uIEZyaSwgIDkgT2N0IDIwMjAKPiA+IDEzOjM3OjUyICswNTMwOgo+ID4gIAo+ID4+IEFmdGVy
IGVhY2ggY29kZXdvcmQgTkFORF9GTEFTSF9TVEFUVVMgaXMgcmVhZCBmb3IgcG9zc2libGUgb3Bl
cmF0aW9uYWwKPiA+PiBmYWlsdXJlcy4gQnV0IHRoZXJlIGlzIG5vIERNQSBzeW5jIGZvciBDUFUg
b3BlcmF0aW9uIGJlZm9yZSByZWFkaW5nIGl0Cj4gPj4gYW5kIHRoaXMgbGVhZHMgdG8gaW5jb3Jy
ZWN0IG9yIG9sZGVyIGNvcHkgb2YgRE1BIGJ1ZmZlciBpbiByZWdfcmVhZF9idWYuCj4gPj4KPiA+
PiBUaGlzIHBhdGNoIGFkZHMgdGhlIERNQSBzeW5jIG9uIHJlZ19yZWFkX2J1ZiBmb3IgQ1BVIGJl
Zm9yZSByZWFkaW5nIGl0Lgo+ID4+Cj4gPj4gRml4ZXM6IDViYzM2YjJiZjZlMiAoIm10ZDogcmF3
bmFuZDogcWNvbTogY2hlY2sgZm9yIG9wZXJhdGlvbiBlcnJvcnMgaW4gY2FzZSBvZiByYXcgcmVh
ZCIpICAKPiA+IEkgZ3Vlc3MgdGhpcyBkZXNlcnZlcyBhIHByb3BlciBDYzogc3RhYmxlIHRhZz8g
IAo+ID4gICAgPj4gWWVzLiBJIHdpbGwgc2VuZCBhIFYyIFBhdGNoIHdpdGggc3RhYmxlIHRhZyBp
biBDYyAgCgpUaGF0J3MgZmluZSBmb3IgdGhpcyBvbmUsIEknbGwgYWRkIGl0IG15c2VsZi4KCj4g
Pj4gU2lnbmVkLW9mZi1ieTogUHJhdmVlbmt1bWFyIEkgPGlwa3VtYXJAY29kZWF1cm9yYS5vcmc+
ICAKPiA+IEkgdGhpbmsgeW91ciBmdWxsIG5hbWUgaXMgcmVxdWlyZWQgaW4gdGhlIFNvQiBsaW5l
IChzaG91bGQgbWF0Y2ggdGhlCj4gPiBhdXRob3JzaGlwKS4gIAo+ID4gICAgID4+ICJQcmF2ZWVu
a3VtYXIgSSIgaXMgbXkgZnVsbCBuYW1lIGFuZCBpdCBpcyBzYW1lIGFzIHRoZSBhdXRob3JzaGlw
LiAgCgpPaywgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uCgo+ID4gT3RoZXJ3aXNlIGxvb2tzIGdv
b2QgdG8gbWUuCj4gPiAgCj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMgfCAyICsrCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPj4gaW5kZXggYmQ3YTcyNTE0Mjli
Li41YmI4NWYxYmE4NGMgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jCj4gPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4g
Pj4gQEAgLTE1NzAsNiArMTU3MCw4IEBAIHN0YXRpYyBpbnQgY2hlY2tfZmxhc2hfZXJyb3JzKHN0
cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50IGN3X2NudCkKPiA+PiAgIAlzdHJ1Y3QgcWNv
bV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjID0gZ2V0X3Fjb21fbmFuZF9jb250cm9sbGVyKGNoaXAp
Owo+ID4+ICAgCWludCBpOyAgCj4gPj4gICA+PiArCW5hbmRjX3JlYWRfYnVmZmVyX3N5bmMobmFu
ZGMsIHRydWUpOyAgCj4gPj4gKwo+ID4+ICAgCWZvciAoaSA9IDA7IGkgPCBjd19jbnQ7IGkrKykg
ewo+ID4+ICAgCQl1MzIgZmxhc2ggPSBsZTMyX3RvX2NwdShuYW5kYy0+cmVnX3JlYWRfYnVmW2ld
KTsgIAo+ID4+ICAgPiBUaGFua3MsICAKPiA+IE1pcXXDqGwgIAo+IAoKQ2hlZXJzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
