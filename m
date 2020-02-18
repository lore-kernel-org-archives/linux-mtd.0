Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0D0C34026
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 10:48:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C43D321D56
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 10:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxhkQ41c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C43D321D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KaG5B4UjZd7y1DZnaIZQwtevC1hnaxVixRAqYjwhrA=; b=YxhkQ41c0m+RgL
	V08LFwRzS7Epw2ZatOxo+b8OH3q6ozU6vO+ThxADnvqUdlqX80aLImyFbRekDoFU4Ny0p0gjSpBcl
	o/MjS98PgERQ3Hv4ON08ye0iNT49ub9SuQ3lqHkCxE5Grx4wNmYZwoGoiaJrFm4Sm5FloESV2Wajt
	o+/0t+fHfqfezM93VPImDVaPhoNHcJfrtDkxaOslfTrhXS4op83lxb8Ht1I76is0lKsVygjSDLamg
	CA7eUgPhlCJtOPC+JhiNl6A2sbCun6vELqNQwLQyq6LHki+3y9Bt8M9oJjFSg58URmuDxKACOrzA1
	gVfn4NPmKsLk4nDauSDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j40Ql-0005RI-1H; Tue, 18 Feb 2020 10:48:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j40Qi-0005QB-20
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 10:48:41 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C0F8D100010;
 Tue, 18 Feb 2020 10:48:37 +0000 (UTC)
Date: Tue, 18 Feb 2020 11:48:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH 4/4] mtd: rawnand: cadence: reinit complete before
 execute command
Message-ID: <20200218114837.2d5e6104@xps13>
In-Reply-To: <1581328530-29966-4-git-send-email-piotrs@cadence.com>
References: <1581328530-29966-1-git-send-email-piotrs@cadence.com>
 <1581328530-29966-4-git-send-email-piotrs@cadence.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_024840_236171_DCE0E2C2 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGlvdHIsCgpQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBNb24s
IDEwIEZlYiAyMDIwIDEwOjU1OjI4CiswMTAwOgoKPiBSZWluaXRpbGFpemUgY29tcGxldGUgb2Jq
ZWN0IGJlZm9yZSBleGVjdXRpbmcgQ0RNQSBjb21tYW5kIHRvIG1ha2Ugc3VyZQo+IHRoYXQgZG9u
ZSBmbGFnIGlzIG9rLgoKTG9va3MgZmluZSwgYmVzaWRlcyB0aGUgbmVlZCBmb3IgRml4ZXMvU3Rh
YmxlIHRhZ3MsIHdoYXQgZG8geW91IHRoaW5rPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciBT
cm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9j
YWRlbmNlLW5hbmQtY29udHJvbGxlci5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5h
bmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRy
b2xsZXIuYwo+IGluZGV4IDVjMWJiYjA1YWI1MS4uZWZkZGM1YzY4YWZiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTk5OCw2
ICs5OTgsNyBAQCBzdGF0aWMgaW50IGNhZGVuY2VfbmFuZF9jZG1hX3NlbmQoc3RydWN0IGNkbnNf
bmFuZF9jdHJsICpjZG5zX2N0cmwsCj4gIAkJcmV0dXJuIHN0YXR1czsKPiAgCj4gIAljYWRlbmNl
X25hbmRfcmVzZXRfaXJxKGNkbnNfY3RybCk7Cj4gKwlyZWluaXRfY29tcGxldGlvbigmY2Ruc19j
dHJsLT5jb21wbGV0ZSk7Cj4gIAo+ICAJd3JpdGVsX3JlbGF4ZWQoKHUzMiljZG5zX2N0cmwtPmRt
YV9jZG1hX2Rlc2MsCj4gIAkJICAgICAgIGNkbnNfY3RybC0+cmVnICsgQ01EX1JFRzIpOwoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
