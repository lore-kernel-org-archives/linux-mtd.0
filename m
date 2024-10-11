Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D9BCFD35C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pxGLVoBzhn6Cwy8jXv1twrLw3Z7gSIiAJkbpid3ecs=; b=sRuJCtHo0NVsDC11zhzwK040G2
	EUVvwUNrT9oKY2GLiYGAKyeY4GCxlXY59/JaWzFFyJ87dKliO8nrycoovmTe8DVSYxwLKk/GvG6mg
	Kw2+PX6G/hNL6saSEiegfWKgv201tgYN/ck2MwL+K6aryO1bVi7CYV3v2+YNhNGI/fMFzsuXYYJ9i
	4VslyvN7YCX2D2bU0OPBMVZSEodTSk7O4w+38/ClnU4zpCo5cX9vDEIfHmH4506EmtNB0Eur9/PNW
	lTGJf3BUiTCKSUzS5Tc529L9hHQVUHdJKRCSgEzdS4pQIyU9waOd1B4+XUIfUZEMN1GUL3PiOV1bH
	Uy9GNAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEZw-0000000GGZz-3rDc;
	Fri, 11 Oct 2024 12:17:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEPi-0000000GDzr-028Q
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:06:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XQ51J2Y9qz20q8R;
	Fri, 11 Oct 2024 20:05:40 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 21AD8140361;
	Fri, 11 Oct 2024 20:06:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:06:18 +0800
Subject: Re: [PATCH v2 07/10] ubi: Add mean erase counter sysfs attribute for
 fastmap area
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-7-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <56f29646-c275-eee9-b761-13ca1ba2edbb@huawei.com>
Date: Fri, 11 Oct 2024 20:06:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-7-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050634_323651_7DC1B24E 
X-CRM114-Status: GOOD (  10.23  )
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
YXIgb2YgdGhlIGZhc3RtYXAgYXJlYS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNrYXJkIEFuZGVy
c3NvbiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4gLS0tCj4gICBEb2N1bWVudGF0aW9u
L0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpIHwgOCArKysrKysrKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3N0YWJs
ZS9zeXNmcy1jbGFzcy11YmkgYi9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3Mt
dWJpCj4gaW5kZXggNTM1YTNlNmRhYjEyLi4wNWE3MDFiMDNhOWEgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWNsYXNzLXViaQo+ICsrKyBiL0RvY3VtZW50YXRp
b24vQUJJL3N0YWJsZS9zeXNmcy1jbGFzcy11YmkKPiBAQCAtMjI2LDMgKzIyNiwxMSBAQCBLZXJu
ZWxWZXJzaW9uOgk2LlgKPiAgIENvbnRhY3Q6CWxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gICBEZXNjcmlwdGlvbjoKPiAgIAkJTWVhbiBwaHlzaWNhbCBlcmFzZWJsb2NrIGVyYXNlIGNv
dW50ZXIgdmFsdWUuCj4gKwo+ICtXaGF0OgkJL3N5cy9jbGFzcy91YmkvdWJpWC9tZWFuX2VjX2Zh
c3RtYXAKPiArRGF0ZToJCU9jdG9iZXIgMjAyNAo+ICtLZXJuZWxWZXJzaW9uOgk2LlgKPiArQ29u
dGFjdDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiArRGVzY3JpcHRpb246Cj4gKwkJ
TWVhbiBwaHlzaWNhbCBlcmFzZWJsb2NrIGVyYXNlIGNvdW50ZXIgdmFsdWUgZm9yIHRoZSBmYXN0
bWFwCj4gKwkJYXJlYS4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
