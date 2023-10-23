Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6EECDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UT67thRDZVi2y114eFSrJifeu06T8VTGg/bIEX1GvHM=; b=EeP2pCe8BUxHbN
	Cxnb8vxqqKhy2/9ae6dRQEiNbC3G7ETz4JmwD5VRUDQ22rwmFJShS6Y9xUKcxygUNGNCNkUcjUmDC
	QlMb5zXlQwMnEVwwVxbWe57TYAaErXc8nLixTmrq6n2csvCfsndC/LGAkA/wBbKwBvHv2aSd1Au8z
	ejKP+z+2vuC2wlDjp7/f8eHzW5ARxXMtFpNAuc72OmLC/qZooF5lp9nnloRtIqnfaj8Z37meOxNje
	jn3EB5DZWWgYGvTTl9JU4dNMx8gvcLE6/JbZcTvVotTR6/K49i4P0zfwfmG9sNIc/lOVoZFpAUNu4
	9+3tAr+aLtHovH2arXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qusAP-0071k4-0W;
	Mon, 23 Oct 2023 10:28:13 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qusAM-0071jd-2j
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 10:28:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5079c846dcfso4129693e87.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2023 03:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698056888; x=1698661688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmpbmNsgTug//AKJ23/LOrdfKl+bPeYyVbdQxbwryQU=;
        b=m1BJsPXXP8yzhEVrQpp0+M7Dhyz+fVlueJftvRtvgIJtvQx9UdJgCb+rRYrhEJRzw3
         Kpq6aXW4amSEgkvFbq2yUrYvunhU67Hd7UhnS5MxW+8cfHX45GDzB3Qua9IIUIUIK/B5
         6KiTvpy5eSXHsPkmVFrvjzwIC4nH6m1TjAgizEPzna/8vcnoZM8ccfn5pwUb8ffnLnOC
         loTY2Gn9XVUGh1iVGrD4YGaYwD5SuiCWWFC8vpIV/7TwSc3vWaSYGVsJNnOk5CsMhAIB
         m7RIqApSfZgpcz3li+0DgCaEO8OnrvSDJpz1i3D3iRrNH7K3cF5vz5CrvKr2q5NI/rxV
         o2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056888; x=1698661688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmpbmNsgTug//AKJ23/LOrdfKl+bPeYyVbdQxbwryQU=;
        b=Mg10akR7gD2p9XNq+Xu4clQkx+v6Bqd0aTBmLVPoE2mFe/MuZIqk4buXOxdmU7pZ4g
         Zsl/Cq0+C/3vI4OFQUOy3grQ+r9mfYyzgPH5Jg41Hk50j9B9QXYu+kYRqvovrqoOSd5r
         fqTn5Fjeii5MP6Uicyj7Um7yKMtHDm1oXj2vimQ+wrP9tuPdH9ZkwvxD739cCh8jU83R
         lbjy+N66HwrjY3uiRybWq3At5Y78g6K0cZY4zoSdEDSMiYifJplar4s13PwWWs705VhJ
         YXl2TbVOCRCfRPZXNabQtmbMM2Y5EZybHlrcaDyLEhz532R2Dz2GT7z++3DoJxIp2eA2
         MoqQ==
X-Gm-Message-State: AOJu0Yw6WONkqHt19yIfjhkCfCR7apB1xuVuQ0xn88xBjAJDJ1ZrpVKL
	SDdzQ8nIPEP6BDHoq8Zft9c=
X-Google-Smtp-Source: AGHT+IEk0BIT4qm3w/hQKen9lE10v/DCqP0PmAupQ7uBGK9Pymywqj0AQFZw/jvACh9HlLsqd5RW6w==
X-Received: by 2002:ac2:5456:0:b0:507:b074:ecd4 with SMTP id d22-20020ac25456000000b00507b074ecd4mr5594571lfn.7.1698056888098;
        Mon, 23 Oct 2023 03:28:08 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id o13-20020ac24bcd000000b00507a622184dsm1651629lfq.173.2023.10.23.03.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:28:07 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH reworded] Revert "nvmem: add new config option"
