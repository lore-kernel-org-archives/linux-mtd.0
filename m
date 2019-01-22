Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401DEC282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 07:49:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BC720854
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 07:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcederUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BC720854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a752StZ5ItFDW3JL9JUvVlaD0mhO/tSNsfe8SvBcXSE=; b=VcederUhv7zGiB
	crtYu+50EHNVpHUR3B4AQLrlUa5VkcEKbfDsv5OREKziRAk3/bPknRxei1OW3TGRTZQN5+RjqE170
	5GTDAdz8zNo/wcbuboqc4OTyuZAMoknLWQgKlXmlRwKIFUcy2bHP2GuASWfh3Ca0k6mpPWcIEo87j
	PPFjOT0LRDIXPb4NRvkOr3+3JsJH3TwADvt8gRZEXNvgYQbhJBnOgzwhZf4l1uopvBRDR0UXAd6gS
	Z/R//Cf45apv7Nnvub4pAGKr1w9ymunEAh1bODymx/pH2caQDVc6PC63EJb2CTErVlX1CSQt6WknC
	5RABlR7z8NV+ZkfAhv5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glqoh-0005By-Ml; Tue, 22 Jan 2019 07:49:51 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glqof-0005BT-6c
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 07:49:50 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 476E52078C; Tue, 22 Jan 2019 08:49:45 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id D7130206DC;
 Tue, 22 Jan 2019 08:49:44 +0100 (CET)
Date: Tue, 22 Jan 2019 08:49:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: use unnamed union in struct
 nand_op_parser_pattern_elem
Message-ID: <20190122084944.420fcd4a@xps13>
In-Reply-To: <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
References: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
 <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_234949_375078_198A8F91 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Lucas Stach <dev@lynxeye.de>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDIyIEphbgoyMDE5IDE2OjQyOjU1ICswOTAwOgoKPiBBbHRob3Vn
aCBkcml2ZXJzIGRvIG5vdCBkaXJlY3RseSBnZXQgYWNjZXNzIHRvIHRoZSBwcml2YXRlIGRhdGEg
b2YKPiBpbnN0cnVjdGlvbiBwYXR0ZXJucywgbGV0J3MgdXNlIHVubmFtZWQgdW5pb24gZmllbGQg
dG8gYmUgY29uc2lzdGVudAo+IHdpdGggbmFuZF9vcF9pbnN0ci4KPiAKCkFjdHVhbGx5IHRoaXMg
aXMgaG93IHdlIHdyb3RlIGl0IHRoZSBmaXJzdCB0aW1lLiBUaGVuIHdlIGdvdCByb2JvdHMKcmVw
b3J0aW5nIHRoYXQgYW5vbnltb3VzIHVuaW9ucyB3aGVyZSBub3QgYWxsb3dlZCB3aXRoIG9sZGVy
IChzdGlsbApzdXBwb3J0ZWQpIEdDQyB2ZXJzaW9ucyBhbmQgSSBoYWQgdG8gZG8gdGhpczoKCgpj
b21taXQgYzFhNzJlMmRiYjRhYmI5MGJkNDA4NDgwZDdjNDhiYTQwY2I3OTljZQpBdXRob3I6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAZnJlZS1lbGVjdHJvbnMuY29tPgpEYXRlOiAgIEZy
aSBKYW4gMTkgMTk6MTE6MjcgMjAxOCArMDEwMAoKICAgIG10ZDogbmFuZDogRml4IGJ1aWxkIGlz
c3VlcyBkdWUgdG8gYW4gYW5vbnltb3VzIHVuaW9uCiAgICAKICAgIEdDQy00LjQuNCByYWlzZXMg
ZXJyb3JzIHdoZW4gYXNzaWduaW5nIGEgcGFyYW1ldGVyIGluIGFuIGFub255bW91cwogICAgdW5p
b24sIGxlYWRpbmcgdG8gdGhpcyBraW5kIG9mIGZhaWx1cmU6CiAgICAKICAgIGRyaXZlcnMvbXRk
L25hbmQvbWFydmVsbF9uYW5kLmM6MTkzNjoKICAgICAgICB3YXJuaW5nOiBtaXNzaW5nIGJyYWNl
cyBhcm91bmQgaW5pdGlhbGl6ZXIKICAgICAgICB3YXJuaW5nOiAobmVhciBpbml0aWFsaXphdGlv
biBmb3IgJyhhbm9ueW1vdXMpWzFdLjxhbm9ueW1vdXM+JykKICAgICAgICBlcnJvcjogdW5rbm93
biBmaWVsZCAnZGF0YScgc3BlY2lmaWVkIGluIGluaXRpYWxpemVyCiAgICAgICAgZXJyb3I6IHVu
a25vd24gZmllbGQgJ2FkZHInIHNwZWNpZmllZCBpbiBpbml0aWFsaXplcgogICAgCiAgICBXb3Jr
IGFyb3VuZCB0aGUgc2l0dWF0aW9uIGJ5IG5hbWluZyB0aGVzZSB1bmlvbnMuCiAgICAKICAgIEZp
eGVzOiA4ODc4YjEyNmRmNzYgKCJtdGQ6IG5hbmQ6IGFkZCAtPmV4ZWNfb3AoKSBpbXBsZW1lbnRh
dGlvbiIpCiAgICBSZXBvcnRlZC1ieTogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0
aW9uLm9yZz4KICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
ZnJlZS1lbGVjdHJvbnMuY29tPgogICAgVGVzdGVkLWJ5OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxp
bnV4LWZvdW5kYXRpb24ub3JnPgogICAgU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
