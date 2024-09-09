Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D335ECE579
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SIf5u4uU7SUFdKvtIOqo4G4ljvMlDiMykhrjw1ntlQ=; b=IqgMAWnehOV0ZD
	ZSqpsc2xctX/vAMftZS8pWnnmIgMNc/Q8tGuGtViFkibnzQ0YK1xG9epgbxRJUf9BvHQBvGF/HWsN
	c/Wdrfyz6dqAjq9tcqxATm9Eb7VxLQX9jNXd0LzvFWr3cTlyfGc2mMy0txvs3oQ71f7DJYQkmeAxo
	eAridH+i7BghEGpsoKujsGinvis0s6HM5B2vVe0xyhyM/NQzWDpWh6zsRlX2uXhk2RhEJqNz/EHLm
	iYAMOXgpq4oHqhbfpVuz29ypy5l56jale/mznySzGQbMA4hjOgLuHk86fl7VhAjchYl9N6ps8BFJw
	d4L4aZHbuO9i9eQpxhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaFu-00000001DTN-3Uuz;
	Mon, 09 Sep 2024 09:00:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGY-00000000vzr-1twb
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:56:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so6249565e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868612; x=1726473412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
        b=fvGZ6el1MBM9yVxaWdrh/Ow1k+hVG/kt0P6U3cHrjnqP1dbRnWR0wU0rymppsrqDPv
         dn12CXgfoyJVpizYXbIZ1LTgkdWVg+qLwgW4MCfp9DLBJdHFi8nChtmnWuNLdGsuKzCW
         1pFOGjBrzqYt0KIbC2uvpVp6mvttuDkpUGBewj6o6MCxJu+Yo8+dbJS4SQCDPpIp8FGz
         56A9WYL7msfbSZQNtUk3XuYbbaCcZono3rvMHb2hd89+zv9LfKdZN+W2BcpRCSORQVS7
         u92aKgTPHrxpBGx6AJXS3i7GUvIoVknJ1ioPlwV1sWvCKtPrGWZWfHHBEcp6ntlWeD80
         2/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868612; x=1726473412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
        b=b+Jhx+9lbPtS/UiqzY5HNOgvWjuEyKTjNn1RU2mAk+kM1kt7NL7PZDCYKpUqQDg5Oh
         uT+87IFlk8r8qpgMpKJ2Yqm3G8ggpXVrP6B9FG5/KorkFtFtSVYhtC6uh2uHALIQgb45
         gx7xlWhXEqzLrDvmhdPBtNg4i6X4+CKJe9dVP/Msj9TXokB4M0ltl59qySjNF+eL6Xzv
         Eof0eVBYPZQZRVVao7imbQ4RdneQeWDJX46dtUVxwYqKJgQbaGRi4teVrVA0ONi7qLQP
         JzNbpE7WSzrns3PwsnAT2pepUmfU+aKvpI8vjYEY8mu3dVn7YQcJmHhX1vI0thqD7mbN
         kDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhDH/865YG/5EbyW2+OZ68rVDq3FIEW+IKw1S4JTSCSAFPGOo2OgcM4BjJLwOK9kMHIgq3XPbyHc4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsFrcaAw3wU0jz09V8fzG0m1zylN21GQ2TEySnBcdF+chtWT+X
	8BwdD65k31QK9vBjSywEWXRRiM9hEGm3IAJlfGDlbvAhZqf5Dh1U
X-Google-Smtp-Source: AGHT+IESGKS/b/3I+SBf3rTXq+UoAQ/sBaFO4c/YOVV0ofXN+ihvCL604F2/r2duzQEowocOYCixTA==
X-Received: by 2002:a05:600c:17d4:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-42cb16e7addmr29272525e9.12.1725868612166;
        Mon, 09 Sep 2024 00:56:52 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:51 -0700 (PDT)
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
Subject: [PATCH RESEND v2 03/19] drm/i915/selftests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:46 +0200
Message-ID: <20240909075641.258968-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005654_515249_0A1F171E 
X-CRM114-Status: GOOD (  13.32  )
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
cy5oIgotLSAKMi40Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
