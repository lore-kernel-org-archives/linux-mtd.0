Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184B9C761A6
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 09:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2jR6Agg6He+uS/fKoi7bOhUzEumBl78Mh0uK12zji8Q=; b=sFA+4UQryCp08K
	lDwMlNGkVvbz03627O00wJGlkE3Lxu32XB2/pwQh3RlFaHyN4DIbCVSzylHOou1vkSq55TYxQd1hK
	ejntad1HS4oWdq8MjMRjCx2pLZ5neZZ5XICsaKVhrTusF6ZQQnpg3pRfYSCKjK0IBNuBcUNzzdWHS
	tbXHZztTLMctMHBS23dstLtwtQ58dPwymTgXxggFfRvReicNCnZLt20k9ZLlb2FNvau73lNYD8LJD
	v/CaH0304FrEHZ9bQzlcwji7762td8vKcbBRkm2U2LUk4r7t9MYVab9t0DeoTV6a0WE2Cpw2DdeBN
	0EivD1WbHp/+PNNdVR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phoeF-003IKv-1w;
	Thu, 30 Mar 2023 09:32:47 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phoeB-003II9-2v
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 09:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680168764;
  x=1711704764;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=ARulaqHJxPwB/WKU7rfcwJ3+y3Mu0UnpMwYgGZ/ZzmM=;
  b=VCykYmGk8cvOdgaK9k+4EFkyrPRVrDKqq1nG6U1DbHEA4WhLCqwlp3wx
   jeEE2tvbP6m4H7uzMA/kdjoy0YRjyu3uFLM9DDcZB+5GEgGl6FnroO+Xp
   4/lkv6KbRzQkMbM2glOWtHo2KAHL6vsHqMu75L322VVcjTTruA6z4fK6R
   Pea2aNpkYD/gQ473io37yc6sTrm5pOE46m/IN467+8styYuwRAccXWEAB
   XQrcLjfKTHl3dcCx0tn4F1s5YS9lXzRWCVXz845Yf4l5y0zO9dk02IMcR
   KPWu2QBSFY8/OZCD3KHDFKEPfOV1C+POGs7pH5CpqPVJ04OQrAPNlrkuk
   w==;
From: =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
Date: Thu, 30 Mar 2023 11:32:14 +0200
Subject: [PATCH v2] ubifs: Free memory for tmpfile name
MIME-Version: 1.0
Message-ID: <20230329-memleak-fix-v2-1-cb8d9394300b@axis.com>
X-B4-Tracking: v=1; b=H4sIAB1XJWQC/22Nyw6CQAxFf4V0bQ0zozxc+R+GRYEijQ6YKSEYw
 r87sHZ57iNnBeUgrHBLVgg8i8o4RLCnBJqehiejtJHBptalzpbo2b+ZXtjJgkVOqWmpu2QlQ3z
 UpIx1oKHp948nnTjsxSdw3B+aRxW5F53G8D2ss9nT/4LZoMHcONfSNWMqujstoudm9FBt2/YDO
 U6Ms74AAAA=
To: Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680168758; l=1585;
 i=marten.lindahl@axis.com; s=20230329; h=from:subject:message-id;
 bh=DvHc9WiK+hCXxAJFzO5SlY8uEWNpRF0ZPAgyp0dhgpQ=;
 b=+VxG8dBorTmhj1CUJGkeCxLyzvmUn+kHjSxEOH4y6tqHD/w29wuRZ3n5bTPTEvZR/XLLGNmCU
 e4XJ5VCW9Y4DDcaapawU1ESDAnzvAz+1R4Nfbf5X56egcCPv//z2JCX
X-Developer-Key: i=marten.lindahl@axis.com; a=ed25519;
 pk=JfbjqFPJnIDIQOkJBeatC8+S3Ax3N0RIdmN+fL3wXgw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_023244_264283_90508040 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

