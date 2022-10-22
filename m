Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AEFC04A95
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 21:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=374hRwSmZkevQ4AI0K6sO5+2PGRce7OZqN6zJqlIYPU=; b=b94xzeFcdojMsw
	hD3E5H3JFg4X/jERkL691Sj09DSQGsvUeckBWGljPObNQ2H61dF48Vt8fY8FzZhzDuaFYWt6Nh9I3
	N451qOqb5kwEJxeFFkm/CLN0oLObwbG06DKvMrZZ6IQh6BGP8Y6TFG2YuEcTu3xORHcHPy/YHUY01
	8CSOQTpcj/jcg90tftHBTiw9JBMXPGA6tKYCXDkl9S32mICbdeuRtRJ7BZBakP77/BHD+txdGOvuO
	ZVl1tetLyN6c1YNRkQNKAHLfkLkS209V/Z3/q1rgh9uj5X1Qe60q0dNEQkyGX1bF40Uj2kWzKyCMK
	2BwV6kzZU766qBb7Df5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omLoA-00DpBI-7a; Sat, 22 Oct 2022 21:13:30 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omLo7-00DpA9-4A
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 21:13:28 +0000
Received: by mail-ed1-x52a.google.com with SMTP id a5so5048373edb.11
        for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2022 14:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5hHs2S/RQl/JXIwHudGm/5mav5RsuOJ5skKbHJaT7M=;
        b=NmBEE6eFFqAk065UYolm1o7PT0D3spxPjIpTB1GN4doSOzS/VyF0MqEGtviFaTzcZc
         kkyskhusTgRHUEXA+SUJWNZZZMtBpySOqUoLqvRB5ZBLRjhEc9KjhLe9c5jK8ry4uTV2
         Nk789OK4t4+qNfxNc4QY99Syb9ofJ5Ow89nccso5G+zA4tp0VGicKZTAp9x+JY0nIJAz
         F+e7O3kIGx94sm6tXjxLuCdaD+lqhx63E8T/5sM8hYbr3w3szKdM8Thn11CAbYOPpln1
         t8lbqWF+RU+6NYlfHw/1fmuOYBoXOLkZUGM3TezeU14AoBjoAJHSGDkc9AdSC9EA9b48
         y46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5hHs2S/RQl/JXIwHudGm/5mav5RsuOJ5skKbHJaT7M=;
        b=8NDmEmY7D7r6zfKFjyIb1gcU/2imYnCmkUBpPWjZPFh1BqN1SQC8wJFe3jaXlktbeg
         4SZL7rNNexfUf6N0ZQP6ozii2wCLBn3pVyF7niZAOwCVGoEAgcBw6GomL3emSnmAu8qx
         kkKVMISyA4jd9BDgMtEGtDUbAALeVQ/dmmqMTwGpM63K4WlN4v3th5A40quKbhLrDbPW
         5eV2ultKpW7nuMIPQskd6UvGN3KM9np7VQYLim7CZefLvB0VTLwnliSzqm9mTVqGA4Hq
         AS1dea+gWBScMiEGr3x/yARWZmLYwK3AcsdEzqzdbRIdzSfBQN/aK+MXr/s5kvOUg43c
         gNcQ==
X-Gm-Message-State: ACrzQf0sS/YU8N5ZLDrMhjmSDxXHZbJkwxdKNWBKVIamUpkdEnu87Gvq
	WAYGwyWa51YGdQrJSVkSsZo=
X-Google-Smtp-Source: AMsMyM4qRAuTX9xAg5+SVeocMaPvY8/QocSpU2ifwAaPqw2Fu6Q4Lo5wOHKB6Sq6ABNXP+Eq+DcSMg==
X-Received: by 2002:a17:907:3f23:b0:78e:260a:fc33 with SMTP id hq35-20020a1709073f2300b0078e260afc33mr21579377ejc.152.1666473203739;
        Sat, 22 Oct 2022 14:13:23 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id la5-20020a170907780500b0077f20a722dfsm13382584ejc.165.2022.10.22.14.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 14:13:23 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 1/2] dt-bindings: mtd: partitions: support marking rootfs partition
