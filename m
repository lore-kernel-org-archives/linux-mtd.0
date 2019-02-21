Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702F8C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8932086C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+sYLkr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8932086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VMGbz/DqZkjV+fNqcZ8IW1w6duW2zfcxHXYA0VjzRkY=; b=F+sYLkr6uo4uAY
	mE5gXpyXF7ETnjP3VzDGs9hiuGfcblOF1IpFWp9Q9a+kBxtGMOaGhuzsRDtyN6QgBWXOeE//5hHLR
	JCLji8EtRZlVxt4+0onQEwogpQsxaFPj/Fqx+MljsB0IkRBu0ueDs98shhwUQIEWqI+ScyJXWTS+C
	V4sLxX8VQt+yFnPKX7AD2Rzu0jO3KPkEyJOE/YM7WR1QFlr+v8jnnjy3fWdeywIjHCCj1GfGOpdqv
	+7eT370yEDBuvwWZIR9D3RHpjAbyFk5KWQ9ekC/oO3PoVn67+940RPRWVhPnysqNu4Ckxxk+mGRXk
	nb0D62Dc/GJZ9jxVJ2pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwjM3-0000JX-Ky; Thu, 21 Feb 2019 08:05:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwjLy-0000Ih-HY
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 08:05:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E609527D486;
 Thu, 21 Feb 2019 08:05:07 +0000 (GMT)
