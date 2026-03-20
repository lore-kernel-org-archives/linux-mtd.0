Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2A31093188
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QTjJbdKVtEb0OlgX2vCwX+O0HFx04JKvDGEP2Z6g+18=; b=S8DxX48wIx+9Bv
	UtOwexW1H02entT54q9WfKdcjgfvIL6qfo/fvC7qKfws8DMGaIQosw1IDTjS/4d6GOAckZ5ITlnsX
	CQTrqj6BM9D8QF0doliFNdZZMf4LNi5UilgFGkKQLMtzde9gfueZRvCCo5UlCkoj8Czn0kpwsox3A
	ISmsYmEhmEWSnNwiYgBNKFCH7cpyow0XmiZnYAo/iwNQ6C98czR3MEulXnStpOsDa0qrRTcU5BC2k
	pK0CDwSpSrmgrcJRgupptjOYzNnPPJV91SYqAgMyx0Nl/9/TFV87Rtp7QUa79yx7zOL5f+CmHbAKS
	hRsTmdBHG83Dntp4EKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3V3u-0000000CKSW-2Tcb;
	Fri, 20 Mar 2026 08:18:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3V3r-0000000CKRy-12JI
	for linux-mtd@lists.infradead.org;
	Fri, 20 Mar 2026 08:18:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 089F21A2EEC;
	Fri, 20 Mar 2026 08:18:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7066600E0;
	Fri, 20 Mar 2026 08:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0D8410450B51;
	Fri, 20 Mar 2026 09:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773994702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=r4TNE/S9ZG8zj9Nf33hs22XY0JSvrEPhC2B3jnmxq5o=;
	b=kWdxSPod5GxueWW1NMT/4k4q+uR36/1UBkpsL6/c2wQOhMNTRFjsyDH24lJ+jpD4Gi08Kc
	8fny9wtQSZmHurVTKp8D116Nfs2SXY+E1eK9qys8OZl4za46iBbl3KIsnmt5ZT7MszpGbO
	RWKMpgX1B/GE3e4v/JjzU9EMbyNoJ2jfWhf/bXWeIHBAcfRoyHy9jndBIz6eNeQtHcAjFb
	d8tvJzXieaNDk0SO4zRY9MjJRtYIxeSxGvTskmsiEJRs6snjcmDahFZOwgcHpNfORAeSZI
	Tt5IhmRrFkE+aP8mfCXXwChjxJOvTvn9iSb/Wi6LRa4W8iohZ9cjIHO00PwL/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Subject: [GIT PULL] mtd: Fixes for 7.0-rc5
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 20 Mar 2026 09:18:17 +0100
Message-ID: <87v7eqc3sm.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_011827_794451_2C56880E 
X-CRM114-Status: UNSURE (   7.81  )
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

