Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171FCC4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 21:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BI7j4LJBccgbqeEzUPEfvhI3sripwGti8m62EWApr0A=; b=PadLuTyCIqwO3q/GTJVW5nhFa1
	ybdDB40kT2yQuR6FMCaR9QXh6v1QS7B6ak6ZHffZBbrjME7Hqs5ykWslBx16QdyzaLczIY/KQ7CKR
	jUVIKwJqmpq42MPaH87ZgBlVegjpodQxMJ52NSDrIFWxhsfL6Z7d0o887eXP+Vh36UUH+Bh/u4sI9
	tXBXei41gF0EeW9ZmaCa/y7f/Iso4ih4pB6JeObeDG+Itngy2I1C8LIKsrbL3rbYN5qb8tOkxajAH
	ue5cY0q7s19SnPNig19ZKV2VQ12QxKH8Eil+1a0rvNnr3kWT/6OlL2WIL1++Tgbxxa5ECLAkPzFrf
	fyMvn28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owVLb-00H8xa-ON; Sat, 19 Nov 2022 21:25:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owVLY-00H8wZ-MM
	for linux-mtd@lists.infradead.org; Sat, 19 Nov 2022 21:25:58 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 28C7763E516F;
	Sat, 19 Nov 2022 22:25:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NjSMm1e3K7LC; Sat, 19 Nov 2022 22:25:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A5E1B63E5157;
	Sat, 19 Nov 2022 22:25:50 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UJoQ5eQwxLyi; Sat, 19 Nov 2022 22:25:50 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8726363E5146;
	Sat, 19 Nov 2022 22:25:50 +0100 (CET)
Date: Sat, 19 Nov 2022 22:25:50 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: "Lihua (lihua, ran)" <hucool.lihua@huawei.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Wei Yongjun <weiyongjun1@huawei.com>, yusongping@huawei.com
Message-ID: <433070166.256175.1668893150374.JavaMail.zimbra@nod.at>
In-Reply-To: <23feff35-6f2d-5cd7-57f9-ff2591a3c74e@huawei.com>
References: <20221115083335.21211-1-hucool.lihua@huawei.com> <23feff35-6f2d-5cd7-57f9-ff2591a3c74e@huawei.com>
Subject: Re: [PATCH] ubifs: Fix build errors as symbol undefined
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix build errors as symbol undefined
Thread-Index: xvKUd6iNeIA9uYaj0+JoIBNTDdG+WA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_132556_903118_A63B7301 
X-CRM114-Status: UNSURE (   5.01  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkxpaHVhIChsaWh1YSwgcmFu
KSIgPGh1Y29vbC5saWh1YUBodWF3ZWkuY29tPgo+PiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvS2Nv
bmZpZyBiL2ZzL3ViaWZzL0tjb25maWcKPj4gaW5kZXggNDVkM2QyMDdmYjk5Li45M2JkYTEwNTdm
ZGMgMTAwNjQ0Cj4+IC0tLSBhL2ZzL3ViaWZzL0tjb25maWcKPj4gKysrIGIvZnMvdWJpZnMvS2Nv
bmZpZwo+PiBAQCAtMTMsNiArMTMsNyBAQCBjb25maWcgVUJJRlNfRlMKPj4gICAJc2VsZWN0IENS
WVBUT19IQVNIX0lORk8KPj4gICAJc2VsZWN0IFVCSUZTX0ZTX1hBVFRSIGlmIEZTX0VOQ1JZUFRJ
T04KPj4gICAJc2VsZWN0IEZTX0VOQ1JZUFRJT05fQUxHUyBpZiBGU19FTkNSWVBUSU9OCj4+ICsJ
c2VsZWN0IFVCSUZTX0ZTX0FVVEhFTlRJQ0FUSU9OCgpJIGZlYXIgdGhpcyBpcyBub3QgYSBwcm9w
ZXIgZml4LgpUaGlzIGNoYW5nZXMgZG9lcyBub3QgbG9uZ2VyIGFsbG93IGJ1aWxkaW5nIFVCSUZT
IHdpdGhvdXQgdGhlIGF1dGhlbnRpY2F0aW9uIGZlYXR1cmUuCldpdGggd2hhdCBjb25maWd1cmF0
aW9uIGRvIHlvdSBzZWUgdGhpcyBlcnJvcj8KCkkganVzdCB0cmllZCB3aXRoOgpDT05GSUdfVUJJ
RlNfRlM9bQpDT05GSUdfVUJJRlNfRlNfQURWQU5DRURfQ09NUFI9eQpDT05GSUdfVUJJRlNfRlNf
TFpPPXkKQ09ORklHX1VCSUZTX0ZTX1pMSUI9eQpDT05GSUdfVUJJRlNfRlNfWlNURD15CkNPTkZJ
R19VQklGU19BVElNRV9TVVBQT1JUPXkKQ09ORklHX1VCSUZTX0ZTX1hBVFRSPXkKQ09ORklHX1VC
SUZTX0ZTX1NFQ1VSSVRZPXkKIyBDT05GSUdfVUJJRlNfRlNfQVVUSEVOVElDQVRJT04gaXMgbm90
IHNldAoKQnV0IGRvbid0IGdldCB0aGUgZXJyb3IgYW5kLCBhcyBleHBlY3RlZCwgZnMvdWJpZnMv
dWJpZnMubyBoYXMgbm8KcmVmZXJlbmNlIHRvIHViaWZzX2JhZF9oYXNoLgoKVGhhbmtzLAovL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
