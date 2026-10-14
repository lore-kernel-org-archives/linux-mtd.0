Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FBBCC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZa76SnApSyH1p2Xj0POF6H9p7FOoMqhjhRkduhW0Do=; b=fLalJidOt+qnfv
	rtgJwxeaQp6dQLLS6om9Ev5Q/ux5PGogeoCEiBWIAzu3IJbhlIbyPqoqDXlFTTwsXzapO2pXaMFKT
	GWWj9fxQ7nNDdXBP4Q3ivYxNsFijyxCWW7HBomGVU0N5a0MjQ3h3F7Vqs3SWzbqww1xTpfnskNKUp
	aw/m2uA353to+cBePXstDZOGm76JlLowrM2vIDEdrVo5/ME6KwTqm5DWFJreXVWNkms9gpDaqzuuz
	oHJgZ8QONrGhCCPXpPkg1tbpgTXygFTcmJKA3P3++ql5fttKeDG35+gvQUNMsQsUrgElnB8s1ZheM
	12eu8+pmLiFPIfLt9IOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1Q8-0000000FvQM-0Q4U;
	Wed, 14 Oct 2026 16:01:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1Pp-0000000FvP2-1z6V
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 16:01:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 169EA43286;
	Wed, 14 Oct 2026 16:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C95C1F000C4;
	Wed, 14 Oct 2026 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791993677;
	bh=u8nhsIdnRTIqxWWvfUm76zLTui4wKN348PbYBvSlkfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RZtbi7ixluduFVTI/iIkX0oqPXs3b2tzR2jG0jokIUvqG5gsNueWm9jFp+ZTm/hxe
	 SilkfDdYwwU1hvt08V3NaclPh48OxaImW7Yc2Hn7B11m+2wUbO4dCDHdSXqsqKRH1o
	 72vpHGWeUou6XVy17VftrUeMnq+y6FgCK6tCbbueNC9hndDcTprLcsFxHyla7jhj8H
	 OhzAn38qPKoagwOhoAhQJxFhs/X7Ix3Y4SkBe8tS7aXgBQaXtnDfgIEvkFDhWvhLzS
	 Aj8dpLKsDfUOjOd3NWPpNEDUGTs6NMVS/Uwp5YqSgo/41yWtILQxq8Zfo2EJLvZ5BM
	 9KkiYtUa7MtrQ==
Message-ID: <sashiko-outbox-171511@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] spi: cadence-xspi: Clear "SDMA ready" IRQ flag
 after polling
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261014154301.157755-5-paul.cercueil@bootlin.com>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
 <20261014154301.157755-5-paul.cercueil@bootlin.com>
