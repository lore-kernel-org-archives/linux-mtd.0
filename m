Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D6E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SIf5u4uU7SUFdKvtIOqo4G4ljvMlDiMykhrjw1ntlQ=; b=VPks3BpI0awZxl
	tQVIL1g04P/+Ig0+HA7hl40LbcVFWQx3Mp4EnaPnYgIU/M6XZJbwebLJF5tgmJpPKIkkWXT+qaHwK
	ByBK8B4aac25MgiUVYCVxoxvZQc1VxLv4Ry5dtQZ81rlnuG6KBVYVUzxzyvwnXWej0cajjTjIcUCm
	l1yTqTO5pbbEUNfSwWVmkUILLnbldRrmPqt7FrG2d6gIfe3I/LCAcjJK2mGnPyspRJrah3JrJi3YM
	sq50U0x2rHPgXfo9HQMzpD8M/CvLmsr7/xDKhDeogRoStD40prD4Hys4JOw8SOH+Xgw0VjKFh+GoM
	uyuvevCttEktPalffqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVe-00000000jVn-3Z4s;
	Mon, 09 Sep 2024 07:08:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVZ-00000000jRM-3Sed
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so3589815f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865700; x=1726470500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
        b=EkX5JFH1Y8QBk7gxL0zNo2YdkY/vbr+jgMsUKa1cXzfNmibmpOf2gTje3MP2c28VW3
         i0U9acaM/qBs92N46+ysXMoS+S0JNqyxCQ0pS3RllOUNSMXfySuatnmAtk03AdNwxfYD
         OpqKjdx96M7UY0/npxyF5inclrCPeedcWFRj/cxj/wx5Yaic8rMLzeOSselZZN4EuOi9
         Pty4NIY2NwQxxPxk2OXLKSOGwgoI/Uc+2kyjQwonXET8HZ34FucsCBI04bK+7SL9dbTX
         sHNFJ4gwgYKMhLKWSjYCQLQhF4w9QRp+jB6wCykk43ckj3nO0XYwdlUBzGChiDqmQ4kI
         vWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865700; x=1726470500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
        b=rHs3sJkcspN0dAbtniaPzoZEKM4JYyLJ4z4g0QcErP0piSfd0ch890GXH/u/HQVQ6y
         NZLzxHVebiKGzwyONHKiTPQHj+74aEjxOa6l5r7pd7vI1bYT1lE0sAsAwbZgOmQloqS5
         2VJH28X/gjjPe5dMJMFL0UPBVAHFH+ss50UJ5YSG1avsKelHFQwZt7TPyw42vBVRc+w+
         kNqgOssoIgInaGCtvw1sJDaGtfRPfkNhQ5tp7nYkk8iLt2fdkhdjJzVIL+5GcRp0luko
         bgU3fzWHadnOZ551XlBhDvAu6Y7CqusqUFQWiKjt8XHwHt0ugJJN1JRH/n+I8+rnJ5bt
         5+kw==
X-Forwarded-Encrypted: i=1; AJvYcCUqLzpa25YD5+CjYGGc8FpOuQw59P28OvC/KWFrC/MWZ573PHPcCDjPhKp+52bNL24KoZNZxeJhfZk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCn1voS+OZyK6z+k7Nhxg71F+wspqY5N57hzR8qo2clMEcl5Fn
	ixy8o8FOQ2cwL2VvTgTIEdugD3bP45T6KVcml1oOOTBpsOqE/Xus
X-Google-Smtp-Source: AGHT+IHMxHViAQuYhY7LbiGTRSQjuSO1CzAuIEbDmKQ7N1Z92ayMooKBy6B84PbIuJbIoGvJODw6LA==
X-Received: by 2002:adf:f4c2:0:b0:374:cb5c:2956 with SMTP id ffacd0b85a97d-3789243fd67mr6064910f8f.40.1725865699969;
        Mon, 09 Sep 2024 00:08:19 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:19 -0700 (PDT)
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
	kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 03/19] drm/i915/selftests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:17 +0200
Message-ID: <20240909070742.75425-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000821_909915_A05D43E6 
X-CRM114-Status: GOOD (  13.33  )
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