Date: Mon, 23 Oct 2023 12:27:59 +0200
Message-Id: <20231023102759.31529-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_032810_889237_8B5A0D33 
X-CRM114-Status: GOOD (  17.85  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyByZXZlcnRzIGNv
bW1pdCA1MTdmMTRkOWNmMzUzM2Q1YWI0ZmRlZDE5NWFiNmY4MGE5MmUzNzhmLgoKQ29uZmlnIG9w
dGlvbiAibm9fb2Zfbm9kZSIgaXMgbm8gbG9uZ2VyIG5lZWRlZCBzaW5jZSBhZGRpbmcgYSBtb3Jl
CmV4cGxpY2l0IGFuZCB0YXJnZXRlZCBvcHRpb24gImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMi
LgoKVGhhdCAibm9fb2Zfbm9kZSIgY29uZmlnIG9wdGlvbiB3YXMgbmVlZGVkICplYXJsaWVyKiB0
byBoZWxwIG10ZCdzIGNhc2UuCgpEVCBub2RlcyBvZiBNVEQgcGFydGl0aW9ucyAodGhhdCBhcmUg
YWxzbyBOVk1FTSBkZXZpY2VzKSBtYXkgY29udGFpbgpzdWJub2Rlcy4gVGhvc2UgU0hPVUxEIE5P
VCBiZSB0cmVhdGVkIGFzIE5WTUVNIGZpeGVkIGNlbGxzLgoKVG8gcHJldmVudCBOVk1FTSBjb3Jl
IGNvZGUgZnJvbSBwYXJzaW5nIHN1Ym5vZGVzIGEgIm5vX29mX25vZGUiIG9wdGlvbgp3YXMgYWRk
ZWQgKGFuZCBzZXQgdG8gdHJ1ZSBpbiBtdGQpIHRvIG1ha2UgZm9yX2VhY2hfY2hpbGRfb2Zfbm9k
ZSgpIGluCk5WTUVNIGEgbm8tb3AuIFRoYXQgd2FzIGEgYml0IGhhY2t5IGJlY2F1c2UgaXQgd2Fz
IG1lc3Npbmcgd2l0aAoib2Zfbm9kZSIgcG9pbnRlciB0byBhY2hpZXZlIHNvbWUgc2lkZS1lZmZl
Y3QuCgpXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMi
IGNvbmZpZyBvcHRpb24KdGhpbmdzIGdvdCBtb3JlIGV4cGxpY2l0LiBNVEQgc3Vic3lzdGVtIHNp
bXBseSB0ZWxscyBOVk1FTSB3aGVuIHRvIGxvb2sKZm9yIGZpeGVkIGNlbGxzIGFuZCB0aGVyZSBp
cyBubyBuZWVkIHRvIGhhY2sgIm9mX25vZGUiIHBvaW50ZXIgYW55bW9yZS4KClNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KUmV2aWV3ZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IFNyaW5p
dmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KLS0tCkdyZWc6
IEkgcmV3b3JkZWQgdGhpcyBQQVRDSCdzIGNvbW1pdCBtZXNzYWdlLiBJdCdzIGhvcGVmdWxseSBj
bGVhciBub3cKICAgICAgdGhhdCB0aGlzIHJldmVydCBpcyBPSyBvbmx5IHdpdGggdGhlICJhZGRf
bGVnYWN5X2ZpeGVkX29mX2NlbGxzIi4KLS0tCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAgICAg
ICAgfCAxIC0KIGRyaXZlcnMvbnZtZW0vY29yZS5jICAgICAgICAgICB8IDIgKy0KIGluY2x1ZGUv
bGludXgvbnZtZW0tcHJvdmlkZXIuaCB8IDIgLS0KIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5j
IGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCmluZGV4IDMyMGQ4YWQyYmFiZS4uYmIwNzU5Y2ExMmYx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvbXRk
Y29yZS5jCkBAIC01NjAsNyArNTYwLDYgQEAgc3RhdGljIGludCBtdGRfbnZtZW1fYWRkKHN0cnVj
dCBtdGRfaW5mbyAqbXRkKQogCWNvbmZpZy5yZWFkX29ubHkgPSB0cnVlOwogCWNvbmZpZy5yb290
X29ubHkgPSB0cnVlOwogCWNvbmZpZy5pZ25vcmVfd3AgPSB0cnVlOwotCWNvbmZpZy5ub19vZl9u
b2RlID0gIW9mX2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUsICJudm1lbS1jZWxscyIpOwogCWNv
bmZpZy5wcml2ID0gbXRkOwogCiAJbXRkLT5udm1lbSA9IG52bWVtX3JlZ2lzdGVyKCZjb25maWcp
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9jb3JlLmMgYi9kcml2ZXJzL252bWVtL2NvcmUu
YwppbmRleCAyNzEwOTQzZjUzYzQuLmJmNDJiN2U4MjZkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
dm1lbS9jb3JlLmMKKysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKQEAgLTkzNSw3ICs5MzUsNyBA
QCBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbV9yZWdpc3Rlcihjb25zdCBzdHJ1Y3QgbnZtZW1f
Y29uZmlnICpjb25maWcpCiAJbnZtZW0tPm5rZWVwb3V0ID0gY29uZmlnLT5ua2VlcG91dDsKIAlp
ZiAoY29uZmlnLT5vZl9ub2RlKQogCQludm1lbS0+ZGV2Lm9mX25vZGUgPSBjb25maWctPm9mX25v
ZGU7Ci0JZWxzZSBpZiAoIWNvbmZpZy0+bm9fb2Zfbm9kZSkKKwllbHNlCiAJCW52bWVtLT5kZXYu
b2Zfbm9kZSA9IGNvbmZpZy0+ZGV2LT5vZl9ub2RlOwogCiAJc3dpdGNoIChjb25maWctPmlkKSB7
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmggYi9pbmNsdWRlL2xp
bnV4L252bWVtLXByb3ZpZGVyLmgKaW5kZXggMWI4MWFkZWJkYjhiLi5lMzkzMDgzNTIzNWIgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAorKysgYi9pbmNsdWRlL2xp
bnV4L252bWVtLXByb3ZpZGVyLmgKQEAgLTg5LDcgKzg5LDYgQEAgc3RydWN0IG52bWVtX2NlbGxf
aW5mbyB7CiAgKiBAcmVhZF9vbmx5OglEZXZpY2UgaXMgcmVhZC1vbmx5LgogICogQHJvb3Rfb25s
eToJRGV2aWNlIGlzIGFjY2Vzc2libHkgdG8gcm9vdCBvbmx5LgogICogQG9mX25vZGU6CUlmIGdp
dmVuLCB0aGlzIHdpbGwgYmUgdXNlZCBpbnN0ZWFkIG9mIHRoZSBwYXJlbnQncyBvZl9ub2RlLgot
ICogQG5vX29mX25vZGU6CURldmljZSBzaG91bGQgbm90IHVzZSB0aGUgcGFyZW50J3Mgb2Zfbm9k
ZSBldmVuIGlmIGl0J3MgIU5VTEwuCiAgKiBAcmVnX3JlYWQ6CUNhbGxiYWNrIHRvIHJlYWQgZGF0
YS4KICAqIEByZWdfd3JpdGU6CUNhbGxiYWNrIHRvIHdyaXRlIGRhdGEuCiAgKiBAc2l6ZToJRGV2
aWNlIHNpemUuCkBAIC0xMjIsNyArMTIxLDYgQEAgc3RydWN0IG52bWVtX2NvbmZpZyB7CiAJYm9v
bAkJCWlnbm9yZV93cDsKIAlzdHJ1Y3QgbnZtZW1fbGF5b3V0CSpsYXlvdXQ7CiAJc3RydWN0IGRl
dmljZV9ub2RlCSpvZl9ub2RlOwotCWJvb2wJCQlub19vZl9ub2RlOwogCW52bWVtX3JlZ19yZWFk
X3QJcmVnX3JlYWQ7CiAJbnZtZW1fcmVnX3dyaXRlX3QJcmVnX3dyaXRlOwogCWludAlzaXplOwot
LSAKMi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