Date: Thu, 21 Feb 2019 09:05:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>, Marek Vasut <marex@denx.de>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.1
Message-ID: <20190221090504.7321919f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_000510_850144_C6E0B11B 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpIZXJlIGlzIHRoZSBTUEkgTk9SIFBSIChwcmVwYXJlZCBieSBUdWRvciBhbmQgc2Vu
dCBieSBtZSA6KSkgZm9yIDUuMS4KTGV0IHVzIGtub3cgaWYgeW91IHNwb3QgYW55dGhpbmcgb2Rk
IGluIHRoZXJlLgoKVGhhbmtzLAoKQm9yaXMKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgYmZlZmZkMTU1MjgzNzcyYmJlNzhjNmEwNWRlYzdjMDEyOGVlNTAwYzoKCiAgTGludXgg
NS4wLXJjMSAoMjAxOS0wMS0wNiAxNzowODoyMCAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1tdGQu
Z2l0IHRhZ3Mvc3BpLW5vci9mb3ItNS4xCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
MjI1YzBlZGEzNmJkYjUzMjdkYzAxMjVmNGNmMjIyYzRjZmQ4MDJhYToKCiAgbXRkOiBzcGktbm9y
OiBGaXggd3JvbmcgYWJicmV2aWF0aW9uIEhXQ1BBUyAoMjAxOS0wMi0yMSAwODo1ODo0MCArMDEw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KU1BJIE5PUiBDaGFuZ2VzCiAgQ29yZSBjaGFuZ2VzOgogIC0gQWRkIHN1cHBv
cnQgb2Ygb2N0YWwgbW9kZSBJL08gdHJhbnNmZXIKICAtIEFkZCBhIGJ1bmNoIG9mIFNQSSBOT1Ig
ZW50cmllcyB0byB0aGUgZmxhc2hfaW5mbyB0YWJsZQoKICBTUEkgTk9SIGNvbnRyb2xsZXIgZHJp
dmVyIGNoYW5nZXM6CiAgLSBjYWRlbmNlLXF1YWRzcGk6CiAgICAqIEFkZCBzdXBwb3J0IGZvciBP
Y3RhbCBTUEkgY29udHJvbGxlcgogICAgKiB3cml0ZSB1cHRvIDgtYnl0ZXMgZGF0YSBpbiBTVElH
IG1vZGUKICAtIG10ay1xdWFkc3BpOgogICAgKiByZW5hbWUgY29uZmlnIHRvIGEgY29tbW9uIG9u
ZQogICAgKiBhZGQgU05PUl9IV0NBUFNfUkVBRCB0byBzcGlfbm9yX2h3Y2FwcyBtYXNrCgpNQUlO
VEFJTkVSUzoKLSBBZGQgVHVkb3IgYXMgU1BJLU5PUiBjby1tYWludGFpbmVyCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFo
bWV0IENlbGVuayAoMSk6CiAgICAgIG10ZDogc3BpLW5vcjogc3BsaXQgczI1ZmwxMjhzIGludG8g
czI1ZmwxMjhzMCBhbmQgczI1ZmwxMjhzMQoKQW5kcsOpIFZhbGVudGluICgxKToKICAgICAgbXRk
OiBzcGktbm9yOiBBZGQgc3VwcG9ydCBmb3IgbXgyNXUzMjM1ZgoKQmVhbiBIdW8gKDEpOgogICAg
ICBtdGQ6IHNwaS1ub3I6IEZpeCB3cm9uZyBhYmJyZXZpYXRpb24gSFdDUEFTCgpDb2xpbiBJYW4g
S2luZyAoMSk6CiAgICAgIG10ZDogc3BpLW5vcjogY2FkZW5jZS1xdWFkc3BpOiBmaXggc3BlbGxp
bmcgbWlzdGFrZTogIkNvdWxkbnQndCIgLT4gIkNvdWxkbid0IgoKRnJpZWRlciBTY2hyZW1wZiAo
Mik6CiAgICAgIG10ZDogc3BpLW5vcjogQWRkIHN1cHBvcnQgZm9yIEVOMjVRODBBCiAgICAgIG10
ZDogc3BpLW5vcjogQWRkIHN1cHBvcnQgZm9yIE1YMjVWODAzNUYKCkd1b2NodW4gTWFvICgxKToK
ICAgICAgbXRkOiBzcGktbm9yOiBtdGstcXVhZHNwaTogYWRkIFNOT1JfSFdDQVBTX1JFQUQgdG8g
c3BpX25vcl9od2NhcHMgbWFzawoKUHVybmEgQ2hhbmRyYSBNYW5kYWwgKDEpOgogICAgICBtdGQ6
IHNwaS1ub3I6IGNhZGVuY2UtcXVhZHNwaTogd3JpdGUgdXB0byA4LWJ5dGVzIGRhdGEgaW4gU1RJ
RyBtb2RlCgpSb2dlciBQdWV5byBDZW50ZWxsZXMgKDEpOgogICAgICBtdGQ6IHNwaS1ub3I6IEFk
ZCBzdXBwb3J0IGZvciBlbjI1cWg2NAoKUnlkZXIgTGVlICgyKToKICAgICAgZHQtYmluZGluZ3M6
IG10ZDogbXRrLXF1YWRzcGk6IHVwZGF0ZSBiaW5kaW5ncyBmb3IgTVQ3NjI5IFNvQwogICAgICBt
dGQ6IHNwaS1ub3I6IG10ay1xdWFkc3BpOiByZW5hbWUgY29uZmlnIHRvIGEgY29tbW9uIG9uZQoK
U2VyZ2VpIFNodHlseW92ICgyKToKICAgICAgbXRkOiBzcGktbm9yOiBhZGQgU3BhbnNpb24gUzI1
RlM1MTJTIElECiAgICAgIG10ZDogc3BpLW5vcjogcmVmaW5lIFNwYW5zaW9uIFMyNUZMNTEyUyBJ
RAoKVHVkb3IgQW1iYXJ1cyAoMSk6CiAgICAgIE1BSU5UQUlORVJTOiBhZGQgbXlzZWxmIGFzIFNQ
SSBOT1IgY28tbWFpbnRhaW5lcgoKVmlnbmVzaCBSICgyKToKICAgICAgZHQtYmluZGluZ3M6IGNh
ZGVuY2UtcXVhZHNwaTogQWRkIG5ldyBjb21wYXRpYmxlIGZvciBBTTY1NCBTb0MKICAgICAgbXRk
OiBzcGktbm9yOiBjYWRlbmNlLXF1YWRzcGk6IEFkZCBzdXBwb3J0IGZvciBPY3RhbCBTUEkgY29u
dHJvbGxlcgoKWW9nZXNoIE5hcmF5YW4gR2F1ciAoMyk6CiAgICAgIG10ZDogc3BpLW5vcjogYWRk
IG9wY29kZXMgZm9yIG9jdGFsIFJlYWQvV3JpdGUgY29tbWFuZHMKICAgICAgbXRkOiBzcGktbm9y
OiBhZGQgb2N0YWwgcmVhZCBmbGFnIGZvciBmbGFzaCBtdDM1eHU1MTJhYmEKICAgICAgbXRkOiBt
MjVwODA6IGFkZCBzdXBwb3J0IG9mIG9jdGFsIG1vZGUgSS9PIHRyYW5zZmVyCgogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jYWRlbmNlLXF1YWRzcGkudHh0IHwgIDEgKwog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGstcXVhZHNwaS50eHQgICAg
IHwgIDMgKystCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0t
LS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2UtcXVhZHNwaS5jICAgICAg
ICAgICAgICAgICAgICAgfCA3NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9tdGQvc3BpLW5v
ci9tdGstcXVhZHNwaS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKystCiBkcml2ZXJz
L210ZC9zcGktbm9yL3NwaS1ub3IuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzNSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogaW5jbHVkZS9saW51eC9tdGQvc3Bp
LW5vci5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrLS0t
LQogMTAgZmlsZXMgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
