Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D1BC25B46
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3pn8OyuGdhALnCGcM5S+MczRtmY+3mxb+bbrdNn1u9I=; b=pBLpyRKBN1GNEiUWt/M2p+dWRz
	KWCo4bkG9m/C2irXCsByRFiqKnyjBH/RP1ymdRL4r8mFe1Ou87we4Fnl8LEiO1fhkMkmeZfFcRrJt
	0NWr3QPlzci+WJ5bbGYLUKGV/OOtRcouKXhG/gJ1PHuAaz7u6Tz4zaToOYZlPHltu0BJAd+faqqRi
	6pi1moIIAGrhXYm5cPKGVOZmtwMF4jYMUwUKGmHkPlBe/yR4FL10jSW0qC5XDGHltFJqI97k7dsdC
	i6OvlqnCF6LpC9dD7tN48naOoHva8YcYdffDX+BZLDSdgqhlE5evqM8vm5DNLO/P2EZG2YvWti9gD
	ynZXOkyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyyy-007zlb-1E;
	Mon, 23 Oct 2023 17:44:52 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyyu-007zkA-2d
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 17:44:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4011D6342D26;
	Mon, 23 Oct 2023 19:44:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ZwQG_BZb1_Op; Mon, 23 Oct 2023 19:44:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A6DC66342D29;
	Mon, 23 Oct 2023 19:44:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ItP854Hxml7T; Mon, 23 Oct 2023 19:44:44 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 794E76342D26;
	Mon, 23 Oct 2023 19:44:44 +0200 (CEST)
Date: Mon, 23 Oct 2023 19:44:44 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Christian Brauner <brauner@kernel.org>, 
	Dave Chinner <dchinner@redhat.com>, Yu Zhe <yuzhe@nfschina.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	kernel <kernel@sberdevices.ru>
Message-ID: <406915015.32119.1698083084288.JavaMail.zimbra@nod.at>
In-Reply-To: <3951ac21-a0a4-47b5-be94-edb0140c69a5@salutedevices.com>
References: <20231019073838.17586-1-mmkurbanov@salutedevices.com> <20231019073838.17586-3-mmkurbanov@salutedevices.com> <1258129392.18842.1697703134703.JavaMail.zimbra@nod.at> <3951ac21-a0a4-47b5-be94-edb0140c69a5@salutedevices.com>
Subject: Re: [PATCH v1 2/2] jffs2: make cleanmarker support option
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: make cleanmarker support option
Thread-Index: ewMpg4ruzQjVS9d+DleKQJCsQylw7A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_104449_007310_16173465 
X-CRM114-Status: UNSURE (   7.33  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hcnRpbiBLdXJiYW5vdiIg
PG1ta3VyYmFub3ZAc2FsdXRlZGV2aWNlcy5jb20+Cj4gSWYgeW91IGRpc2FibGUgdGhlIGNsZWFu
bWFya2VyLCB0aGUgZm91bmQgY2xlYW4gYmxvY2sgKGZpbGxlZCB3aXRoIDB4ZmYpCj4gd2lsbCBi
ZSBlcmFzZWQgYWdhaW4gKHNlZSBmcy9qZmZzMi9zY2FuLmMjTDE2MikuCj4gSW4gbXkgb3Bpbmlv
biwgaXQgaXMgYmV0dGVyIHRvIHBlcmZvcm0gdGhlIGJsb2NrIGVyYXN1cmUgYWdhaW4gdGhhbiB0
bwo+IG5vdCB3b3JrIHdpdGggc3VjaCBhIG5hbmQgZmxhc2ggYXQgYWxsLgoKRG9lc24ndCB0aGlz
IGNhc2UgbWFueSByZS1lcmFzZXMgYXQgZWFjaCBtb3VudCB0aW1lPwoKQlRXOiBJIHRyaWVkIHlv
dXIgcGF0Y2ggaW4gbmFuZHNpbSwgamZmczIgd2FzIHVuaGFwcHkuClsgICA1Ni4xNDczNjFdIGpm
ZnMyOiBub3RpY2U6ICg0NDApIGpmZnMyX2J1aWxkX3hhdHRyX3N1YnN5c3RlbTogY29tcGxldGUg
YnVpbGRpbmcgeGF0dHIgc3Vic3lzdGVtLCAwIG9mIHhkYXR1bSAoMCB1bmNoZWNrZWQsIDAgb3Jw
aGFuKSBhbmQgMCBvZiB4cmVmICgwIGRlYWQsIDAgb3JwaGFuKSBmb3VuZC4KWyAgIDU2LjIwMDQz
OF0gbmFuZDogbmFuZF9kb193cml0ZV9vcHM6IGF0dGVtcHQgdG8gd3JpdGUgbm9uIHBhZ2UgYWxp
Z25lZCBkYXRhClsgICA1Ni4yMDEwOTBdIGpmZnMyOiBXcml0ZSBjbGVhbiBtYXJrZXIgdG8gYmxv
Y2sgYXQgMHgwMDFmODAwMCBmYWlsZWQ6IC0yMgoKRG8geW91IGhhdmUgYW4gaWRlYT8KClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
