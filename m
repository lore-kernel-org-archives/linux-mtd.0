Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C629C44512
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e8VopjsjOvUuvAucoFDU5r4cBAidB+JgYXFB4KUG13o=; b=hqxbr13iOLpojz
	ZMHvt2uDBwnafRzVy+8+jlgJe7aCiG67JAsrsDXMYniOcUvr8DxbbacoPdBHRi+AQfedJ1hUj2eID
	MtmuOfxCqBAMBmUCon0xJAM+26hrdaPmPI9oH9qG62S/DrHCIz/PrqsbGKBOHma1WDhyOnxW/CDut
	4MGb/9xc4IIakm4E3DaRrlhhlphsfjUTOdtCqacHtk+SZ4W1vFKJc/fntebQRj82jLnrTB7Ya5jXC
	25KkGcgIY8euPUD2pjESLNZpF/T9h2fcZ/8bE60YVbHVfKWn5n1TFqyCLPjbc1y1p5it0Us/sjzeD
	Z+VGzX0YV9W8h7j4uqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRiC-00000000SvU-0gY5;
	Thu, 16 Jul 2026 19:25:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRi9-00000000SuV-3Fa6
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 19:25:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so24390285e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2026 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784229931; x=1784834731; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EnDpN9/EzuQRL2oL3rRietJSPrPHbp0gZrBiyubbNo=;
        b=A5iSmLar9LV6YH7E3FAIHvlR6IqFh2JHDALuoHm8itYYOzUKEUDq/e4gmPk6cgBsrI
         EPQUhO63/nnUtZ3EngKzif0HyI2QgguzyYQU3pbMi0uoqFC04kwY0M2pm2kSwH9ZMj7y
         exXJPv4ahxRMmcDV8iIjyF4YtyR/r+c1d8Tp5P4ObSMVS+eKPvqwt/GWqi3psQq6lGsM
         ChB4JtL5FFLeVt5j1mnaCEOg9GwzeOaT4PC1HwTSe3QnURe1OuyfaFmYSlSz+Sn7KAsv
         qT4UCR3cXoFI9bHp0FGZO2/sbKIaSxUVaHoBY9Z3GhqE6WTprmsd8uWX2x3wD19FIenR
         rvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784229931; x=1784834731;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EnDpN9/EzuQRL2oL3rRietJSPrPHbp0gZrBiyubbNo=;
        b=NxE+fMq99YrTf8BmNopIVzxqexqBksn8B6Sq2ZQJlAnuUB0bhF1hya4Yuk+BzNInLM
         N/hbeU2lBfmoftEvHS8j7b/3kFMdSOFuSZtwk07yJlgvPwz8IOT0Jc68Pqc/1YgAGOMh
         xsL2kM0OUHkmuofKyhCPSEPMHy3QbaVQ/RtuqV6Ud306QwpGerJiDy0IK75hy4scFbD4
         8mq/caIwzm/wKtSOOC4ebeMMrw8a/LtkvSoduOm65KS+9IACg5PdRsMrU4aWvBd5x2Bu
         A5HKU2piFDsaTyJXJPqw+faSgKLu2nqPFzdXSPiZJvos5Khx1+LVi4Qf5b9jhXwtYhJF
         q7IQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6kOxqsAMNmvspCtdTJOeU9UwyI5UdGTaincs3nMFGgZombGgTMQ6rbUfgR0A8RQp2ACgJvsrbbJ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd65kOPL0SIpf4iedpYUwTXhNHEpxObMBWm+1o72tzjcOjrhyw
	2UJqv8lAzz7t5bnwL0UzrQycw8hLGw+eUkWnDvUmUIfoZZtNa9+Jm3S1B0HtJ5sIaQk=
