Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3CCCE8343
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVcRS8ZHDGEv/09foIGn3frSyN6C3EnkJxy2wpkRh/o=; b=vwhW0g2zE3JR/h
	eYu3sUtAdD1+xhNfULMa/lX0a/SvLhSYMWRhHsebFRpUBhI3fHQIWpAeJDECHTLLMn52rQNX9vD0I
	xbqzll3VNsQQt9AGLSdknSCvKJ5d/2JoT8UXPlQaPzUP2y3j4cE4BHt8R0oc47KU2191Bfss/ai/i
	EOHNg2ITL9fsBKYFcbZjvarrs+OXV7v7wzidgwei16b5M+tmmHMCtU0Kb4mIUU9RDoWoBCugLYJal
	wCKaG/qEDiujqPrS73iUBytaMLftLnQPTJE0/tziZ2H5JwlYmR7lmMkTzoCco0eIlDuxAtvhzJ0XK
	ZNEVy+d2ue78ZufC/dDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB0-0000000HDf0-0eeo;
	Mon, 30 Sep 2024 13:10:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeM-0000000H4mx-2wm8
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so39430165e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699833; x=1728304633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWdhzc84IUX3iZRvSVXhcMocJl1l3V+3RFdCYOgUVyI=;
        b=LW+ItA1Wjj5amz5AGvn/IB/7ZAJ/MJfTBWKMeQEHGqIWUCNW90TRk1D3PnjsuZr9y3
         uKLwuMXNC48e/m0WHqXH9T6qhJpRvdoimLKEyv1cvcH5/wt9pKGHIIS5/UgUrbadrUui
         8p8ZOVmGetanMOzLcCha587oqfgfUebs8SSUCYwtQLeXtfTsJ+5Gs8k6efD1cdpbZVdL
         PVKMWyOBcdz8U+WbtUQIaF6qZNpqCmUAeqUpvotu13aVgf6Ifam3F7f0HYyivJJ/ihMl
         nLOsLQaOVbDt7HxMtCYLsrpwmDsKnKlxqhIEHAVMnxKvho6q9R37z/wsjGI815G+EGkq
         +sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699833; x=1728304633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWdhzc84IUX3iZRvSVXhcMocJl1l3V+3RFdCYOgUVyI=;
        b=NT0KlQN6IDitjzC0C0Y7f5UtYzpZiZiNi2oC8CvQFklqZ0kDbQgRs2ieo89OPcCm69
         EZv1BAsl1GA0fdAiDAGj7Tve15xrlf112jxR4HK3+saMH/S2a6Wp0DVdsmyetsKtuq1F
         WZZOz3O00tSctWT6KMlvomOfqXVEcP2dGcpi6nBGXpiyGO/+Isbo8M+m3DSw9fVYbIk8
         elmy9vLJowYdkqO3IXny6ELoOGVwC68DUl1mQcypxX09SCc7DxDc4uybAbnw0aykTFz0
         YPWy1z/YR/ADmZIQvUvBUdjpt2LL0AmzzAtLRb56TSjiObijumIFTXjlXxNJxrs8p7ag
         mLCw==
X-Forwarded-Encrypted: i=1; AJvYcCUtsIbfj5VRZ6MliiWN94vHW5fc8aDW/ITJEOgQkLUcmP4YZVoTfev58VjiZiGOu7k1yIWCBa+kFss=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVeRbKznkrArglN0j5NRFq8lFkECYpPLZ2T7qBh31794+UT4zV
	F1ZyLKDoyWw+r1iMB/jel3/EUOlzlKq9PQdn1XfMT9RU//IRkE0w
X-Google-Smtp-Source: AGHT+IFcXQiYgy1UCejNT8Qld3tDPg5srqzSDnRCPSydZyRhIwizEVC4oe/1cX76nhckBGiahi+2eg==
X-Received: by 2002:a05:600c:c5:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-42f6944174dmr24736915e9.11.1727699832942;
        Mon, 30 Sep 2024 05:37:12 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:12 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 03/19] drm/i915/selftests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:14 +0200
Message-ID: <20240930123702.803617-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053714_773156_25524BE6 
X-CRM114-Status: GOOD (  13.31  )
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

U3Vic3RpdHV0ZSB0aGUgaW5jbHVzaW9uIG9mIDxsaW51eC9yYW5kb20uaD4gaGVhZGVyIHdpdGgK
PGxpbnV4L3ByYW5kb20uaD4gdG8gYWxsb3cgdGhlIHJlbW92YWwgb2YgbGVnYWN5IGluY2x1c2lv
bgpvZiA8bGludXgvcHJhbmRvbS5oPiBmcm9tIDxsaW51eC9yYW5kb20uaD4uCgpTaWduZWQtb2Zm
LWJ5OiBVcm9zIEJpemphayA8dWJpempha0BnbWFpbC5jb20+CkFja2VkLWJ5OiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29u
YXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPgpDYzogVHZydGtvIFVyc3VsaW4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvaTkxNV9n
ZW0uYyAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9pOTE1X3JhbmRv
bS5oIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL3NjYXR0ZXJsaXN0LmMg
fCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvaTkxNV9nZW0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9pOTE1X2dlbS5jCmluZGV4IDYxZGE0ZWQ5
ZDUyMS4uMDcyNzQ5MjU3NmJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxm
dGVzdHMvaTkxNV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvaTkx
NV9nZW0uYwpAQCAtNCw3ICs0LDcgQEAKICAqIENvcHlyaWdodCDCqSAyMDE4IEludGVsIENvcnBv
cmF0aW9uCiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5oPgorI2luY2x1ZGUgPGxpbnV4
L3ByYW5kb20uaD4KIAogI2luY2x1ZGUgImdlbS9pOTE1X2dlbV9pbnRlcm5hbC5oIgogI2luY2x1
ZGUgImdlbS9pOTE1X2dlbV9wbS5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
c2VsZnRlc3RzL2k5MTVfcmFuZG9tLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMv
aTkxNV9yYW5kb20uaAppbmRleCAwNTM2NGVjYTIwZjcuLjcwMzMwYTJlODBmMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfcmFuZG9tLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfcmFuZG9tLmgKQEAgLTI2LDcgKzI2LDcg
QEAKICNkZWZpbmUgX19JOTE1X1NFTEZURVNUU19SQU5ET01fSF9fCiAKICNpbmNsdWRlIDxsaW51
eC9tYXRoNjQuaD4KLSNpbmNsdWRlIDxsaW51eC9yYW5kb20uaD4KKyNpbmNsdWRlIDxsaW51eC9w
cmFuZG9tLmg+CiAKICNpbmNsdWRlICIuLi9pOTE1X3NlbGZ0ZXN0LmgiCiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9zY2F0dGVybGlzdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvc2VsZnRlc3RzL3NjYXR0ZXJsaXN0LmMKaW5kZXggODA1YzRiZmI4NWZlLi43
ZTU5NTkxYmJlZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9z
Y2F0dGVybGlzdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9zY2F0dGVy
bGlzdC5jCkBAIC0yMiw3ICsyMiw3IEBACiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L3ByaW1lX251
bWJlcnMuaD4KLSNpbmNsdWRlIDxsaW51eC9yYW5kb20uaD4KKyNpbmNsdWRlIDxsaW51eC9wcmFu
ZG9tLmg+CiAKICNpbmNsdWRlICJpOTE1X3NlbGZ0ZXN0LmgiCiAjaW5jbHVkZSAiaTkxNV91dGls
cy5oIgotLSAKMi40Ni4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
