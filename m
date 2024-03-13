Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEDDC54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igWzbj73ferMd/IFfkxy89JQhiSUdhHgkUuga9h03lk=; b=oOKW6rODJpJ9OEWZM7FVC/JnFp
	rkK9NOUcnqpEJ+5IEIE239JnnfzxKf3HA/4G4pl8IaJCCFp3cv8dFe9uYcxIctQquXrNAQBWiKoz1
	Kj/y+p04ynXXysMpS1zfREfCVCZtPF1BWRsqy8cVH46XqN7tajM5NiOgzNQk0a2pTdM4hZJvlbJh0
	FQrKBLH2yUUMnTjmq4xGZuDk0i9BURb9m/1mhxIh+IowfKFRtAHbaawRgAGepeEt8hqgaj30wQvvu
	FShprkpsPNgNCuFj7BetmZhAQgkqr/hmlszwSTgayakdBExvijQkdq0XbSYEJqMVn706CEFs8lPG2
	pKaV+jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOg8-0000000AERd-24mH;
	Wed, 13 Mar 2024 13:29:56 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOg5-0000000AEOT-019P
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 13:29:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TvrsD1DMFz1Q9gw;
	Wed, 13 Mar 2024 21:27:12 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D5A3E140159;
	Wed, 13 Mar 2024 21:29:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 21:29:38 +0800
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
To: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240313084707.3292300-1-arnd@kernel.org>
 <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
 <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
 <1a12c8ed-0cb5-5650-24a2-84b021c444c3@huawei.com>
 <b08aaae4-8c69-47eb-9658-5f3f5c8e4056@app.fastmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <610231c3-c3ee-e543-1a8a-8e1098ee6a7c@huawei.com>
Date: Wed, 13 Mar 2024 21:29:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b08aaae4-8c69-47eb-9658-5f3f5c8e4056@app.fastmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_062953_260423_28A483CF 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjQvMy8xMyAyMDoyMSwgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4gT24gV2VkLCBNYXIg
MTMsIDIwMjQsIGF0IDEzOjEwLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+IOWcqCAyMDI0LzMvMTMg
MTk6NTMsIEFybmQgQmVyZ21hbm4g5YaZ6YGTOgo+Pj4gT24gV2VkLCBNYXIgMTMsIDIwMjQsIGF0
IDEyOjI5LCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+Pgo+Pj4gVGhlIHdheSBpdCB1c3VhbGx5IGdv
ZXMgaXMgdGhhdCBzb21lb25lIGFkZHMgYW4gb3Blbi1jb2RlZAo+Pj4gNjQtYml0IGRpdmlzaW9u
IHRoYXQgY2F1c2VzIGEgbGluayBmYWlsdXJlLCB3aGljaCBwcm9tcHRzCj4+IEknbSBhIGxpdHRs
ZSBjb25mdXNlZCwgd2hhdCBraW5kIG9mIGxpbmsgZmFpbHVyZT8gQ291bGQgeW91IHNob3cgYW4g
ZXhhbXBsZT8KPiAKPiBUaGUgb3Blbi1jb2RlZCA2NC1iaXQgZGl2aXNpb24gd2l0aG91dCB1c2lu
ZyBkb19kaXYoKSBzaG93cyB1cCBhcwo+IAo+IHg4Nl82NC1saW51eC1sZDogZHJpdmVycy9tdGQv
dWJpL252bWVtLm86IGluIGZ1bmN0aW9uIGB1YmlfbnZtZW1fcmVnX3JlYWQnOgo+IG52bWVtLmM6
KC50ZXh0KzB4MTBhKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191bW9kZGkzJwo+IHg4Nl82
NC1saW51eC1sZDogbnZtZW0uYzooLnRleHQrMHgxMWYpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBfX3VkaXZkaTMnCj4geDg2XzY0LWxpbnV4LWxkOiBkcml2ZXJzL210ZC91YmkvbnZtZW0ubzog
aW4gZnVuY3Rpb24gYHViaV9udm1lbV9yZWdfcmVhZC5jb2xkJzoKPiBudm1lbS5jOigudGV4dC51
bmxpa2VseSsweDJkKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191bW9kZGkzJwo+ICA+IFRo
ZSBpZGVhIGlzIHRoYXQgZ2NjIGV4cGVjdHMgX191bW9kZGkzIHRvIGJlIHByb3ZpZGVkIGJ5IGxp
YmdjYywKPiBidXQgTGludXggaW50ZW50aW9uYWxseSBsZWF2ZXMgaXQgb3V0IGluIG9yZGVyIHRv
IGNhdGNoIGFjY2lkZW50YWwKPiA2NC1iaXQgZGl2aXNpb25zLgo+IAoKVGhhbmtzIGZvciBleHBs
YWluYXRpb24sIHdoaWNoIG1lYW5zIHRoYXQgZG9fZGl2IGlzIHVzZWQgZm9yIDY0LWJpdCAKZGl2
aXNpb24gdG8gc29sdmUgdGhlIGxpbmsgZmFpbHVyZSBjYXVzZWQgYnkgbWlzc2VkIGxpYmdjYy4g
U2luY2UgCnBhcmFtZXRlciAnZnJvbScgaXMgdTMyLCB0aGVyZSBpcyBubyBuZWVkIHRvIGludm9r
ZSBkb19kaXYgb24gYSAzMi1iaXQgCnBsYXRmb3JtLCB5b3UganVzdCB3YW50IHRvIHN0b3AgdGhl
IHdhc3RpbmcgYmVoYXZpb3Igb24gYSAzMi1iaXQgCnBsYXRmb3JtLiBEbyBJIHVuZGVyc3RhbmQg
cmlnaHQ/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
