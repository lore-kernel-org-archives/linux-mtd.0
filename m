Return-Path: <SRS0=c5zc=3K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC943C33CAA
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 19:09:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C304A21835
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 19:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJR5kGlc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C304A21835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W438ow6T0QkN32n4YXcjHozI0ymC76u9/K3SZnhaHXA=; b=rJR5kGlcR5M45q
	CUODxg9KOy8+OIXpRh7Ug9BqouOpyjULOHULcUn55oxfVmp3ZLgKl2ajyAAJMczgd3lgCwlOWPGbd
	TuKQ2Q+cthuZfOXN/Mdt4vzVICGk21sZP/oEGF10D9dTgu/BgmuVl974VYLgD8+chZpHzxFf0wsde
	ph+4syjSq71MdU6rxy/cJkgbCQGc8+fHXQGN1/N+ZvtGXzhSuCkw8FgWUrG8rLGmscUPUyLgxvYP8
	jPtxrhQr/4kjC5rO0BpvM+DnXpFWqK56fEZcEy0/ObU7a1sF4BcMyhM9KOLmCL7BkS1q85aEaUP9i
	ARJSqn7Xh93EyyfMTKVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itytS-0006OX-01; Tue, 21 Jan 2020 19:08:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itytJ-0006Nl-57
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2020 19:08:52 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C98D2E0007;
 Tue, 21 Jan 2020 19:08:31 +0000 (UTC)
