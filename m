Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5A6C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:07:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8086D24656
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ULoRDgmg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8086D24656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNA/D9VOXNqEv8reF7QfbnipCmsyTyk3xyXkhwAgFYw=; b=ULoRDgmgBPe4tb
	USYlqqgiiDhFd3luj8dofgTvTun5fnU6WkZTUp7gR10dZt+3dsVkJ3YomlImujlvVIJfdWpUJNTLo
	Ds5kOrTbrMZnbblGz0FCINzmVnwtLrLFNMnf7L64n6dIQLM9zVyMKxP6ezE6GcNKmWG6GpW1xV6f7
	5oTdakNP1AV2P80Pigy5kDsP9GaRhEFxCZe4byfwQZMrd+/ZECeF1wS5mFbZFml3BG4pNucvsCDqo
	ZYCeqJ+RS0yFzjWGOk//cTDlN3Dv2pGRFto4gbH0A+FoCvRxW0F0u+Q1txza6wbuKX8j/tSOUgDxq
	EzSxrEpBrksbVmmsdSUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPfM-0001va-3i; Tue, 14 Jan 2020 17:07:44 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPdF-00004r-Dx; Tue, 14 Jan 2020 17:05:39 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 50E90E0009;
 Tue, 14 Jan 2020 17:05:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: onenand: samsung: Fix pointer cast
 -Wpointer-to-int-cast warnings on 64 bit
Date: Tue, 14 Jan 2020 18:05:28 +0100
Message-Id: <20200114170528.1554-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183612.22133-1-krzk@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d321e010dc0dd3a28d48f1d9314161678ac13aa1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_090533_644648_712E57C1 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDE5LTEyLTI5IGF0IDE4OjM2OjEwIFVUQywgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBpb21lbSBwb2ludGVycyBzaG91bGQgYmUgY2FzdGVkIHRvIHVuc2lnbmVkIGxvbmcg
dG8gYXZvaWQKPiAtV3BvaW50ZXItdG8taW50LWNhc3Qgd2FybmluZ3Mgd2hlbiBjb21waWxpbmcg
b24gNjQtYml0IHBsYXRmb3JtIChlLmcuCj4gd2l0aCBDT01QSUxFX1RFU1QpOgo+IAo+ICAgICBk
cml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZ19tdGQuYzogSW4gZnVuY3Rpb24g4oCYczNj
X29uZW5hbmRfcmVhZHfigJk6Cj4gICAgIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5n
X210ZC5jOjI1MTo2OiB3YXJuaW5nOgo+ICAgICAgICAgY2FzdCBmcm9tIHBvaW50ZXIgdG8gaW50
ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdwb2ludGVyLXRvLWludC1jYXN0XQo+ICAgICAgIGlm
ICgodW5zaWduZWQgaW50KSBhZGRyIDwgT05FTkFORF9EQVRBUkFNICYmIG9uZW5hbmQtPmJvb3Ry
YW1fY29tbWFuZCkgewo+ICAgICAgICAgICBeCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwg
dGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
