Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6FEC02193
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FcYdpYduWtngqXI1KGEQimMh75wVU3SvMlKrJ7wIAM=; b=2QKGdWwoYYiTOG
	qke8jyNhGWEd44DhYKvMIDrrMhx/DWk3yEjKAVlUlgMetQZl4WSpaGXamvfOMMvYzdWxlE988EqVr
	3Z+w7fALKIbmbqgdcGX0Sdtpjd7RiUufsI1acTCP80j9cj6XwT2aq324UejJIJYKOWOQzP6XeVbVU
	kHYV6l9lmA3Eb+fjr9U1nqrW+VFAAp3ChfGTXxDkdlr65S+QAN+sSyqJnl1GTU5zb1/+OL66wfqRY
	Uls9+RDntx6T3KJQEbUtVic2MSY11y9sU0fAGhd+ttXJR7iG2hwi/AuIgS24nCO1sapCPhxsKEKnM
	JdVBFcwyEtWjOvYGTAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQo-0000000HAKE-3vKI;
	Sun, 26 Jan 2025 06:47:42 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQm-0000000HAIv-3wAa
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:42 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yghpt2MFNz1l08x;
	Sun, 26 Jan 2025 14:44:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 39EF81A016C;
	Sun, 26 Jan 2025 14:47:30 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:29 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 2/7] nand-utils: nanddump: Fix unexpected type compiling warning for argument 'dumpfile'
Date: Sun, 26 Jan 2025 14:41:58 +0800
Message-ID: <20250126064203.3348494-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224741_167169_0688E3C3 
X-CRM114-Status: UNSURE (   9.65  )
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

VGhlIGNvbnN0IHBvaW50ZXIgYXJndW1lbnQgY2Fubm90IGJlIHBhc3NlZCBpbnRvIGxpYmMgZnVu
Y3Rpb24gJ2ZyZWUoKScsCm90aGVyd2lzZSB0aGUgY29tcGlsZXIgd2lsbCBjb21wbGFpbiBmb2xs
b3dpbmcgbWVzc2FnZToKIG5hbmQtdXRpbHMvbmFuZGR1bXAuYzoxNjg6MTA6IHdhcm5pbmc6IHBh
c3NpbmcgYXJndW1lbnQgMSBvZiDigJhmcmVl4oCZCiBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFs
aWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlCgpGaXhlczogYzg5MDA5NDYzODg4ICgibmFu
ZGR1bXA6IGRvbid0IGxlYWsgY29waWVkIGNvbW1hbmQgbGluZSBhcmd1bWVudHMiKQpTaWduZWQt
b2ZmLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgotLS0KIG5hbmQt
dXRpbHMvbmFuZGR1bXAuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbmFuZC11dGlscy9uYW5kZHVtcC5jIGIv
bmFuZC11dGlscy9uYW5kZHVtcC5jCmluZGV4IGJjMjI4NTguLmI0ZGUwNWUgMTAwNjQ0Ci0tLSBh
L25hbmQtdXRpbHMvbmFuZGR1bXAuYworKysgYi9uYW5kLXV0aWxzL25hbmRkdW1wLmMKQEAgLTEw
Miw2ICsxMDIsNyBAQCBzdGF0aWMgdm9pZCBwcm9jZXNzX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIg
KiBjb25zdCBhcmd2W10pCiB7CiAJaW50IGVycm9yID0gMDsKIAlib29sIG9vYl9kZWZhdWx0ID0g
dHJ1ZTsKKwljaGFyICpkdW1wZmlsZV90bXAgPSBOVUxMOwogCiAJZm9yICg7OykgewogCQlpbnQg
b3B0aW9uX2luZGV4ID0gMDsKQEAgLTE2NSw4ICsxNjYsOCBAQCBzdGF0aWMgdm9pZCBwcm9jZXNz
X29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJCQkJc3RhcnRfYWRkciA9
IHNpbXBsZV9zdHJ0b2xsKG9wdGFyZywgJmVycm9yKTsKIAkJCQlicmVhazsKIAkJCWNhc2UgJ2Yn
OgotCQkJCWZyZWUoZHVtcGZpbGUpOwotCQkJCWR1bXBmaWxlID0geHN0cmR1cChvcHRhcmcpOwor
CQkJCWZyZWUoZHVtcGZpbGVfdG1wKTsKKwkJCQlkdW1wZmlsZSA9IGR1bXBmaWxlX3RtcCA9IHhz
dHJkdXAob3B0YXJnKTsKIAkJCQlicmVhazsKIAkJCWNhc2UgJ2wnOgogCQkJCWxlbmd0aCA9IHNp
bXBsZV9zdHJ0b2xsKG9wdGFyZywgJmVycm9yKTsKLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
