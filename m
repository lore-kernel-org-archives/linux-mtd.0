Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA499C64EC7
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Mar 2023 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1DK5GDPBpGARS9TRCfDalEbCnNr3sDUAs4fzVLz6zLc=; b=xTyHOLWydvDTQGEiVdngQhlXJ+
	G6PebDReHNgHJ2Ywi3JtoEluAA7m/QNzctIDk/FL6zBlTgxgusziZkklTdfuX0X+w5jxt2gM8lol7
	/WKxM1zZ7eTaZlHlN2gxz2GlJBMCjMCERnC0NBD5lzeXmxKhqL6MOlZou2N/gannnDkNwMyNCcnIi
	8ibSItFkTzkID91Bn8+p0HC09nvXxacZYQT7/ZYEPToZ6GJueHigth36nBLeJb4+VOFA/cIsZ1rmI
	RvmdgoYWC+MfUM8LIQeUgbEPQr5y0gLke9r+5RUubhS1DTklckbCnk/+uvousMxlzApeaGaffiV8A
	aWwiAUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKd7-00FvlY-RL; Wed, 01 Mar 2023 11:28:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKd3-00Fvk7-TD
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2023 11:28:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 229AC6382EF7;
	Wed,  1 Mar 2023 12:28:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id VzUUj5x2PD0C; Wed,  1 Mar 2023 12:28:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7BDF86382F03;
	Wed,  1 Mar 2023 12:28:09 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uELCjn1QVamu; Wed,  1 Mar 2023 12:28:09 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 565826382EF5;
	Wed,  1 Mar 2023 12:28:09 +0100 (CET)
Date: Wed, 1 Mar 2023 12:28:09 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1637751218.187351.1677670089216.JavaMail.zimbra@nod.at>
In-Reply-To: <299a85b4-aea5-b8b8-394f-4b7093b6a754@huawei.com>
References: <20230215022507.2363193-1-chengzhihao1@huawei.com> <9121ae91-5b4f-4b10-46fc-6cc0683c949d@huawei.com> <34189394.187159.1677657964794.JavaMail.zimbra@nod.at> <299a85b4-aea5-b8b8-394f-4b7093b6a754@huawei.com>
Subject: Re: [PATCH v2] ubifs: dirty_cow_znode: Fix memleak in error
 handling path
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: dirty_cow_znode: Fix memleak in error handling path
Thread-Index: jI6dxxZj4vvQSlt0IvLuiHnakpyrZA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_032814_111951_105D6DE9 
X-CRM114-Status: UNSURE (   3.47  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+
IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiU2FzY2hh
IEhhdWVyIiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4sICJsaW51eC1tdGQiCj4gPGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAxLiBNw6RyeiAyMDIzIDEyOjEzOjU5
Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCB2Ml0gdWJpZnM6IGRpcnR5X2Nvd196bm9kZTogRml4IG1l
bWxlYWsgaW4gZXJyb3IgaGFuZGxpbmcgcGF0aAoKPiDlnKggMjAyMy8zLzEgMTY6MDYsIFJpY2hh
cmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4+IFdlIGNhbm5vdCByZXBsYWNlIHRoZSBwYXRjaCBpbiBs
aW51eC1uZXh0LCB0aGUgbWVyZ2Ugd2luZG93IGlzIGFscmVhZHkgb3Blbi4KPj4gQSBmb2xsb3cg
dXAgZml4IGlzIHBvc3NpYmxlIGFmdGVyIDYuMy1yYzEgaXMgZG9uZS4gU28sIG5leHQgd2Vlay4K
PiAKPiBJdCdzIG9rYXksIHRoYW5rcy4gSSB3aWxsIHNlbmQgZml4IHBhdGNoIGFnYWluIGFmdGVy
IDYuMy1yYzEuCgpZb3UgY2FuIHNlbmQgaXQgcmlnaHQgbm93LiBCdXQgSSBoYXZlIHRvIHdhaXQg
YSBiaXQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