X-Gm-Gg: AfdE7cnZJdfFZeH3DKGFUpP7ME0NPyhAcvxFErHmFMNKJDIkdjf1R9n6aZUzNW1K2Jt
	NJ07taYYEe2/8B6ARc4v84k9ZGkqWoxU3+4W7wiv35wPjxbD1uscZcpnZmhBy1osk304x01S2hK
	jX+l6cXPEFfGKNFi/uPx2oXxTmKm+3lPelgqih/fMEQ5av94x7XAGXnXLejCBkLuxa2kgpdEOO1
	VHHrYC99wr3vj+MV/CQiUXDXFJgj3TmOWCBGyG6hOJA7a/Exwsqgb+Fx9NUE5Y4jGOJWYAnYcn7
	QGDeYTkobIpRVTiEl6r3Eg4hHp/4AtVdrOTLZ070YA9CohO/abFS4KyuQmOzAn27rOpYxSP3Y15
	HXtHAel0zkZrfeOLAgiOuRiH012SWqOO8HXbo/ql/NDsGYaqnbclXJO1nF5wE1+yPiAQQiXazfr
	bmw0e4uYjMrxqJtIl9Xw==
X-Received: by 2002:a05:600c:c492:b0:495:4589:cea6 with SMTP id 5b1f17b1804b1-495483c7c53mr7923575e9.34.1784229931237;
        Thu, 16 Jul 2026 12:25:31 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49541e51f47sm71110295e9.0.2026.07.16.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:25:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Johan Hovold <johan@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand-omap2: Move omap_nand_ids[] to raw nand driver
Date: Thu, 16 Jul 2026 21:25:23 +0200
Message-ID: <901ca5f67bc57219a9222115fabe1a1729b87e25.1784229863.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4041; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=UfIEc8aikJ1M4bIzqCGo5pTJFc1acZzEWA/aeiDqyxw=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqxIA5WUZNG+6b8ZH05yWZKo9HXXNmcm/bYmhpcBcRy3G K3mHGTrZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiMlc5GHoe3FGob/AsE9QK 21HWerB60qeiM2XfV0UWTxSI/nrxc0Bgv+qZ0uA5fdoZix0Ygw4rGQWdEXPsXau0SNO3i/nCxV8 Pd11deXkLZ1ODM0NGovG2V1FCwudCfJ9u4JfayCeqJPKkINyt5nfJC/Hshj2vPrxhVyqsy39h+f PZzAkz/PQMO+fMD+73We+/dX1Xz8H52zb7JUbxKa1myn0XLdG7/r3YDb1bCaqfNzz07+ATCDyw1 i42+/4VRS9p9aDHaSZVjA8uhxefiGo+tClec+9s3/+Nywws4+TOPg26eOrzYRWmwGtuVc8Y9lma Whi1vPld9rPeNKes+NeVq4lsHEJXvdnVH0y6EzWh1OoGAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_122533_837865_ED39918C 
X-CRM114-Status: GOOD (  18.68  )
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

