Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A97C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Message-ID:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/r9qWA53M0fmMUWdx3DePANowdW5+ok0mLOVIxujso=; b=gLP403sfSHzNp8
	TwNS6l55X3c1viJAiZEwEP0k+M/LX2vPIvA43qHtaLcZABdck+B78XobV/yhorEMFEWZduZSYzor2
	0Y1tPCdSEyoKeDU9lU4grTzakZ8fJAizUF3CoKTMPNWr5TWUPsmtfod9f8dNrr7wuOTYMXrfBY8+Y
	2rlZBqyaClTJ/ECd1a1zqt6geVqMIoQW0FKUBMAEJ4yU4JDVSqjmAFACac29HqFJ5c4S0dvoBbAx9
	N4brZ6fxWesmn7mSzM6dw3RaX8h0nQqAQPyFaLgXljLSkKPjzrt88uiLMbZUvqcdh+8wMsnwAgQQH
	/T8GKP1kjKwkYBn2N/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUoE-006JcL-Qa; Mon, 16 May 2022 07:06:26 +0000
Received: from sender11-op-o11.zoho.eu ([31.186.226.225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUo9-006JZj-Q0
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 07:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1652684771; cv=none; d=zohomail.eu; s=zohoarc; 
 b=HDr/FFQNBXFV8vicf1l6hjE/A2euDlDbK5kQQYtyPTuLmMQqU/gKfjTrACJrx6jR0/CphquX5DkFCkfb4mKb17jLNVK6awizQlmXdS8N6x1JkCyZx+FUZQayLSP8wZ0JnbUjhh4MOo8cVEWIkwyGZbYX/XxTP0yUj5Z555DD3k0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1652684771;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=NIcPko3O8gQnfcEw2wD+BsSr/fE+oPhDVo1xC1CrC1M=; 
 b=PGL1v/cVRuZhLvAQSBDwMj9g/YkOcUM9aSIA+6MRAtfYksxcG1mKGGGc1poV7hAQeBQxpwRRHi7sZnP4QTYSXQPfnrWrh92ORJlGgbOaCEv4K3ykSpe4lnfmn7+wDue+g/p9S5R4BfKnQzv1MgZoRBnE4mkDPfGsX7YRaa5hFQQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=kempniu.pl;
 spf=pass  smtp.mailfrom=kernel@kempniu.pl;
 dmarc=pass header.from=<kernel@kempniu.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652684771; 
 s=zmail; d=kempniu.pl; i=kernel@kempniu.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NIcPko3O8gQnfcEw2wD+BsSr/fE+oPhDVo1xC1CrC1M=;
 b=LSJOdimXKmYqlmtuFAB+yt/QK2YcoZWZgWEf0df6TxO+n3JV+wtMfFNbdcbDfBKz
 cOcJ4c5O0peEsmbMjgDNhagL8Mt3JIeII1kLsiSWTlPcwQxwQ+kbRhHxAMxfB7Ygh9p
 ZSNIFxvQFACfRI0D/BwhyZ1wPe8ADa0TcZrCt6Rk=
Received: from larwa.hq.kempniu.pl (212.180.138.61 [212.180.138.61]) by
 mx.zoho.eu with SMTPS id 1652684770360299.9570452205538;
 Mon, 16 May 2022 09:06:10 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-ID: <20220516070601.11428-2-kernel@kempniu.pl>
Subject: [PATCH 1/2] mtdchar: prevent integer overflow in a safety check
Date: Mon, 16 May 2022 09:06:00 +0200
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516070601.11428-1-kernel@kempniu.pl>
References: <20220516070601.11428-1-kernel@kempniu.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_000622_425972_62D31B57 
X-CRM114-Status: GOOD (  16.33  )
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

Q29tbWl0IDY0MjBhYzBhZjk1ZCAoIm10ZGNoYXI6IHByZXZlbnQgdW5ib3VuZGVkIGFsbG9jYXRp
b24gaW4gTUVNV1JJVEUKaW9jdGwiKSBhZGRlZCBhIHNhZmV0eSBjaGVjayB0byBtdGRjaGFyX3dy
aXRlX2lvY3RsKCkgd2hpY2ggYXR0ZW1wdHMgdG8KZW5zdXJlIHRoYXQgdGhlIHdyaXRlIHJlcXVl
c3Qgc2VudCBieSB1c2VyIHNwYWNlIGRvZXMgbm90IGV4dGVuZCBiZXlvbmQKdGhlIE1URCBkZXZp
Y2UncyBzaXplLiAgSG93ZXZlciwgdGhhdCBjaGVjayBjb250YWlucyBhbiBhZGRpdGlvbiBvZiB0
d28Kc3RydWN0IG10ZF93cml0ZV9yZXEgZmllbGRzLCAnc3RhcnQnIGFuZCAnbGVuJywgYm90aCBv
ZiB3aGljaCBhcmUgdTY0CnZhcmlhYmxlcy4gIFRoZSByZXN1bHQgb2YgdGhhdCBhZGRpdGlvbiBj
YW4gb3ZlcmZsb3csIGFsbG93aW5nIHRoZQpzYWZldHkgY2hlY2sgdG8gYmUgYnlwYXNzZWQuCgpU
aGUgYXJndWFibHkgc2ltcGxlc3QgZml4IC0gY2hhbmdpbmcgdGhlIGRhdGEgdHlwZXMgb2YgdGhl
IHJlbGV2YW50CnN0cnVjdCBtdGRfd3JpdGVfcmVxIGZpZWxkcyAtIGlzIG5vdCBmZWFzaWJsZSBh
cyBpdCB3b3VsZCBicmVhayB1c2VyCnNwYWNlLgoKRml4IGJ5IG1ha2luZyBtdGRjaGFyX3dyaXRl
X2lvY3RsKCkgdHJ1bmNhdGUgdGhlIHZhbHVlIHByb3ZpZGVkIGJ5IHVzZXIKc3BhY2UgaW4gdGhl
ICdsZW4nIGZpZWxkIG9mIHN0cnVjdCBtdGRfd3JpdGVfcmVxLCBzbyB0aGF0IG9ubHkgdGhlIGxv
d2VyCjMyIGJpdHMgb2YgdGhhdCBmaWVsZCBhcmUgdXNlZCwgcHJldmVudGluZyB0aGUgb3ZlcmZs
b3cuCgpXaGlsZSB0aGUgJ29vYmxlbicgZmllbGQgb2Ygc3RydWN0IG10ZF93cml0ZV9yZXEgaXMg
bm90IGN1cnJlbnRseSB1c2VkCmluIGFueSBzaW1pbGFybHkgZmxhd2VkIHNhZmV0eSBjaGVjaywg
YWxzbyB0cnVuY2F0ZSBpdCB0byAzMiBiaXRzLCBmb3IKY29uc2lzdGVuY3kgd2l0aCB0aGUgJ2xl
bicgZmllbGQgYW5kIHdpdGggb3RoZXIgTVREIHJvdXRpbmVzIGhhbmRsaW5nCk9PQiBkYXRhLgoK
VXBkYXRlIGluY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oIGFjY29yZGluZ2x5LgoKU3VnZ2VzdGVk
LWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgpTaWduZWQtb2ZmLWJ5OiBN
aWNoYcWCIEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4KLS0tCiBkcml2ZXJzL210ZC9tdGRj
aGFyLmMgICAgICB8IDMgKysrCiBpbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbXRkY2hhci5jIGIvZHJpdmVycy9tdGQvbXRkY2hhci5jCmluZGV4
IGQwZjljNGIwMjg1Yy4uYjI3MDBmODQ2N2ZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRj
aGFyLmMKKysrIGIvZHJpdmVycy9tdGQvbXRkY2hhci5jCkBAIC02MTUsNiArNjE1LDkgQEAgc3Rh
dGljIGludCBtdGRjaGFyX3dyaXRlX2lvY3RsKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCWlmICgh
dXNyX29vYikKIAkJcmVxLm9vYmxlbiA9IDA7CiAKKwlyZXEubGVuICY9IDB4ZmZmZmZmZmY7CisJ
cmVxLm9vYmxlbiAmPSAweGZmZmZmZmZmOworCiAJaWYgKHJlcS5zdGFydCArIHJlcS5sZW4gPiBt
dGQtPnNpemUpCiAJCXJldHVybiAtRUlOVkFMOwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
bXRkL210ZC1hYmkuaCBiL2luY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oCmluZGV4IGI4Njk5OTBj
MmRiMi4uODkwZDllNWI3NmQ3IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbXRkL210ZC1hYmku
aAorKysgYi9pbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaApAQCAtNjksOCArNjksOCBAQCBlbnVt
IHsKICAqIHN0cnVjdCBtdGRfd3JpdGVfcmVxIC0gZGF0YSBzdHJ1Y3R1cmUgZm9yIHJlcXVlc3Rp
bmcgYSB3cml0ZSBvcGVyYXRpb24KICAqCiAgKiBAc3RhcnQ6CXN0YXJ0IGFkZHJlc3MKLSAqIEBs
ZW46CWxlbmd0aCBvZiBkYXRhIGJ1ZmZlcgotICogQG9vYmxlbjoJbGVuZ3RoIG9mIE9PQiBidWZm
ZXIKKyAqIEBsZW46CWxlbmd0aCBvZiBkYXRhIGJ1ZmZlciAob25seSBsb3dlciAzMiBiaXRzIGFy
ZSB1c2VkKQorICogQG9vYmxlbjoJbGVuZ3RoIG9mIE9PQiBidWZmZXIgKG9ubHkgbG93ZXIgMzIg
Yml0cyBhcmUgdXNlZCkKICAqIEB1c3JfZGF0YToJdXNlci1wcm92aWRlZCBkYXRhIGJ1ZmZlcgog
ICogQHVzcl9vb2I6CXVzZXItcHJvdmlkZWQgT09CIGJ1ZmZlcgogICogQG1vZGU6CU1URCBtb2Rl
IChzZWUgIk1URCBvcGVyYXRpb24gbW9kZXMiKQotLSAKMi4zNi4xCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
