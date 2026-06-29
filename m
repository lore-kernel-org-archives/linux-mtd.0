Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1906C43327
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TISYRGIlMJY01eksPH4q7IdUfulm2XgYeYiEp3C4fs=; b=iNsxjh7CBNUkpT
	9GF1jB5reKa3Iqv0ahJUEveS98VWfYIX1P824ZC5V7Lv3GS6rWMYluaxTLDokv2Uf7PM0OkHD3X4D
	K1R2uXgXI3TWbw2R9s39sRRwjHI2hzGyb+5uI/hHxAHNuxRW385YByumY9rZkuQGV/q0P0bL0LGIO
	NjkufMWTpeMkdT/VzoLrzbQpAp+5IITk895y67GggeEO2dl/qhUhKG4SNBdvd7h/zho7CStkyatz8
	Ufxz29XILYe+9lTR5WJViDSB8p1yQXFYBtjWLLdG00egZiTxVT1XfDimu4XFpgd9crh5ZXYqLv1cB
	qB1v747rGJOQ9/ERrWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDMC-0000000Ey8i-23IA;
	Mon, 29 Jun 2026 14:53:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDM9-0000000Ey7J-2S1x
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:53:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66E44C6B3B0;
	Mon, 29 Jun 2026 14:53:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BE535FF96;
	Mon, 29 Jun 2026 14:53:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03E94106F18C3;
	Mon, 29 Jun 2026 16:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q+qPY+wZL96BqmgI/Qwa97Lxv1ivMGIPBo+iFhCvISY=;
	b=h1J2jyLcLij6G9E7jVkwQOQBgQvwtqP71K1UtlCEjRmtVIdwxZG4VbY/G3ZAVNGMu9XiWc
	+nuNAy0ke3WJDNiAm7d6MIjFJY4sMmWrHuow2hI5Sn96VFTAfIT+LOZ/z/DmTXYLattLZS
	iL1wiFJydmDms5IF1/z4JYNtcCv7fN1eW36DZ/ZMUhp42d9sk4W4K7dg6l6tjg1KJ6HYvH
	SfY/aMQixSbUG8Pg62zuGSAxb+26wUGVqJHrcsaALDLLDp6aoj7Fk4Qg/+SsRCZeucv2SS
	RQdLYC3DnGASoLIb+nBKAorARXM2lHmJzUKKFzPWJ/NrIbOWif2pJGHLRuFv8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260623015317.23393-1-pengpeng@iscas.ac.cn>
References: <20260623015317.23393-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: mtdswap: remove debugfs stats file on teardown
Message-Id: <178274477987.273793.7851506178067546361.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:52:59 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075305_785501_66235B2D 
X-CRM114-Status: UNSURE (   6.46  )
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

T24gVHVlLCAyMyBKdW4gMjAyNiAwOTo1MzoxNyArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IG10ZHN3YXBfYWRkX2RlYnVnZnMoKSBjcmVhdGVzIGFuIG10ZHN3YXBfc3RhdHMgZGVidWdmcyBm
aWxlIHVuZGVyIHRoZQo+IHBlci1NVEQgZGVidWdmcyBkaXJlY3RvcnksIGJ1dCBtdGRzd2FwX3Jl
bW92ZV9kZXYoKSBuZXZlciByZW1vdmVzIGl0Cj4gYmVmb3JlIGZyZWVpbmcgdGhlIG10ZHN3YXBf
ZGV2Lgo+IAo+IFN0b3JlIHRoZSByZXR1cm5lZCBkZW50cnkgYW5kIHJlbW92ZSBpdCBkdXJpbmcg
ZGV2aWNlIHRlYXJkb3duIGJlZm9yZSB0aGUKPiBkcml2ZXItcHJpdmF0ZSBzdGF0ZSBpcyBmcmVl
ZC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDog
bXRkc3dhcDogcmVtb3ZlIGRlYnVnZnMgc3RhdHMgZmlsZSBvbiB0ZWFyZG93bgogICAgICBjb21t
aXQ6IDY2ZmIzMTM1ODEwOGQxMDI0NWI5ZTRlZjBlZWYzZTdkOTc0NzA1NWUKClBhdGNoZShzKSBz
aG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0
aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpL
aW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
