Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EC0C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 13:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DCE21916
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 13:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AB5hDNNr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="L8k2uiTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64DCE21916
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nic.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg8Hs4mW+cnP9VW/HCfPQyfwdqvrJHO31md3w4S+Vs4=; b=AB5hDNNr1pANKo
	X8MeLQli+cZP6FEITcAjnFC1yue7ujn5qnZEE8FSBz2pNio7jsyZhgKqrI40TCeewSToLBZRfseZq
	pJwKAeYTBW2LEiuqKLHDReSQaGgkxYfk3+WiIYS8OYFx8lakroSAPuszeNUOCm0GRQgsZSBjYEKz6
	bLxWAhH0FmIsU/sdzSEngsv6K1aQJKHKpQVN2fkoNDxHYEHTJmWZHEzKVxGml1yg5CRE9u8T+oq3Q
	wEGvGB3yA+pkc9Kt9iW40Dau3EqgRSxr1/MYe2ictY1SVT7i+wm/67yA55UmcijkH+I67P/Rtn1Ih
	SKKPa/yAQH726ChaAG2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KC4-0007Uj-Aq; Fri, 22 Mar 2019 13:26:44 +0000
Received: from mail.nic.cz ([2001:1488:800:400::400])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7KBk-00077g-Cs
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2019 13:26:27 +0000
Received: from dellmb.labs.office.nic.cz (unknown
 [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
 by mail.nic.cz (Postfix) with ESMTP id A6B7763503;
 Fri, 22 Mar 2019 14:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1553261180; bh=9utupMqS8pim3L/hwJ7SDp/+7UOhWLax082TqDioq5s=;
 h=From:To:Date;
 b=L8k2uiTOduEu5DZISZOlrJGCg07BX6BsQOkD10YymMY3HEAOSmpefAYkrH+GV3ZgU
 D+PWpIJNqeLsX5WnOVuH42UuWxQ/DFjZxaqz1a2hn8exC21xSsZWPGyxosNXtquoGT
 R/Bxo7PrCE0230g28dERvht+axh8e8ZJWByibEKA=
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 mtd/nand/next 3/3] mtd: rawnand: fsl_elbc: Make SW ECC work
Date: Fri, 22 Mar 2019 14:26:19 +0100
Message-Id: <20190322132619.10339-4-marek.behun@nic.cz>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190322132619.10339-1-marek.behun@nic.cz>
References: <20190322132619.10339-1-marek.behun@nic.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_062624_772008_9653B0CB 
X-CRM114-Status: GOOD (  12.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Shreeya Patel <shreeya.patel23498@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TW92ZSB0aGUgY29kZSB0aGF0IGNob3NlcyBFQ0MgaW50byBfYXR0YWNoX2NoaXAsIHdoaWNoIGlz
IGV4ZWN1dGVkIG9ubHkKYWZ0ZXIgdGhlIGNoaXAtPmVjYy4qIHByb3BlcnRpZXMgd2VyZSBsb2Fk
ZWQgZnJvbSBkZXZpY2UtdHJlZS4gVGhpcyB3YXkKd2Uga25vdyB3aGljaCBFQ0MgbWV0aG9kIHdh
cyBjaG9zZW4gYnkgdGhlIGRldmljZS10cmVlIGFuZCBjYW4gc2V0Cm1ldGhvZHMgYXBwcm9wcmlh
dGVseS4KClRoZSBjaGlwLT5lY2MuKnBhZ2UgbWV0aG9kcyBzaG91bGQgYmUgc2V0IHRvIGZzbF9l
bGJjXypwYWdlIG9ubHkgaW4gSFcKRUNDIG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBCZWjD
um4gPG1hcmVrLmJlaHVuQG5pYy5jej4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxi
Y19uYW5kLmMgfCA1MiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNs
X2VsYmNfbmFuZC5jCmluZGV4IGZiNjA5MjgyOWQ3OC4uZmEwM2M4ZjY0YjQyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jCkBAIC03MzAsMjQgKzczMCw2IEBAIHN0YXRpYyBpbnQg
ZnNsX2VsYmNfY2hpcF9pbml0KHN0cnVjdCBmc2xfZWxiY19tdGQgKnByaXYpCiAJY2hpcC0+Y29u
dHJvbGxlciA9ICZlbGJjX2ZjbV9jdHJsLT5jb250cm9sbGVyOwogCW5hbmRfc2V0X2NvbnRyb2xs
ZXJfZGF0YShjaGlwLCBwcml2KTsKIAotCWNoaXAtPmVjYy5yZWFkX3BhZ2UgPSBmc2xfZWxiY19y
ZWFkX3BhZ2U7Ci0JY2hpcC0+ZWNjLndyaXRlX3BhZ2UgPSBmc2xfZWxiY193cml0ZV9wYWdlOwot
CWNoaXAtPmVjYy53cml0ZV9zdWJwYWdlID0gZnNsX2VsYmNfd3JpdGVfc3VicGFnZTsKLQotCS8q
IElmIENTIEJhc2UgUmVnaXN0ZXIgc2VsZWN0cyBmdWxsIGhhcmR3YXJlIEVDQyB0aGVuIHVzZSBp
dCAqLwotCWlmICgoaW5fYmUzMigmbGJjLT5iYW5rW3ByaXYtPmJhbmtdLmJyKSAmIEJSX0RFQ0Mp
ID09Ci0JICAgIEJSX0RFQ0NfQ0hLX0dFTikgewotCQljaGlwLT5lY2MubW9kZSA9IE5BTkRfRUND
X0hXOwotCQltdGRfc2V0X29vYmxheW91dChtdGQsICZmc2xfZWxiY19vb2JsYXlvdXRfb3BzKTsK
LQkJY2hpcC0+ZWNjLnNpemUgPSA1MTI7Ci0JCWNoaXAtPmVjYy5ieXRlcyA9IDM7Ci0JCWNoaXAt
PmVjYy5zdHJlbmd0aCA9IDE7Ci0JfSBlbHNlIHsKLQkJLyogb3RoZXJ3aXNlIGZhbGwgYmFjayB0
byBkZWZhdWx0IHNvZnR3YXJlIEVDQyAqLwotCQljaGlwLT5lY2MubW9kZSA9IE5BTkRfRUNDX1NP
RlQ7Ci0JCWNoaXAtPmVjYy5hbGdvID0gTkFORF9FQ0NfSEFNTUlORzsKLQl9Ci0KIAlyZXR1cm4g
MDsKIH0KIApAQCAtNzU5LDYgKzc0MSw0MCBAQCBzdGF0aWMgaW50IGZzbF9lbGJjX2F0dGFjaF9j
aGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCiAJc3RydWN0IGZzbF9sYmNfcmVncyBfX2lvbWVt
ICpsYmMgPSBjdHJsLT5yZWdzOwogCXVuc2lnbmVkIGludCBhbDsKIAorCXN3aXRjaCAoY2hpcC0+
ZWNjLm1vZGUpIHsKKwkvKgorCSAqIGlmIEVDQyB3YXMgbm90IGNob3NlbiBpbiBEVCwgZGVjaWRl
IHdoZXRoZXIgdG8gdXNlIEhXIG9yIFNXIEVDQyBmcm9tCisJICogQ1MgQmFzZSBSZWdpc3Rlcgor
CSAqLworCWNhc2UgTkFORF9FQ0NfTk9ORToKKwkJLyogSWYgQ1MgQmFzZSBSZWdpc3RlciBzZWxl
Y3RzIGZ1bGwgaGFyZHdhcmUgRUNDIHRoZW4gdXNlIGl0ICovCisJCWlmICgoaW5fYmUzMigmbGJj
LT5iYW5rW3ByaXYtPmJhbmtdLmJyKSAmIEJSX0RFQ0MpID09CisJCSAgICBCUl9ERUNDX0NIS19H
RU4pIHsKKwkJCWNoaXAtPmVjYy5yZWFkX3BhZ2UgPSBmc2xfZWxiY19yZWFkX3BhZ2U7CisJCQlj
aGlwLT5lY2Mud3JpdGVfcGFnZSA9IGZzbF9lbGJjX3dyaXRlX3BhZ2U7CisJCQljaGlwLT5lY2Mu
d3JpdGVfc3VicGFnZSA9IGZzbF9lbGJjX3dyaXRlX3N1YnBhZ2U7CisKKwkJCWNoaXAtPmVjYy5t
b2RlID0gTkFORF9FQ0NfSFc7CisJCQltdGRfc2V0X29vYmxheW91dChtdGQsICZmc2xfZWxiY19v
b2JsYXlvdXRfb3BzKTsKKwkJCWNoaXAtPmVjYy5zaXplID0gNTEyOworCQkJY2hpcC0+ZWNjLmJ5
dGVzID0gMzsKKwkJCWNoaXAtPmVjYy5zdHJlbmd0aCA9IDE7CisJCX0gZWxzZSB7CisJCQkvKiBv
dGhlcndpc2UgZmFsbCBiYWNrIHRvIGRlZmF1bHQgc29mdHdhcmUgRUNDICovCisJCQljaGlwLT5l
Y2MubW9kZSA9IE5BTkRfRUNDX1NPRlQ7CisJCQljaGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0hB
TU1JTkc7CisJCX0KKwkJYnJlYWs7CisKKwkvKiBpZiBTVyBFQ0Mgd2FzIGNob3NlbiBpbiBEVCwg
d2UgZG8gbm90IG5lZWQgdG8gc2V0IGFueXRoaW5nIGhlcmUgKi8KKwljYXNlIE5BTkRfRUNDX1NP
RlQ6CisJCWJyZWFrOworCisJLyogc2hvdWxkIHdlIGFsc28gaW1wbGVtZW50IE5BTkRfRUNDX0hX
IHRvIGRvIGFzIHRoZSBjb2RlIGFib3ZlPyAqLworCWRlZmF1bHQ6CisJCXJldHVybiAtRUlOVkFM
OworCX0KKwogCS8qIGNhbGN1bGF0ZSBGTVIgQWRkcmVzcyBMZW5ndGggZmllbGQgKi8KIAlhbCA9
IDA7CiAJaWYgKGNoaXAtPnBhZ2VtYXNrICYgMHhmZmZmMDAwMCkKLS0gCjIuMTkuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
