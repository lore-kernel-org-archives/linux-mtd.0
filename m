Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67C6C761A6
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+FQMd4MCxlf8L5m9AjoIqZY3VnYDaphfIXAKFJawkBk=; b=bqnd7/kA0Au1tL
	9h8MRTwFdKNndktiolOWI1lFQlyg8IQRRYqGNR08ynWpADuN8LPhvRdCUIeDwKXMKDGemoFaz3XIq
	AQrph8pgjr0YCyfTvu6I8jeFQB8FBJw7rby+Zeqemu691YJQxZoy01HrwsPGfVAUGQ3ezcaNorTu6
	P/FBiW1wzxXmX79KfWaaxmO1tHGYmooGiL+TlkXG6MQxPyZ06ajVGV+sfysNltlEeWprqHGkpCARt
	wsu9i7+ANeCuw8ceFCbU7+Wu1TotEDYDCoy8WXFxA5ULL2j8HdWAZlNAbdJXmMMx3fUvUeIYsYQZk
	inzPbuB6rTsomX1yycCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phtSb-0047Iq-0M;
	Thu, 30 Mar 2023 14:41:05 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phtSY-0047Hq-1D
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 14:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680187262;
  x=1711723262;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=im1xHFBiQBfuSGAUiVkeWoF5rTdTuQGdGDQOsjFK6VE=;
  b=GlncwXgQnsQbFGZq3tI/IAXINpUalGwAMz9T1ebGRYzW61t/31TVutU5
   EGCEajwC88YtPWTM3i/plfcV0TdbZL9C8y6eczrIIkYWbdRl5Ixf/rA0G
   k8RgnViR2D95wZyYH0oqjmuaGSOfvd8BWtxKIjz4ewoROdAAQl9I8xndt
   7wPUfeoKmfYGwrxU9SHOUJJIX9eVemnrZiQW5MF2zlvjYIQX+OEiZWC96
   5UsUS2/LE5m6uK0FYEZpRRrl82IvDDYL/4A5wJDiDT5Jej1ujmiozsNgf
   AIPZGFn+pKndPGbNosz0HX2duC4CLBfQPPTgO5I3ekGplnIHXiyB1bw9o
   g==;
From: =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
Date: Thu, 30 Mar 2023 16:40:59 +0200
Subject: [PATCH v2] ubifs: Fix memory leak in do_rename
MIME-Version: 1.0
Message-ID: <20230330-memleak_rename-fix-v2-1-687242e41163@axis.com>
X-B4-Tracking: v=1; b=H4sIAHufJWQC/32NWwqDMBBFtyLz3ZRo+jB+dR9FyqiTGtrEMiNiE
 ffe6AL6c+HcmctZQIg9CVTZAkyTFz/EBMUhg7bH+CTlu8RQ6MJoY7QKFN6ErwdTxEDK+VldnD1
 hCmvOGtKwQSHVMMa236YBZSTeDh+m9L/b7nXi3ss48HeXT/nW/vVMucqVtdfSktWl69wNZy/Hd
 ghQr+v6A9vuNafMAAAA
To: Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, <kernel@axis.com>,
	=?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680187260; l=2535;
 i=marten.lindahl@axis.com; s=20230329; h=from:subject:message-id;
 bh=3mcJAPvJidZPoHyhj7PF7QetETALl5dvWMu5ksFMcR4=;
 b=1QH4dNzVxp3TRA84Ml2WSVq5Mz1/T7nZsqLUNPuClYid7nEfOTs18BxvuT/LFjsF89+h+AmQF
 fnKcJ3om58KC1qLuZeskLbuugUYkXgAioDfe151guJ6JeP4s7aV+ZZ+
X-Developer-Key: i=marten.lindahl@axis.com; a=ed25519;
 pk=JfbjqFPJnIDIQOkJBeatC8+S3Ax3N0RIdmN+fL3wXgw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_074102_730042_2F150751 
