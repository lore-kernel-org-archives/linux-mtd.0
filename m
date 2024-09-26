Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DEBCCFA15
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eV4q10G5sxldF3eT053k+473MdnfyQxyP+DVpx8+ZOE=; b=3Pcg3m+MgKfLKS
	kGb38++dY8ogTIFAq0Gf/8mCqTCdUz/3w+0CAibdVtkI3eeVlzXOdrccIrl9y17F4juRGsxFuZ6BN
	jbjDL0Nvd1XPHzeFKlZpuROByIUxRmXX+Ak+5gpb7zBUXsO3RPSmpeCoDH5JF22+sdUQuMrTTYwTN
	mLp7WmiaiwX4/hGU7x/w/rw1mo+vz18sSfRmghVDAKM342W23NnbajGa9TRjdFQ9cxbQ9GAtxqq1y
	W5bKqNUX3hUnI2XRHLw7uXvaKML5vYTZ+FIQaPTepFGdgT7KCR4wwJ//Kqkp7bHy12tH4S3RQjBPo
	dlyimmcpcdTibnQ32aTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlDG-00000007ytD-0u7L;
	Thu, 26 Sep 2024 09:55:06 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl97-00000007xU8-1Nyl
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 09:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727344241; x=1727949041; i=markus.elfring@web.de;
	bh=AFzcS8Ftuw+z5NkNchcdPPK9b9v88GV9gFK0HM0eF/k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IPfMCxpm4X94tQ0gZdtc0YPBwYnhDeXbbUbiOiKWLPEiZHC6EMXvw1eOvLBFNv7H
	 EGDPRKjMbwpTJ4udjUkvn3HOWyoVPia128/ZQfSa0MdzJ5smc3jchESfFMItpFkgI
	 GnlHAcJSUxREHJPrmfQuAh5Zt6f/rbLh4zkqqdFUC0BtRBqKhh2yTtTTY82gziFLI
	 JTNm8+EY4yjPaHridnyNHoXOdctVTr5t57TNQXC8mf7ZYOjy8fRuLlZ3KAjIfm6XX
	 TOrsKDE/S5/lsnpf0+kaRMKJEkxhx5uuXVAZQXtGilNUzkQZHD1bPxzgX9D5cV+lJ
	 Q9+IumrhFFvtiYVVpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MhWkj-1sGahe09EB-00g2qr; Thu, 26
 Sep 2024 11:50:41 +0200
Message-ID: <fc35a4b0-9a41-4f14-9558-99fc0b7e2ad8@web.de>
Date: Thu, 26 Sep 2024 11:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] ubifs: Reduce kfree() calls in ubifs_purge_xattrs()
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <ff787fb9-a9fc-4798-8460-3ec310e6cd9f@web.de>
Content-Language: en-GB
In-Reply-To: <ff787fb9-a9fc-4798-8460-3ec310e6cd9f@web.de>
X-Provags-ID: V03:K1:aPiOWLcSidigunR2DygPf0duUQgDMqaQvfyrTwF39tLnflvg42L
 nQ8g/c7fmGAaop0GbD6vgZNGULC28/e+ECRg6nzhxAFXNpgO0mK7WKxSxNyYKWhzdbtJr/4
 BESjDWCztPlfBHhBQ7kxlOJ4c0MFexsGNuqeNKmDvsRxbumnyD+E1wACOk+hf8K9yo6fBrG
 p/2A/cRnmcLdLZSXwLk1g==
