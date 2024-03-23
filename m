Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE045C47DD9
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Mar 2024 02:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY+86e9PVbdRrCDt6w5us0zFfQNAJUEkfZ78UaZUb1Q=; b=VylCBrhg4kQNkEj6vTvGO5SQts
	GD9ye8/23GKtK7Gorskj7QmEWUwWYHTIkXzFxTOaAxA6Ai7b/IQ49J8tbuSrJuxBctzAno76xeckf
	mQ+XVGAFyTbKgN2P6E+uETz4igHxTOBdb+VpDMGbwbKpY9725L9CTWUT8Ge9lAklbTEJYHcZaBIW2
	m+zk6ME5/TxhGi2h3Cp515jl4k89WikZQENQeWcYbeOa1HpooK3sNeEAsx1ujLaie2wBifk0wpCvJ
	ZEEESetitxXSUYNAkParjTSjyuTHaFnKKkMLefu2Qo0S19SfNQTQNe8ZICQgE1E1vE3eFt6onzZae
	FcDu7/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnrXt-00000009Hr5-1pVS;
	Sat, 23 Mar 2024 02:55:45 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnrXp-00000009Hoo-3nK1
	for linux-mtd@lists.infradead.org;
	Sat, 23 Mar 2024 02:55:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V1kLn1J3hz1vx4F;
	Sat, 23 Mar 2024 10:54:41 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 93D79140258;
	Sat, 23 Mar 2024 10:55:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 23 Mar 2024 10:55:27 +0800
Subject: Re: [RFC PATCH v2 5/5] ubifs: Introduce ACLs mount options
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>, <corbet@lwn.net>,
	<kent.overstreet@linux.dev>, <agruenba@redhat.com>
CC: <linux-mtd@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20240322154812.215369-1-lizetao1@huawei.com>
 <20240322154812.215369-6-lizetao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e10b4182-a6b6-25f5-b04d-92bc20fa56d4@huawei.com>
Date: Sat, 23 Mar 2024 10:55:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240322154812.215369-6-lizetao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_195542_131357_D74C59F3 
X-CRM114-Status: GOOD (  13.93  )
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

1NogMjAyNC8zLzIyIDIzOjQ4LCBMaSBaZXRhbyDQtLXAOgo+IEltcGxlbWVudCB0aGUgYWJpbGl0
eSB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgQUNMcyBmZWF0dXJlIHRocm91Z2gKPiBtb3VudCBv
cHRpb25zLiAiLW8gYWNsIiBvcHRpb24gbWVhbnMgZW5hYmxlIGFuZCAiLW8gbm9hY2wiIG1lYW5z
IGRpc2FibGUKPiBhbmQgaXQgaXMgZW5hYmxlIGJ5IGRlZmF1bHQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTGkgWmV0YW8gPGxpemV0YW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gdjEgLT4gdjI6Cj4gICAg
KiBSZW1vdmUgcmVkdW5kYW50IGFzc2lnbm1lbnRzIHRvIG1vdW50LmFjbC4KPiAgICAqIEFkZGVk
IHRoZSBkZXNjcmlwdGlvbiBvZiBhY2wgbW91bnQgb3B0aW9ucyBpbiB1Ymlmcy5yc3QuCj4gCj4g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMxOTE2MTY0Ni4yMTUzODY3LTUt
bGl6ZXRhbzFAaHVhd2VpLmNvbS8KPiAKPiAgIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvdWJp
ZnMucnN0IHwgIDQgKysrCj4gICBmcy91Ymlmcy9zdXBlci5jICAgICAgICAgICAgICAgICAgICB8
IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBmcy91Ymlmcy91Ymlmcy5oICAg
ICAgICAgICAgICAgICAgICB8ICAyICsrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy91Ymlmcy5y
c3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ViaWZzLnJzdAo+IGluZGV4IGNlZDJmNzY3
OWRkYi4uZjk2MTUxMDRkN2EzIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZmlsZXN5c3Rl
bXMvdWJpZnMucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy91Ymlmcy5yc3QK
PiBAQCAtMTA1LDYgKzEwNSwxMCBAQCBhdXRoX2tleT0JCXNwZWNpZnkgdGhlIGtleSB1c2VkIGZv
ciBhdXRoZW50aWNhdGluZyB0aGUgZmlsZXN5c3RlbS4KPiAgIGF1dGhfaGFzaF9uYW1lPQkJVGhl
IGhhc2ggYWxnb3JpdGhtIHVzZWQgZm9yIGF1dGhlbnRpY2F0aW9uLiBVc2VkIGZvcgo+ICAgCQkJ
Ym90aCBoYXNoaW5nIGFuZCBmb3IgY3JlYXRpbmcgSE1BQ3MuIFR5cGljYWwgdmFsdWVzCj4gICAJ
CQlpbmNsdWRlICJzaGEyNTYiIG9yICJzaGE1MTIiCj4gK25vYWNsCQkJVGhpcyBvcHRpb24gZGlz
YWJsZXMgUE9TSVggQWNjZXNzIENvbnRyb2wgTGlzdCBzdXBwb3J0LiBJZiBBQ0wgc3VwcG9ydAo+
ICsJCQlpcyBlbmFibGVkIGluIHRoZSBrZXJuZWwgY29uZmlndXJhdGlvbiAoQ09ORklHX0VYVDRf
RlNfUE9TSVhfQUNMKSwgQUNMCj4gKwkJCWlzIGVuYWJsZWQgYnkgZGVmYXVsdCBvbiBtb3VudC4g
U2VlIHRoZSBhY2woNSkgbWFudWFsIHBhZ2UgZm9yIG1vcmUKPiArCQkJaW5mb3JtYXRpb24gYWJv
dXQgYWNsLgpBbHNvIGFkZCBhY2wgZGVzY3JpcHRpb24/ClNwbGl0IGRvY3VtZW50YXRpb24gaW50
byBhIG5ldyBwYXRjaD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
