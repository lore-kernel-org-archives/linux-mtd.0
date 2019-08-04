Return-Path: <SRS0=EOAK=WA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38D4C433FF
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2019 21:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C04D62070D
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2019 21:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHqjUfFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C04D62070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pZiuAb/s/ylSoT7R4wla/3v0mIchpWPYGuUa8X3/PsI=; b=iHqjUfFXAtoRVc
	e0WyxuWWEdpVlKMwAi5XY6NWaR7zVBtohNj9h3wtNLfMD5aweuJYaGYUjtGeC5hJ+ZY9hBCLWLLaK
	tZQwHhFCiQYJ0fkp2oaedwZwoKlGkU1g7AxdRPgvodajrpb1whVup9HHAnWcJOCQzTGXrb27zrkUS
	kqQwLZoczbNQr/mu5ZJ0HNj/pOjxZLhOZxNmC/CiC8ibBTKB2V+CV0nSvl7F+fBiS4IhGKajDg+mi
	CeAVaVTIPYlCMaIr0NvKbVZjJGef04N1HR5xoPp75KMVSXcaCcAI9WRHz/cQUFdfkyFD4SFDG/K6q
	cDMBjsxYeJYBAL3jCM/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huO5r-0001Wy-67; Sun, 04 Aug 2019 21:31:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huO5o-0001WG-0C
 for linux-mtd@lists.infradead.org; Sun, 04 Aug 2019 21:31:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B57961BF206;
 Sun,  4 Aug 2019 21:30:45 +0000 (UTC)
Date: Sun, 4 Aug 2019 23:30:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for 5.3-rc4
Message-ID: <20190804232928.08b4b69a@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_143104_205171_070D8902 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpIZXJlIGFyZSB0aHJlZSBNVEQgZml4ZXMgZm9yIHRoZSBuZXh0IC1yYy4K
ClRoYW5rcywKTWlxdcOobAoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWY5
ZTgzMmMxMzcwNzUwNDVkMTVjZDY4OTlhYjA1MDVjZmIyY2E0YjoKCiAgTGludXMgNS4zLXJjMSAo
MjAxOS0wNy0yMSAxNDowNTozOCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbXRkL2xpbnV4LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNS4zLXJjMwoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDJiMzcyYTk2ODVhNzU3YTFkM2FiMzA2MTVlZjQyYjJkYjdjNDUy
OTg6CgogIG10ZDogaHlwZXJidXM6IEFkZCBoYXJkd2FyZSBkZXBlbmRlbmN5IHRvIEFNNjU0IGRy
aXZlciAoMjAxOS0wOC0wMyAwMjoxMTo1MiArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTkFORDoKLSBGaXggTWlj
cm9uIGRyaXZlciBhcyBzb21lIGNoaXBzIGVuYWJsZSBpbnRlcm5hbCBFQ0MgY29ycmVjdGlvbgog
IGR1cmluZyB0aGVpciBkaXNjb3Zlcnkgd2hpbGUgdGhleSBhZHZlcnRpemUgdGhleSBkbyBub3Qg
aGF2ZSBhbnkuCgpIeXBlcmJ1czoKLSBSZXN0cmljdCB0aGUgYnVpbGQgdG8gb25seSBBUk02NCBT
b0NzIChhbmQgY29tcGlsZSB0ZXN0aW5nKSB3aGljaCBpcwogIHdoYXQgc2hvdWxkIGhhdmUgYmVl
biBkb25lIHNpbmNlIHRoZSBiZWdpbm5pbmcuCi0gRml4IEtjb25maWcgaXNzdWUgYnkgc2VsZWN0
aW9uIHNvbWV0aGluZyBpbnN0ZWFkIG9mIGltcGx5aW5nIGl0LgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKZWFuIERlbHZh
cmUgKDEpOgogICAgICBtdGQ6IGh5cGVyYnVzOiBBZGQgaGFyZHdhcmUgZGVwZW5kZW5jeSB0byBB
TTY1NCBkcml2ZXIKCk1hcmNvIEZlbHNjaCAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogbWljcm9u
OiBoYW5kbGUgb24tZGllICJFQ0Mtb2ZmIiBkZXZpY2VzIGNvcnJlY3RseQoKVmlnbmVzaCBSYWdo
YXZlbmRyYSAoMSk6CiAgICAgIG10ZDogaHlwZXJidXM6IEtjb25maWc6IEZpeCBIQk1DX0FNNjU0
IGRlcGVuZGVuY2llcwoKIGRyaXZlcnMvbXRkL2h5cGVyYnVzL0tjb25maWcgICAgICAgfCAgMyAr
Ky0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMgfCAxNCArKysrKysrKysrKy0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
