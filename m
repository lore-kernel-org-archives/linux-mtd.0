Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC99E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZuuGm9sLjcOp0LlFTcMvFAIBczFPdkISmWGAW+fD1WI=; b=J67/6UwNciXhxb
	P3+7KQINA/RKrWgwz1TuDJ07vXuS8idz9qwQ7YZi//zfv2c0/wSkDO5LktD8seBNwPOvVQD8qNQbg
	5zNJu9qx5sOlKmx3bugU9ErJrcVhQOESqeiHOcycZnE1ql/wyGxkP96KJwpzyB6A1pJ/FafOyoduD
	zvjUWP+OPycYSYqJAA4wT6HDwZKOe33RU9I4ugw8Sd5xKEAHw5M95x+jzTwTu0IxstxOZ4+8+7zHV
	L8xvXbO5YmaqbeXuQw5KgXqHmW2WtEwh7uYrSchXP15E5zIgtVC01A8OvovSZjH96303QVc2SMvHP
	UGHu+I4mS/d/QS5WWI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7XD-0000000CH4I-3yxO;
	Tue, 24 Dec 2024 16:13:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7XB-0000000CH3K-2pyC
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 16:13:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27E7F60004;
	Tue, 24 Dec 2024 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735056802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S5yWREK/xz1TafHl1qigMDCWrq/hYJcO9E0Jz1ycrqc=;
	b=Tz43mDp9KDAA35lpfBpdwE8wT+lqNFvynoieFPNscTFRAacUqlqvxisuSxSeJDY+yaxVkN
	TAPJ6/bh6CPNNPI4DOsmPUsHic0lhSpTApfI5lritdXpGwRITXBykyGb5IuUhCEsoCdO/C
	z8eyTP4lybfDVz6nZBzX9LAUZEhE5lLn7qpaTKgm9Kxgm/iSyVY4UDFbVoIvT5zzcIWI1H
	2/btnAtfBdXC2Lb0M+t2tRZsHYpMJ3pd8//zRHIiDYg0tqX5PtyDkZHnR0Hog9v2+jH41M
	2wt/SbxGX6QreJHlaJRRjAmma0VTnKH3+bQdwdr08qqFzXbBMfBsHlTNTnY4KA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 6.13-rc5
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 24 Dec 2024 17:12:15 +0100
Message-ID: <87zfkl9i1s.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_081325_998568_FF4FA776 
X-CRM114-Status: UNSURE (   5.86  )
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

SGVsbG8sCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciBvbmUgb2YgdGhlIG5leHQgLXJjIGN5
Y2xlLgoKTWVycnkgQ2hyaXN0bWFzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IDQwMzg0Yzg0MGVhMTk0NGQ3YzVhMzkyZTg5NzVlZDA4OGVjZjBiMzc6CgogIExp
bnV4IDYuMTMtcmMxICgyMDI0LTEyLTAxIDE0OjI4OjU2IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci02LjEzLXJj
NQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDE0MDA1NGEyNWY4NTAzNmVjODQ3ZTcy
MmM3NmNjMWJmYWYzZjBkOTY6CgogIG10ZDogcmF3bmFuZDogb21hcDI6IEZpeCBidWlsZCB3YXJu
aW5ncyB3aXRoIFc9MSAoMjAyNC0xMi0wNSAxMToxNTowMCArMDEwMCkKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRm91ciBt
aW5vciBmaXhlcyBmb3IgTkFORCBjb250cm9sbGVyIGRyaXZlcnMgKGNsZWFudXAgcGF0aCwgZG91
YmxlCmFjdGlvbnMsIGFuZCBXPTEgd2FybmluZykgYXMgd2VsbCBhcyBhIGNhc3QgdG8gYXZvaWQg
b3ZlcmZsb3dzIGluIGFuIG10ZApkZXZpY2UgZHJpdmVyLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpEYW4gQ2FycGVudGVy
ICgxKToKICAgICAgbXRkOiByYXduYW5kOiBmaXggZG91YmxlIGZyZWUgaW4gYXRtZWxfcG1lY2Nf
Y3JlYXRlX3VzZXIoKQoKTWFjaWVqIEFuZHJ6ZWpld3NraSAoMik6CiAgICAgIG10ZDogcmF3bmFu
ZDogYXJhc2FuOiBGaXggZG91YmxlIGFzc2VydGlvbiBvZiBjaGlwLXNlbGVjdAogICAgICBtdGQ6
IHJhd25hbmQ6IGFyYXNhbjogRml4IG1pc3NpbmcgZGUtcmVnaXN0cmF0aW9uIG9mIE5BTkQKClJv
Z2VyIFF1YWRyb3MgKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IG9tYXAyOiBGaXggYnVpbGQgd2Fy
bmluZ3Mgd2l0aCBXPTEKClppY2hlbiBYaWUgKDEpOgogICAgICBtdGQ6IGRpc2tvbmNoaXA6IENh
c3QgYW4gb3BlcmFuZCB0byBwcmV2ZW50IHBvdGVudGlhbCBvdmVyZmxvdwoKIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYyB8IDExICsrKysrKysrKy0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9wbWVjYy5jICAgICAgICAgICAgfCAgNCArLS0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmMgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvb21hcDIuYyAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysr
KysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
