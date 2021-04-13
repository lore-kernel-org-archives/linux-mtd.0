Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0BEC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:45:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B0C861246
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B0C861246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QyidqCzwA4EIopstr9FOoxsUa/1f0V/KBlaVxGLcCvI=; b=mSYX5vb47gLpl/HAX2MeMsa2lm
	EqZ2ygSDVjv8uOg4z6G6KcFsnO54yTlVlzKHBxz2nHcHL2iggpl4Uo5oc0N2q4UQz1WaMdW/H1zZg
	Iz0PBUgyIp2kkskc11Pd2kShGSVGCKokGH81zmr2H8TkeTbmM7RO3mB+uyYbDaJd5iqm9QpiBjzhs
	U/l5zx9FL+oBUyP7fJXVlDUNsKOHbWG3zezvI2JSb/xP1swpyGD4WvE69PAHaAWG9HX2lgmbfhfD5
	MLYC6o2oGEdax28YbxmnK1nYhUNpu39LbbbNyeDaM+xwOcQATuYM0mscBL0YqP9dl5kTJhpOH28DE
	whpKcBjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWM97-009qNg-BH; Tue, 13 Apr 2021 16:44:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWM2U-009pBl-2q
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7iiRIC7UUWnTaGZjjzvtx5ZNWIoZkouacPtJP/jAlsY=; b=K7L7OZPrFLvhGD4zOza3ADkrUV
 /pCfbLTyWqyr0A4RNdlJTRJTClkTuOx5qL1H9IbdZHPrCTAaUx42g+A4xAEQZpj+siNP5x0y9H37u
 bGbb45RhW0O6vzqHx/S85JPSfm1jpH7kjNu1FfjNu9Q0Tz32fhLXB/ODvMKqJNnSX9gNx+kwv7kl8
 kjGQV47878zKG42/01ZCEHkLqC0EljfH4k/EZGfy0TyVQ16GTKgfDH6Ja5KSHA0pmPzcZuyj3Xmjx
 Jx0EfCBlVDP72GOhEjex+n/a7wOCI5fi3kkxEv6rEZ24am/wiNhWPjhXCjhS9DnBGypOrDepsGkQm
 tN6h/xAw==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWM2R-007Baf-4M
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:37:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id w8so19866595lfr.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Apr 2021 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7iiRIC7UUWnTaGZjjzvtx5ZNWIoZkouacPtJP/jAlsY=;
 b=fpk7iLxhmf9FiKL20+6mGPvLuTjNVFR5sBIAU5QmTdTpS/TeeUR017+2MkdQozT0wd
 yS9QjYBgnLxZtWucGc63iPib0O270FPfW8sDoLekGa+fFVLJaNQ4fhqlPuvh3qh3Zp3U
 8NlTtMUnd71tmLSKv8/pLCi9udn4RLXjPYKe+8fKXZCuEdJyKKZj3+VWpxEo/wp4FpG0
 XWh4n5LXsbejcRpblRg63IrTUSOlE+tcwvWD0ZPE2b+YkPsN7Qgj9HbRF6gtFjc0ISnp
 MwLJlgf60RXRfAHZmnZsU1CsS/MeZK0cDP+3ppHLkkv2eBJIEZzQSOGf3vKcN6O5oj0s
 +z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7iiRIC7UUWnTaGZjjzvtx5ZNWIoZkouacPtJP/jAlsY=;
 b=ZTUnKDVijQwbPeec67dPqrCBa/cfwPjPCHtrixwno9qSKE4HX04HDCzXVWj8EpgdxJ
 EzEM7s8znU99LOU1e6n0YTc8zZib1UU28pirtENfGydiLuyuGvMMwV6Yy3FuXD0o+uIh
 JRZsfJo0sUq69iJd33P70IjTMLdr2be4hicbE2vR5AWsbUj5tW6gisl+N6tcMDN2ZkLb
 O7LREw8HkfnbJQ3pZWU25QVJTGi85kK4Us2DZ5nrf7OhLEGwygaXwfAHz6lVzWMWNWb5
 fz7x8dPPexPxCldn9oyywFDvpOSFrg3J2mBIfFJU6xeiBELzV2ZLgOzAaq8W9Xl5jyKl
 FCyA==
X-Gm-Message-State: AOAM530ww2KRl+HBko9HeWKQ/s44SIjS1r3BwJyAufsNcGp2X7JgZGtT
 vrmA5GJL9Unycp2ki0J0Ndw=
X-Google-Smtp-Source: ABdhPJyOtfQ5faeASKaofvaoLEae3KOL7usNOY88wAEoD7yAsyiAcEzx4I1YPnSdxtE3PXloMs7cwQ==
X-Received: by 2002:ac2:4e95:: with SMTP id o21mr1594161lfr.325.1618331835433; 
 Tue, 13 Apr 2021 09:37:15 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id z21sm4026777ljh.104.2021.04.13.09.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:37:14 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Vivek Unune <npcomplete13@gmail.com>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: parsers: trx: parse "firmware" MTD partitions only
