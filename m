Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95554C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 02:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm/XJFoZVm7CeFG9ohvZFkqIvzc6Lk/FvI4pkm3L1To=; b=FYOxHFnXw7P7oE41qRyAOTiL6P
	BFINiNIaPaRi6N20he3yXppHhps6cMRPLKBIGyDDZft1zPbqZ0D67OeKtgUJPpU/Te9ikE/FNf0YC
	ZnoAaViQM99mX7+VgVeY6cJXExhAhZ2ZoumKrmcza5l2u2+sEzQc1HlrE+hE6x+jJPAyffweJfvAC
	nK+LSA4e7mqRNX1Syv5Y1Ws4yxP3Awf0pJtzKYGdSwr9teei0WFyJwefWhJjrnLa+2AOlsEff3lGe
	v3HcKadh0E02NL3dgkz50dK9lZPzE1YjzxFB0R12796/rNG5pLyItgVVTbkhW4oQTwPyO08X88+Xq
	Aqv3DMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV1vl-0009dK-Kj; Fri, 18 Mar 2022 02:01:29 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV1vh-0009bn-Ok
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2022 02:01:27 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KKRz51XbMzfYpx;
 Fri, 18 Mar 2022 09:59:45 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 10:01:13 +0800
Subject: Re: [PATCH -next] ubifs: rename_whiteout: correct old_dir size
 computing
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, yukuai3 <yukuai3@huawei.com>, chengzhihao1
 <chengzhihao1@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20220215040736.2839939-1-libaokun1@huawei.com>
 <dc55e8b3-7d22-6024-374d-4ed126e18c42@huawei.com>
 <157336576.152785.1647468012272.JavaMail.zimbra@nod.at>
 <a4f8bfff-26ee-95f8-db3c-91ca860a32bd@huawei.com>
 <2008739324.156347.1647556500875.JavaMail.zimbra@nod.at>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <1535fba0-838d-848b-8906-f25929037af9@huawei.com>
Date: Fri, 18 Mar 2022 10:01:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2008739324.156347.1647556500875.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_190126_002500_F1EFB3A3 
X-CRM114-Status: UNSURE (   5.52  )
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

5ZyoIDIwMjIvMy8xOCA2OjM1LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAibGliYW9rdW4iIDxsaWJhb2t1bjFAaHVh
d2VpLmNvbT4KPj4+Pj4gKwo+Pj4+PiArCQkvKiBBZGQgdGhlIG9sZF9kZW50cnkgc2l6ZSB0byB0
aGUgb2xkX2RpciBzaXplLiAqLwo+Pj4+PiArCQlvbGRfc3ogLT0gQ0FMQ19ERU5UX1NJWkUoZm5h
bWVfbGVuKCZvbGRfbm0pKTsKPj4+IFNvIHlvdSBiYXNpY2FsbHkgcmVzZXQgb2xkX3N6IGJhY2sg
dG8gMD8KPj4gWWVzLCByZXNldCBvbGRfc3ogdG8gMCBoZXJlLgo+IE9rYXksIG1ha2VzIHNlbnNl
LiBQYXRjaCBhcHBsaWVkLgo+Cj4gVGhhbmtzLAo+IC8vcmljaGFyZAo+IC4KClRoYW5rIHlvdSBm
b3IgeW91ciByZXZpZXchCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkJhb2t1biBMaQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
