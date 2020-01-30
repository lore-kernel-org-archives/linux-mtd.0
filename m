Return-Path: <SRS0=c1be=3T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD57C2D0DB
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2020 19:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2FBA214D8
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2020 19:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CDSxFTRW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2FBA214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XS+OXrxlXmojEgop6sa72td2KaP/WdO90c2aZGzLh/8=; b=CDSxFTRWgHDZ7C
	lLbunC/2opJHc3rcTA4l1sQWksRXc8Ft1bckKImQc9gxy2B2ANhfAa/45SqEaOALDW0FDG3jNOdYO
	bAplcPtzI78El/xZ1cHH4XWO4iro2QVa09jZpdEyzRq1cNxQWiCF7AmCvX8GfEt3vKJ7pHOVFX82y
	o0uv59iEuoZbAs6QZfl2iH15dRPJIUZizsTRTMbRWbxlpYrVVn9jc6I+p7tI+niLLgJfd4wmm8+hi
	C+HBWbhCZSrNc7HU06X1Ml3VqP6IkeqFEdLpaA3wdNRYlDfDvJ2eq8MHSF25NQiEs+hena9KNTk8k
	PLwSq99+lva8xkg+xfUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixFrP-0005NM-Em; Thu, 30 Jan 2020 19:52:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixFrM-0005Mn-IU
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2020 19:52:17 +0000
X-Originating-IP: 93.23.196.10
Received: from xps13 (10.196.23.93.rev.sfr.net [93.23.196.10])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 578C040002;
 Thu, 30 Jan 2020 19:52:13 +0000 (UTC)
