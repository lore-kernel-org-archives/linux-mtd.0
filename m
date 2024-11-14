Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB7AD68B33
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DJtahiZrJVxtijKnJpkHgCwuREXoDxl8vHLpWjo/b48=; b=Frgxd193d6fxeBLJTT01dXPk2r
	gPMnmeMCrvTJM5dDwzAkPYZm3i5Re+5i/eiE7DHNAZ77vH/vJZvUylwIjermk7FOHhb+6CvbFMsDQ
	X70SSI9QyNMq6ixDcbPlDPemwVcsOvIQ/I3DR602VoI/Ng4VI/vH9/1scFiVpjwYY/nqMpU+wsz+4
	S86dhgfpvfJXvHS+FbeaSwh4RGt4jQ/+2AbFtkCbH/pAql/1W7O3Msw6g/lPEhlGNZNHn73jEWGqx
	T5slbvFiKeb2sjkZvKBMfPz+uRpvj2bLnzMu8SWrcof4j3beQfY2c+uOaCCUkuWndOHRgCLqsxVA4
	KaMS6bEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc8g-00000000Grb-3bFK;
	Thu, 14 Nov 2024 15:52:10 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc78-00000000GNS-1Vk4
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 15:50:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 67C9F2BFA23;
	Thu, 14 Nov 2024 16:50:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ltrO9K3SGxkH; Thu, 14 Nov 2024 16:50:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BBCC42BFA25;
	Thu, 14 Nov 2024 16:50:27 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gjdoMpmc9UA2; Thu, 14 Nov 2024 16:50:27 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8BCC62BFA23;
	Thu, 14 Nov 2024 16:50:27 +0100 (CET)
Date: Thu, 14 Nov 2024 16:50:27 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, joern <joern@lazybastard.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Fabian Vogt <fvogt@suse.com>
Message-ID: <1898930663.21166792.1731599427304.JavaMail.zimbra@nod.at>
In-Reply-To: <20241114154442.25920-1-tiwai@suse.de>
References: <20241114154442.25920-1-tiwai@suse.de>
Subject: Re: [PATCH] mtd: phram: Add the kernel lock down check
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: phram: Add the kernel lock down check
Thread-Index: fEx14KVYL22/FSDt0R0dYYGq9HpsYA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_075034_537879_C9BF5ECC 
X-CRM114-Status: UNSURE (   5.79  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRha2FzaGkgSXdhaSIgPHRp
d2FpQHN1c2UuZGU+Cj4gQW46ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFk
Lm9yZz4KPiBDQzogImpvZXJuIiA8am9lcm5AbGF6eWJhc3RhcmQub3JnPiwgIk1pcXVlbCBSYXlu
YWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5h
dD4sICJWaWduZXNoCj4gUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAibGludXgta2Vy
bmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJGYWJpYW4gVm9ndCIgPGZ2b2d0
QHN1c2UuY29tPgo+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAxNC4gTm92ZW1iZXIgMjAyNCAxNjo0
NDo0MQo+IEJldHJlZmY6IFtQQVRDSF0gbXRkOiBwaHJhbTogQWRkIHRoZSBrZXJuZWwgbG9jayBk
b3duIGNoZWNrCgo+IFRoZSBwaHJhbSBNVEQgZHJpdmVyIG1heSBtYXAgYW55IG1lbW9yeSBwYWdl
cyBubyBtYXR0ZXIgd2hldGhlciBpdCdzCj4gcmVzZXJ2ZWQgb3Igd2hhdGV2ZXIgdXNlZCBmb3Ig
c3lzdGVtcywgd2hpY2ggYmFzaWNhbGx5IGFsbG93cyB1c2VyCj4gYnlwYXNzaW5nIHRoZSBsb2Nr
IGRvd24uCj4gCj4gQWRkIHRoZSBjaGVjayBhbmQgYWJvcnQgdGhlIHByb2JlIGlmIHRoZSBrZXJu
ZWwgaXMgbG9ja2VkIGRvd24gZm9yCj4gTE9DS0RPV05fREVWX01FTS4KPiAKPiBSZXBvcnRlZC1i
eTogRmFiaWFuIFZvZ3QgPGZ2b2d0QHN1c2UuY29tPgo+IFN1Z2dlc3RlZC1ieTogRmFiaWFuIFZv
Z3QgPGZ2b2d0QHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlA
c3VzZS5kZT4KCkdvb2QgY2F0Y2ghCgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