V2hlbiBvcGVuaW5nIGEgdWJpZnMgdG1wZmlsZSBvbiBhbiBlbmNyeXB0ZWQgZGlyZWN0b3J5LCBm
dW5jdGlvbgpmc2NyeXB0X3NldHVwX2ZpbGVuYW1lIGFsbG9jYXRlcyBtZW1vcnkgZm9yIHRoZSBu
YW1lIHRoYXQgaXMgdG8gYmUKc3RvcmVkIGluIHRoZSBkaXJlY3RvcnkgZW50cnksIGJ1dCBhZnRl
ciB0aGUgbmFtZSBoYXMgYmVlbiBjb3BpZWQgdG8gdGhlCmRpcmVjdG9yeSBlbnRyeSBpbm9kZSwg
dGhlIG1lbW9yeSBpcyBub3QgZnJlZWQuCgpXaGVuIHJ1bm5pbmcga21lbWxlYWsgb24gaXQgd2Ug
c2VlIHRoYXQgaXQgaXMgcmVnaXN0ZXJlZCBhcyBhIGxlYWsuIFRoZQpyZXBvcnQgYmVsb3cgaXMg
dHJpZ2dlcmVkIGJ5IGEgc2ltcGxlIHByb2dyYW0gJ3RtcGZpbGUnIGp1c3Qgb3BlbmluZyBhCnRt
cGZpbGU6CgogIHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTAxNzhmMzgwIChzaXplIDMy
KToKICAgIGNvbW0gInRtcGZpbGUiLCBwaWQgNTA5LCBqaWZmaWVzIDQyOTQ5MzQ3NDQgKGFnZSAx
NTI0Ljc0MnMpCiAgICBiYWNrdHJhY2U6CiAgICAgIF9fa21lbV9jYWNoZV9hbGxvY19ub2RlCiAg
ICAgIF9fa21hbGxvYwogICAgICBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lCiAgICAgIHViaWZzX3Rt
cGZpbGUKICAgICAgdmZzX3RtcGZpbGUKICAgICAgcGF0aF9vcGVuYXQKCkZyZWUgdGhpcyBtZW1v
cnkgYWZ0ZXIgaXQgaGFzIGJlZW4gY29waWVkIHRvIHRoZSBpbm9kZS4KClNpZ25lZC1vZmYtYnk6
IE3DpXJ0ZW4gTGluZGFobCA8bWFydGVuLmxpbmRhaGxAYXhpcy5jb20+Ci0tLQpDaGFuZ2VzIGlu
IHYyOgotIENhbGwgZnNjcnlwdF9mcmVlX2ZpbGVuYW1lIGFmdGVyIHViaWZzX3JlbGVhc2VfYnVk
Z2V0Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMDMyOS1tZW1s
ZWFrLWZpeC12MS0xLTcxMzNkYTU2ZWE4ZkBheGlzLmNvbQotLS0KIGZzL3ViaWZzL2Rpci5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9mcy91Ymlm
cy9kaXIuYyBiL2ZzL3ViaWZzL2Rpci5jCmluZGV4IDBmMjljZjIwMTEzNi4uN2RkNmRkMzRiODRj
IDEwMDY0NAotLS0gYS9mcy91Ymlmcy9kaXIuYworKysgYi9mcy91Ymlmcy9kaXIuYwpAQCAtNDky
LDYgKzQ5Miw3IEBAIHN0YXRpYyBpbnQgdWJpZnNfdG1wZmlsZShzdHJ1Y3QgdXNlcl9uYW1lc3Bh
Y2UgKm1udF91c2VybnMsIHN0cnVjdCBpbm9kZSAqZGlyLAogCXVubG9ja18yX2lub2RlcyhkaXIs
IGlub2RlKTsKIAogCXViaWZzX3JlbGVhc2VfYnVkZ2V0KGMsICZyZXEpOworCWZzY3J5cHRfZnJl
ZV9maWxlbmFtZSgmbm0pOwogCiAJcmV0dXJuIGZpbmlzaF9vcGVuX3NpbXBsZShmaWxlLCAwKTsK
IAoKLS0tCmJhc2UtY29tbWl0OiBjOWMzMzk1ZDVlM2RjYzZkYWVlNjZjNjkwODM1NGQ0N2JmOThj
YjBjCmNoYW5nZS1pZDogMjAyMzAzMjktbWVtbGVhay1maXgtODdhMDFkYWY0NjllCgpCZXN0IHJl
Z2FyZHMsCi0tIApNw6VydGVuIExpbmRhaGwgPG1hcnRlbi5saW5kYWhsQGF4aXMuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
