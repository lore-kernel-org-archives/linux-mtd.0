Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F83EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 07:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlJnf2nR8TTHAEAuqvMe90i7Zc7Npv/eUudQQT0r2qQ=; b=DaSeocPuIqZkoK5cOSlgKOoJ4U
	t7luTquCjpyKM/syTySxaQ6DXFiRcKTLKeTPuJB6mMbwQJ8+xrIsXKJKSBPkeedd2zwK+PMtViqDw
	qN27OLdHB6eElm2wd63Tsn1u3/DJB2hjImC9YC5FxKANxfaQJtU3uGav45q5rWOuS05GCSzjW5BLY
	SQUtHRYpZw6Ra/l/8s3D3zu4u/TDuJz0dJ+c1juVRnQ+7u0DPwDaOgYbiZ6Pv8th95DSAybtIacXg
	n6Xma6pdIfxcZ4uSS25R64sDBNRwNZEpRCvhcFWzP4USzwUtI0rkCvOAvfnigcLJ33z8x8l1wAxwF
	Ngd0H2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJULH-00Gn7w-23;
	Wed, 12 Jul 2023 07:32:55 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJULD-00Gn5v-2o
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 07:32:53 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R18Wj6v1tztR9P;
	Wed, 12 Jul 2023 15:29:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 15:32:36 +0800
Subject: Re: [PATCH -next] ubifs: Fix some kernel-doc comments
To: Yang Li <yang.lee@linux.alibaba.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Abaci
 Robot <abaci@linux.alibaba.com>
References: <20230712071200.78575-1-yang.lee@linux.alibaba.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <94b243cb-da53-a3d4-7986-60e3be65a761@huawei.com>
Date: Wed, 12 Jul 2023 15:32:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230712071200.78575-1-yang.lee@linux.alibaba.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_003252_180811_E444A5ED 
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

1NogMjAyMy83LzEyIDE1OjEyLCBZYW5nIExpINC0tcA6Cj4gQWRkIGRlc2NyaXB0aW9uIG9mIEB0
aW1lIGFuZCBAZmxhZ3MgaW4gdWJpZnNfdXBkYXRlX3RpbWUoKS4KPiAKPiB0byBzaWxlbmNlIHRo
ZSB3YXJuaW5nczoKPiBmcy91Ymlmcy9maWxlLmM6MTM4Mzogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAndGltZScgbm90IGRlc2NyaWJlZCBpbiAndWJpZnNfdXBkYXRlX3Rp
bWUnCj4gZnMvdWJpZnMvZmlsZS5jOjEzODM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVzY3JpYmVkIGluICd1Ymlmc191cGRhdGVfdGltZScKPiAK
PiBSZXBvcnRlZC1ieTogQWJhY2kgUm9ib3QgPGFiYWNpQGxpbnV4LmFsaWJhYmEuY29tPgo+IENs
b3NlczogaHR0cHM6Ly9idWd6aWxsYS5vcGVuYW5vbGlzLmNuL3Nob3dfYnVnLmNnaT9pZD01ODQ4
Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBMaSA8eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+Cj4g
LS0tCj4gICBmcy91Ymlmcy9maWxlLmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2Zp
bGUuYwo+IGluZGV4IDQzNmIyN2Q3YzU4Zi4uNWU4NmVmMWJlNjk4IDEwMDY0NAo+IC0tLSBhL2Zz
L3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IEBAIC0xMzc1LDYgKzEzNzUs
OCBAQCBzdGF0aWMgaW5saW5lIGludCBtY3RpbWVfdXBkYXRlX25lZWRlZChjb25zdCBzdHJ1Y3Qg
aW5vZGUgKmlub2RlLAo+ICAgLyoqCj4gICAgKiB1Ymlmc191cGRhdGVfdGltZSAtIHVwZGF0ZSB0
aW1lIG9mIGlub2RlLgo+ICAgICogQGlub2RlOiBpbm9kZSB0byB1cGRhdGUKPiArICogQHRpbWU6
ICB0aW1lc3BlYyBzdHJ1Y3R1cmUgdG8gaG9sZCB0aGUgY3VycmVudCB0aW1lIHZhbHVlCj4gKyAq
IEBmbGFnczogZmlsZSB0aW1lIGZsYWcKCmZsYWdzOiB0aW1lIHVwZGF0aW5nIGNvbnRyb2wgZmxh
ZyBkZXRlcm1pbmVzIHVwZGF0aW5nIHdoaWNoIHRpbWUgZmllbGRzIApvZiBAaW5vZGUKCj4gICAg
Kgo+ICAgICogVGhpcyBmdW5jdGlvbiB1cGRhdGVzIHRpbWUgb2YgdGhlIGlub2RlLgo+ICAgICov
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
