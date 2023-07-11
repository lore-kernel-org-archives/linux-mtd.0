Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2703CEB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0HkzDetDyslK8NgnSrB5FeWhFpShxQB+v2y0KyckczU=; b=KGHoos5e7jsDMccRrBd4flh5Tk
	u2GF4BFVZCRTc5ankYohonaCpL4ODsSmS2smA6i1FdWlLPv3Ijr8tEhu0XKsCCnS5MtkD+TXVmR7j
	3j3R9dElrNQOjQ43HwFnXwP8fCLO0/8t8e0r95K3c6J7qtTgUH9uwEmFRx0X9EBZO4zvnwCpMHwXa
	IWVD7jz4iJX9Y43G1uRmxrap485xzlfAfm+dupm9/PdJPdN6qUk6pvNx9S6nS506c33InaHsOsiPu
	itd2SnZtZbvvrsEfTDJotwIusLvQDBEggK9i0WQVJJtNL2WtyHVL2h6avy5nGoZA1drTB8zXqk4lp
	87LF551A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGGU-00FOTF-2k;
	Tue, 11 Jul 2023 16:31:02 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGGQ-00FOSP-2R
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jul 2023 16:31:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 30D7962F2910;
	Tue, 11 Jul 2023 18:30:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8R4yn2ky6m_j; Tue, 11 Jul 2023 18:30:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9C74861A7038;
	Tue, 11 Jul 2023 18:30:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u99T18Ks9BIc; Tue, 11 Jul 2023 18:30:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6400E61989ED;
	Tue, 11 Jul 2023 18:30:51 +0200 (CEST)
Date: Tue, 11 Jul 2023 18:30:51 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yang Rong <yangrong@vivo.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	opensource kernel <opensource.kernel@vivo.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Lu Hongfei <luhongfei@vivo.com>
Message-ID: <2014273324.2321953.1689093051254.JavaMail.zimbra@nod.at>
In-Reply-To: <743f4445-31a6-0e51-f432-08033bdcaf20@web.de>
References: <20230711020752.2344-1-yangrong@vivo.com> <743f4445-31a6-0e51-f432-08033bdcaf20@web.de>
Subject: Re: [PATCH v3] mtd: core: Fix resource leak in a
 for_each_child_of_node() loop
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: Fix resource leak in a for_each_child_of_node() loop
Thread-Index: O0iikkkuA+X93639t1xDfOZiQ6wdMQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_093058_967311_00952A3D 
X-CRM114-Status: UNSURE (   6.55  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hcmt1cyBFbGZyaW5nIiA8
TWFya3VzLkVsZnJpbmdAd2ViLmRlPgo+PiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjMwNzEwMDYxNDEyLjIyNzItMS15YW5ncm9uZ0B2aXZvLmNvbS8KPj4gVGhlIG1vZGlmaWNh
dGlvbnMgbWFkZSBjb3BhcmVkIHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uIGFyZSBhcyBmb2xsb3dz
Ogo+IAo+IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhlIG9taXNzaW9uIG9mIGEgbGluZSBoZXJl
Cj4gKHNvIHRoYXQgYSByZXBlYXRlZCB0eXBvIGNhbiBiZSBhdm9pZGVkKT8KPiAKPiBXb3VsZCB0
aGUgc3Vic2VxdWVudCBlbnVtZXJhdGlvbiBsb29rIGEgYml0IG5pY2VyIGlmIGVhY2ggdGV4dCBp
dGVtCj4gd2lsbCBiZSBkZWxpbWl0ZWQgYnkgYSBzcGFjZSBjaGFyYWN0ZXI/CgpNYXJrdXMsIGp1
c3Qgc3RvcCBpdC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
