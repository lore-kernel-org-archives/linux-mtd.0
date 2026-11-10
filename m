Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B6606DF4F
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZVAqNq5N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eC+bxpEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZwabUeFMqwf8F242+EFnBFoQIxr5HuVS8CsU7tOhPig=; b=ZVAqNq5NP/C0BnjKqs+dzkhQrW
	GaIf26Z9rnJ+My8JwRpNAgCZkc2xzjL1AIzxZl/mGW4yt98GuDpA4vvMQqyDISsUEUwr8Z4juGXA9
	buxEVPNBsdj+I80/7IERTcj53mmkILTUQWRgUX3ziHJsdOdrrlR/w4iIOkWJxKkW5GJl0VBVnwNa0
	DPNql9IhIETJgL1biksFgWzAEGW6Q1EA6CppBwQ5F+lOCrov5LVn8W3DTk5rKwHMEg/uGSaxedh0y
	KMUpG4kn4DCA4K3GtE1RLfra2Zb2W4w2QXxSYYvUSxNp8s7E0B1g6/E1TmuMbwarBbZTBTvBaBi9E
	yCMxGg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYc-00000002yrl-3ZPG;
	Tue, 10 Nov 2026 07:46:18 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXf-00000002xYB-3gzP
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:22 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-854b6e2e41fso899692a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296719; x=1794901519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=eC+bxpEBlxFfcwXtKiLCwdEu7ooiYvKKrKv4/4fmV0nRfDzqG/0Ny0VxPFCnAyGgOX
         BrqEm1oiV90YEZwlG3MkSsiJIiqSopfo4sGnUwAXB+jkA46+bH3Via/2ajwaQW4xd1tk
         1Q5XrvmyULGRZn1P+qU5RLe/epGPaVa7ceOxMlF8vnFTL34yV9z5WW1JQKJ27w/S7V93
         1Emfkte0Gw3HWJ/CwTmWWJvP94tpr5ggawc1M4wxkb7COGG8b/RluiVxKmrOWvEHTIaq
         yTOWo9vJykQZLm7GAB4cV3Zl54lcQXWvIjWhsd6f8lCT+hkSMd2RKh6gXPFhUgO5EB4f
         c3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296719; x=1794901519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=rHKoT6f8oNUJXln6JFJILVpUcXK1+zNrkm5NmXIrFUa5UPN8FIxPqAqrA3U4lSm828
         x74AqGW3YQfK3NFvXvOjdhrEO+XI6VPi6cAWB2iDwBUEnts1LduXN2ZTfxz2Kxxwe+0b
         f7LSaZNdGgWpS3OPU/YmUe/tp8XSMdH8DB3rriKj1rUObqOsVxhZf6ChT6n7tuuWgRVR
         0aU/elGIXp+LwjHR+nrQS9B4lmaydKB52oZxMNBnQugrVqYy3CikQdaQgVeukbHOxfwT
         wpqMM7lZSd2J0j4W5qk3laWtP9qow5BaP557i6x4YFnlByvrM3QMinCWB3Dodx1/9QQ5
         FC0Q==
X-Gm-Message-State: APuU4Z9b2CUmukopF2H9C3x+KA9W3ciop+G8y0hjAHUx14vtU1ZyM02J
	ch+sLzsgx8A0ZU1mMoM4oPd96vzoZLXVkXXcgwve4XVCu3IiaZd7mKADKXUVop77
X-Gm-Gg: AYBFou3WFYIqx2S51ARFb0r4zXD+nAeaXZLHw9YRQ5luuTmYKKTvfjWPrMPoK6nTBEK
	zyC5gGN3LwmHHoQOZInofG9metyo8TP7RpghEBRj6crb1D8USKc6da13U90wGsPpekLt2yZaDWU
	nHdPx7J1vip0kAaCRsNXAut/fwKkRw2qeuWO1YornulgQGODeReB4ZuR9XJOaPWEZRsY0KYQqoJ
	2vcx6lX5KycdYCr6gwhgeYxAHNvBMp9fTyDKwxSIWCnPQOb8AaQZmjHBYsdLheqnGl8hLXwgL6s
	QjsDXRzr10gsYzX8joA6/Ci12r09+Cod8tOjt9GtzF4lhpIDEZj91j0BwSIhsyUzqoXDZcy/oHj
	59gwDR6RZHKGg7mqSZUMhgYoXbvV7M6WQzp2L+6LtP0OBZtjQm99eWzO9qrFEsvImkEKlWCu455
	5ciz8uijExesax9bT6PF6yfdwu6F49dCYtBDL7Syy10Zb8uzpZNny5R8NXPC8TNO/aAG8o8sh4i
	Ekl5Hx25tq1cwSn/B5/kfdHdFqx4+FLOYcDWEiPeLLTJMk5E7Yn5pbjhLi0c0luElwIA6MWKI9n
	K1tM2cizMe2keq8QwJP+925MmYLArD/E5yBPPpYvPKI2MeMq0sNUi3tgoBzju6CEeJpLfOxsNH4
	xSEmjVbKJfOeO1NVyDtxrPwcGbaAZSoAe5f2CezOsmPTC7LuTt9t6ZNyceNe0rtglWIAcy1Cm3Z
	bijHnY+5sAZAEnkSjBUb/GFfrYeZxqnNo4wCbquAS0zKEHYq6h7CU=
X-Received: by 2002:a05:6808:5087:b0:503:8f9d:f11a with SMTP id 5614622812f47-5683cd8022amr1530811b6e.29.1794296718777;
        Mon, 09 Nov 2026 23:45:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:55 -0700
