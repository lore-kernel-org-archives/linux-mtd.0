Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6026EC5ACD6
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 08:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3398620753
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 08:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sVzGAyHx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3398620753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPj1F52ewDmXY06u23ty223N4crqhR1Z9/EqxOzqEQU=; b=sVzGAyHxKMc2xi
	xJLTFd0ppE4Kn100OUiHgIyAynk1KEzy/UR+8v1iNWYVxe5q1U1rWt522MZPiR8ghWJY2WpYRD9gY
	Pm9NYL9Yv9UuyvsZAoeREJrsMXv74ieRhOw+mkyFPR9HZIjDjz3iF+GdxHDe7BOebOIRV+Awa/ob7
	YgNp1+WkFCNJ2X3G218i0y4PbBXY148PGQDoUL7gsxav6dE1ugFbRec2fzoPdE9DEx7vHzcytHupt
	cJ2pFvpuT0wwbqE5TOsZpCCqkuLMnavpg5vrK3/SdZUIkE2Hc3iMlMN9cXuQDX2Cf/DMj/w7MaaQu
	qOfAgrIWmtBg6v9aKQ6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEUAf-0000zr-Qz; Wed, 18 Mar 2020 08:35:25 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEUAc-0000y7-0G
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 08:35:23 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9E04A24000C;
 Wed, 18 Mar 2020 08:35:12 +0000 (UTC)
Date: Wed, 18 Mar 2020 09:35:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: Re: [PATCH v4 0/2] mtd: spinand: toshiba: Support for new Kioxia
 Serial NAND
Message-ID: <20200318093511.4213c6a2@xps13>
In-Reply-To: <42e02e2c-ee61-1b0d-5d8e-3a512c042151@kioxia.com>
References: <cover.1583834323.git.ytc-mb-yfuruyama7@kioxia.com>
 <20200311165011.63a3d82e@xps13>
 <42e02e2c-ee61-1b0d-5d8e-3a512c042151@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_013522_190763_9567EF55 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29t
PiB3cm90ZSBvbiBXZWQsIDE4IE1hcgoyMDIwIDE0OjQwOjQ3ICswOTAwOgoKPiBPbiAyMDIwLzAz
LzEyIDA6NTAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBZb3NoaW8sCj4gPgo+ID4gWW9z
aGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29tPiB3cm90ZSBvbiBXZWQs
IDExIE1hcgo+ID4gMjAyMCAxMDo0NzowNCArMDkwMDoKPiA+ICAKPiA+PiBGaXJzdCBwYXRjaCBp
cyB0byByZW5hbWUgZnVuY3Rpb24gbmFtZSBiZWNhc2Ugb2YgYWRkIG5ldyBkZXZpY2UuCj4gPj4g
U2Vjb25kIHBhdGNoIGlzIHRvIHN1cHByb3QgZm9yIG5ldyBkZXZpY2UuCj4gPj4KPiA+PiBZb3No
aW8gRnVydXlhbWEgKDIpOgo+ID4+ICAgIG10ZDogc3BpbmFuZDogdG9zaGliYTogUmVuYW1lIGZ1
bmN0aW9uIG5hbWUgdG8gY2hhbmdlIHN1ZmZpeCBhbmQKPiA+PiAgICAgIHByZWZpeCAoOEdiaXQp
Cj4gPj4gICAgbXRkOiBzcGluYW5kOiB0b3NoaWJhOiBTdXBwb3J0IGZvciBuZXcgS2lveGlhIFNl
cmlhbCBOQU5ECj4gPj4KPiA+PiAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hpYmEuYyB8IDE3
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ID4+ICAgMSBmaWxl
IGNoYW5nZWQsIDEzMCBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkKPiA+PiAgCj4gPiBJ
IGFtIHZlcnkgc29ycnkgYnV0IGFjdHVhbGx5IEkgaGFkIGlzc3VlcyBhcHBseWluZyBhbGwgeW91
ciBwYXRjaGVzIG5vdAo+ID4gYmVjYXVzZSB0aGV5IHdlcmUgbm90IGJhc2VkIG9uIHY1LjYtcmMx
LCBidXQgYmVjYXVzZSBzaW5jZSB0aGVuIEkKPiA+IGFwcGxpZWQgYSBwYXRjaCBjaGFuZ2luZyB0
aGUgZGV0ZWN0aW9uIHRoYXQgY2hhbmdlZCB0aGUgY29udGVudCBvZiBhCj4gPiBsb3Qgb2Ygc3Ry
dWN0dXJlcyAoaW5jbHVkaW5nIGluIFRvc2hpYmEncyBkcml2ZXIpLgo+ID4KPiA+IENhbiB5b3Ug
cGxlYXNlIHJlYmFzZSBhZ2FpbiBvbiB0b3Agb2YgdGhlIGN1cnJlbnQgbmFuZC9uZXh0PyBJIGFt
IHZlcnkKPiA+IHNvcnJ5IGZvciB0aGlzIGV4dHJhIHdvcmssIHRoaXMgaXMgbXkgbWlzdGFrZS4g
IAo+IAo+IFRoYW5rcyBjb21tZW50LiDCoCDCoCDCoCDCoCBJIHdpbGwgcmV2aXNlIHJldiAoVjUp
IG5leHQgd2Vlay4KCldlIGFyZSBhdCAtcmM2IGFscmVhZHksIGl0IHdvdWxkIGJlIGdvb2QgaWYg
eW91IGNvdWxkIHNlbmQgaXQgYmVmb3JlCnRoZSBlbmQgb2YgdGhlIHdlZWsuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