Date: Tue, 21 Jan 2020 20:08:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: miquel.raynal@bootlin.com
Subject: [GIT PULL] mtd: nand: Changes for 5.6
Message-ID: <20200121200829.346bcbdc@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_110845_851927_195D558C 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIGlzIHRoZSBOQU5EIFBSIGZvciA1LjYuCgpUaGFua3MsCk1pcXXDqGwKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjNhOTg3YjAyNjRkM2RkYmIyNDI5M2Vi
ZmYxMGVkZGZjNDcyZjY1MzoKCiAgTGludXggNS41LXJjNiAoMjAyMC0wMS0xMiAxNjo1NTowOCAt
MDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdz
L25hbmQvZm9yLTUuNgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGQ4NTMzOWQ5ZWEy
NjYwYjU1MGYxMmFjYThiZDA0MGJlNDM5NWM5NjM6CgogIG10ZDogb25lbmFuZDogUmVuYW1lIG9t
YXAyIGRyaXZlciB0byBhdm9pZCBhIGJ1aWxkIHdhcm5pbmcgKDIwMjAtMDEtMjEgMjA6MDA6MzUg
KzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tClJhdyBOQU5ECiogTWFjcm9uaXg6IFVzZSBtYXRjaF9zdHJpbmcoKSBo
ZWxwZXIKKiBBdG1lbDogc3dpdGNoIHRvIHVzaW5nIGRldm1fZndub2RlX2dwaW9kX2dldCgpCiog
RGVuYWxpOiByZXdvcmsgdGhlIFNLSVBfQllURVMgZmVhdHVyZSBhbmQgYWRkIHJlc2V0IGNvbnRy
b2xsaW5nCiogQnJjbW5hbmQ6IHNldCBhcHByb3ByaWF0ZSBETUEgbWFzawoqIFZhcmlvdXMgY2xl
YW51cC4KCk9uZW5hbmQgZHJpdmVycwoqIFJlbmFtZSBTYW1zdW5nIGFuZCBPbWFwMiBkcml2ZXJz
IHRvIGF2b2lkIHBvc3NpYmxlIGJ1aWxkIHdhcm5pbmdzCiogRW5hYmxlIGNvbXBpbGUgdGVzdGlu
ZwoqIFZhcmlvdXMgYnVpbGQgaXNzdWVzCiogS2NvbmZpZyBjbGVhbnVwCgpTUEktTkFORAoqIFN1
cHBvcnQgZm9yIFRvc2hpYmEgVEM1OENWRzJTMEhSQUlKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNoZW4gV2FuZHVuICgx
KToKICAgICAgbXRkOiBvbmVuYW5kOiBzYW1zdW5nOiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2
YXJpYWJsZQoKRG1pdHJ5IFRvcm9raG92ICgxKToKICAgICAgbXRkOiByYXduYW5kOiBhdG1lbDog
c3dpdGNoIHRvIHVzaW5nIGRldm1fZndub2RlX2dwaW9kX2dldCgpCgpGbG9yaWFuIEZhaW5lbGxp
ICgxKToKICAgICAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogU2V0IGFwcHJvcHJpYXRlIERNQSBt
YXNrCgpLcnp5c3p0b2YgS296bG93c2tpICg0KToKICAgICAgbXRkOiBvbmVuYW5kOiBGaXggS2Nv
bmZpZyBpbmRlbnRhdGlvbgogICAgICBtdGQ6IG9uZW5hbmQ6IHNhbXN1bmc6IEZpeCBwb2ludGVy
IGNhc3QgLVdwb2ludGVyLXRvLWludC1jYXN0IHdhcm5pbmdzIG9uIDY0IGJpdAogICAgICBtdGQ6
IG9uZW5hbmQ6IHNhbXN1bmc6IEZpeCBwcmludGluZyBmb3JtYXQgZm9yIHNpemVfdCBvbiA2NC1i
aXQKICAgICAgbXRkOiBvbmVuYW5kOiBFbmFibGUgY29tcGlsZSB0ZXN0aW5nIG9mIE9NQVAgYW5k
IFNhbXN1bmcgZHJpdmVycwoKTWFyZWsgVmFzdXQgKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IGRl
bmFsaV9kdDogQWRkIHN1cHBvcnQgZm9yIGNvbmZpZ3VyaW5nIFNQQVJFX0FSRUFfU0tJUF9CWVRF
UwoKTWFzYWhpcm8gWWFtYWRhICg0KToKICAgICAgbXRkOiByYXduYW5kOiBkZW5hbGlfZHQ6IGVy
cm9yIG91dCBpZiBwbGF0Zm9ybSBoYXMgbm8gYXNzb2NpYXRlZCBkYXRhCiAgICAgIGR0LWJpbmRp
bmdzOiBtdGQ6IGRlbmFsaV9kdDogZG9jdW1lbnQgcmVzZXQgcHJvcGVydHkKICAgICAgbXRkOiBy
YXduYW5kOiBkZW5hbGlfZHQ6IGFkZCByZXNldCBjb250cm9sbGluZwogICAgICBtdGQ6IHJhd25h
bmQ6IGRlbmFsaTogcmVtb3ZlIGhhcmQtY29kZWQgREVOQUxJX0RFRkFVTFRfT09CX1NLSVBfQllU
RVMKCk1pcXVlbCBSYXluYWwgKDIpOgogICAgICBtdGQ6IG9uZW5hbmQ6IFVzZSBhIGJldHRlciBu
YW1lIGZvciBzYW1zdW5nIGRyaXZlcgogICAgICBtdGQ6IG9uZW5hbmQ6IFJlbmFtZSBvbWFwMiBk
cml2ZXIgdG8gYXZvaWQgYSBidWlsZCB3YXJuaW5nCgpOYXRoYW4gQ2hhbmNlbGxvciAoMSk6CiAg
ICAgIG10ZDogb25lbmFuZF9iYXNlOiBBZGp1c3QgaW5kZW50YXRpb24gaW4gb25lbmFuZF9yZWFk
X29wc19ub2xvY2sKClJvYmVydCBNYXJrbyAoMSk6CiAgICAgIG10ZDogc3BpbmFuZDogYWRkIHN1
cHBvcnQgZm9yIFRvc2hpYmEgVEM1OENWRzJTMEhSQUlKCgpZdWVIYWliaW5nICgyKToKICAgICAg
bXRkOiBzaGFycHNscGFydDogRml4IHVuc2lnbmVkIGNvbXBhcmlzb24gdG8gemVybwogICAgICBt
dGQ6IHJhd25hbmQ6IG1hY3Jvbml4OiBVc2UgbWF0Y2hfc3RyaW5nKCkgaGVscGVyIHRvIHNpbXBs
aWZ5IHRoZSBjb2RlCgp6aGVuZ2JpbiAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogbXBjNTEyMTog
UmVtb3ZlIHVubmVlZGVkIHNlbWljb2xvbgoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvZGVuYWxpLW5hbmQudHh0ICAgfCAgNyArKwogZHJpdmVycy9tdGQvbmFuZC9vbmVu
YW5kL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8IDE0ICsrLS0KIGRyaXZlcnMvbXRk
L25hbmQvb25lbmFuZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJp
dmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jICAgICAgICAgICAgICAgICB8IDgy
ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3tvbWFw
Mi5jID0+IG9uZW5hbmRfb21hcDIuY30gICB8ICAwCiAuLi4vbmFuZC9vbmVuYW5kL3tzYW1zdW5n
X210ZC5jID0+IG9uZW5hbmRfc2Ftc3VuZy5jfSAgIHwgIDkgKystCiBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyAgICAgICAgICAgIHwgMjAgKysrLS0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jICAgICAgICAgICAgICAgIHwgMTAg
KysrCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTQgKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpX2R0LmMgICAgICAgICAg
ICAgICAgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L21wYzUxMjFfbmZjLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9tYWNyb25peC5jICAgICAgICAgICAgICAgICAgICB8IDExICsrLS0KIGRy
aXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hpYmEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAx
MCArKysKIGRyaXZlcnMvbXRkL3BhcnNlcnMvc2hhcnBzbHBhcnQuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLQogMTQgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlvbnMoKyksIDg4IGRl
bGV0aW9ucygtKQogcmVuYW1lIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC97b21hcDIuYyA9PiBv
bmVuYW5kX29tYXAyLmN9ICgxMDAlKQogcmVuYW1lIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC97
c2Ftc3VuZ19tdGQuYyA9PiBvbmVuYW5kX3NhbXN1bmcuY30gKDk5JSkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