X-CRM114-Status: GOOD (  11.01  )
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
aGUgY2FsbCB0byBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lIGFzIGl0J3Mgbm90Cm5lZWRlZC4KCkZp
eGVzOiAyNzhkOWEyNDM2MzVmMjYgKCJ1YmlmczogUmVuYW1lIHdoaXRlb3V0IGF0b21pY2FsbHki
KQpSZXBvcnRlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KU2ln
bmVkLW9mZi1ieTogTcOlcnRlbiBMaW5kYWhsIDxtYXJ0ZW4ubGluZGFobEBheGlzLmNvbT4KUmV2
aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Ci0tLQpDaGFu
Z2VzIGluIHYyOgotIEFkZGVkIEZpeGVzIHRhZwotIEFkZGVkIFJldmlld2VkLWJ5IHRhZyBmcm9t
IFpoaWhhbyBDaGVuZwotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
MzAzMzAtbWVtbGVha19yZW5hbWUtZml4LXYxLTEtOTk3ODllOTA4ZmRmQGF4aXMuY29tCi0tLQog
ZnMvdWJpZnMvZGlyLmMgfCA2IC0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwppbmRleCAwZjI5
Y2YyMDExMzYuLjRjMmRkYTEzNDZlNyAxMDA2NDQKLS0tIGEvZnMvdWJpZnMvZGlyLmMKKysrIGIv
ZnMvdWJpZnMvZGlyLmMKQEAgLTM1OCw3ICszNTgsNiBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpj
cmVhdGVfd2hpdGVvdXQoc3RydWN0IGlub2RlICpkaXIsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSkK
IAl1bW9kZV90IG1vZGUgPSBTX0lGQ0hSIHwgV0hJVEVPVVRfTU9ERTsKIAlzdHJ1Y3QgaW5vZGUg
Kmlub2RlOwogCXN0cnVjdCB1Ymlmc19pbmZvICpjID0gZGlyLT5pX3NiLT5zX2ZzX2luZm87Ci0J
c3RydWN0IGZzY3J5cHRfbmFtZSBubTsKIAogCS8qCiAJICogQ3JlYXRlIGFuIGlub2RlKCdubGlu
ayA9IDEnKSBmb3Igd2hpdGVvdXQgd2l0aG91dCB1cGRhdGluZyBqb3VybmFsLApAQCAtMzY5LDEw
ICszNjgsNiBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpjcmVhdGVfd2hpdGVvdXQoc3RydWN0IGlu
b2RlICpkaXIsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSkKIAlkYmdfZ2VuKCJkZW50ICclcGQnLCBt
b2RlICUjaHggaW4gZGlyIGlubyAlbHUiLAogCQlkZW50cnksIG1vZGUsIGRpci0+aV9pbm8pOwog
Ci0JZXJyID0gZnNjcnlwdF9zZXR1cF9maWxlbmFtZShkaXIsICZkZW50cnktPmRfbmFtZSwgMCwg
Jm5tKTsKLQlpZiAoZXJyKQotCQlyZXR1cm4gRVJSX1BUUihlcnIpOwotCiAJaW5vZGUgPSB1Ymlm
c19uZXdfaW5vZGUoYywgZGlyLCBtb2RlLCBmYWxzZSk7CiAJaWYgKElTX0VSUihpbm9kZSkpIHsK
IAkJZXJyID0gUFRSX0VSUihpbm9kZSk7CkBAIC0zOTUsNyArMzkwLDYgQEAgc3RhdGljIHN0cnVj
dCBpbm9kZSAqY3JlYXRlX3doaXRlb3V0KHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5
ICpkZW50cnkpCiAJbWFrZV9iYWRfaW5vZGUoaW5vZGUpOwogCWlwdXQoaW5vZGUpOwogb3V0X2Zy
ZWU6Ci0JZnNjcnlwdF9mcmVlX2ZpbGVuYW1lKCZubSk7CiAJdWJpZnNfZXJyKGMsICJjYW5ub3Qg
Y3JlYXRlIHdoaXRlb3V0IGZpbGUsIGVycm9yICVkIiwgZXJyKTsKIAlyZXR1cm4gRVJSX1BUUihl
cnIpOwogfQoKLS0tCmJhc2UtY29tbWl0OiBjOWMzMzk1ZDVlM2RjYzZkYWVlNjZjNjkwODM1NGQ0
N2JmOThjYjBjCmNoYW5nZS1pZDogMjAyMzAzMzAtbWVtbGVha19yZW5hbWUtZml4LTZmOTRhNmY5
OTM1MAoKQmVzdCByZWdhcmRzLAotLSAKTcOlcnRlbiBMaW5kYWhsIDxtYXJ0ZW4ubGluZGFobEBh
eGlzLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
