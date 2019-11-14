Return-Path: <SRS0=UT8Q=ZG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189AAC432C3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 13:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8C220715
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 13:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z3UeMyXt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF8C220715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7Flk7CrL5T3UY8EFuJyZEiWvGZf18ns//fqsmfwcd4=; b=Z3UeMyXtt3sxGA
	505Wf1E7v9ZliPCfSa/W/qRqIA+7yb4LrCRpGdzlqSOXVZOqOIVHWJUXnj1l8xXCx5ooYMDE7g6cM
	eR6clBA7yMTEeJawoDqawFUDdgwhQRAHMTiMtbPXl87r7oPEtEoG9g9K5WqafImZ6cE9lOUZ2g/I6
	lFTKuWjEiaRAS+E1nO7t//9jvIhw+h2MiEKVn/L26tKvW/YP7z8UylI7EqCAAWOI/AIkGgbYOMhxm
	1kC9KwHhxuuWTYJSzwheM7wbtKhKNrtU+FYKBWevuB+WJv5Uxxr+TIdWQoK28WiBk+zCJybVo90Le
	GT1qO6pLZ5LIkUV+oGoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVEwD-0002yX-Fj; Thu, 14 Nov 2019 13:13:29 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVEw8-0002xd-F4
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2019 13:13:27 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 18CACFB1E458C6647982;
 Thu, 14 Nov 2019 21:13:16 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 14 Nov 2019 21:13:13 +0800
Subject: Re: [PATCH -next] ubi: remove unused variable 'err'
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20191114072236.15104-1-yuehaibing@huawei.com>
 <20191114110053.4fbeb918@xps13>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <f9a8e5f3-cea9-a251-9627-63dfb34149c7@huawei.com>
Date: Thu, 14 Nov 2019 21:13:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20191114110053.4fbeb918@xps13>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_051326_311851_A5A1343A 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAxOS8xMS8xNCAxODowMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBZdWUsCj4gCj4g
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZSBvbiBUaHUsIDE0IE5vdiAy
MDE5IDE1OjIyOjM2Cj4gKzA4MDA6Cj4gCj4+IGRyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5jOjUxMjo2
OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ2VycicgWy1XdW51c2VkLXZhcmlhYmxlXQo+Pgo+
PiBjb21taXQgMzQyN2RkMjEzMjU5ICgibXRkOiBubyBuZWVkIHRvIGNoZWNrIHJldHVybiB2YWx1
ZQo+PiBvZiBkZWJ1Z2ZzX2NyZWF0ZSBmdW5jdGlvbnMiKSBsZWF2ZSB0aGlzIHZhcmlhYmxlIG5v
dCB1c2VkLgo+IAo+IFRoYW5rcyBmb3IgdGhlIGZpeCBidXQgSSBhbHJlYWR5IGZpeGVkIHRoaXMg
dHJpdmlhbCBpc3N1ZSwgSSBqdXN0Cj4gZGlkIG5vdCBoYWQgdGltZSB5ZXN0ZXJkYXkgbmlnaHQg
dG8gcHVzaCBpdCwgbm93IGl0IGlzIGRvbmUuIEl0IHdpbGwKPiBiZSBwYXJ0IG9mIHRvbW9ycm93
J3MgbGludXgtbmV4dCByZWxlYXNlLgoKT2ssIHRoYW5rcyBmb3IgdGhlIGluZm8uCgo+IAo+IENo
ZWVycywKPiBNaXF1w6hsCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
