Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7327C77B6F
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j7fwYppwozA3RoR8dz8UIMPqqnHOVbVD4GxpmE/F5iY=; b=yqeo0UyvyBNtT3
	yVG/AwZAE75CFiwNVGJ6bKz6RjYGqp114JVVZta/f7lSTmrwvTZtH7Pyo+VM5dFL0kEehRuHbbTs8
	ZmlPk/OS7nbvcOyyoLtNnJHV7remOESlQMZgIOGt5SOtcho5tDmdTKF13uzTzYMbPRmOPdC0+9Nvg
	OsocHu/2Xusgky0EY3pqa4nM/v9mmFmlArjVe6fPUnR9U3AMOSqO6SzMGtB0QYGM12z4Nf+4xG5TB
	RN+Iug7bvZjgPel1DIKDZ3g7Jbmdx78xq73cXOZ8uVIwekMsccdMHOGIoPxNTy1NrUBkXYHh5V4C2
	RKMg0pQnyCBzqf7s5tJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEjJ-000DVH-2L;
	Tue, 11 Apr 2023 14:12:17 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEjG-000DR2-2E
	for linux-mtd@lists.infradead.org;
	Tue, 11 Apr 2023 14:12:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6E0384000B;
	Tue, 11 Apr 2023 14:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681222315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XZe8xYC1xbEnhgYDBod/OpyA9Fw0CldqYg1lJS8s6AY=;
	b=Fl054psGHyMkXjkn4/ugFrMsQoBuW+Nt5sXCoxPtDZV8Xj/sohwf2DxZYvWbRT1gP3Roax
	/4xhfYf+sBgX3MjYuwr290tzJwlbxrxdoBk7Ej84KoUyoS3uvjhQRoPe7r+HXzOj+pInhH
	q/7SLwRIBWGVQFhSYWeUdH6pSQuSfTQvCaqAtyUr5HlUK6dUqXNuXoQFFBUDcSi0WxJgN/
	DqOQXcnIE6hJ12DYrbMaP2IMrsKKhJ8qKRGCNchQOwQ9+1SzktgEaS8SMEsfPu75cU2PVR
	m9ONUKaThe3XYjdPvJZqndcikTxb+TGyX1uwKfI4g+4yb8HRG9Rb+tRIF3X6ew==
Date: Tue, 11 Apr 2023 16:11:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 6.3-rc7
Message-ID: <20230411161153.60998465@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_071214_879396_87FAF864 
X-CRM114-Status: UNSURE (   9.25  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGEgc2Vjb25kIGZpeGVzIE1URCBQUiBmb3IgdGhlIG5leHQg
cmVsZWFzZS9yZWxlYXNlLWNhbmRpZGF0ZS4KClRoYW5rcywKTWlxdcOobAoKVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3ZTM2NGU1NjI5M2JiOThjYWUxYjU1ZmQ4MzVmNTk5MWM0
ZTk2ZTdkOgoKICBMaW51eCA2LjMtcmM1ICgyMDIzLTA0LTAyIDE0OjI5OjI5IC0wNzAwKQoKYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVz
LWZvci02LjMtcmM3Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOTM5NDJiNzA0NjE1
NzRjYTdmYzNkOTE0OTRjYTg5YjE2YTRjNjRjNzoKCiAgbXRkOiByYXduYW5kOiBtZXNvbjogZml4
IGJpdG1hc2sgZm9yIGxlbmd0aCBpbiBjb21tYW5kIHdvcmQgKDIwMjMtMDQtMDMgMTc6NTg6MDEg
KzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkNvcmUgTVREIGZpeDoKKiBtdGRibG9jazogVG9sZXJhdGUgY29ycmVj
dGVkIGJpdC1mbGlwcwoKUmF3IE5BTkQgZml4ZXM6CiogbWVzb246IEZpeCBiaXRtYXNrIGZvciBs
ZW5ndGggaW4gY29tbWFuZCB3b3JkCiogc3RtMzJfZm1jMjoKICAtIFJlbW92ZSB1bnN1cHBvcnRl
ZCBFRE8gbW9kZQogIC0gVXNlIHRpbWluZ3MubW9kZSBpbnN0ZWFkIG9mIGNoZWNraW5nIHRSQ19t
aW4KICBUaGUgZmlyc3QgcGF0Y2ggaXMgdGhlIHJlYWwgZml4IGJ1dCBub3dhZGF5cyB3ZSB1c2Ug
dGltaW5ncy5tb2RlCiAgaW5zdGVhZCBvZiBiYXJlIHRpbWluZ3MsIHNvIGluIG9yZGVyIHRvIGVh
c2UgdGhlIGJhY2twb3J0cywgdGhlIGZpeAogIHdhcyBzcGxpdCBpbnRvIHR3byBzdGVwcywgdGhl
IGZpcnN0IG9uZSBlYXN5IHRvIGJhY2twb3J0IG9uIG9sZGVyCiAga2VybmVscywgdGhlIHNlY29u
ZCBvbmUganVzdCBhcyBhIGZvbGxvdy11cCBzbyByZWNlbnQgc3RhYmxlIGtlcm5lbHMKICB3b3Vs
ZCBsb29rIGxpa2UgdGhlIG1haW5saW5lLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBcnNlbml5IEtyYXNub3YgKDEpOgog
ICAgICBtdGQ6IHJhd25hbmQ6IG1lc29uOiBmaXggYml0bWFzayBmb3IgbGVuZ3RoIGluIGNvbW1h
bmQgd29yZAoKQmFuZyBMaSAoMSk6CiAgICAgIG10ZGJsb2NrOiB0b2xlcmF0ZSBjb3JyZWN0ZWQg
Yml0LWZsaXBzCgpDaHJpc3RvcGhlIEtlcmVsbG8gKDIpOgogICAgICBtdGQ6IHJhd25hbmQ6IHN0
bTMyX2ZtYzI6IHJlbW92ZSB1bnN1cHBvcnRlZCBFRE8gbW9kZQogICAgICBtdGQ6IHJhd25hbmQ6
IHN0bTMyX2ZtYzI6IHVzZSB0aW1pbmdzLm1vZGUgaW5zdGVhZCBvZiBjaGVja2luZyB0UkNfbWlu
CgogZHJpdmVycy9tdGQvbXRkYmxvY2suYyAgICAgICAgICAgICAgICAgfCAxMiArKysrKysrKy0t
LS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyAgICAgIHwgIDYgKysrLS0tCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8ICAzICsrKwogMyBmaWxlcyBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
