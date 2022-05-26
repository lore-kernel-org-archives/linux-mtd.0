Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F561C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 26 May 2022 01:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOhmcgDkpTmrK6OhETgp5iLqezCRGxwXsKYes2zqOtc=; b=KEGj4HW/szwxyL
	zVkFPR9d9Yc37jwR9dZ+yxOoGe6vY9KIO47tMGGgokn7aFYun3gguVK6hz/k9yyeqmHEfesBCRcdk
	MrBTt4ZE0/G+RCSeEt8uNHi9OcJDTo8+umzwIH8Zic3P3KHOIwkf6ST3R69YSIq00RJKIsGO10eja
	cw4+7tSpAZcWbEtsyGdg6JoDCXwMygzWjKMox22M1yAJdaUUOAqDg4oWLdKcaumiyQZ+JbiFE69OF
	yVhSf63eE1++N1IDyiRe39UpCGkDN5Fo0gsJzXShRej9iwlqFU9Nnqcnm5cmk3i6Tx9/aP/TeYMxv
	uatcihhL4Iituuln4o8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2k8-00DEqK-LS; Thu, 26 May 2022 01:56:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2k5-00DEok-Ir
	for linux-mtd@lists.infradead.org; Thu, 26 May 2022 01:56:51 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L7rbz0xYmzgYNr;
	Thu, 26 May 2022 09:55:11 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 09:56:42 +0800
Message-ID: <45daf51c-c9ec-d4d9-1aee-27fe4bb4b1da@huawei.com>
Date: Thu, 26 May 2022 09:56:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH -next] jffs2: fix memory leak in jffs2_do_fill_super
To: Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	yukuai3 <yukuai3@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20220412093816.2280678-1-libaokun1@huawei.com>
 <c2f49973-e5be-475a-1b92-77fc6e86ba37@huawei.com>
 <1917663619.89751.1653338200219.JavaMail.zimbra@nod.at>
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <1917663619.89751.1653338200219.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_185649_840093_08571A6D 
X-CRM114-Status: UNSURE (   7.32  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjIvNS8yNCA0OjM2LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAibGliYW9rdW4iIDxsaWJhb2t1bjFAaHVh
d2VpLmNvbT4KPj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiRGF2aWQgV29vZGhv
dXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMu
aW5mcmFkZWFkLm9yZz4sCj4+ICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPgo+PiBDQzogInl1a3VhaTMiIDx5dWt1YWkzQGh1YXdlaS5jb20+LCAibGliYW9rdW4i
IDxsaWJhb2t1bjFAaHVhd2VpLmNvbT4KPj4gR2VzZW5kZXQ6IE1vbnRhZywgMjMuIE1haSAyMDIy
IDA4OjAwOjIxCj4+IEJldHJlZmY6IFJlOiBbUEFUQ0ggLW5leHRdIGpmZnMyOiBmaXggbWVtb3J5
IGxlYWsgaW4gamZmczJfZG9fZmlsbF9zdXBlcgo+PiBwaW5nCj4gVGhhbmtzIGZvciB5b3VyIHRp
bWUuIFlvdSBwYXRjaCB3aWxsIGJlIHBhcnQgb2YgdGhlIHVwY29taW5nIG1lcmdlIHdpbmRvdy4K
PiBJJ20gcHJlcGFyaW5nIHJpZ2h0IG5vdyBteSBxdWV1ZS4KPgo+IFRoYW5rcywKPiAvL3JpY2hh
cmQKPiAuCgpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQoKLS0gCldpdGggQmVzdCBSZWdhcmRz
LApCYW9rdW4gTGkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