Subject: [PATCH v2 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-52-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234520_500863_C99EBF67 
X-CRM114-Status: GOOD (  14.03  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RGlzY29ubmVjdCB0aGUgc2Nhbm5lZCBjaGlwIG9uIHJlbW92YWwgYmVmb3JlIHRoZSBCQ01BLWJh
Y2tlZCBoYXJkd2FyZQpzdGF0ZSBiZWNvbWVzIHVuYXZhaWxhYmxlLiBSZXRhaW4gdGhlIGVtYmVk
ZGVkIE5BTkQgY29udHJvbGxlciBhbmQgY2hpcAp1bnRpbCB0aGUgZmluYWwgTVREIHB1dCwgaW5j
bHVkaW5nIHJlZ2lzdHJhdGlvbiBmYWlsdXJlIGNsZWFudXAuCgpTaWduZWQtb2ZmLWJ5OiBKYW1l
cyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4uYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4uYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2JjbTQ3eHhuZmxhc2gvbWFpbi5jCmluZGV4IDRkNGUxODVjMjJlNS4u
NjBmYzQ0MGQ0NTE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZs
YXNoL21haW4uYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4u
YwpAQCAtMTksNiArMTksMTIgQEAgTU9EVUxFX0FVVEhPUigiUmFmYcWCIE1pxYJlY2tpIik7CiAK
IHN0YXRpYyBjb25zdCBjaGFyICpwcm9iZXNbXSA9IHsgImJjbTQ3eHhwYXJ0IiwgTlVMTCB9Owog
CitzdGF0aWMgdm9pZCBiY200N3h4bmZsYXNoX3JlbGVhc2Uoc3RydWN0IG5hbmRfY29udHJvbGxl
ciAqY29udHJvbGxlcikKK3sKKwlrZnJlZShjb250YWluZXJfb2YoY29udHJvbGxlciwgc3RydWN0
IGJjbTQ3eHhuZmxhc2gsCisJCQkgICBuYW5kX2NoaXAubGVnYWN5LmR1bW15X2NvbnRyb2xsZXIp
KTsKK30KKwogc3RhdGljIGludCBiY200N3h4bmZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGJjbWFfbmZsYXNoICpuZmxhc2ggPSBkZXZfZ2V0X3Bs
YXRkYXRhKCZwZGV2LT5kZXYpOwpAQCAtMjYsOSArMzIsMTQgQEAgc3RhdGljIGludCBiY200N3h4
bmZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IG10ZF9p
bmZvICptdGQ7CiAJaW50IGVyciA9IDA7CiAKLQliNDduID0gZGV2bV9remFsbG9jKCZwZGV2LT5k
ZXYsIHNpemVvZigqYjQ3biksIEdGUF9LRVJORUwpOworCWI0N24gPSBremFsbG9jX29iaigqYjQ3
bik7CiAJaWYgKCFiNDduKQogCQlyZXR1cm4gLUVOT01FTTsKKwliNDduLT5uYW5kX2NoaXAuY29u
dHJvbGxlciA9ICZiNDduLT5uYW5kX2NoaXAubGVnYWN5LmR1bW15X2NvbnRyb2xsZXI7CisJZXJy
ID0gZGV2bV9uYW5kX2NvbnRyb2xsZXJfaW5pdCgmcGRldi0+ZGV2LCBiNDduLT5uYW5kX2NoaXAu
Y29udHJvbGxlciwKKwkJCQkJYmNtNDd4eG5mbGFzaF9yZWxlYXNlKTsKKwlpZiAoZXJyKQorCQly
ZXR1cm4gZXJyOwogCiAJbmFuZF9zZXRfY29udHJvbGxlcl9kYXRhKCZiNDduLT5uYW5kX2NoaXAs
IGI0N24pOwogCW10ZCA9IG5hbmRfdG9fbXRkKCZiNDduLT5uYW5kX2NoaXApOwpAQCAtNDgsOSAr
NTksMTYgQEAgc3RhdGljIGludCBiY200N3h4bmZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBiNDduKTsKIAorCWVy
ciA9IG5hbmRfc2V0X3JlbGVhc2UoJmI0N24tPm5hbmRfY2hpcCwgTlVMTCk7CisJaWYgKGVycikg
eworCQluYW5kX2NsZWFudXAoJmI0N24tPm5hbmRfY2hpcCk7CisJCXJldHVybiBlcnI7CisJfQog
CWVyciA9IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIobXRkLCBwcm9iZXMsIE5VTEwsIE5VTEws
IDApOwogCWlmIChlcnIpIHsKIAkJcHJfZXJyKCJGYWlsZWQgdG8gcmVnaXN0ZXIgTVREIGRldmlj
ZTogJWRcbiIsIGVycik7CisJCW5hbmRfZGlzY29ubmVjdCgmYjQ3bi0+bmFuZF9jaGlwKTsKKwkJ
bXRkX3B1dF9tYXN0ZXIobXRkKTsKIAkJcmV0dXJuIGVycjsKIAl9CiAKQEAgLTY1LDcgKzgzLDgg
QEAgc3RhdGljIHZvaWQgYmNtNDd4eG5mbGFzaF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAogCXJldCA9IG10ZF9kZXZpY2VfdW5yZWdpc3RlcihuYW5kX3RvX210ZChjaGlw
KSk7CiAJV0FSTl9PTihyZXQpOwotCW5hbmRfY2xlYW51cChjaGlwKTsKKwluYW5kX2Rpc2Nvbm5l
Y3QoY2hpcCk7CisJbXRkX3B1dF9tYXN0ZXIobmFuZF90b19tdGQoY2hpcCkpOwogfQogCiBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBiY200N3h4bmZsYXNoX2RyaXZlciA9IHsKCi0tIAoy
LjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
