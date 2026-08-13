Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4562C5AD5A
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 02:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sC85UxQIGO7RpMi2EAPqLTeExaji3IS7y1k8aH+M/Ck=; b=dmEAGFFl2vPvsr
	yQsf6bvdsHH1NkB2nyFFhrEikX7rjf7PQsDiOCG4WYrmG2Rvw19lTTEEBJfUYq9S9IYVmQE4EnLlf
	CJBIIy7fYLOfAOw2ZPhEBI+YF8t78JIwneb4TDwScDdxCgjPTgAe3Kqs+l7/tfHQMOIhLwTmNgzr3
	n8/75W1QTQHdq8FCEd2XOhsUbCLfZov5sbo0pj4QOl9IuvaUqs/0d24+w0hGB5yvHELMyPPJQAObW
	OiI6RaT4uP68AkJ5WrSM6TyKRPfbHcoFiHP601Dt+9v7SMPo+GEy5amP7JsSpWTBhNqYkj5+jD+XE
	1ltFQZSryOR9/bR/kj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLUW-0000000HIEX-3t8G;
	Thu, 13 Aug 2026 02:48:24 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLUU-0000000HIE8-1qu7
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 02:48:24 +0000
X-UUID: 6f0a086a96c111f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3ee9cb89-8f7e-4e34-8529-8b33a01c0c99,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:fca12f24adbe9056790d6ab9c1a22647,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6f0a086a96c111f1aa26b74ffac11d73-20260813
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1912808178; Thu, 13 Aug 2026 10:48:16 +0800
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
Subject: [PATCH v3] mtd: block2mtd: Fix divide error when erase_size is zero
Date: Thu, 13 Aug 2026 10:48:12 +0800
Message-Id: <25ec7ba58facdf29b42ca43dcf11cd98e2089a5f.1786589041.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_194822_774918_070D4BED 
X-CRM114-Status: GOOD (  10.53  )
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
aWNoIHRyaWdnZXJzIGEgZGl2aWRlIGVycm9yOgoKZGl2aWRlIGVycm9yOiAwMDAwIFsjMV0gUFJF
RU1QVCBTTVAgUFRJClJJUDogMDAxMDphZGRfZGV2aWNlIGRyaXZlcnMvbXRkL2RldmljZXMvYmxv
Y2sybXRkLmM6Mjk2IFtpbmxpbmVdClJJUDogMDAxMDpibG9jazJtdGRfc2V0dXAyKzB4NTkyLzB4
ZGEwIGRyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmM6NDU5CkNhbGwgVHJhY2U6CmJsb2Nr
Mm10ZF9zZXR1cCsweDI3LzB4ZTAgZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYzo0NzYK
cGFyYW1fYXR0cl9zdG9yZSsweDIxNC8weDMxMCBrZXJuZWwvcGFyYW1zLmM6NTg5Cm1vZHVsZV9h
dHRyX3N0b3JlKzB4NjUvMHg5MCBrZXJuZWwvcGFyYW1zLmM6OTA0Cmtlcm5mc19mb3Bfd3JpdGVf
aXRlcisweDNhNC8weDU0MCBmcy9rZXJuZnMvZmlsZS5jOjM0NQouLi4KClJlamVjdCBhIHplcm8g
ZXJhc2Ugc2l6ZSBiZWZvcmUgcGVyZm9ybWluZyB0aGUgbW9kdWxvIG9wZXJhdGlvbiBzbyB0aGUK
ZXhpc3RpbmcgImVyYXNlc2l6ZSBtdXN0IGJlIGEgZGl2aXNvciBvZiBkZXZpY2Ugc2l6ZSIgZXJy
b3IgcGF0aApyZXBvcnRzIHRoZSBpbnZhbGlkIGFyZ3VtZW50IGFuZCBmcmVlcyB0aGUgZGV2aWNl
LgoKRml4ZXM6IGVhNmQ4MzNhM2ZkZCAoIm10ZDogYmxvY2sybXRkOiBjaGVjayBkZXZpY2Ugc2l6
ZSIpClJlcG9ydGVkLWJ5OiBzeXpib3QrYjMyMGE0ZDVmNjVhNjFkYmJmODlAc3l6a2FsbGVyLmFw
cHNwb3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNmE3YjU4
YmEuYWMzNjFjMDkuMjJmZjBhLjAwNDUuR0FFQGdvb2dsZS5jb20vClN1Z2dlc3RlZC1ieTogSsO2
cm4gRW5nZWwgPGpvZXJuQGJhcmVseXNlY3VyZS5vcmc+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnClNpZ25lZC1vZmYtYnk6IFBlaSBYaWFvIDx4aWFvcGVpMDFAa3lsaW5vcy5jbj4KLS0tCmNo
YW5nZXMgaW4gdjM6CjEucmVtb3ZlIChsb25nKSBjYXN0IGR1ZSB0byBidWlsZCBlcnJvcnMgaW4g
MzJiaXQgY29uZmlnIHN5c3RlbXMKMi5jaGFuZ2VzIGdpdCBsb2cgYWJvdXQgKGxvbmcpIGNhc3QK
CmNoYW5nbG9ncyBpbiB2MjoKMS5BZGQgU3VnZ2VzdGVkLWJ5IHRhZwoyLnJlbW92ZSB1bm5lY2Vz
c2FyeSAobG9uZykgY2FzdCBmcm9tIHRoZSBzaXplCi0tLQogZHJpdmVycy9tdGQvZGV2aWNlcy9i
bG9jazJtdGQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmMgYi9k
cml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCmluZGV4IDAzZTgwYjJjNGY1YS4uMzQ5ZmEw
N2JlMzE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCisrKyBi
L2RyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmMKQEAgLTI5Myw3ICsyOTMsNyBAQCBzdGF0
aWMgc3RydWN0IGJsb2NrMm10ZF9kZXYgKmFkZF9kZXZpY2UoY2hhciAqZGV2bmFtZSwgaW50IGVy
YXNlX3NpemUsCiAJfQogCiAJc2l6ZSA9IGJkZXZfbnJfYnl0ZXMoYmRldik7Ci0JaWYgKChsb25n
KXNpemUgJSBlcmFzZV9zaXplKSB7CisJaWYgKCFlcmFzZV9zaXplIHx8IChsb25nKXNpemUgJSBl
cmFzZV9zaXplKSB7CiAJCXByX2VycigiZXJhc2VzaXplIG11c3QgYmUgYSBkaXZpc29yIG9mIGRl
dmljZSBzaXplXG4iKTsKIAkJZ290byBlcnJfZnJlZV9ibG9jazJtdGQ7CiAJfQotLSAKMi4yNS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
