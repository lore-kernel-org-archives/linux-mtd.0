Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A3EC6FD1D
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VaBaot6IANRsRyeucLE477k9+9ZIjZ4nzYTh4du3Ulc=; b=WRFwAH95ALn3KH
	spflbKKwRsgJm3OHYudbri1HxugnWLwv9lcSywNqH94g4TmAnK7RaetEL1SOEUT6Qn8gUK5fqPKBo
	qSPz+fHTGgpy/D6Sni1skCQwB8Q108+EFI5rgqqy5XG8S5jvNDJ8RnrVmA8z/u3Kv7lee3jN43J2o
	3HwXHiNlhv8TJpANvbw8uID/SJxqdNRHYEsYW7uQ/XoGMFw55EcrmgJZ79ykex6niaFaerNxYCA/l
	E9XFRM+/vz8JGhJgpinZldbD/q6VjkZURyz6YwMOlCglfR99oZ8fCv9G7NpbLIqTehz+mrwsJuCwP
	T5XIr6CGqrpQ34N7kSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phswl-003yGo-1g;
	Thu, 30 Mar 2023 14:08:11 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phswh-003yE2-2x
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 14:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680185288;
  x=1711721288;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=SDhALq5sqn8JFnI5dxt8aiWfo1+gUXMcuGRIDtBs4P4=;
  b=SBgE9rxLzFVrZZ/K3CbppzX/RJ94H6/XqgmMcaQaCyZQJFCWcX5M0bq/
   dVHGWkWua1Nz6fhegltb67ZqmDDB2EJLb4Lb8smGjM6KsOAQBRtZsKaVE
   ppIclTEMMQIi/bUiAIZqmVX4Ow7RdoiA+8P+iTCHeE1hyhjRklsgTPJsQ
   s46ghwkW7BXI2CNnFIYOBB/Zzpj+Rz7Nhl/PIWbZtFJcq6IeWYG7BWzMm
   HXkxawT2TC4E5jDoug4Nrcjs+UMl2gHby/QbHnXzw6fSgzHPoF7xXIyux
   C3IP/wuQhi+eACKZj8W0xlBHK+76sfgOlRgdnjYE7YzORW3MQeaoupubb
   w==;
From: =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
Date: Thu, 30 Mar 2023 16:07:53 +0200
Subject: [PATCH] ubifs: Fix memory leak in do_rename
MIME-Version: 1.0
Message-ID: <20230330-memleak_rename-fix-v1-1-99789e908fdf@axis.com>
X-B4-Tracking: v=1; b=H4sIALiXJWQC/x2NUQrCQAxEr1LybWDtqlCvIiJpndqgu0oiIpTe3
 dSfgcfMY2ZymMLp2Mxk+KjrswZsNw0Nk9QbWK/B1KY2p5wTF5QH5H4xVCngUb98GLudRHR5nyj
 EXhzcm9RhWtUi/oatxcsQ+//b6bwsP3vMayV9AAAA
To: Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, <kernel@axis.com>,
	=?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680185276; l=2241;
 i=marten.lindahl@axis.com; s=20230329; h=from:subject:message-id;
 bh=g5Ezw3BIW1qMna/ZzA/RPpn1WuFGRca/jEji/cb2cqI=;
 b=WCzt4Sw1mS2Gl47E7zLF5LpSr1wrbn6+7tEXL/6u2aDOZpV64OMUohefncYOsLMU2sE9WZQdX
 q0ymzNszV3pDh0wqp8Rabz5jssxJ1xfhGx5HpigjfACDePmvIlSYeJV
X-Developer-Key: i=marten.lindahl@axis.com; a=ed25519;
 pk=JfbjqFPJnIDIQOkJBeatC8+S3Ax3N0RIdmN+fL3wXgw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_070808_294384_999E399A 
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