UI-OutboundReport: notjunk:1;M01:P0:KCkX6tKssj0=;8ThV0nGKi5xh+POQztudQoa7Qii
 CKNfINptDpzjfiY+/SiY0XMhtmHintSTGmZBRoDbuDsYAq1EUhWBlTdMcA/mRnAkxgVbs0tZJ
 +AmMiSWjMUNjVwDdYudGq8S3/0C7Diy4upeSoFlbSHLIgfjMmkZ5sp4eTX+ojzxb2f0J/u1Ms
 QfEUv+Zpeh6g3uGOZWYZUrxZK9WcIzcjS7lTlxzlpT3UBs0aaq/Q4AP4mcsGlcPVCq5krDeiC
 SQOHg+l8hKW+RCGRMOLpaZlN4mf8pqGBEhWVy0vdZhP3a3Xv+KWS+IW2+izVbRqI9Ujxni7tW
 o+fyrXCcQlMhepIW0HvpFJaKnLUdzRucOBeZpbyqVTgWKSuLJghsz7rr/pbmK1ffgK21QYrPa
 h8WJAa7fJSQ3gN4c/wBIAwi2NVNdTZ4wKOq1aQ5vjhxNd3V93+XKv335EwN7SI7b4tqHOX1iV
 3KT5A3J4A9sJ52+sUrnq3sajaDJH1j0m92ZEZpP07M0Av4/aoX9f3/98Lp4AYU4qVMNoOcvAe
 Jjk5SAyTke92hCLha2k/jI1aofGk0Pnmp1nH5NlEeftNu0MRJjxlKNlxTuJFnsmzibX76OPsb
 uPgGBr+bbEvJZrqCv57KZIe8hcksLa7BgDhv6l3nLEZvUW9EGnChiNyA57WYlKAwuenNavE9A
 7S6v4BB1a0vVdiGiC/vVqCfbOh+37ik7+arRznu9sVwhvt3bUio84P/Ko2e/yA3+UgaEc9qiy
 EGXIR4TUtWzAUn3VGJJ4qi+iychuHe4yugn+BhVO1KyDeA3W5mNkBmENHDanfU1VMOl3KGA+W
 SkctUyBETctUuqZKBKNxYwqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_025049_699048_6E4D8BFA 
X-CRM114-Status: UNSURE (   6.58  )
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

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUaHUsIDI2IFNlcCAyMDI0IDExOjI4OjQ4ICswMjAwCgpNb3ZlIGEgcGFpciBvZiBrZnJlZSgp
IGNhbGxzIGJlaGluZCB0aGUgbGFiZWwg4oCcb3V0X2VycuKAnQpzbyB0aGF0IHR3byBzdGF0ZW1l
bnRzIGNhbiBiZSBiZXR0ZXIgcmV1c2VkIGF0IHRoZSBlbmQgb2YKdGhpcyBmdW5jdGlvbiBpbXBs
ZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJz
LnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBmcy91Ymlmcy94YXR0ci5jIHwgNiArKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZnMvdWJpZnMveGF0dHIuYyBiL2ZzL3ViaWZzL3hhdHRyLmMKaW5kZXggNzc1Nzk1OWU5ZjA5Li5h
NTE0ZGM0ZGM1MzUgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL3hhdHRyLmMKKysrIGIvZnMvdWJpZnMv
eGF0dHIuYwpAQCAtNTMyLDggKzUzMiw2IEBAIGludCB1Ymlmc19wdXJnZV94YXR0cnMoc3RydWN0
IGlub2RlICpob3N0KQogCQkJdWJpZnNfZXJyKGMsICJkZWFkIGRpcmVjdG9yeSBlbnRyeSAnJXMn
LCBlcnJvciAlZCIsCiAJCQkJICB4ZW50LT5uYW1lLCBlcnIpOwogCQkJdWJpZnNfcm9fbW9kZShj
LCBlcnIpOwotCQkJa2ZyZWUocHhlbnQpOwotCQkJa2ZyZWUoeGVudCk7CiAJCQlnb3RvIG91dF9l
cnI7CiAJCX0KCkBAIC01NDMsOCArNTQxLDYgQEAgaW50IHViaWZzX3B1cmdlX3hhdHRycyhzdHJ1
Y3QgaW5vZGUgKmhvc3QpCiAJCWVyciA9IHJlbW92ZV94YXR0cihjLCBob3N0LCB4aW5vLCAmbm0p
OwogCQlpcHV0KHhpbm8pOwogCQlpZiAoZXJyKSB7Ci0JCQlrZnJlZShweGVudCk7Ci0JCQlrZnJl
ZSh4ZW50KTsKIAkJCXViaWZzX2VycihjLCAiY2Fubm90IHJlbW92ZSB4YXR0ciwgZXJyb3IgJWQi
LCBlcnIpOwogCQkJZ290byBvdXRfZXJyOwogCQl9CkBAIC01NjQsNiArNTYwLDggQEAgaW50IHVi
aWZzX3B1cmdlX3hhdHRycyhzdHJ1Y3QgaW5vZGUgKmhvc3QpCiAJcmV0dXJuIDA7Cgogb3V0X2Vy
cjoKKwlrZnJlZShweGVudCk7CisJa2ZyZWUoeGVudCk7CiAJdXBfd3JpdGUoJnViaWZzX2lub2Rl
KGhvc3QpLT54YXR0cl9zZW0pOwogCXJldHVybiBlcnI7CiB9Ci0tCjIuNDYuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
