Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCED3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 22:04:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56DF60724
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 22:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A56DF60724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ablnx2EqGbIpxqpvsdOquo56VbOuv70IOVD3bSFuAxM=; b=JzbUsm9JPoTVrl
	I8dHpzYhUbc3hh7/KZ78DjBYDZ80FOEpJQ44JYHINQQ3FIZyweE2AgQQTZngeCytc3OCqv2s3bAhX
	OAKtUsDc7E1ltvNXjp+sHjLJvNLqSwqCfE3Rbql1GQv/WaQJRZnH+DPfBfDpZ/XNXP36ZiZPdztbs
	cz2JeQ1zQAydrF/pb6DQXA7NlYn1Jwswc+cNxKI4TbeO37gez04xxu/VrhDNsNPjfCAy5uJ+0GxQN
	pwfWoFzGS+hsURGy9FQbD25yconKBI7Vc6wYNQr7MnySuXNXD2rWo5LOglkiffmotmE/YxZqiO1cn
	oWVomi3O47y/LKC4KRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLunm-00Aa6Y-H2; Thu, 02 Sep 2021 22:03:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLunj-00Aa5m-9q
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 22:03:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 93C501BF205;
 Thu,  2 Sep 2021 22:03:11 +0000 (UTC)
Date: Fri, 3 Sep 2021 00:03:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [GIT PULL] mtd: nand: Changes for 5.15
Message-ID: <20210903000310.6cd0fbff@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_150315_522506_C676605C 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgpUaGlzIGlzIHRoZSBOQU5EIFBSIGZvciA1LjE1LgoKVGhhbmtzLApNaXF1w6hsCgpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU3M2YwZjBlZTc1NDExNzFkODlmMmUy
NDkxMTMwYzc3NzFiYTU4ZDM6CgogIExpbnV4IDUuMTQtcmMxICgyMDIxLTA3LTExIDE1OjA3OjQw
IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRh
Z3MvbmFuZC9mb3ItNS4xNQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDZiNDMwYzc1
OTVlNGViOTVmYWU4ZmI1NGFkYzNjM2NlMDAyZTc1YWU6CgogIG10ZDogcmF3bmFuZDogY2FmZTog
Rml4IGEgcmVzb3VyY2UgbGVhayBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBvZiAnY2FmZV9u
YW5kX3Byb2JlKCknICgyMDIxLTA4LTIzIDEwOjU4OjE0ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpOQU5EIGNv
cmUgY2hhbmdlczoKKiBSZXBhaXIgTWlxdWVsIFJheW5hbCdzIGVtYWlsIGFkZHJlc3MgaW4gTUFJ
TlRBSU5FUlMKKiBGaXggYSBjb3VwbGUgb2Ygc3BlbGxpbmcgbWlzdGFrZXMgaW4gS2NvbmZpZwoq
IGJidDogU2tpcCBiYWQgYmxvY2tzIHdoZW4gc2VhcmNoaW5nIGZvciB0aGUgQkJUIGluIE5BTkQK
KiBSZW1vdmUgbmV2ZXIgY2hhbmdlZCByZXQgdmFyaWFibGUKClJhdyBOQU5EIGNoYW5nZXM6Ciog
Y2FmZTogRml4IGEgcmVzb3VyY2UgbGVhayBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBvZiAn
Y2FmZV9uYW5kX3Byb2JlKCknCiogaW50ZWw6IEZpeCBlcnJvciBoYW5kbGluZyBpbiBwcm9iZQoq
IG9tYXA6IEZpeCBrZXJuZWwgZG9jIHdhcm5pbmcgb24gJ2NhbGN1YXRlJyB0eXBvCiogZ3BtYzog
Rml4IHRoZSBFQ0MgYnl0ZXMgdnMuIE9PQiBieXRlcyBlcXVhdGlvbgoKU1BJLU5BTkQgY29yZSBj
aGFuZ2VzOgoqIFByb3Blcmx5IGZpbGwgdGhlIE9PQiBhcmVhLgoqIEZpeCBjb21tZW50CgpTUEkt
TkFORCBkcml2ZXJzIGNoYW5nZXM6CiogbWFjcm9uaXg6IEFkZCBRdWFkIHN1cHBvcnQgZm9yIHNl
cmlhbCBOQU5EIGZsYXNoCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlzdG9waGUgSkFJTExFVCAoMSk6CiAgICAgIG10
ZDogcmF3bmFuZDogY2FmZTogRml4IGEgcmVzb3VyY2UgbGVhayBpbiB0aGUgZXJyb3IgaGFuZGxp
bmcgcGF0aCBvZiAnY2FmZV9uYW5kX3Byb2JlKCknCgpDb2xpbiBJYW4gS2luZyAoMSk6CiAgICAg
IG10ZDogcmF3bmFuZDogRml4IGEgY291cGxlIG9mIHNwZWxsaW5nIG1pc3Rha2VzIGluIEtjb25m
aWcKCkRhbmllbCBQYWxtZXIgKDEpOgogICAgICBtdGQ6IHNwaW5hbmQ6IGNvcmU6IFByb3Blcmx5
IGZpbGwgdGhlIE9PQiBhcmVhLgoKRXZnZW55IE5vdmlrb3YgKDEpOgogICAgICBtdGQ6IHJhd25h
bmQ6IGludGVsOiBGaXggZXJyb3IgaGFuZGxpbmcgaW4gcHJvYmUKCkphaW1lIExpYW8gKDEpOgog
ICAgICBtdGQ6IHNwaW5hbmQ6IG1hY3Jvbml4OiBBZGQgUXVhZCBzdXBwb3J0IGZvciBzZXJpYWwg
TkFORCBmbGFzaAoKSmFzb24gV2FuZyAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogcmVtb3ZlIG5l
dmVyIGNoYW5nZWQgcmV0IHZhcmlhYmxlCgpMdWthcyBCdWx3YWhuICgxKToKICAgICAgTUFJTlRB
SU5FUlM6IHJlcGFpciBNaXF1ZWwgUmF5bmFsJ3MgZW1haWwgYWRkcmVzcwoKTWlxdWVsIFJheW5h
bCAoMik6CiAgICAgIGR0LWJpbmRpbmdzOiBtdGQ6IGdwbWM6IEZpeCB0aGUgRUNDIGJ5dGVzIHZz
LiBPT0IgYnl0ZXMgZXF1YXRpb24KICAgICAgbXRkOiBzcGluYW5kOiBGaXggY29tbWVudAoKU3Rl
ZmFuIFJpZWRtdWVsbGVyICgxKToKICAgICAgbXRkOiByYXduYW5kOiBuYW5kX2JidDogU2tpcCBi
YWQgYmxvY2tzIHdoZW4gc2VhcmNoaW5nIGZvciB0aGUgQkJUIGluIE5BTkQKClZsYWRpbWlyIE1v
bG9rb3YgKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IG9tYXA6IEZpeCBrZXJuZWwgZG9jIHdhcm5p
bmcgb24gJ2NhbGN1YXRlJyB0eXBvCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9ncG1jLW5hbmQudHh0IHwgIDIgKy0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2NhZmVfbmFuZC5jICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jICAgICAgICB8IDI3ICsrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jICAgICAg
ICAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYyAg
ICAgICAgICAgICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDQgKysrLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYyAgICAgICAgICAgICAg
ICAgICAgIHwgMTYgKysrKysrKystLS0tLS0tLQogMTAgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0
aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
