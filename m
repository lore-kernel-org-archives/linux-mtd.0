Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D58BC98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGgrkQVy75Uk7IKJEIYYZgD0IQX5NpBhlRBj4gal9X8=; b=TFU8/5BLJYSqzf
	uaEHg6+vbE3BEFDqbDPeN/nigXUIa/a1ja4Fcxnhr8PXXz6fNu/kULYSOXF3YjlHzv+El14HTMhni
	2sVucxpBuyJKHCiKqinaKt01H7d7qmx5dG1zduyJgFh2kcelVcMUqTjAbZe/+ILBAlTrsr6Kz8y9y
	KlFP7n8/LmhHnavFcT2WM2VHev1X7WlGpkyYk3Tpnx9+LYCNxisc24uUi4hugEAKhYo/flJRix0it
	qfHrB/of813i4XEGgYRJDuPrfQJSMWCrVSToLY5H9BSvncVimsr3SAtR4P+ZcroEI0El8GyWkuvvy
	eXwUhsSFRPQThBCRB63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6v3-0000000DZtR-2e30;
	Fri, 25 Sep 2026 14:28:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6uy-0000000DZnc-3yXh
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:28:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6E1A04E41075;
	Fri, 25 Sep 2026 14:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CE3C6073B;
	Fri, 25 Sep 2026 14:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 203F0102F19F8;
	Fri, 25 Sep 2026 16:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=48TSY6/XqUrQC7pG5irCkd7o+Gn6x10HSD/mfjLBu8w=;
	b=GV+OxjOcXeQg3GbndjDmYQeb9rE2x/7r3ExFjXmTu4962hzCt84kcQSZlBLn2/8Tg1517J
	5nusq3BIDopS/69XOdSFuNGzwpGI//SSx7HdnY21MdHSXY2TUIXN9qzSnwXRDQLGNJVGnI
	LaPYABgMW4bnfAqCPNSpbjHTWkC4H5fj3/FKoWUSnumTwgwXBZoAtSI5kthmvJdy9qNaJX
	m6gsfmUMe3OpBPgeNsKqXOnFjg3Xt83euUFU+9/y8ydHlzwWlpvGD1ywVoivGQk5Qa13KY
	ZplEsJr6U+DQYHFa2OB8OVsE9N9x8tYJkyG07+4hs0P1N7xz6cYraDyd9ZKwVA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: akpm@osdl.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, 
 stable@vger.kernel.org
In-Reply-To: <20260917102407.2146727-1-vulab@iscas.ac.cn>
References: <20260917102407.2146727-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: maps: l440gx: Fix double put of the PM device in
 init_l440gx()
Message-Id: <179034652899.1166139.902487494191174396.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:48 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072853_131141_45A399D8 
X-CRM114-Status: UNSURE (   6.93  )
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxMDoyNDowNyArMDAwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IFRoZSBQSUlYNCBQTSBkZXZpY2UgcmVmZXJlbmNlIHRha2VuIHdpdGggcGNpX2dldF9kZXZpY2Uo
KSBpcyBkcm9wcGVkCj4gYWdhaW4gYmVmb3JlIHRoZSBpb2Jhc2UgcmVzb3VyY2UgaXMgYWxsb2Nh
dGVkLiAgSWYgcGNpX2Fzc2lnbl9yZXNvdXJjZSgpCj4gZmFpbHMsIHRoZSBlcnJvciBwYXRoIGNh
bGxzIHBjaV9kZXZfcHV0KCkgb24gcG1fZGV2IGEgc2Vjb25kIHRpbWUsCj4gcmVsZWFzaW5nIGEg
cmVmZXJlbmNlIHRoYXQgaXMgbm8gbG9uZ2VyIG93bmVkIGFuZCB1bmRlcmZsb3dpbmcgdGhlCj4g
cmVmZXJlbmNlIGNvdW50Lgo+IAo+IFJlbW92ZSB0aGUgZXh0cmEgcGNpX2Rldl9wdXQoKS4KPiAK
PiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBtYXBzOiBs
NDQwZ3g6IEZpeCBkb3VibGUgcHV0IG9mIHRoZSBQTSBkZXZpY2UgaW4gaW5pdF9sNDQwZ3goKQog
ICAgICBjb21taXQ6IGU2Y2E1MjRlZTViMjcwNWJlMzBlYTE5Y2UyZTU1MTIyZDlmOWVkOGYKClBh
dGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUK
cGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkg
dGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
