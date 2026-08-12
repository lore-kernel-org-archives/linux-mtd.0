Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659F9C5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 01:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BUR32KnxXAxCef6/0KX0cUN5NI6WoZKokKGp0526NNs=; b=pJ9kFJDiVE77lm
	8+8Bs++99VG8nu1x9I0+iTLKnquJpwpd5htzVHW/l+g3DNQR/lQnOxx7EhDgCs6nZk6tJlp2TGHjm
	J+A7p7dfOD8y58gEi6B58u3FhooDWYIORJWbtw2tNuMwTCjPIhTYmFnn25SmPEL99GX683uJc63QX
	h+h+pjaq2oCRB2mpOIh8/AnkCsUoiV4/7Jy1gUdzgVHkBrS4Gsw2fJ560VhgF8uVFc3qmu5eBjP18
	ll4ENJFh2MV/lMnAl3Xs4CWirLymbk45f7xmp44LUxfO8caYL1+7U6bF3TZzAaEiy0kgbn/1PUdsD
	WwueegxVa9yCfOm1V5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wty9M-0000000FDxq-3C4v;
	Wed, 12 Aug 2026 01:53:00 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wty9J-0000000FDxC-3igP
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 01:52:59 +0000
X-UUID: 83d00f5095f011f1aa26b74ffac11d73-20260812
X-CID-CACHE: Type:Local,Time:202608120941+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:29fd8a83-22f9-4b16-9869-f0f4ec69909e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:2a74e15aecf54d0328745e282302cfcd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 83d00f5095f011f1aa26b74ffac11d73-20260812
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 406332067; Wed, 12 Aug 2026 09:52:46 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com,
	=?UTF-8?q?J=C3=B6rn=20Engel?= <joern@barelysecure.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: block2mtd: Fix divide error when erase_size is zero
Date: Wed, 12 Aug 2026 09:52:42 +0800
Message-Id: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_185258_240393_63C2B3B9 
X-CRM114-Status: GOOD (  10.54  )
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

VGhlIGVyYXNlIHNpemUgaXMgcGFyc2VkIGZyb20gdGhlICJibG9jazJtdGQiIG1vZHVsZSBwYXJh
bWV0ZXIgYW5kIGNhbgpiZSBzZXQgdG8gemVyby4gYWRkX2RldmljZSgpIHRoZW4gZXZhbHVhdGVz
CgogICAgICAgIGlmIChzaXplICUgZXJhc2Vfc2l6ZSkKCndpdGggYSB6ZXJvIGRpdmlzb3IsIHdo
aWNoIHRyaWdnZXJzIGEgZGl2aWRlIGVycm9yOgoKICAgICAgICBkaXZpZGUgZXJyb3I6IDAwMDAg
WyMxXSBQUkVFTVBUIFNNUCBQVEkKICAgICAgICBSSVA6IDAwMTA6YWRkX2RldmljZSBkcml2ZXJz
L210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jOjI5NiBbaW5saW5lXQogICAgICAgIFJJUDogMDAxMDpi
bG9jazJtdGRfc2V0dXAyKzB4NTkyLzB4ZGEwIGRyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRk
LmM6NDU5CiAgICAgICAgQ2FsbCBUcmFjZToKICAgICAgICAgYmxvY2sybXRkX3NldHVwKzB4Mjcv
MHhlMCBkcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jOjQ3NgogICAgICAgICBwYXJhbV9h
dHRyX3N0b3JlKzB4MjE0LzB4MzEwIGtlcm5lbC9wYXJhbXMuYzo1ODkKICAgICAgICAgbW9kdWxl
X2F0dHJfc3RvcmUrMHg2NS8weDkwIGtlcm5lbC9wYXJhbXMuYzo5MDQKICAgICAgICAga2VybmZz
X2ZvcF93cml0ZV9pdGVyKzB4M2E0LzB4NTQwIGZzL2tlcm5mcy9maWxlLmM6MzQ1CiAgICAgICAg
IC4uLgoKUmVqZWN0IGEgemVybyBlcmFzZSBzaXplIGJlZm9yZSBwZXJmb3JtaW5nIHRoZSBtb2R1
bG8gb3BlcmF0aW9uIHNvIHRoZQpleGlzdGluZyAiZXJhc2VzaXplIG11c3QgYmUgYSBkaXZpc29y
IG9mIGRldmljZSBzaXplIiBlcnJvciBwYXRoCnJlcG9ydHMgdGhlIGludmFsaWQgYXJndW1lbnQg
YW5kIGZyZWVzIHRoZSBkZXZpY2UuCgpXaGlsZSBhdCBpdCwgZHJvcCB0aGUgdW5uZWNlc3Nhcnkg
KGxvbmcpIGNhc3QgZnJvbSB0aGUgc2l6ZSBvcGVyYW5kIG9mCnRoZSBtb2R1bG8uCgpGaXhlczog
ZWE2ZDgzM2EzZmRkICgibXRkOiBibG9jazJtdGQ6IGNoZWNrIGRldmljZSBzaXplIikKUmVwb3J0
ZWQtYnk6IHN5emJvdCtiMzIwYTRkNWY2NWE2MWRiYmY4OUBzeXprYWxsZXIuYXBwc3BvdG1haWwu
Y29tCkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82YTdiNThiYS5hYzM2MWMw
OS4yMmZmMGEuMDA0NS5HQUVAZ29vZ2xlLmNvbS8KU3VnZ2VzdGVkLWJ5OiBKw7ZybiBFbmdlbCA8
am9lcm5AYmFyZWx5c2VjdXJlLm9yZz4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVk
LW9mZi1ieTogUGVpIFhpYW8gPHhpYW9wZWkwMUBreWxpbm9zLmNuPgotLS0KY2hhbmdsb2dzIGlu
IHYyOgoxLkFkZCBTdWdnZXN0ZWQtYnkgdGFnCjIucmVtb3ZlIHVubmVjZXNzYXJ5IChsb25nKSBj
YXN0IGZyb20gdGhlIHNpemUKLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYyBiL2RyaXZlcnMvbXRkL2Rl
dmljZXMvYmxvY2sybXRkLmMKaW5kZXggMDNlODBiMmM0ZjVhLi4zZTIzNjdkZmZmODggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmMKKysrIGIvZHJpdmVycy9tdGQv
ZGV2aWNlcy9ibG9jazJtdGQuYwpAQCAtMjkzLDcgKzI5Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgYmxv
Y2sybXRkX2RldiAqYWRkX2RldmljZShjaGFyICpkZXZuYW1lLCBpbnQgZXJhc2Vfc2l6ZSwKIAl9
CiAKIAlzaXplID0gYmRldl9ucl9ieXRlcyhiZGV2KTsKLQlpZiAoKGxvbmcpc2l6ZSAlIGVyYXNl
X3NpemUpIHsKKwlpZiAoIWVyYXNlX3NpemUgfHwgc2l6ZSAlIGVyYXNlX3NpemUpIHsKIAkJcHJf
ZXJyKCJlcmFzZXNpemUgbXVzdCBiZSBhIGRpdmlzb3Igb2YgZGV2aWNlIHNpemVcbiIpOwogCQln
b3RvIGVycl9mcmVlX2Jsb2NrMm10ZDsKIAl9Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
