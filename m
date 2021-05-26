Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E74C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:37:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A34661260
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A34661260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fbK0MsOMCSTvFcmO+y1BAdPbfTzmHKup1vnbNaYqlas=; b=sx58lj3biYWcnn
	iLiDhyjLkKlk2gQtRZFv+bKVw5BhevERQyrF8BD9Emj/Eo1YQigzOlTc264arg4g1DH/FKAsIbALz
	7d6Tiw4RpxwTx9pi6zHjv29ZAXnHGjqN37A/0cXWISVsZe/HTAh4fuKzFZ+6MyLWWvkUeRzqtvIiY
	i+xcNZgwgcoVKvKeici6wWHVgNPmGvBONJn5JkvaW9nDBeAam7F6G3vpFqrTOnUBUkDnlLX2ntF7c
	sSSWahGOAXtoWupCzsuzwwtHcwVEgaMCGaFV72NDVRcpu5FlZWVONCwDkwJFKKGFFgdZ5sw39LBXz
	2SH0zPiL3g/DC4bCjaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llrqL-00DcO8-M5; Wed, 26 May 2021 11:36:57 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpu9-00CueZ-JU
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:32:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 61F3F6000F;
 Wed, 26 May 2021 09:32:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND v3 0/4] Bring GPIO CS support to the Arasan controller driver
Date: Wed, 26 May 2021 11:32:38 +0200
Message-Id: <20210526093242.183847-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_023245_897578_3FD2E82B 
X-CRM114-Status: GOOD (  12.18  )
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

W1Jlc2VuZGluZyBiZWNhdXNlIG9mIHRoaXMgc2VyaWVzIG5vdCBhcHBlYXJpbmcgaW4gcGF0Y2h3
b3JrOiBJIHVzZWQgdGhlCndyb25nIHByZWZpeCB3aXRoIHYyIGluc3RlYWQgb2YgdjMgaW4gdGhl
IGNvdmVyIGxldHRlciBhbmQgdGhpcyBzZWVtcyB0bwpjb25mdXNlIHBhdGNod29yay9sb3JlLl0K
CkhlbGxvLAoKVGhpcyBpcyBhIHNob3J0IHNlcmllcyBicmluZ2luZyBhIHVzZWZ1bCBmZWF0dXJl
IGZvciBkcml2ZXJzIHdoaWNoIGFyZSBhCmxpdHRsZSBiaXQgY29uc3RyYWluZWQgcmVnYXJkaW5n
IHRoZWlyIG51bWJlciBvZiBuYXRpdmUgQ1MuIEFzCm1hbnVmYWN0dXJlciB0ZW5kIHRvIGdyb3Vw
IGNoaXBzIGluIGFycmF5cyB0byBlbmxhcmdlIHRoZSBvdmVyYWxsCmF2YWlsYWJsZSBzcGFjZSwg
aXQgbWlnaHQgYmUgdXNlZnVsIHRvIG90aGVyIGNvbnRyb2xsZXIgZHJpdmVycyB0byBtYWtlCnVz
ZSBvZiB0aGUgYWRkZWQgRFQgcHJvcGVydHkgKGNzLWdwaW9zKSBhcyB3ZWxsIGFzIHRoZSBjb3Jl
IGhlbHBlciB3aGljaAppcyBiZWluZyBpbnRyb2R1Y2VkIHRvIHBhcnNlIHRoaXMgRFQgcHJvcGVy
dHkgYW5kIHJldHVybmVkIGEgQ1MgYXJyYXkKd2l0aCBlaXRoZXIgZW1wdHkgY2VsbHMgKG5hdGl2
ZSBDUyBhcmUgYmVpbmcgdXNlZCkgb3IgYSBHUElPIGRlc2NyaXB0b3IKc3RydWN0dXJlIHBvaW50
ZXIgKEdQSU8gQ1MpLgoKVGhpcyBpcyBhcHBsaWVkIHRvIHRoZSBBcmFzYW4gTkFORCBjb250cm9s
bGVyIGRyaXZlciB3aGljaCBpbnZvbHZlZCBhCmxpdHRsZSBiaXQgbW9yZSBib2lsZXJwbGF0ZSB0
aGFuIGVzdGltYXRlZCBJIHRob3VnaHQgZHVlIHRvIGl0cyBpbnRlcm5hbApjb25zdHJhaW50cyBy
ZWdhcmRpbmcgdGhlIGJvbmQgYmV0d2VlbiBDUyBhbmQgUkIuCgpDaGVlcnMsCk1pcXXDqGwKClJl
c2VuZDoKKiB2MyB3YXMgbm90IHByb3Blcmx5IHBhcnNlZCBieSBwYXRjaHdvcmssIHRyeWluZyBh
Z2Fpbiwgbm8gY2hhbmdlcyBpbgogIHRoZSBwYXRjaGVzIG90aGVyd2lzZS4KCkNoYW5nZXMgaW4g
djM6CiogQWRkZWQgYSBtaXNzaW5nIE1PRFVMRV9FWFBPUlQoKSByZXBvcnRlZCBieSBrZXJuZWwg
dGVzdCByb2JvdC4KCkNoYW5nZXMgaW4gdjI6CiogUmViYXNlZCBvbiB0b3Agb2YgdjUuMTMtcmMx
CiogVGhpcyB0aW1lIEknbSBDQydpbmcgUm9iICsgRFQgTUwuLi4KCk1pcXVlbCBSYXluYWwgKDQp
OgogIG10ZDogcmF3bmFuZDogTW92ZSBzdHJ1Y3QgZ3Bpb19kZXNjIGRlY2xhcmF0aW9uIHRvIHRo
ZSB0b3AKICBtdGQ6IHJhd25hbmQ6IEFkZCBhIGhlbHBlciB0byBwYXJzZSB0aGUgZ3Bpby1jcyBE
VCBwcm9wZXJ0eQogIG10ZDogcmF3bmFuZDogYXJhc2FuOiBFbnN1cmUgcHJvcGVyIGNvbmZpZ3Vy
YXRpb24gZm9yIHRoZSBhc3NlcnRlZAogICAgdGFyZ2V0CiAgbXRkOiByYXduYW5kOiBhcmFzYW46
IExldmVyYWdlIGFkZGl0aW9uYWwgR1BJTyBDUwoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNh
bi1uYW5kLWNvbnRyb2xsZXIuYyB8IDIzOCArKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICB8ICAzOSArKysKIGluY2x1ZGUvbGlu
dXgvbXRkL3Jhd25hbmQuaCAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogMyBmaWxlcyBjaGFu
Z2VkLCAyMjYgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0pCgotLSAKMi4yNy4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
