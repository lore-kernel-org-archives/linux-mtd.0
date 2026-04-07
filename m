Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A169FFB5178
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2026 01:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n+p27wezoLjHsnLWjE//U+UptzIfNn3sJsa1lRiN6I=; b=4gQCi5J8z/VQiIJ4aacmuAo4Bt
	UDIQGfQmTTdrZ6jNpYJ4osQMgcoXtkWauLbjkis96QjUmUpQ1nVKsgIzeMf3WWJbRSw++h+cWEoI7
	eIpJFZgLqlF903yr93zDywHxk6nOjLSQWnfg6dbSXYXbBKpsACj/8sUGQHa7O6MePBjlHNQhfs0sI
	CuBrtM2kN5ujUfsrmQYt+42Lf/sfp1vl0V/E13uo2S2LDjtnFS0AJHzhQRajSuFUo5P3Zsc5TxPvd
	NA/8tDQPM1tgBEv7KZQL97SkvnBF+QzSq+ePgiR7WC8ApnpfbFQDaFI9dNE8T+w+HgVV0lrYaa9Kb
	GreLOdQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9v7z-00000005hki-3rLR;
	Tue, 07 Apr 2026 01:21:15 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9v7u-00000005hkF-0BAP
	for linux-mtd@lists.infradead.org;
	Tue, 07 Apr 2026 01:21:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PCDQ30Z5fZrjSgwZtjdGnhfHilDxL8jMDIq0KDcBbWo=;
	b=j8dXM8r9pQBEbDpH8J5QnKKUefO+JLbXNpgKh+V06se/w+325SarZo5tG+gIq/BWqfx0YT5P5
	PaIeVv1XTpkyDR0MudN6qshs/nNskRp/q+K3n7IOGJX4UELTr9+h7NB8TRnVmpHjRxLdeLS+DOy
	xdj4SPlUIPnP6Rz1ABsa03s=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fqSsc4jbBzKm6G;
	Tue,  7 Apr 2026 09:14:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C32344055B;
	Tue,  7 Apr 2026 09:20:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Apr 2026 09:20:59 +0800
Subject: Re: [PATCH] [JFFS2] update dead link in kconfig help text
To: Julian Braha <julianbraha@gmail.com>, <dwmw2@infradead.org>,
	<richard@nod.at>, <adobriyan@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260405162252.163276-1-julianbraha@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f27875bd-432a-087e-e957-431c77f23347@huawei.com>
Date: Tue, 7 Apr 2026 09:20:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260405162252.163276-1-julianbraha@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_182110_561249_297DFC8F 
X-CRM114-Status: GOOD (  13.98  )
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

1NogMjAyNi80LzYgMDoyMiwgSnVsaWFuIEJyYWhhINC0tcA6Cj4gVGhlIGV4aXN0aW5nIGh0dHA6
Ly93d3cuZ3ppcC5vcmcvemxpYi8gbGluayBpbiB0aGUgaGVscCB0ZXh0IGdpdmVzIGEgNDA0Cj4g
ZXJyb3IuIEkgYmVsaWV2ZSB0aGUgbW9zdCB1cC10by1kYXRlIHdlYnNpdGUgZm9yIHpsaWIKPiBp
cyBodHRwczovL3d3dy56bGliLm5ldC8KPiAKPiBMZXQncyB1cGRhdGUgaXQuCj4gCj4gVGhpcyBk
ZWFkIGxpbmsgd2FzIGZvdW5kIGJ5IGtjb25maXJtLCBhIHN0YXRpYyBhbmFseXNpcyB0b29sIGZv
ciBLY29uZmlnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhbiBCcmFoYSA8anVsaWFuYnJhaGFA
Z21haWwuY29tPgo+IC0tLQo+ICAgZnMvamZmczIvS2NvbmZpZyB8IDIgKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAoKUmV2aWV3ZWQtYnk6IFpo
aWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2ZzL2pm
ZnMyL0tjb25maWcgYi9mcy9qZmZzMi9LY29uZmlnCj4gaW5kZXggNTYwMTg3ZDYxNTYyLi4yODlk
YzI1ZjYyY2IgMTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvS2NvbmZpZwo+ICsrKyBiL2ZzL2pmZnMy
L0tjb25maWcKPiBAQCAtMTE5LDcgKzExOSw3IEBAIGNvbmZpZyBKRkZTMl9aTElCCj4gICAJaGVs
cAo+ICAgCSAgWmxpYiBpcyBkZXNpZ25lZCB0byBiZSBhIGZyZWUsIGdlbmVyYWwtcHVycG9zZSwg
bGVnYWxseSB1bmVuY3VtYmVyZWQsCj4gICAJICBsb3NzbGVzcyBkYXRhLWNvbXByZXNzaW9uIGxp
YnJhcnkgZm9yIHVzZSBvbiB2aXJ0dWFsbHkgYW55IGNvbXB1dGVyCj4gLQkgIGhhcmR3YXJlIGFu
ZCBvcGVyYXRpbmcgc3lzdGVtLiBTZWUgPGh0dHA6Ly93d3cuZ3ppcC5vcmcvemxpYi8+IGZvcgo+
ICsJICBoYXJkd2FyZSBhbmQgb3BlcmF0aW5nIHN5c3RlbS4gU2VlIDxodHRwczovL3d3dy56bGli
Lm5ldC8+IGZvcgo+ICAgCSAgZnVydGhlciBpbmZvcm1hdGlvbi4KPiAgIAo+ICAgCSAgU2F5ICdZ
JyBpZiB1bnN1cmUuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