RGVmaW5pbmcgYSBzdGF0aWMgYXJyYXkgaW4gYSBoZWFkZXIgcmVzdWx0cyBpbiBlYWNoIC5jIGZp
bGUgdGhhdAppbmNsdWRlcyB0aGUgaGVhZGVyIChoZXJlOiBkcml2ZXJzL21lbW9yeS9vbWFwLWdw
bWMuYyBhbmQKZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYykgdG8gY29udGFpbiBhIGNvcHkg
b2YgdGhhdCBhcnJheSB3aGVuCmNvbXBpbGVkIHRvIGFuIG9iamVjdCBmaWxlLgoKV2l0aCBzaXpl
b2Yoc3RydWN0IG9mX2RldmljZV9pZFszXSkg4omlIDU4OCBoYXZpbmcgb21hcF9uYW5kX2lkc1td
IHR3aWNlCmp1c3QgdG8gZG8gdHdvIHN0cmluZyBjb21wYXJpc29ucyBpcyBxdWl0ZSBzb21lIGJs
b2F0LiBTbyBtb3ZlCm9tYXBfbmFuZF9pZHNbXSB0byB0aGUgbmFuZCBkcml2ZXIgd2hpY2ggYWN0
dWFsbHkgbmVlZHMgdGhhdCBhcnJheSBmb3IKaXRzIG1vZHVsZSBtZXRhIGRhdGEgYW5kIGRvIHRo
ZSBjb21wYXRpYmxlIGNoZWNrIGJ5IGhhbmQuCgpibG9hdC1vLW1ldGVyIHJlcG9ydHMgZm9yIGRy
aXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5vIChBUkNIPWFybSk6CgoJYWRkL3JlbW92ZTogMS8yIGdy
b3cvc2hyaW5rOiAxLzAgdXAvZG93bjogMjgvLTU4OCAoLTU2MCkKCUZ1bmN0aW9uICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGEKCWdwbWNfcHJv
YmVfZ2VuZXJpY19jaGlsZCAgICAgICAgICAgICAgICAgICAgMjEwOCAgICAyMTM2ICAgICArMjgK
CW9tYXBfbmFuZF9pZHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDU4OCAgICAgICAt
ICAgIC01ODgKCVRvdGFsOiBCZWZvcmU9MTgxMTQsIEFmdGVyPTE3NTU0LCBjaGcgLTMuMDklCgoo
ZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIubyBkb2Vzbid0IGNoYW5nZSkuCgpUaGlzIGFsbG93
cyB0byBkcm9wIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4gZnJvbQppbmNsdWRlL2xpbnV4L3Bs
YXRmb3JtX2RhdGEvbXRkLW5hbmQtb21hcDIuaCAod2hpY2ggaXMgbXkgb3JpZ2luYWwKbW90aXZh
dGlvbiBmb3IgdGhpcyBjaGFuZ2UpLiBOb3RlIHRoYXQgdGhpcyBoZWFkZXIgaXNuJ3QgbmVlZGVk
IGluIHRoZQp0d28gZHJpdmVycyBiZWNhdXNlIG9tYXAtZ3BtYy5jIGRvZXNuJ3QgdXNlIGFueSBk
ZXZpY2UgaWQgc3RydWN0IGFuZCBmb3IKdGhlIG5hbmQgZHJpdmVyIG9tYXAyLmMgb2ZfZGV2aWNl
X2lkIGlzIGFscmVhZHkgcHJvdmlkZWQgdmlhCjxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4uCgpT
aWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVp
bmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYyAg
ICAgICAgICAgICAgICAgICB8IDkgKysrKysrKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFw
Mi5jICAgICAgICAgICAgICAgICB8IDYgKysrKystCiBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2Rh
dGEvbXRkLW5hbmQtb21hcDIuaCB8IDcgLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L29t
YXAtZ3BtYy5jIGIvZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmMKaW5kZXggOTU4ZDJiMGVhNTRh
Li40OGFmMzFhNTRiNTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jCisr
KyBiL2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jCkBAIC0yMTI5LDYgKzIxMjksMTMgQEAgc3Rh
dGljIHZvaWQgX19tYXliZV91bnVzZWQgZ3BtY19yZWFkX3RpbWluZ3NfZHQoc3RydWN0IGRldmlj
ZV9ub2RlICpucCwKIAkJb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiZ3BtYyx0aW1lLXBhcmEt
Z3JhbnVsYXJpdHkiKTsKIH0KIAorc3RhdGljIGludCBncG1jX2NoaWxkX2lzX25hbmQoc3RydWN0
IGRldmljZV9ub2RlICpjaGlsZCkKK3sKKwkvKiBUaGlzIGhhcyB0byBtYXRjaCBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9vbWFwMi5jJ3Mgb21hcF9uYW5kX2lkc1tdICovCisJcmV0dXJuIG9mX2Rldmlj
ZV9pc19jb21wYXRpYmxlKGNoaWxkLCAidGksb21hcDItbmFuZCIpIHx8CisJCW9mX2RldmljZV9p
c19jb21wYXRpYmxlKGNoaWxkLCAidGksYW02NC1uYW5kIik7Cit9CisKIC8qKgogICogZ3BtY19w
cm9iZV9nZW5lcmljX2NoaWxkIC0gY29uZmlndXJlcyB0aGUgZ3BtYyBmb3IgYSBjaGlsZCBkZXZp
Y2UKICAqIEBwZGV2Oglwb2ludGVyIHRvIGdwbWMgcGxhdGZvcm0gZGV2aWNlCkBAIC0yMjIwLDcg
KzIyMjcsNyBAQCBzdGF0aWMgaW50IGdwbWNfcHJvYmVfZ2VuZXJpY19jaGlsZChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LAogCQlnb3RvIGVycjsKIAl9CiAKLQlpZiAob2ZfbWF0Y2hfbm9k
ZShvbWFwX25hbmRfaWRzLCBjaGlsZCkpIHsKKwlpZiAoZ3BtY19jaGlsZF9pc19uYW5kKGNoaWxk
KSkgewogCQkvKiBOQU5EIHNwZWNpZmljIHNldHVwICovCiAJCXZhbCA9IDg7CiAJCW9mX3Byb3Bl
cnR5X3JlYWRfdTMyKGNoaWxkLCAibmFuZC1idXMtd2lkdGgiLCAmdmFsKTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFw
Mi5jCmluZGV4IDM5ZTI5NzQ4NjcyMS4uNTUyZjM2ZGE3OWZjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9vbWFwMi5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMK
QEAgLTIzMTgsNyArMjMxOCwxMSBAQCBzdGF0aWMgdm9pZCBvbWFwX25hbmRfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbmFuZF9jbGVhbnVwKG5hbmRfY2hpcCk7CiB9CiAK
LS8qIG9tYXBfbmFuZF9pZHMgZGVmaW5lZCBpbiBsaW51eC9wbGF0Zm9ybV9kYXRhL210ZC1uYW5k
LW9tYXAyLmggKi8KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9tYXBfbmFuZF9p
ZHNbXSA9IHsKKyAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJ0aSxvbWFwMi1uYW5kIiB9LAorICAg
ICAgICB7IC5jb21wYXRpYmxlID0gInRpLGFtNjQtbmFuZCIgfSwKKyAgICAgICAgeyB9Cit9Owog
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgb21hcF9uYW5kX2lkcyk7CiAKIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIG9tYXBfbmFuZF9kcml2ZXIgPSB7CmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L3BsYXRmb3JtX2RhdGEvbXRkLW5hbmQtb21hcDIuaCBiL2luY2x1ZGUvbGludXgvcGxh
dGZvcm1fZGF0YS9tdGQtbmFuZC1vbWFwMi5oCmluZGV4IDhjMmYxZjE4NTM1My4uMmRkYjYyNGI5
N2ZkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvbXRkLW5hbmQtb21h
cDIuaAorKysgYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvbXRkLW5hbmQtb21hcDIuaApA
QCAtNyw3ICs3LDYgQEAKICNkZWZpbmUJX01URF9OQU5EX09NQVAyX0gKIAogI2luY2x1ZGUgPGxp
bnV4L210ZC9wYXJ0aXRpb25zLmg+Ci0jaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+
CiAKICNkZWZpbmUJR1BNQ19CQ0hfTlVNX1JFTUFJTkRFUgk4CiAKQEAgLTYzLDEwICs2Miw0IEBA
IHN0cnVjdCBncG1jX25hbmRfcmVncyB7CiAJdm9pZCBfX2lvbWVtCSpncG1jX2JjaF9yZXN1bHQ2
W0dQTUNfQkNIX05VTV9SRU1BSU5ERVJdOwogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgb21hcF9uYW5kX2lkc1tdID0gewotCXsgLmNvbXBhdGlibGUgPSAidGksb21hcDIt
bmFuZCIsIH0sCi0JeyAuY29tcGF0aWJsZSA9ICJ0aSxhbTY0LW5hbmQiLCB9LAotCXt9LAotfTsK
LQogI2VuZGlmIC8qIF9NVERfTkFORF9PTUFQMl9IICovCgpiYXNlLWNvbW1pdDogMWExNzU3Yjc2
NDI3ZjYyMDFiZmUwYmYxYmVhOWY3NTc0ZjMzMmE5MwotLSAKMi41NS4wLjExLmcxNTM2NjZhN2Q5
YmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
