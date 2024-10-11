Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C82CFD36E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgPfAtdX6AQ20ku4fpYIINlgmbI9S7u2oyV+PzxNcFY=; b=Aw3xvNiVeiKsWPtJqpsokVHAJJ
	xPOXDWmdyjs5zlQkIOAbvOqJzcExzF87XxIkIUyV2CeVM6afVTKmKowmncL1I7AlsNwnbAMU+FL/f
	cn3W8fdJ18x8TgimtodxSTM1qIx2FqphwHuCmu0AhLIw4gO6uV23+6RjDcWshYUM7pQmgDEiFwP/O
	XrldYDITs4h5UCut7BGaRn6NbFl2/N6mgpJik40/9ANeIj7o8DtXT8mAQ6NFSoLAjqgLPtGzaPfx/
	Yeod8JVSYTznz0b/t1DQxIrSVn4eN9E1Our1NSzD1WZYnv/l7jj6nbtYXVIX5pm75iNwbdPafohWN
	PfKPT5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEZw-0000000GGZV-190v;
	Fri, 11 Oct 2024 12:17:08 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEPd-0000000GDzs-0NYe
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:06:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XQ4zp2rRhz10N5x;
	Fri, 11 Oct 2024 20:04:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id ACD0B140157;
	Fri, 11 Oct 2024 20:06:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:06:07 +0800
Subject: Re: [PATCH v2 06/10] ubi: Add mean erase counter sysfs attribute
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-6-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e65b5621-472e-5f5f-4fcd-ee21be9b1bb5@huawei.com>
Date: Fri, 11 Oct 2024 20:06:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-6-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050629_990004_50404A72 
X-CRM114-Status: GOOD (  11.47  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBBIG1lYW4gZXJh
c2UgY291bnRlciBnaXZlcyBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBmbGFzaAo+IHdl
YXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJz
c29uQGF4aXMuY29tPgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWNs
YXNzLXViaSB8IDcgKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+
IAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1jbGFzcy11YmkgYi9E
b2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpCj4gaW5kZXggYTZiMzI0MDE0
NjkyLi41MzVhM2U2ZGFiMTIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxl
L3N5c2ZzLWNsYXNzLXViaQo+ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1j
bGFzcy11YmkKPiBAQCAtMjE5LDMgKzIxOSwxMCBAQCBEZXNjcmlwdGlvbjoKPiAgIAkJTG9naWNh
bCBlcmFzZWJsb2NrIHNpemUgb2YgdGhpcyB2b2x1bWUuIEVxdWl2YWxlbnQgdG8gbG9naWNhbAo+
ICAgCQllcmFzZWJsb2NrIHNpemUgb2YgdGhlIGRldmljZSBhbGlnbmVkIG9uIHRoZSB2b2x1bWUg
YWxpZ25tZW50Cj4gICAJCXZhbHVlLgo+ICsKPiArV2hhdDoJCS9zeXMvY2xhc3MvdWJpL3ViaVgv
bWVhbl9lYwo+ICtEYXRlOgkJT2N0b2JlciAyMDI0Cj4gK0tlcm5lbFZlcnNpb246CTYuWAo+ICtD
b250YWN0OglsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ICtEZXNjcmlwdGlvbjoKPiAr
CQlNZWFuIHBoeXNpY2FsIGVyYXNlYmxvY2sgZXJhc2UgY291bnRlciB2YWx1ZS4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
