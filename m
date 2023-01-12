Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4D9C54EBD
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jan 2023 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lrXW6sLN5A3tAjrzqRtwrMyifWkZ3IDMToF9y0nzOcY=; b=eEEtxgKAUgqp71
	mAYyzD1ZY/bdNO2b+jnaGp/vxyp8r39pVPQA5l3bvxzyx24TZzvJ17rtBODupgM32GwAmZXiwTuWX
	Tk8sWGwau4nX+ttALxtf7gG+7Zm34dA42MwE+uzmTgqjDGgv3gGUHBGcNwBRLwTE7Yaa9g9xL0UE0
	acB09n6qekHcMRHzSG5Duxi5InJt5/ibL/pJkuKlK6z4iz95KRLPR2Bx33raC4bsG5McmxDMjjmfb
	JwcToacv2zHMsLY3rn2Fp1vA9XHn265fC5PVozL1ZqBbSGfXhf5x52hzKkbNigxofntxbXhcmneNW
	OTtWJbuim9dMOVvToFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuDZ-00ESAJ-Ry; Thu, 12 Jan 2023 09:49:53 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuDU-00ES6U-Pj
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2023 09:49:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 580D31BF205;
	Thu, 12 Jan 2023 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673516984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1yJ3dM1kuE3+hpM9qPqGozVgFuQrdfJMlJUzQ8ON5N8=;
	b=QTkoS2EUDM8i/6FDn5CcEFD5VSCGjCMf0bFt4WcUtN4CbRX1144+TOhhJFjv2MZ/vkSCzN
	z/u0tBgHn1lHij+LNTxGTp0o/8XycWvGwI5Qx6QcvKgXJsRJ70BaYdkxHSLrhmBH9wG7lI
	LE6iCMlY5WeCz7Nf1wfyvIj9UKniQALMsUK/UPznFcUfgcVX88NAajspGu1iTa9PZSUouO
	tprLJSHksM/FBZVMTQ3a6NrTszvF7yfGRjglDd2hLQBpnMMWSokleFJscsJoDVttgYht8B
	l0JsKvgdkqKJBtvI+zHYjvHjXSU8x0eFyS+WWWB+z2Gn0lAE172IDgKEKJlJ4Q==
Date: Thu, 12 Jan 2023 10:49:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for v6.2-rc4
Message-ID: <20230112104941.27840eb4@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_014949_138766_EBE4D4F9 
X-CRM114-Status: UNSURE (   8.50  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgdGhlIG5leHQgLXJjLiBJ
IHdhcyB0b2xkIHRoYXQgTUFJTlRBSU5FUlMKY2hhbmdlcyB3ZXJlIHdlbGNvbWUgQVNBUCB0byBh
dm9pZCBib3VuY2luZyBlLW1haWxzIGFuZCBjb21tdW5pY2F0aW9uCmRpc3J1cHRpb25zLCBzbyBo
ZXJlIGlzIGEgY2hhbmdlIHRvIHVwZGF0ZSBUdWRvcidzIGUtbWFpbCBhZGRyZXNzCmluY2x1ZGVk
IGluIHRoaXMgUFIgYXNpZGUgd2l0aCAzIGNvcmUgTVREIGNoYW5nZXMuCgpUaGFua3MsCk1pcXXD
qGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODg2MDNiNmRjNDE5NDQ1ODQ3
OTIzZmNiN2ZlNTA4MDA2N2EzMGY5ODoKCiAgTGludXggNi4yLXJjMiAoMjAyMy0wMS0wMSAxMzo1
MzoxNiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4Lmdp
dCB0YWdzL210ZC9maXhlcy1mb3ItNi4yLXJjNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIGMwZjdhZTI3NTM5ZmJhYzI2NzM4NGE3YmZjNTgyOTZlYTc1NTBkNTI6CgogIE1BSU5UQUlO
RVJTOiBVcGRhdGUgZW1haWwgb2YgVHVkb3IgQW1iYXJ1cyAoMjAyMy0wMS0wNyAxNToxODo0NCAr
MDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KTVREIGNoYW5nZXM6CiogY2ZpOiBBbGxvdyBidWlsZGluZyBzcGktaW50
ZWwgc3RhbmRhbG9uZSB0byBhdm9pZCBidWlsZCBpc3N1ZXMKKiBwYXJzZXJzOiBzY3BhcnQ6IEZp
eCBfX3VkaXZkaTMgdW5kZWZpbmVkIG9uIG1pcHMKKiBwYXJzZXJzOiB0cGxpbmtfc2FmZWxvYWRl
cjogRml4IHBvdGVudGlhbCBtZW1vcnkgbGVhayBkdXJpbmcgcGFyc2luZwoKTUFJTlRBSU5FUlMg
Y2hhbmdlOgoqIFVwZGF0ZSBlbWFpbCBvZiBUdWRvciBBbWJhcnVzCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFybmQgQmVy
Z21hbm4gKDEpOgogICAgICBtdGQ6IGNmaTogYWxsb3cgYnVpbGRpbmcgc3BpLWludGVsIHN0YW5k
YWxvbmUKCk1pa2hhaWwgWmhpbGtpbiAoMSk6CiAgICAgIG10ZDogcGFyc2Vyczogc2NwYXJ0OiBm
aXggX191ZGl2ZGkzIHVuZGVmaW5lZCBvbiBtaXBzCgpUdWRvciBBbWJhcnVzICgxKToKICAgICAg
TUFJTlRBSU5FUlM6IFVwZGF0ZSBlbWFpbCBvZiBUdWRvciBBbWJhcnVzCgpZdWFuIENhbiAoMSk6
CiAgICAgIG10ZDogcGFyc2VyczogRml4IHBvdGVudGlhbCBtZW1vcnkgbGVhayBpbiBtdGRfcGFy
c2VyX3RwbGlua19zYWZlbG9hZGVyX3BhcnNlKCkKCiAubWFpbG1hcCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vYXRtZWwsYXQ5MXNhbTlnNDYtYWVz
LnlhbWwgIHwgIDIgKy0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8v
YXRtZWwsYXQ5MXNhbTlnNDYtc2hhLnlhbWwgIHwgIDIgKy0KIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jcnlwdG8vYXRtZWwsYXQ5MXNhbTlnNDYtdGRlcy55YW1sIHwgIDIgKy0K
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXRtZWwsYXQ5MXJtOTIwMC1z
cGkueWFtbCAgICAgIHwgIDIgKy0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cGkvYXRtZWwscXVhZHNwaS55YW1sICAgICAgICAgICAgIHwgIDIgKy0KIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MTAgKysrKystLS0tLQogZHJpdmVycy9jcnlwdG8vYXRtZWwtZWNjLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2NyeXB0by9hdG1l
bC1pMmMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsr
LS0KIGRyaXZlcnMvY3J5cHRvL2F0bWVsLWkyYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRkL3BhcnNlcnMvc2NwYXJ0LmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRk
L3BhcnNlcnMvdHBsaW5rX3NhZmVsb2FkZXIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDQgKysrLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9y
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIDE0IGZp
bGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
