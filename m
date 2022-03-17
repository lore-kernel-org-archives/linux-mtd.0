Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401A2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 01:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1Iwhp+o1AASD7KUbOis+MS1ObrPlQVcY+tun/KFZlU=; b=f90rmQbZr4umsLFOSBcOmvTZO6
	oI9OHDcOXMMwM1Zgy9h/7YpVApXLFuX4Q/qqwi7N2rdmpCSxgfYVklu/T/Mua3LCR2AhNVk6DRPiA
	TGSVdFkzDh777m/Je1dcO7sguNF6jxEOnnSMiqdoD8paS9T617sGU+0aj2F+Y3L/sInixluDewc78
	UC9ZTbyUppYEAyLYbEViXsXH4H4r8a6ZJ39FulsHeVIVy0xHtgeJ9zs0Mg+SWqtW0hkO0NflUHDsE
	EmrbWVXCSa+X9Kf6afjMLnfnfYHIfmHsgGw+ay65hpq7P0KMrPxP53G0pzLEb5JYHJgo14WzxsVri
	2l0o8N2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUf7T-00Efo8-9f; Thu, 17 Mar 2022 01:40:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUf7P-00EfmV-0m
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 01:40:00 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KJqXz3NkjzfYlq;
 Thu, 17 Mar 2022 09:38:27 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 09:39:55 +0800
Subject: Re: [PATCH -next v3 0/2] jffs2: fix two memory leak when mount jffs2
To: Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 yukuai3 <yukuai3@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20220114102854.3399585-1-libaokun1@huawei.com>
 <c0d05cca-2827-481c-f534-d4fb30b91533@huawei.com>
 <936195660.152787.1647468047915.JavaMail.zimbra@nod.at>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <38d3124c-ed5d-d00b-bf72-6ff80cf80cd0@huawei.com>
Date: Thu, 17 Mar 2022 09:39:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <936195660.152787.1647468047915.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_183959_253687_20670FF9 
X-CRM114-Status: UNSURE (   6.62  )
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

5ZyoIDIwMjIvMy8xNyA2OjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAibGliYW9rdW4iIDxsaWJhb2t1bjFAaHVh
d2VpLmNvbT4KPj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiRGF2aWQgV29vZGhv
dXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMu
aW5mcmFkZWFkLm9yZz4sCj4+ICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPgo+PiBDQzogInl1a3VhaTMiIDx5dWt1YWkzQGh1YXdlaS5jb20+LCAibGliYW9rdW4i
IDxsaWJhb2t1bjFAaHVhd2VpLmNvbT4KPj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDEwLiBNw6Ry
eiAyMDIyIDA5OjM0OjM1Cj4+IEJldHJlZmY6IFJlOiBbUEFUQ0ggLW5leHQgdjMgMC8yXSBqZmZz
MjogZml4IHR3byBtZW1vcnkgbGVhayB3aGVuIG1vdW50IGpmZnMyCj4+IEEgZ2VudGxlIHBpbmcs
IHNvcnJ5IGZvciB0aGUgbm9pc2UuCj4gUGF0Y2hlcyBhcHBsaWVkLgo+IFRoYW5rcyBmb3IgZml4
aW5nIQo+Cj4gVGhhbmtzLAo+IC8vcmljaGFyZAo+IC4KCgpUaGFuayB5b3UgZm9yIHlvdXIgcmV2
aWV3IQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApCYW9rdW4gTGkKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
