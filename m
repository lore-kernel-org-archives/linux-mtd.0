Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF68C4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:49:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C782F2469F
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZHFs2QO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C782F2469F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HOX3/+k/FC7pnzen5P160bwKgwTacLRCLFt2vD1iPQ4=; b=kZHFs2QObU5Q7ZVabf1RKFX6H
	GiPuGmu9u5IP3JyIc6gZw4K4eatLANwQY/LHatlBp0owrAbM6qTaKk372k67EwcqQrXx3edd9C8Wj
	9oeQCAJPGQ5H6EVRoKpF2SSLsypwJr3lTfXJKZjonUNETNhJCsrtVefmSALR1sh1SjdfYsFQqobFb
	VJmWEfBDqckEirqIrBPI9idiWi6QYIy/e5flfqy3Dcu5XkOi1PTlxoZbxMzvC3fi7j8zSPNgewsb1
	mB9AW2vRSOsiYRSXvLSo7QiFyx5H+ttfWOB0g43PvW7HvOCVCF+KtMrb5o4YIkrhlG56y3qSoj52z
	E+SOybVwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXi4T-00060J-6H; Wed, 28 Oct 2020 09:48:45 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXi4Q-0005zG-19
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 09:48:43 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2CE3FE0005;
 Wed, 28 Oct 2020 09:48:36 +0000 (UTC)
Date: Wed, 28 Oct 2020 10:48:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
Message-ID: <20201028104835.3dc31745@xps13>
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_054842_196426_BF8F85B1 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFNh
dCwgMTAgT2N0IDIwMjAKMTE6MDE6MzcgKzA1MzA6Cgo+IFFQSUMgMi4wIHN1cHBvcnRzIFNlcmlh
bCBOQU5EIHN1cHBvcnQgaW4gYWRkaXRpb24gdG8gYWxsIGZlYXR1cmVzIGFuZAo+IGNvbW1hbmRz
IGluIFFQSUMgMS4wIGZvciBwYXJhbGxlbCBOQU5ELiBQYXJhbGxlbCBhbmQgU2VyaWFsIE5BTkQg
Y2Fubm90Cj4gb3BlcmF0ZSBzaW11bHRhbmVvdXNseS4gUVNQSSBuYW5kIGRldmljZXMgd2lsbCBj
b25uZWN0IHRvIFFQSUMgSU9fTUFDUk8KPiBibG9jayBvZiBRUElDIGNvbnRyb2xsZXIuIFRoZXJl
IGlzIGEgc2VwYXJhdGUgSU9fTUFDUk8gY2xvY2sgZm9yIElPX01BQ1JPCj4gYmxvY2suIERlZmF1
bHQgSU9fTUFDUk8gYmxvY2sgZGl2aWRlIHRoZSBpbnB1dCBjbG9jayBieSA0LiBzbyBpZiBJT19N
QUNSTwo+IGlucHV0IGNsb2NrIGlzIDMyME1IeiB0aGVuIG9uIGJ1cyBpdCB3aWxsIGJlIDgwTUh6
LCBzbyBRU1BJIG5hbmQgZGV2aWNlCj4gc2hvdWxkIGFsc28gc3VwcG9ydCB0aGlzIGZyZXF1ZW5j
eS4KPiAKPiBRUElDIHByb3ZpZGVzIDQgZGF0YSBwaW5zIHRvIFFTUEkgbmFuZC4gSW4gc3RhbmRh
cmQgU1BJIG1vZGUgKHgxIG1vZGUpIGRhdGEKPiB0cmFuc2ZlciB3aWxsIG9jY3VyIG9uIG9ubHkg
MiBwaW5zIG9uZSBwaW4gZm9yIFNlcmlhbCBkYXRhIGluIGFuZCBvbmUgZm9yCj4gc2VyaWFsIGRh
dGEgb3V0LiBJbiBRVUFEIFNQSSBtb2RlICh4NCBtb2RlKSBkYXRhIHRyYW5zZmVyIHdpbGwgb2Nj
dXIgYXQgYWxsCj4gdGhlIGZvdXIgZGF0YSBsaW5lcy4gUVBJQyBjb250cm9sbGVyIHN1cHBvcnRz
IGNvbW1hbmQgZm9yIHgxIG1vZGUgYW5kIHg0IG1vZGUuCj4gCj4gTWQgU2FkcmUgQWxhbSAoNSk6
Cj4gICBkdC1iaW5kaW5nczogcWNvbV9uYW5kYzogSVBRNTAxOCBRUElDIE5BTkQgZG9jdW1lbnRh
dGlvbgo+ICAgbXRkOiByYXduYW5kOiBxY29tOiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBxc3Bp
IG5hbmQKPiAgIG10ZDogcmF3bmFuZDogcWNvbTogUmVhZCBRUElDIHZlcnNpb24KPiAgIG10ZDog
cmF3bmFuZDogcWNvbTogRW5hYmxlIHN1cHBvcnQgZm9yIGVyYXNlLHJlYWQgJiB3cml0ZSBmb3Ig
c2VyaWFsCj4gICAgIG5hbmQuCj4gICBtdGQ6IHJhd25hbmQ6IHFjb206IEFkZCBzdXBwb3J0IGZv
ciBzZXJpYWwgdHJhaW5pbmcuCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29t
X25hbmRjLnR4dCAgICAgICAgIHwgICAzICsKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9p
ZHMuYyAgICAgICAgICAgICAgICAgICAgfCAgMTMgKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9x
Y29tX25hbmRjLmMgICAgICAgICAgICAgICAgICB8IDUwMiArKysrKysrKysrKysrKysrKysrKy0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA0OTQgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4g
CgpJJ20gc29ycnkgYnV0IHRoaXMgc2VyaWVzIGNsZWFybHkgYnJlYWtzIHRoZSBjdXJyZW50IGxh
eWVyaW5nLiBJIGNhbm5vdAphdXRob3JpemUgU1BJLU5BTkQgY29kZSB0byBmYWxsIGludG8gdGhl
IHJhdyBOQU5EIHN1YnN5c3RlbS4KCkFzIGJvdGggdHlwb2xvZ2llcyBjYW5ub3QgYmUgdXNlZCBh
dCB0aGUgc2FtZSB0aW1lLCBJIGd1ZXNzIHlvdSBzaG91bGQKaGF2ZSBhbm90aGVyIGRyaXZlciBo
YW5kbGluZyB0aGlzIGZlYXR1cmUgdW5kZXIgdGhlIHNwaS8gc3Vic3lzdGVtICsKYSBmZXcgZGVj
bGFyYXRpb25zIGluIHRoZSBTUEktTkFORCBkZXZpY2VzIGxpc3QuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