Date: Tue, 13 Apr 2021 18:37:00 +0200
Message-Id: <20210413163700.12215-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_093719_193614_547F1180 
X-CRM114-Status: GOOD (  13.45  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKUGFyc2luZyBldmVyeSBw
YXJ0aXRpb24gd2l0aCAiY29tcGF0aWJsZSIgc2V0IHRvICJicmNtLHRyeCIgcmVzdWx0cyBpbgpw
YXJzaW5nIGJvdGg6IGZpcm13YXJlIHBhcnRpdGlvbiBhbmQgZmFpbHNhZmUgcGFydGl0aW9uIG9u
IGRldmljZXMgdGhhdAppbXBsZW1lbnQgZmFpbHNhZmUgYm9vdGluZy4gVGhpcyBhZmZlY3RzIGUu
Zy4gTGlua3N5cyBFQTk1MDAgd2hpY2ggaGFzOgoKcGFydGl0aW9uQDIwMDAwMCB7CglyZWcgPSA8
MHgwMjAwMDAwIDB4MDFkMDAwMDA+OwoJY29tcGF0aWJsZSA9ICJsaW5rc3lzLG5zLWZpcm13YXJl
IiwgImJyY20sdHJ4IjsKfTsKCnBhcnRpdGlvbkAxZjAwMDAwIHsKCXJlZyA9IDwweDAxZjAwMDAw
IDB4MDFkMDAwMDA+OwoJY29tcGF0aWJsZSA9ICJsaW5rc3lzLG5zLWZpcm13YXJlIiwgImJyY20s
dHJ4IjsKfTsKCkNoZWNrIGZvciBNVEQgcGFydGl0aW9uIG5hbWUgImZpcm13YXJlIiBiZWZvcmUg
cGFyc2luZy4gUmVjZW50bHkgYWRkZWQKb2ZwYXJ0X2xpbmtzeXNfbnMuYyBjcmVhdGVzICJmaXJt
d2FyZSIgYW5kICJmYWlsc2FmZSIgZGVwZW5kaW5nIG9uCmJvb3Rsb2FkZXIgc2V0dXAuCgpTaWdu
ZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQpWaXZlayBo
YXMgcmVjZW50bHkgcmVwb3J0ZWQgdGhpcyBwcm9ibGVtIHRvIG1lIGFuZCB0aGlzIGlzIHNvbHR1
aW9uIEkKY2FtZSB1cCB3aXRoLgoKT25lIGFsdGVybmF0aXZlIEkgdGhvdWdodCBvZiBjb3VsZCBi
ZSBtYXJraW5nICJmYWlsc2FmZSIgTVREIHBhcnRpdGlvbgpub2RlIGFzIGRpc2FibGVkICh1c2lu
ZyBvZl91cGRhdGVfcHJvcGVydHkoKSArICJzdGF0dXMiICsgImRpc2FibGVkIikgYW5kCnRoZW4g
dXNpbmcgb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZSgpIGluIHRoZSBwYXJzZXJfdHJ4LmMuCgpMZXQg
bWUga25vdyBpZiB5b3UgcHJlZmVyIHRoZSBvdGhlciAob3IgYW55IG90aGVyKSBzb2x1dGlvbiBv
dmVyIHRoaXMKcGF0Y2guCi0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9wYXJzZXJzL3BhcnNlcl90cnguYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvcGFyc2Vy
X3RyeC5jCmluZGV4IDg1NDExODIxMzRkNC4uMDA2Mzc5MWUxNjRkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9wYXJzZXJzL3BhcnNlcl90cnguYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL3Bh
cnNlcl90cnguYwpAQCAtNTgsNiArNTgsMTAgQEAgc3RhdGljIGludCBwYXJzZXJfdHJ4X3BhcnNl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCXVpbnQ4X3QgY3Vycl9wYXJ0ID0gMCwgaSA9IDA7CiAJ
aW50IGVycjsKIAorCS8qIERvbid0IHBhcnNlIGFueSBmYWlsc2FmZSAvIGJhY2t1cCBwYXJ0aXRp
b25zICovCisJaWYgKHN0cmNtcChtdGQtPm5hbWUsICJmaXJtd2FyZSIpKQorCQlyZXR1cm4gLUVJ
TlZBTDsKKwogCXBhcnRzID0ga2NhbGxvYyhUUlhfUEFSU0VSX01BWF9QQVJUUywgc2l6ZW9mKHN0
cnVjdCBtdGRfcGFydGl0aW9uKSwKIAkJCUdGUF9LRVJORUwpOwogCWlmICghcGFydHMpCi0tIAoy
LjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
