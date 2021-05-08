Return-Path: <SRS0=zn6r=KD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7B0C433ED
	for <linux-mtd@archiver.kernel.org>; Sat,  8 May 2021 17:33:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E492613C5
	for <linux-mtd@archiver.kernel.org>; Sat,  8 May 2021 17:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E492613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S0Rbtb2b1KrhGUlusySfZdlDtQId3Tn+4Cdddc9YT4Y=; b=i1wGMO96U8XPWkk7yTChblx+0P
	3VGN3hdpeWbc4ctRHwbj3Uvi1lN4GJFAmtxuMs7sEwyIY1I8dVg3XU5vxUjqybHNBQTv8mhIcEwjg
	BQkOyOssG6QY4Tzq4xzhoB8zgFwkUcBY5EYtqjzd/TNRoA44Z+ndg5A8q+/pBJgkFf+5O4XyORI6c
	0isIz+7ql+2W90BbU4JtnzK+y0AqHEzsJxzccE+iklQvb8LSOeIB2dof3X8cxC0RkUjsdXIYVkZ+N
	Tbc6tnG4wzbIYeXUSRZnY2aD0NxoYXpzTdTortG5vqUPcmjDy6EU+VW0bbN8TjBqy5CwetWKrctBK
	xAGpk9PQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfQoj-00A0jO-1o; Sat, 08 May 2021 17:32:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfQoe-00A0jC-7Z
 for linux-mtd@desiato.infradead.org; Sat, 08 May 2021 17:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=x75f2zhKWTzHjy88mDJZzhpjqEESdxY4UIswXW92FRk=; b=UCqd00o9/2u/1hSD3eJFycOGmV
 56oqySF0ubZuWoVY2qrjzW6GbY/nXuYp20XsznXUf6dPeSmh73ccQrkICD6djFn99ZVVi19tBa8Hj
 kzJrkBe57vV7Zxf3UMesfgnEfsi8n5WH2x0AVC6pFIM9cc7xc0lolmRyrlqq7fh7Azr56/FjoifaV
 snoplja/wDTaueK6K03EfToC0Q22z5cjyz4l6awcs4ekkG8uRb/CpWaZ8avdffAU9RwOFmfSdX9KT
 YZ0ogtb42HWxWXsrKZEiF6XxmrFMvsMeDcevnljjVD4N3ClSyBse3TmB39epyjC8Kp3P2odkaIx15
 JWxNyY+g==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfQob-007eUn-Kl
 for linux-mtd@lists.infradead.org; Sat, 08 May 2021 17:32:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id e11so2032774ljn.13
 for <linux-mtd@lists.infradead.org>; Sat, 08 May 2021 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x75f2zhKWTzHjy88mDJZzhpjqEESdxY4UIswXW92FRk=;
 b=q0ntRY86SCIEWdV1U9Q5DVF7C2UL8MXllEQDBqJNHSqF3kXiBzU9yu7bTdNKSIu70k
 kv+L4cyibVgPCiP+sw2hI+5Q4bD4OmZxHhGqhNejOIaY1X++x11Zbd64UZ7+DU0SSHpI
 s+o/JFjx+FOysLW/TEQkzuVLzh7SDQCUcihm4lyNdoSqVg7galhGlL+Z7KioTqCDr9PG
 PWmDGyAhl0NAxhbTulA22kePg3q4/Ox3yFL2hnagk3Scq4uKBPO1u2DOKJYGJlEcg+1b
 8Y4x2KrZ0s15Kzd27xNYQdXbKTWwSwGoPhZMzkQb7QBIDFFkJcImwrZeZtF8Xc9JzrG1
 q6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x75f2zhKWTzHjy88mDJZzhpjqEESdxY4UIswXW92FRk=;
 b=cL2c2xjhFckYTBzFw/bA+0oBpJPkUDk2VPvDE0HFDOcY6jIyzPjJlufj1KhAxhelZP
 pCQsp9OgwvKce3AjI0gQY9tEtH+oSYhqdp8Qe6Z2oEsjoVbmim8qoNjxiR+rEeAnNmie
 1i544b1r8nNpSNYCjznEAQjLpxn1y+Ei7lp6fgHk4W/BkuDIaWSQZ4pSoRy5SNSSPpUQ
 yUqf4qQYQ4Brh5+yvZ0KLgou+mlGdbkqARTIcEERMN74VJs0Gf5ktOdbvAWGtFQzeuBa
 /Xs8LCZMwWsC2yulOveeVVaiJ0lXegyqsPtNDOlIvi4WLQZFf293wrTWpfQyOhDdLswT
 cvKg==
