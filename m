Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745E8C4707B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jan 2024 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaogbEtUWcWnygUA10293T9aqSrqT1sDXI9Eg91smUE=; b=1a2qYI8U/frbRfbG8OA2sLwkWn
	BGbeixD+nDtVpItsaiEyOGGIol9IydAafqvq1kgF1EP1y4500Z2fgq4R1TcN9PMqVeq2wxYci5cE7
	UdVm/Mr/WU3ggSdo6Q469jhgFPIV4oZRIyjf1TXIC8xX1QzyvGrFvehQCaxokD8sqcHsUm0EkwPLy
	vqvxekTIweJvMW77/vF4pcYqdYY03V8OOnw+YlQx+D+uOI0piHZpzTsgAuv+2fz5YBX/rSCPidoX7
	WZJylLYKSunsAzOkxQ5+iSnf+4R0apXsOpipfoB053HBA9tWu4FE12mRWhu/P6uvN/3y9vTLnJCWL
	TuVFi2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuCj-0002Mn-20;
	Thu, 11 Jan 2024 12:30:37 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuCg-0002LZ-0K
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jan 2024 12:30:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4T9kVY60cFz1Q7lS;
	Thu, 11 Jan 2024 20:28:53 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 13FD21A0172;
	Thu, 11 Jan 2024 20:30:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 20:30:26 +0800
Subject: Re: [PATCH v2] ubifs: Remove unreachable code in dbg_check_ltab_lnum
To: Kunwu Chan <chentao@kylinos.cn>, <richard@nod.at>,
	<Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Kunwu
 Chan <kunwu.chan@hotmail.com>, Richard Weinberger
	<richard.weinberger@gmail.com>
References: <20240111063656.68810-1-chentao@kylinos.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <920ffa51-15af-c07f-3eae-1e1ebd5fdd33@huawei.com>
Date: Thu, 11 Jan 2024 20:30:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240111063656.68810-1-chentao@kylinos.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_043034_327740_9BFB2D0C 
X-CRM114-Status: GOOD (  12.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8xLzExIDE0OjM2LCBLdW53dSBDaGFuINC0tcA6Cj4gQmVjYXVzZSB0aGVyZSBpcyBu
byBicmVhayBzdGF0ZW1lbnQgaW4gdGhlIGRlYWQgbG9vcCBhYm92ZSxpdCBpcwo+IGltcG9zc2li
bGUgdG8gZXhlY3V0ZSB0aGUgJ2Vycj0wJyBzdGF0ZW1lbnQuRGVsZXRlIHRoZSBjb2RlIHRoYXQK
PiB3aWxsIG5ldmVyIGV4ZWN1dGUuCj4gCj4gRml4ZXM6IDZmYjMyNGE0YjBjMyAoIlVCSUZTOiBh
bGxvY2F0ZSBsdGFiIGNoZWNraW5nIGJ1ZmZlciBvbiBkZW1hbmQiKQo+IFNpZ25lZC1vZmYtYnk6
IEt1bnd1IENoYW4gPGNoZW50YW9Aa3lsaW5vcy5jbj4KPiBDYzogS3Vud3UgQ2hhbiA8a3Vud3Uu
Y2hhbkBob3RtYWlsLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmlj
aGFyZC53ZWluYmVyZ2VyQGdtYWlsLmNvbT4KPiAKPiAtLS0KPiB2MjogUmVtb3ZlIHRoZSBpbml0
aWFsaXphdGlvbiBvZiBlcnIKPiAtLS0KPiAgIGZzL3ViaWZzL2xwdF9jb21taXQuYyB8IDEgLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMv
bHB0X2NvbW1pdC5jIGIvZnMvdWJpZnMvbHB0X2NvbW1pdC5jCj4gaW5kZXggYzRkMDc5MzI4Yjky
Li4wNzM1MWZkY2U3MjIgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvbHB0X2NvbW1pdC5jCj4gKysr
IGIvZnMvdWJpZnMvbHB0X2NvbW1pdC5jCj4gQEAgLTE2NDYsNyArMTY0Niw2IEBAIHN0YXRpYyBp
bnQgZGJnX2NoZWNrX2x0YWJfbG51bShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50IGxudW0pCj4g
ICAJCWxlbiAtPSBub2RlX2xlbjsKPiAgIAl9Cj4gICAKPiAtCWVyciA9IDA7Cj4gICBvdXQ6Cj4g
ICAJdmZyZWUoYnVmKTsKPiAgIAlyZXR1cm4gZXJyOwo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
