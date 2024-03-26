Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29263CD11DD
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WBWSFjFzB7UMe3v8NIMpCkWlSDAieQ2uVV6gK8PLKLM=; b=4OnjpggeB1u/1E1270OLfUFg0v
	QVpvpCslApE6xnKCgjAu5u3vp+6wVS8JBMrJWea4Ubqa2U35ZBvJTMYWseFgc4OOt7O2t0aOUBJaj
	wxi+0wSY4m4LyAh1c/WNoYdSj2whRLosKveFn3xDLY12gq8xwIxwikiUpL+x9npp0uYgE6cTJ+6IX
	b6TKaT5sFL7Ecv16Ry7TNzu6Qgiz5XdWfxdc2hQ0ec9asug6uNWWBZE8u5RrCL4nwm/J4XZIfx55K
	NTwEn/j30i/HXATLOcx2XB2AHS0pWDuOO04NzcQwC3lDM9hDa87yauo9SNAEM5g27/X4jvmzkWDYG
	CvcADzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp7VX-00000004qF2-3Hwg;
	Tue, 26 Mar 2024 14:10:31 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp7VU-00000004qCa-10km
	for linux-mtd@lists.infradead.org;
	Tue, 26 Mar 2024 14:10:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 62092644A91F;
	Tue, 26 Mar 2024 15:10:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 5ADS77W7NZdl; Tue, 26 Mar 2024 15:10:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0562D6450975;
	Tue, 26 Mar 2024 15:10:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Rgs8DqVLzHbZ; Tue, 26 Mar 2024 15:10:24 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B7560644A91F;
	Tue, 26 Mar 2024 15:10:24 +0100 (CET)
Date: Tue, 26 Mar 2024 15:10:24 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@kvack.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
	Richard Weinberger <richard.weinberger@gmail.com>, 
	Ezequiel Garcia <ezequiel@collabora.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <815707414.105612.1711462224601.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLik9B0spBUYOVSekAns+zf=-zemit=DoVt0r6Us71p=Gw@mail.gmail.com>
References: <CAOuPNLjQPo8hoawK73H7FOVitQHp21HHODExO+7cguGrtURKWg@mail.gmail.com> <321330094.101965.1711390802883.JavaMail.zimbra@nod.at> <CAOuPNLik9B0spBUYOVSekAns+zf=-zemit=DoVt0r6Us71p=Gw@mail.gmail.com>
Subject: Re: linux-mtd: ubiattach taking long time
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: linux-mtd: ubiattach taking long time
Thread-Index: 49zEOnfSaCF4BioDpzC0tXhOf7BsDg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_071028_483454_E4C98061 
X-CRM114-Status: UNSURE (   8.41  )
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

UGludHUsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiUGludHUgQWdh
cndhbCIgPHBpbnR1LnBpbmdAZ21haWwuY29tPgoKPiBJcyB0aGVyZSBhbnl0aGluZyBtaXNzaW5n
IGhlcmUgPwo+IENhbiB3ZSBpbmNyZWFzZSB0aGUgcG9vbCBzaXplID8gV2lsbCBpdCBoZWxwIHRv
IGltcHJvdmUgdGhlIHRpbWluZyA/CgpBcyBsb25nIHlvdSBzZWUgInNjYW5uaW5nIGlzIGZpbmlz
aGVkIiwgZmFzdG1hcCB3YXMgbm90IHVzZWQuClVzdWFsbHkgYSBmYXN0bWFwIGlzIGNyZWF0ZWQg
YWZ0ZXIgdWJpZGV0YWNoIG9yIHdyaXRpbmcgbW9yZSB0aGFuIHBvb2wgc2l6ZS4KIAo+PiBTcGVh
a2luZyBvZiBvdGhlciB0ZWNobmlxdWVzLCB5b3UgY2FuIGltcHJvdmUgc2Nhbm5pbmcgdGltZSBh
bHNvIGJ5Cj4+IHR1bmluZyBVQkkgZm9yIHlvdXIgTkFORCBjb250cm9sbGVyL3NldHVwLgo+PiBF
LmcuIHRyYW5zZmVycmluZyBvbmx5IHRoZSBhbW91bnQgb2YgYnl0ZXMgbmVlZGVkIGZvciBhbiBo
ZWFkZXIuCj4+IE9yIHJlYWRpbmcgd2l0aG91dCBFQ0MgYW5kIHJlLXJlYWRpbmcgd2l0aCBFQ0Mg
aWYgdGhlIGhlYWRlciBDUkMtY2hlY2sgZmFpbHMuCj4+Cj4gU29ycnksIEkgY291bGQgbm90IGdl
dCB0aGlzIGZ1bGx5Lgo+IElzIGl0IHBvc3NpYmxlIHRvIGVsYWJvcmF0ZSBtb3JlIHdpdGggc29t
ZSByZWZlcmVuY2UgPwo+IERvIHdlIGhhdmUgc29tZSBzcGVjaWFsIGNvbW1hbmRzL3BhcmFtZXRl
cnMgdG8gZG8gaXQgaWYgd2UgdXNlIGluaXRyYW1mcyA/CgpZb3UgbmVlZCB0byB0b3VjaCBjb2Rl
IGZvciB0aGF0LiBUaGVzZSBhcmUgaGlnaGx5IHNwZWNpZmljIGFkb3B0aW9ucy4KClRoYW5rcywK
Ly9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