X-Gm-Message-State: AOAM530Srdymk5jfxQ156bSJVpKZ1dDRaOQ4qv/JCf6RBwtqtZYgboi5
 SICA6GdVCxnN/hnyUu5TosU=
X-Google-Smtp-Source: ABdhPJxF1AEO/+xAT1u3pck6/FCMMvmMeupL6SpwnrHW3ynYluuyh3qRtdsVLlqbED7fiHvXEhCYog==
X-Received: by 2002:a2e:9b51:: with SMTP id o17mr12439135ljj.320.1620495151268; 
 Sat, 08 May 2021 10:32:31 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id t20sm2401428ljk.2.2021.05.08.10.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 10:32:30 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 David Bauer <mail@david-bauer.net>, Andrew Cameron <apcameron@softhome.net>
Subject: [PATCH] mtd: parsers: ofpart: fix parsing subpartitions
Date: Sat,  8 May 2021 19:32:14 +0200
Message-Id: <20210508173214.28365-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_103233_711280_7A98940D 
X-CRM114-Status: GOOD (  15.51  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKb2ZwYXJ0IHdhcyByZWNl
bnRseSBwYXRjaGVkIHRvIG5vdCBzY2FuIHJhbmRvbSBwYXJ0aXRpb24gbm9kZXMgYXMKc3VicGFy
dGl0aW9ucy4gVGhhdCBjaGFuZ2UgdW5mb3J0dW5hdGVseSBicm9rZSBzY2FubmluZyB2YWxpZApz
dWJwYXJ0aXRpb25zIGxpa2U6CgpwYXJ0aXRpb25zIHsKCWNvbXBhdGlibGUgPSAiZml4ZWQtcGFy
dGl0aW9ucyI7CgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXplLWNlbGxzID0gPDE+OwoKCXBh
cnRpdGlvbkAwIHsKCQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwoJCWxhYmVsID0g
ImJvb3Rsb2FkZXIiOwoJCXJlZyA9IDwweDAgMHgxMDAwMDA+OwoKCQlwYXJ0aXRpb25AMCB7CgkJ
CWxhYmVsID0gImNvbmZpZyI7CgkJCXJlZyA9IDwweDgwMDAwIDB4ODAwMDA+OwoJCX07Cgl9Owp9
OwoKRml4IHRoYXQgcmVncmVzc2lvbiBieSBhZGRpbmcgMSBtb3JlIGNvZGUgcGF0aC4gV2UgYWN0
dWFsbHkgbmVlZCAzCmNvbmRpdGlvbmFsIGJsb2NrcyB0byBzdXBwb3J0IDMgcG9zc2libGUgY2Fz
ZXMuIFRoaXMgY2hhbmdlIGFsc28gbWFrZXMKY29kZSBlYXNpZXIgdG8gdW5kZXJzdGFuZCAmIGZv
bGxvdy4KClJlcG9ydGVkLWJ5OiBEYXZpZCBCYXVlciA8bWFpbEBkYXZpZC1iYXVlci5uZXQ+CkZp
eGVzOiAyZDc1MTIwM2FhY2YgKCJtdGQ6IHBhcnNlcnM6IG9mcGFydDogbGltaXQgcGFyc2luZyBv
ZiBkZXByZWNhdGVkIERUIHN5bnRheApTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+ClRlc3RlZC1ieTogQW5kcmV3IENhbWVyb24gPGFwY2FtZXJvbkBzb2Z0
aG9tZS5uZXQ+Ci0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9vZnBhcnRfY29yZS5jIHwgMjYgKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFy
dF9jb3JlLmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9jb3JlLmMKaW5kZXggMGZkOGQy
YTBkYjk3Li4xOTIxOTBjNDJmYzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2Zw
YXJ0X2NvcmUuYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9jb3JlLmMKQEAgLTU3
LDIwICs1NywyMiBAQCBzdGF0aWMgaW50IHBhcnNlX2ZpeGVkX3BhcnRpdGlvbnMoc3RydWN0IG10
ZF9pbmZvICptYXN0ZXIsCiAJaWYgKCFtdGRfbm9kZSkKIAkJcmV0dXJuIDA7CiAKLQlvZnBhcnRf
bm9kZSA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKG10ZF9ub2RlLCAicGFydGl0aW9ucyIpOwotCWlm
ICghb2ZwYXJ0X25vZGUgJiYgIW1hc3Rlci0+cGFyZW50KSB7Ci0JCS8qCi0JCSAqIFdlIG1pZ2h0
IGdldCBoZXJlIGV2ZW4gd2hlbiBvZnBhcnQgaXNuJ3QgdXNlZCBhdCBhbGwgKGUuZy4sCi0JCSAq
IHdoZW4gdXNpbmcgYW5vdGhlciBwYXJzZXIpLCBzbyBkb24ndCBiZSBsb3VkZXIgdGhhbgotCQkg
KiBLRVJOX0RFQlVHCi0JCSAqLwotCQlwcl9kZWJ1ZygiJXM6ICdwYXJ0aXRpb25zJyBzdWJub2Rl
IG5vdCBmb3VuZCBvbiAlcE9GLiBUcnlpbmcgdG8gcGFyc2UgZGlyZWN0IHN1Ym5vZGVzIGFzIHBh
cnRpdGlvbnMuXG4iLAotCQkJIG1hc3Rlci0+bmFtZSwgbXRkX25vZGUpOworCWlmICghbWFzdGVy
LT5wYXJlbnQpIHsgLyogTWFzdGVyICovCisJCW9mcGFydF9ub2RlID0gb2ZfZ2V0X2NoaWxkX2J5
X25hbWUobXRkX25vZGUsICJwYXJ0aXRpb25zIik7CisJCWlmICghb2ZwYXJ0X25vZGUpIHsKKwkJ
CS8qCisJCQkgKiBXZSBtaWdodCBnZXQgaGVyZSBldmVuIHdoZW4gb2ZwYXJ0IGlzbid0IHVzZWQg
YXQgYWxsIChlLmcuLAorCQkJICogd2hlbiB1c2luZyBhbm90aGVyIHBhcnNlciksIHNvIGRvbid0
IGJlIGxvdWRlciB0aGFuCisJCQkgKiBLRVJOX0RFQlVHCisJCQkgKi8KKwkJCXByX2RlYnVnKCIl
czogJ3BhcnRpdGlvbnMnIHN1Ym5vZGUgbm90IGZvdW5kIG9uICVwT0YuIFRyeWluZyB0byBwYXJz
ZSBkaXJlY3Qgc3Vibm9kZXMgYXMgcGFydGl0aW9ucy5cbiIsCisJCQkJbWFzdGVyLT5uYW1lLCBt
dGRfbm9kZSk7CisJCQlvZnBhcnRfbm9kZSA9IG10ZF9ub2RlOworCQkJZGVkaWNhdGVkID0gZmFs
c2U7CisJCX0KKwl9IGVsc2UgeyAvKiBQYXJ0aXRpb24gKi8KIAkJb2ZwYXJ0X25vZGUgPSBtdGRf
bm9kZTsKLQkJZGVkaWNhdGVkID0gZmFsc2U7CiAJfQotCWlmICghb2ZwYXJ0X25vZGUpCi0JCXJl
dHVybiAwOwogCiAJb2ZfaWQgPSBvZl9tYXRjaF9ub2RlKHBhcnNlX29mcGFydF9tYXRjaF90YWJs
ZSwgb2ZwYXJ0X25vZGUpOwogCWlmIChkZWRpY2F0ZWQgJiYgIW9mX2lkKSB7Ci0tIAoyLjI2LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
