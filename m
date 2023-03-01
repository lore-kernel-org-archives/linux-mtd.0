Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B5C64EC7
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Mar 2023 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rzMcjkALxYATET+xFFlfUvi1GsqiGF4VCinJbskWIk=; b=vnzFTt5OTcBaXxxHcRflJE9ZJk
	Cz/ROVi4hr1+6/hVd4kRbjJ2iZUaK0i7yrNIhFagBxzYNP1xSBNHTq2C/gAZiYJ0ogsVgI4wqTYVi
	b7+PQkBW27gcdBZk0pxE2IuoJb97RGu1RiYs7NVCLkOKKvUaa3dPtHz4JpYQZDWyzefgEi5RmiNAa
	P39L0zwOoK07lkgefbkxHoCtKvmi57Yhm5jSKB4tfQmVsBSNypO6wHMKjGiebftoAEfPsQsHb83MS
	1UIKl4njEFTKlXrMpDPb/S5m6tvLgJzKZepBGkDZ4bnn8Bhi/9uGvYbB55o+904OBXhJH3iqWgsia
	6EQvS0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKPo-00FtZv-Tc; Wed, 01 Mar 2023 11:14:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKPn-00FtYy-S1
	for linux-mtd@bombadil.infradead.org; Wed, 01 Mar 2023 11:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ffZTZ0HpQAbOTDiIOr8aQH1FNKoZG0VYLonffSG0YyM=; b=afbmBhEsJTWmKLF0PeHTo58oMi
	NcKAbgik/zKMq/6WMSoIkdmKoLSXh5Wne2ub0R07eWOztVEG2aX0PD5tG2srvf++vyZzYP69Mue8P
	bWJ8Avtrq/44Ej+LprP0nZMAIKPIXqXiVxiRb3id/64kJlUyiaMi4HV77dw0JI1XtFba82h6fhvJ3
	HOKTJb24IMfRUyUO8WhZKzKwDstGjJzLoVjujhOX3KU0ZGvvnmhgMF4PHaS1aHx+ZlEieD5FI9D3a
	/0bU6WrqdgaWSq5Ru8ixUTA1ZNHvK/w/iKKuIo+ORCEy3zJvLJNw7OJtVqexJlo8fDzmoiwt9iSBI
	oI3kt2tA==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pXKPf-00EsQm-2l
	for linux-mtd@lists.infradead.org;
	Wed, 01 Mar 2023 11:14:27 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PRWky0Ptgz16P7F;
	Wed,  1 Mar 2023 19:11:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 19:14:00 +0800
Subject: Re: [PATCH v2] ubifs: dirty_cow_znode: Fix memleak in error handling
 path
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
References: <20230215022507.2363193-1-chengzhihao1@huawei.com>
 <9121ae91-5b4f-4b10-46fc-6cc0683c949d@huawei.com>
 <34189394.187159.1677657964794.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <299a85b4-aea5-b8b8-394f-4b7093b6a754@huawei.com>
Date: Wed, 1 Mar 2023 19:13:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <34189394.187159.1677657964794.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_111425_439754_C72DA660 
X-CRM114-Status: UNSURE (   5.39  )
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

5ZyoIDIwMjMvMy8xIDE2OjA2LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IFdlIGNhbm5v
dCByZXBsYWNlIHRoZSBwYXRjaCBpbiBsaW51eC1uZXh0LCB0aGUgbWVyZ2Ugd2luZG93IGlzIGFs
cmVhZHkgb3Blbi4KPiBBIGZvbGxvdyB1cCBmaXggaXMgcG9zc2libGUgYWZ0ZXIgNi4zLXJjMSBp
cyBkb25lLiBTbywgbmV4dCB3ZWVrLgoKSXQncyBva2F5LCB0aGFua3MuIEkgd2lsbCBzZW5kIGZp
eCBwYXRjaCBhZ2FpbiBhZnRlciA2LjMtcmMxLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