SGVsbG8sCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciA3LjAtcmM1LgoKUm9iLCBzb3JyeSBm
b3IgdGhlIGRlbGF5LCB0aGlzIFBSIGNvbnRhaW5zIHRoZSBEVCBiaW5kaW5nIGZpeGVzIHlvdSB3
ZXJlCndhaXRpbmcgZm9yLgoKVGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IDZkZTIzZjgxYTVlMDhiZThmYmY1ZThkN2U5ZmViYzcyYTViNWYyN2Y6Cgog
IExpbnV4IDcuMC1yYzEgKDIwMjYtMDItMjIgMTM6MTg6NTkgLTA4MDApCgphcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTcuMC1y
YzUKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBiOTQ2NWIwNGRlNGI5MDIyOGRlMDNk
YjlhMWUwZDU2YjAwODE0MzY2OgoKICBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBtYWtlIHN1cmUgb3B0
aW1hbCB0aW1pbmdzIGFyZSBhcHBsaWVkICgyMDI2LTAzLTE4IDE4OjA4OjI1ICswMTAwKQoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpJbiBTUEkgTk9SLCB0aGVyZSB3YXMgYW4gaXNzdWUgd2l0aCB0aGUgUkRDUiBjYXBhYmls
aXR5LCBsZWFkaW5nIHRvCnNldmVyYWwgcGxhdGZvcm1zIG5vIGxvbmdlciBjYXBhYmxlIG9mIHVz
aW5nIGl0IGZvciB3cm9uZyByZWFzb25zICh0aGUKZm9sbG93LXVwIGNvbW1pdCByZW5hbWVzIHRo
ZSBoZWxwZXIgdG8gYXZvaWQgZnV0dXJlIGNvbmZ1c2lvbikuCgpOQU5EIGNvbnRyb2xsZXIgZHJp
dmVycyBuZWVkZWQgdG8gYmUgaW1wcm92ZWQgdG8gZml4IHNvbWUgdGltaW5ncywKYSBsb2NraW5n
IHNjaGVuYXJpbyBhbmQgYXZvaWQgY2VydGFpbiBvcGVyYXRpb25zIGR1cmluZyBwYW5pYyB3cml0
ZXMuCgpUaGUgU3BlYXI2MDAgRFQgYmluZGluZyBjb252ZXJzaW9uIHdhcyBkb25lIHBhcnRpYWxs
eSwgbGVhZGluZyB0bwpzZXZlcmFsIHdhcm5pbmdzIHdoaWNoIGhhdmUgaW5kaXZpZHVhbGx5IGJl
ZW4gZml4ZWQuCgpUdWRvciBnZXRzIHJlcGxhY2VkIGJ5IFRha2FoaXJvIGZvciB0aGUgU1BJIE5P
UiBtYWludGFpbmFuY2UuCgpQbHVzIHR3byBtb3JlIG1pc2MgZml4ZXMuCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNoZW4g
TmkgKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IGNhZGVuY2U6IEZpeCBlcnJvciBjaGVjayBmb3Ig
ZG1hX2FsbG9jX2NvaGVyZW50KCkgaW4gY2FkZW5jZV9uYW5kX2luaXQoKQoKRmlubiBUaGFpbiAo
MSk6CiAgICAgIG10ZDogQXZvaWQgYm9vdCBjcmFzaCBpbiBSZWRCb290IHBhcnRpdGlvbiB0YWJs
ZSBwYXJzZXIKCkthbWFsIERhc3UgKDIpOgogICAgICBtdGQ6IHJhd25hbmQ6IHNlcmlhbGl6ZSBs
b2NrL3VubG9jayBhZ2FpbnN0IG90aGVyIE5BTkQgb3BlcmF0aW9ucwogICAgICBtdGQ6IHJhd25h
bmQ6IGJyY21uYW5kOiBza2lwIERNQSBkdXJpbmcgcGFuaWMgd3JpdGUKCk1pcXVlbCBSYXluYWwg
KDUpOgogICAgICBkdC1iaW5kaW5nczogbXRkOiBzdCxzcGVhcjYwMC1zbWk6IEZpeCBkZXNjcmlw
dGlvbgogICAgICBkdC1iaW5kaW5nczogbXRkOiBzdCxzcGVhcjYwMC1zbWk6ICNhZGRyZXNzL3Np
emUtY2VsbHMgaXMgbWFuZGF0b3J5CiAgICAgIGR0LWJpbmRpbmdzOiBtdGQ6IHN0LHNwZWFyNjAw
LXNtaTogRml4IGV4YW1wbGUKICAgICAgbXRkOiBzcGktbm9yOiBGaXggUkRDUiBjb250cm9sbGVy
IGNhcGFiaWxpdHkgY29yZSBjaGVjawogICAgICBtdGQ6IHNwaS1ub3I6IFJlbmFtZSBzcGlfbm9y
X3NwaW1lbV9jaGVja19vcCgpCgpPbGl2aWVyIFNvYnJpZSAoMSk6CiAgICAgIG10ZDogcmF3bmFu
ZDogcGwzNTM6IG1ha2Ugc3VyZSBvcHRpbWFsIHRpbWluZ3MgYXJlIGFwcGxpZWQKClR1ZG9yIEFt
YmFydXMgKDIpOgogICAgICBNQUlOVEFJTkVSUzogcmVtb3ZlIFR1ZG9yIEFtYmFydXMgYXMgU1BJ
IE5PUiBtYWludGFpbmVyCiAgICAgIE1BSU5UQUlORVJTOiBhZGQgVGFrYWhpcm8gS3V3YW5vIGFz
IFNQSSBOT1IgcmV2aWV3ZXIKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3Qsc3BlYXI2
MDAtc21pLnlhbWwgICB8IDI2ICsrKysrKysrKysrKysrKystLS0tLS0KIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgICAgICAgICAgIHwgIDYgKystLS0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMgICAgIHwgIDIgKy0KIGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICAgICAgIHwgMTQgKysr
KysrKysrKy0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYyAg
ICAgICB8ICAzICsrKwogZHJpdmVycy9tdGQvcGFyc2Vycy9yZWRib290LmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgNiArKy0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxNCArKysrKystLS0tLS0KIDggZmlsZXMgY2hhbmdlZCwgNDggaW5z
ZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
