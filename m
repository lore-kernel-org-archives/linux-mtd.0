Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB6AC5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 01:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orNRKePay4PtF7yDrfjKoEy5vZdfCsUzFYGB8EOSWJI=; b=3jqCwNYfxP/nfA
	NkOXn9wW+0eUG2/4w3yKWJmaCm89bf5SwN54KMng4z053FTvVIF7DWIChGxBPWWjT7b7qGhD6nEDk
	22UID3QiGV45y8Y6IP47XT9eRoj+DSoFT8lxuTJyGaVNo07jSa/ZzUtJ4EW3MQOJFhGhZMVggc+LX
	KnF/nCDbWFWbIMqlPvx1PUaNo5tO1SUcrLXqebZvihaBE6qkH0HjFCcF+rN79+kFhfoK8QLzVauAZ
	bw9zcvGCbxgGD+gql2BnFJVsJ/lAD6g5VlOZuRxJSpZCEG2iUwUho+3WFYh1C9H9aKKCYzGkxiEl4
	pth862+o4VX6oMaTkvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOqp-00000005TMR-3b8p;
	Mon, 26 Aug 2024 01:48:59 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOql-00000005TKL-3Ck7
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 01:48:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WsYVY0pTkz1S8t2;
	Mon, 26 Aug 2024 09:48:37 +0800 (CST)
Received: from kwepemd100013.china.huawei.com (unknown [7.221.188.163])
	by mail.maildlp.com (Postfix) with ESMTPS id E9C4C1A0188;
	Mon, 26 Aug 2024 09:48:45 +0800 (CST)
Received: from [10.67.109.79] (10.67.109.79) by kwepemd100013.china.huawei.com
 (7.221.188.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 26 Aug
 2024 09:48:45 +0800
Message-ID: <4c7a5574-3e34-49e2-ab93-463d09b9ca37@huawei.com>
Date: Mon, 26 Aug 2024 09:48:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] denali_pci: Fix missing pci_release_regions in
 probe and remove
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
References: <20240814092854.3109192-1-chenridong@huawei.com>
 <20240823192649.43c06026@xps-13>
Content-Language: en-US
From: chenridong <chenridong@huawei.com>
In-Reply-To: <20240823192649.43c06026@xps-13>
X-Originating-IP: [10.67.109.79]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd100013.china.huawei.com (7.221.188.163)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_184856_086467_9B830192 
X-CRM114-Status: UNSURE (   6.36  )
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

CgpPbiAyMDI0LzgvMjQgMToyNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBDaGVuLAo+IAo+
IGNoZW5yaWRvbmdAaHVhd2VpLmNvbSB3cm90ZSBvbiBXZWQsIDE0IEF1ZyAyMDI0IDA5OjI4OjU0
ICswMDAwOgo+IAo+PiBUaGUgcGNpX3JlbGVhc2VfcmVnaW9ucyB3YXMgbWlzcyBhdCBlcnJvciBj
YXNlLCBqdXN0IGFkZCBpdC4KPiAKPiBJIHdhcyBhYm91dCB0byB0YWtlIHRoaXMgYnV0IHRoZSBz
dWJqZWN0IHByZWZpeCBpcyB3cm9uZy4gUGxlYXNlIGZpeCBpdC4KPiAKPiBUaGFua3MsCj4gTWlx
dcOobAoKVGhhbmtzLCBJIHdpbGwgc2VuZCBhIG5ldyBvbmUuCgpUaGFua3MsClJpZG9uZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