Date: Wed, 14 Oct 2026 16:01:15 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogY2FkZW5jZS14
c3BpOiBFbmRpYW5uZXNzIGRhdGEgY29ycnVwdGlvbiBpbiBTRE1BIEZJRk8gYWNjZXNzb3JzCi0t
Cgpjb21taXQgMWNhMDZkMTU0MTYzN2Y2YjczNGZlNDUxMTIzNjZjMTk4N2Q1OTc4NQpBdXRob3I6
IFRhbm1heSBKYWdkYWxlIDx0YW5tYXlAbWFydmVsbC5jb20+CgpzcGk6IGNhZGVuY2UteHNwaTog
Q2xlYXIgIlNETUEgcmVhZHkiIElSUSBmbGFnIGFmdGVyIHBvbGxpbmcKCldoZW4gcG9sbGluZyBm
b3IgdGhlICJTRE1BIHJlYWR5IiBldmVudCwgb25jZSB0aGUgY29ycmVzcG9uZGluZyBiaXQgaXMK
c2V0IGluIHRoZSBDRE5TX1hTUElfU0RNQV9UUklHR0VSIHdlIHNob3VsZCByZXNldCBpdCB0byB6
ZXJvLiBPdGhlcndpc2UsCmFueSBzdWJzZXF1ZW50IGNhbGwgdG8gY2Ruc194c3BpX2lzX3NkbWFf
cmVhZHkoKSB3aWxsIGp1c3QgcmV0dXJuIGVhcmx5LgoKRml4ZXM6IDkzMWUzODlkZWQwZiAoInNw
aTogY2FkZW5jZTogQWRkIE1hcnZlbGwgeGZlciBvcGVyYXRpb24gc3VwcG9ydCIpCkNjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5j
ZS14c3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmMKPiBpbmRleCAzOWM4Njhh
NWIxNzFjLi4wOTViZjY0MGIzNzlhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1jYWRl
bmNlLXhzcGkuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXhzcGkuYwo+IEBAIC0x
MDY4LDEyICsxMDY4LDIwIEBAIHN0YXRpYyBib29sIGNkbnNfeHNwaV9pc19zZG1hX3JlYWR5KHN0
cnVjdCBjZG5zX3hzcGlfZGV2ICpjZG5zX3hzcGksIGJvb2wgc2xlZXApCj4gIHsKPiAgCXUzMiBj
dHJsX3N0YXQ7Cj4gIAo+IC0JcmV0dXJuICFyZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dAo+IC0J
CShjZG5zX3hzcGktPmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NUQVRVU19SRUcsCj4gLQkJY3Ry
bF9zdGF0LAo+IC0JCShjdHJsX3N0YXQgJiBDRE5TX1hTUElfU0RNQV9UUklHR0VSKSwKPiAtCQlz
bGVlcCA/IE1SVkxfWFNQSV9QT0xMX0RFTEFZX1VTIDogMCwKPiAtCQlzbGVlcCA/IE1SVkxfWFNQ
SV9QT0xMX1RJTUVPVVRfVVMgOiAwKTsKPiArCWlmIChyZWFkbF9yZWxheGVkX3BvbGxfdGltZW91
dAo+ICsJICAgIChjZG5zX3hzcGktPmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NUQVRVU19SRUcs
Cj4gKwkgICAgIGN0cmxfc3RhdCwKPiArCSAgICAgKGN0cmxfc3RhdCAmIENETlNfWFNQSV9TRE1B
X1RSSUdHRVIpLAo+ICsJICAgICBzbGVlcCA/IE1SVkxfWFNQSV9QT0xMX0RFTEFZX1VTIDogMCwK
PiArCSAgICAgc2xlZXAgPyBNUlZMX1hTUElfUE9MTF9USU1FT1VUX1VTIDogMCkpIHsKPiArCQly
ZXR1cm4gZmFsc2U7Cj4gKwl9Cj4gKwo+ICsJLyogQ2xlYXIgdGhlIGZsYWcgKi8KPiArCXdyaXRl
bChDRE5TX1hTUElfU0RNQV9UUklHR0VSLAo+ICsJICAgICAgIGNkbnNfeHNwaS0+aW9iYXNlICsg
Q0ROU19YU1BJX0lOVFJfU1RBVFVTX1JFRyk7Cj4gKwo+ICsJcmV0dXJuIHRydWU7Cj4gIH0KCltT
ZXZlcml0eTogSGlnaF0KRG9lcyB0aGlzIGNvZGUgY29ycnVwdCBkYXRhIG9uIGJpZy1lbmRpYW4g
YXJjaGl0ZWN0dXJlcz8KCkluIG1faW9yZWFkcSgpLCByZWdpc3RlciBhY2Nlc3NvcnMgYXJlIHVz
ZWQgaW5zdGVhZCBvZiBzdHJlYW0gYWNjZXNzb3JzIHRvCnJlYWQgYnVsayBzdHJlYW0gZGF0YSBm
cm9tIHRoZSBTRE1BIEZJRk86Cgpkcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmM6bV9pb3Jl
YWRxKCkgewogICAgLi4uCgkJZG8gewoJCQl1NjQgYiA9IHJlYWRxKGFkZHIpOwoJCQkqYnVmZmVy
KysgPSBiOwoJCX0gd2hpbGUgKC0tZnVsbF9vcHMpOwogICAgLi4uCn0KCkJlY2F1c2UgYWRkciBp
cyBub3QgaW5jcmVtZW50ZWQsIHRoaXMgcmVhZHMgZnJvbSBhIEZJRk8uIFJlZ2lzdGVyIGFjY2Vz
c29ycwpsaWtlIHJlYWRxKCkgcGVyZm9ybSBieXRlLXN3YXBwaW5nLCB3aGljaCByZXZlcnNlcyB0
aGUgYnl0ZSBzdHJlYW0gd2l0aGluCmVhY2ggOC1ieXRlIGNodW5rIG9uIGJpZy1lbmRpYW4gc3lz
dGVtcy4KClNpbWlsYXJseSwgZm9yIHBhcnRpYWwgdHJhbnNmZXJzIGluIG1faW9yZWFkcSgpOgoK
ZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jOm1faW9yZWFkcSgpIHsKICAgIC4uLgoJd2hp
bGUgKGxlbikgewoJCXU2NCB0bXBfYnVmOwoKCQl0bXBfYnVmID0gcmVhZHEoYWRkcik7CgkJbWVt
Y3B5KGJ1ZiwgJnRtcF9idWYsIG1pbihsZW4sIDgpKTsKICAgIC4uLgp9CgpDb21iaW5pbmcgYSBi
eXRlLXN3YXBwaW5nIHJlYWRxKCkgd2l0aCBtZW1jcHkoKSBleHRyYWN0cyBpbmNvcnJlY3QgYnl0
ZXMgb24KYmlnLWVuZGlhbiBzeXN0ZW1zIGJlY2F1c2UgdGhlIHJldmVyc2VkIDY0LWJpdCB3b3Jk
IHBsYWNlcyB0aGUgd3Jvbmcgc3RyZWFtCmJ5dGVzIGluIHRoZSBsb3dlc3QgbWVtb3J5IGFkZHJl
c3Nlcy4KClRoZSBzYW1lIGJlaGF2aW9yIGFwcGVhcnMgaW4gbV9pb3dyaXRlcSgpIHdoZW4gd3Jp
dGluZyB0byB0aGUgU0RNQSBGSUZPOgoKZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jOm1f
aW93cml0ZXEoKSB7CiAgICAuLi4KCQlkbyB7CgkJCXdyaXRlcSgqYnVmZmVyKyssIGFkZHIpOwoJ
CX0gd2hpbGUgKC0tZnVsbF9vcHMpOwogICAgLi4uCn0KClNob3VsZCB0aGVzZSBiZSBjb252ZXJ0
ZWQgdG8gc3RyZWFtIGFjY2Vzc29ycyB0byBwcmVzZXJ2ZSBieXRlIG9yZGVyIG9uCmJpZy1lbmRp
YW4gc3lzdGVtcz8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjEwMTQxNTQzMDEuMTU3NzU1LTEtcGF1bC5jZXJjdWVpbEBib290bGlu
LmNvbT9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
