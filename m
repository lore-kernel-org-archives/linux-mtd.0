Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACFACFD370
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dyEedSfDX42KMDRnuwcwn+X4VejZNdVHKPxygtMbG0=; b=YIRmJoOHAuNW1S0mx5mTUhaylo
	rZciR3ZXNGRsYDPq4MGi8PyIw7HG31pNfu5rqXM/FJpeZlB/qhHZda8KZ2IixRjP95SpVKPc3wbG9
	4dQ1GBgyNUPEsIAv0uVzwQiqyfYWdavwrfbO45WBn+hsiGFYmyG7bN/wafg30QDcfnr4OwmxXT7Pr
	Y1OZtHWJyqo+KSZxpvS9+koOEPtMoo5uMLXMLDtPk6YUu2uLLEKoDqq5NGUEmatji1IODcJExBe0a
	khaUgNRO6NCrWrpeQvitO/RQCwG/KYbFXaCeew2qHineULGWyYbmDmS5+rHyB0Z8vlWVjKffU3w7k
	EAN3kt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEZx-0000000GGaS-2iwD;
	Fri, 11 Oct 2024 12:17:09 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEPq-0000000GE3u-0YWL
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:06:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XQ52V3mqlz32755;
	Fri, 11 Oct 2024 20:06:42 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AAAB4140361;
	Fri, 11 Oct 2024 20:06:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:06:32 +0800
Subject: Re: [PATCH v2 08/10] ubi: Add max erase counter sysfs attribute for
 fastmap area
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-8-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9a7f1df8-2695-9eee-cc01-7cb36cc0fdeb@huawei.com>
Date: Fri, 11 Oct 2024 20:06:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-8-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050642_507026_9B50A57B 
X-CRM114-Status: GOOD (  10.42  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBBIG1heCBlcmFz
ZSBjb3VudGVyIHNwZWNpZmljYWxseSBmb3IgdGhlIGZhc3RtYXAgYXJlYSBnaXZlcyBhIGJldHRl
cgo+IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGZsYXNoIHdlYXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Umlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+IC0tLQo+ICAg
RG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWNsYXNzLXViaSB8IDggKysrKysrKysKPiAg
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpIGIvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxl
L3N5c2ZzLWNsYXNzLXViaQo+IGluZGV4IDA1YTcwMWIwM2E5YS4uNjJjOTNmZGEwYmM0IDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1jbGFzcy11YmkKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpCj4gQEAgLTc4LDYgKzc4
LDE0IEBAIENvbnRhY3Q6CUFydGVtIEJpdHl1dHNraXkgPGRlZGVraW5kQGluZnJhZGVhZC5vcmc+
Cj4gICBEZXNjcmlwdGlvbjoKPiAgIAkJTWF4aW11bSBwaHlzaWNhbCBlcmFzZWJsb2NrIGVyYXNl
IGNvdW50ZXIgdmFsdWUuCj4gICAKPiArV2hhdDoJCS9zeXMvY2xhc3MvdWJpL3ViaVgvbWF4X2Vj
X2Zhc3RtYXAKPiArRGF0ZToJCU9jdG9iZXIgMjAyNAo+ICtLZXJuZWxWZXJzaW9uOgk2LlgKPiAr
Q29udGFjdDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiArRGVzY3JpcHRpb246Cj4g
KwkJTWF4aW11bSBwaHlzaWNhbCBlcmFzZWJsb2NrIGVyYXNlIGNvdW50ZXIgdmFsdWUgZm9yIGEg
YmxvY2sKPiArCQlpbiB0aGUgZmFzdG1hcCBhcmVhLgo+ICsKPiAgIFdoYXQ6CQkvc3lzL2NsYXNz
L3ViaS91YmlYL21heF92b2xfY291bnQKPiAgIERhdGU6CQlKdWx5IDIwMDYKPiAgIEtlcm5lbFZl
cnNpb246CTIuNi4yMgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