SWYgcmVuYW1pbmcgYSBmaWxlIGluIGFuIGVuY3J5cHRlZCBkaXJlY3RvcnksIGZ1bmN0aW9uCmZz
Y3J5cHRfc2V0dXBfZmlsZW5hbWUgYWxsb2NhdGVzIG1lbW9yeSBmb3IgYSBmaWxlIG5hbWUuIFRo
aXMgbmFtZSBpcwpuZXZlciB1c2VkLCBhbmQgYmVmb3JlIHJldHVybmluZyB0byB0aGUgY2FsbGVy
IHRoZSBtZW1vcnkgZm9yIGl0IGlzIG5vdApmcmVlZC4KCldoZW4gcnVubmluZyBrbWVtbGVhayBv
biBpdCB3ZSBzZWUgdGhhdCBpdCBpcyByZWdpc3RlcmVkIGFzIGEgbGVhay4gVGhlCnJlcG9ydCBi
ZWxvdyBpcyB0cmlnZ2VyZWQgYnkgYSBzaW1wbGUgcHJvZ3JhbSAncmVuYW1lJyB0aGF0IHJlbmFt
ZXMgYQpmaWxlIGluIGFuIGVuY3J5cHRlZCBkaXJlY3Rvcnk6CgogIHVucmVmZXJlbmNlZCBvYmpl
Y3QgMHhmZmZmODg4MTAxNTAyODQwIChzaXplIDMyKToKICAgIGNvbW0gInJlbmFtZSIsIHBpZCA5
NDA0LCBqaWZmaWVzIDQzMDI1ODI0NzUgKGFnZSA0MzUuNzM1cykKICAgIGJhY2t0cmFjZToKICAg
ICAgX19rbWVtX2NhY2hlX2FsbG9jX25vZGUKICAgICAgX19rbWFsbG9jCiAgICAgIGZzY3J5cHRf
c2V0dXBfZmlsZW5hbWUKICAgICAgZG9fcmVuYW1lCiAgICAgIHViaWZzX3JlbmFtZQogICAgICB2
ZnNfcmVuYW1lCiAgICAgIGRvX3JlbmFtZWF0MgoKVG8gZml4IHRoaXMgd2UgY2FuIHJlbW92ZSB0
aGUgY2FsbCB0byBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lIGFzIGl0J3Mgbm90Cm5lZWRlZC4KClJl
cG9ydGVkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgpTaWduZWQt
b2ZmLWJ5OiBNw6VydGVuIExpbmRhaGwgPG1hcnRlbi5saW5kYWhsQGF4aXMuY29tPgotLS0KIGZz
L3ViaWZzL2Rpci5jIHwgNiAtLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2Rpci5jIGIvZnMvdWJpZnMvZGlyLmMKaW5kZXggMGYyOWNm
MjAxMTM2Li40YzJkZGExMzQ2ZTcgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL2Rpci5jCisrKyBiL2Zz
L3ViaWZzL2Rpci5jCkBAIC0zNTgsNyArMzU4LDYgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqY3Jl
YXRlX3doaXRlb3V0KHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCiAJ
dW1vZGVfdCBtb2RlID0gU19JRkNIUiB8IFdISVRFT1VUX01PREU7CiAJc3RydWN0IGlub2RlICpp
bm9kZTsKIAlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGRpci0+aV9zYi0+c19mc19pbmZvOwotCXN0
cnVjdCBmc2NyeXB0X25hbWUgbm07CiAKIAkvKgogCSAqIENyZWF0ZSBhbiBpbm9kZSgnbmxpbmsg
PSAxJykgZm9yIHdoaXRlb3V0IHdpdGhvdXQgdXBkYXRpbmcgam91cm5hbCwKQEAgLTM2OSwxMCAr
MzY4LDYgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqY3JlYXRlX3doaXRlb3V0KHN0cnVjdCBpbm9k
ZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCiAJZGJnX2dlbigiZGVudCAnJXBkJywgbW9k
ZSAlI2h4IGluIGRpciBpbm8gJWx1IiwKIAkJZGVudHJ5LCBtb2RlLCBkaXItPmlfaW5vKTsKIAot
CWVyciA9IGZzY3J5cHRfc2V0dXBfZmlsZW5hbWUoZGlyLCAmZGVudHJ5LT5kX25hbWUsIDAsICZu
bSk7Ci0JaWYgKGVycikKLQkJcmV0dXJuIEVSUl9QVFIoZXJyKTsKLQogCWlub2RlID0gdWJpZnNf
bmV3X2lub2RlKGMsIGRpciwgbW9kZSwgZmFsc2UpOwogCWlmIChJU19FUlIoaW5vZGUpKSB7CiAJ
CWVyciA9IFBUUl9FUlIoaW5vZGUpOwpAQCAtMzk1LDcgKzM5MCw2IEBAIHN0YXRpYyBzdHJ1Y3Qg
aW5vZGUgKmNyZWF0ZV93aGl0ZW91dChzdHJ1Y3QgaW5vZGUgKmRpciwgc3RydWN0IGRlbnRyeSAq
ZGVudHJ5KQogCW1ha2VfYmFkX2lub2RlKGlub2RlKTsKIAlpcHV0KGlub2RlKTsKIG91dF9mcmVl
OgotCWZzY3J5cHRfZnJlZV9maWxlbmFtZSgmbm0pOwogCXViaWZzX2VycihjLCAiY2Fubm90IGNy
ZWF0ZSB3aGl0ZW91dCBmaWxlLCBlcnJvciAlZCIsIGVycik7CiAJcmV0dXJuIEVSUl9QVFIoZXJy
KTsKIH0KCi0tLQpiYXNlLWNvbW1pdDogYzljMzM5NWQ1ZTNkY2M2ZGFlZTY2YzY5MDgzNTRkNDdi
Zjk4Y2IwYwpjaGFuZ2UtaWQ6IDIwMjMwMzMwLW1lbWxlYWtfcmVuYW1lLWZpeC02Zjk0YTZmOTkz
NTAKCkJlc3QgcmVnYXJkcywKLS0gCk3DpXJ0ZW4gTGluZGFobCA8bWFydGVuLmxpbmRhaGxAYXhp
cy5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