Date: Sat, 22 Oct 2022 23:13:17 +0200
Message-Id: <20221022211318.32009-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_141327_232382_2C5A7959 
X-CRM114-Status: GOOD (  12.64  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTGludXggbmVlZHMgdG8g
a25vdyB3aGF0IHRvIHVzZSBhcyByb290IGRldmljZS4gT24gZW1iZWRkZWQgZGV2aWNlcyB3aXRo
CmZsYXNoIHRoZSBvbmx5IGNvbW1vbiB3YXkgdG8gc3BlY2lmeSB0aGF0IGlzIGNtZGxpbmUgJiBy
b290PSBwYXJhbWV0ZXIuCgpUaGF0IHNvbHV0aW9uIHdvcmtzIHdpdGggVS1Cb290IHdoaWNoIGlz
IExpbnV4ICYgY21kbGluZSBhd2FyZSBidXQgaXNuJ3QKYXZhaWxhYmxlIHdpdGggYWxsIG1hcmtl
dCBib290bG9hZGVycy4gQWxzbyB0aGF0IG1ldGhvZCBpcyBmcmFnaWxlOgoxLiBSZXF1aXJlcyBz
cGVjaWZpYyBwcm9iaW5nIG9yZGVyIG9uIG11bHRpLWZsYXNoIGRldmljZXMKMi4gVXNlcyBoYXJk
Y29kZWQgcGFydGl0aW9ucyBpbmRleGVzCgpBIGxvdCBvZiBkZXZpY2VzIHVzZSBkaWZmZXJlbnQg
cGFydGl0aW9uaW5nIG1ldGhvZHMuIEl0IG1heSBiZQoiZml4ZWQtcGFydGl0aW9ucyIgb3Igc29t
ZSBkeW5hbWljIHBhcnRpdGlvbmluZyAoZS5nLiBiYXNlZCBvbiBwYXJ0cwp0YWJsZSkuIEZvciBz
dWNoIGNhc2VzIGFsbG93ICJsaW51eCxyb290ZnMiIHByb3BlcnR5IHRvIG1hcmsgY29ycmVjdApm
bGFzaCBwYXJ0aXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+Ci0tLQpWMjogVXNlICJsaW51eCxyb290ZnMiIGFzIG1vcmUgYWNjdXJhdGUuIFRo
YW5rcyBSb2IuCi0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4
ZWQtcGFydGl0aW9ucy55YW1sICB8IDEgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgICAgICB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMu
eWFtbAppbmRleCBhZDNjY2QyNTA4MDIuLmQ2NmE2ZTNiY2I1NiAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlv
bnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sCkBAIC04NCw2ICs4NCw3IEBAIGV4YW1wbGVzOgog
ICAgICAgICBwYXJ0aXRpb25AMCB7CiAgICAgICAgICAgICBsYWJlbCA9ICJmaWxlc3lzdGVtIjsK
ICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MSAweDAwMDAwMDAwPjsKKyAgICAgICAg
ICAgIGxpbnV4LHJvb3RmczsKICAgICAgICAgfTsKICAgICB9OwogCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFy
dGl0aW9uLnlhbWwKaW5kZXggZjFhMDJkODQwYjEyLi5hMjVjZDIzYTM0YzAgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRp
b24ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvcGFydGl0aW9uLnlhbWwKQEAgLTUyLDYgKzUyLDEwIEBAIHByb3BlcnRpZXM6CiAgICAg
ICBpbW11bmUgdG8gcGFpcmVkLXBhZ2VzIGNvcnJ1cHRpb25zCiAgICAgdHlwZTogYm9vbGVhbgog
CisgIGxpbnV4LHJvb3RmczoKKyAgICBkZXNjcmlwdGlvbjogTWFya3MgcGFydGl0aW9uIHRoYXQg
Y29udGFpbnMgcm9vdCBmaWxlc3lzdGVtIHRvIG1vdW50IGFuZCBib290CisgICAgICB1c2VyIHNw
YWNlIGZyb20KKwogaWY6CiAgIG5vdDoKICAgICByZXF1aXJlZDogWyByZWcgXQotLSAKMi4zNC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