Date: Thu, 30 Jan 2020 20:52:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.6
Message-ID: <20200130205211.1b1a5fe4@xps13>
In-Reply-To: <3990025.71ridMsFQ8@localhost.localdomain>
References: <3990025.71ridMsFQ8@localhost.localdomain>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_115216_746539_C2EB08A6 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgo8VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tPiB3cm90ZSBvbiBNb24sIDIw
IEphbiAyMDIwIDE3OjU0OjMwICswMDAwOgoKPiBIaSwKPiAKPiBUaGlzIGlzIHRoZSBTUEkgTk9S
IFBSIGZvciA1LjYuCj4gCj4gVGhhbmtzLAo+IHRhCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdCA0NmNmMDUzZWZlYzZhM2E1ZjM0M2ZlYWQ4Mzc3NzdlZmU4MjUyYTQ2Ogo+
IAo+ICAgTGludXggNS41LXJjMyAoMjAxOS0xMi0yMiAxNzowMjoyMyAtMDgwMCkKPiAKPiBhcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgIHNzaDovL2dpdEBnaXRv
bGl0ZS5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRh
Z3MvCj4gc3BpLW5vci9mb3ItNS42Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGNjZmI5Mjk5YTBiNjNkYTRmZGU2MDdjODIyZTE0NzA0NzJhNDYxNzc6Cj4gCj4gICBtdGQ6IHNw
aS1ub3I6IEFkZCBzdXBwb3J0IGZvciBhdDI1c2wzMjEgKDIwMjAtMDEtMTkgMDg6NDU6NTUgKzAy
MDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IFNQSSBOT1IgY29yZSBjaGFuZ2VzOgo+IC0gQWRkIHN1cHBvcnQg
Zm9yIFRCIHNlbGVjdGlvbiB1c2luZyBTUiBiaXQgNiwKPiAtIEFkZCBzdXBwb3J0IGZvciBmZXcg
Zmxhc2hlcy4KPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gRGF2aWQgQmF1ZXIgKDEpOgo+ICAgICAgIG10ZDogc3Bp
LW5vcjogQWRkIHN1cHBvcnQgZm9yIG14MjVyMzIzNWYKPiAKPiBKZXJvbWUgQnJ1bmV0ICgxKToK
PiAgICAgICBtdGQ6IHNwaS1ub3I6IGFkZCBHaWdhZGV2aWNlIGdkMjVscTEyOGQgc3VwcG9ydAo+
IAo+IEpvaG4gR2FycnkgKDEpOgo+ICAgICAgIG10ZDogc3BpLW5vcjogaGlzaS1zZmM6IFRyeSB0
byBwcm92aWRlIHNvbWUgY2xhcml0eSBvbiB3aGljaCBTRkMgd2UgYXJlCj4gCj4gSm9zZXBoIEt1
c3QgKDEpOgo+ICAgICAgIG10ZDogc3BpLW5vcjogQWRkIHN1cHBvcnQgZm9yIHNzdDI2dmYwMTZi
Cj4gCj4gSnVuZ3NldW5nIExlZSAoNCk6Cj4gICAgICAgbXRkOiBzcGktbm9yOiBmaXggdHlwbyBv
ZiAiSkVTQjIxNiIgaW4gY29tbWVudAo+ICAgICAgIG10ZDogc3BpLW5vcjogUmVuYW1lIFNSX1RC
IHRvIGluZGljYXRlIHRoZSBiaXQgdXNlZAo+ICAgICAgIG10ZDogc3BpLW5vcjogU3VwcG9ydCBU
QiBzZWxlY3Rpb24gdXNpbmcgU1IgYml0IDYKPiAgICAgICBtdGQ6IHNwaS1ub3I6IEZpeCB3cm9u
ZyBUQiBzZWxlY3Rpb24gb2YgR0QyNVEyNTYKPiAKPiBNaWNoYWVsIFdhbGxlICgzKToKPiAgICAg
ICBtdGQ6IHNwaS1ub3I6IHJlbW92ZSB1bnVzZWQgZW51bSBzcGlfbm9yX29wcwo+ICAgICAgIG10
ZDogc3BpLW5vcjogQWRkIHN1cHBvcnQgZm9yIHcyNXEzMmp3bQo+ICAgICAgIG10ZDogc3BpLW5v
cjogQWRkIHN1cHBvcnQgZm9yIGF0MjVzbDMyMQo+IAo+IE1pa2EgV2VzdGVyYmVyZyAoMik6Cj4g
ICAgICAgbXRkOiBzcGktbm9yOiBpbnRlbC1zcGk6IEFkZCBzdXBwb3J0IGZvciBJbnRlbCBKYXNw
ZXIgTGFrZSBTUEkgc2VyaWFsIAo+IGZsYXNoCj4gICAgICAgbXRkOiBzcGktbm9yOiBpbnRlbC1z
cGk6IEFkZCBzdXBwb3J0IGZvciBJbnRlbCBDb21ldCBMYWtlLVYgU1BJIHNlcmlhbCAKPiBmbGFz
aAo+IAo+IFJvYmVydCBNYXJrbyAoMSk6Cj4gICAgICAgbXRkOiBzcGktbm9yOiBBZGQgNEJfT1BD
T0RFUyBmbGFnIHRvIHcyNXEyNTYKPiAKPiBWaWduZXNoIFJhZ2hhdmVuZHJhICgzKToKPiAgICAg
ICBtdGQ6IHNwaS1ub3I6IFNwbGl0IG10MjVxdTUxMmEgKG4yNXE1MTJhKSBlbnRyeSBpbnRvIHR3
bwo+ICAgICAgIG10ZDogc3BpLW5vcjogQWRkIGVudHJpZXMgZm9yIG10MjVxIHZhcmlhbnRzCj4g
ICAgICAgbXRkOiBzcGktbm9yOiBBZGQgVVNFX0ZTUiBmbGFnIGZvciBuMjVxKiBlbnRyaWVzCj4g
Cj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvS2NvbmZpZyAgICAgICAgICAgfCAgIDQgKy0tCj4gIGRy
aXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNtYy5jICAgICAgfCAgIDQgKy0tCj4gIGRyaXZlcnMv
bXRkL3NwaS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMgfCAgIDQgKy0tCj4gIGRyaXZlcnMvbXRkL3Nw
aS1ub3IvaGlzaS1zZmMuYyAgICAgICAgfCAgIDYgKystLQo+ICBkcml2ZXJzL210ZC9zcGktbm9y
L2ludGVsLXNwaS1wY2kuYyAgIHwgICAyICsrCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5v
ci5jICAgICAgICAgfCAxMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvbXRk
L3NwaS1ub3IuaCAgICAgICAgICAgfCAgMTYgKysrLS0tLS0tCj4gIDcgZmlsZXMgY2hhbmdlZCwg
MTA3IGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQo+IAo+IAoKUHVsbGVkLCB0aGFua3Mh
CgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
