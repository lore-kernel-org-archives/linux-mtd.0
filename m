Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17A7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 13:29:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81ACE6117A
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 13:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81ACE6117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyiFS3sGI5AB+50Nr1TBjrOdHW+oZQsEE5WevkjCGJI=; b=gFtoi5ESFqeUlM
	sNCzyHd65yvoiDcKI5I3S+19yKuFTa7jfzpHSawz7twFQHVC4h/+j9y2CZo77bD+l4NJ4vsbwAMVN
	NHCz+pdjee98HvSa71ASkRZ6A5yRVtAtKcEup5i/lpUwOv9e95ERttB+7ba0QJhz/Hi6GP9clTLqE
	sGTcUoNWd06oBAxUdOVu4w6RFR45tcZz8L5mUycgXwDRWtKfjxyA6MACdSHOSQb+IHmr8KTBnjWnX
	uAvjDoy0z8DbWtekiVrhfIALeiuzv+eYqPbZnKynxcDBf+k0kmRrNZ37ERO8kNTPbafAm6zDpPkTn
	Eb5/V+vlJ51dAD28MIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkRAy-002KEy-RM; Tue, 09 Nov 2021 13:28:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkRAw-002KDs-Il
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 13:28:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 51995C0004;
 Tue,  9 Nov 2021 13:28:29 +0000 (UTC)
Date: Tue, 9 Nov 2021 14:28:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali: Add the dependency on HAS_IOMEM
Message-ID: <20211109142828.3e4ec837@xps13>
In-Reply-To: <20211109125457.213-1-caihuoqing@baidu.com>
References: <20211109125457.213-1-caihuoqing@baidu.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_052834_779310_A6E3951A 
X-CRM114-Status: GOOD (  16.57  )
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

SGkgQ2FpLAoKY2FpaHVvcWluZ0BiYWlkdS5jb20gd3JvdGUgb24gVHVlLCA5IE5vdiAyMDIxIDIw
OjU0OjU1ICswODAwOgoKPiBUaGUgaGVscGVyIGZ1bmN0aW9uIGRldm1fcGxhdGZvcm1faW9yZW1h
cF9yZXNvdXJjZV94eHgoKQo+IG5lZWRzIEhBU19JT01FTSBlbmFibGVkLCBzbyBhZGQgdGhlIGRl
cGVuZGVuY3kgb24gSEFTX0lPTUVNLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENhaSBIdW9xaW5nIDxj
YWlodW9xaW5nQGJhaWR1LmNvbT4KPiAtLS0KCiBDYW4geW91IHBsZWFzZSBhZGQgYSBGaXhlcyB0
YWc/Cgo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcK
PiBpbmRleCA2N2I3Y2I2N2MwMzAuLjBhNDVkM2M2YzE1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZp
Zwo+IEBAIC0yNiw3ICsyNiw3IEBAIGNvbmZpZyBNVERfTkFORF9ERU5BTElfUENJCj4gIGNvbmZp
ZyBNVERfTkFORF9ERU5BTElfRFQKPiAgCXRyaXN0YXRlICJEZW5hbGkgTkFORCBjb250cm9sbGVy
IGFzIGEgRFQgZGV2aWNlIgo+ICAJc2VsZWN0IE1URF9OQU5EX0RFTkFMSQo+IC0JZGVwZW5kcyBv
biBIQVNfRE1BICYmIEhBVkVfQ0xLICYmIE9GCj4gKwlkZXBlbmRzIG9uIEhBU19ETUEgJiYgSEFW
RV9DTEsgJiYgT0YgJiYgSEFTX0lPTUVNCj4gIAloZWxwCj4gIAkgIEVuYWJsZSB0aGUgZHJpdmVy
IGZvciBOQU5EIGZsYXNoIG9uIHBsYXRmb3JtcyB1c2luZyBhIERlbmFsaSBOQU5ECj4gIAkgIGNv
bnRyb2xsZXIgYXMgYSBEVCBkZXZpY2UuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
