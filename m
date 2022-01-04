Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A27C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 04:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlsVdTqFkWm3ULR7fCWjNJF5U/z9+ATMPYgr8PxekY0=; b=wqPXnSPAwwnF9/gWPQczL4Oz6U
	imJryQJuPkRhvQz4WNG0Nnw55QcfUQsWraFSB9pplqF4JGiFXXo+y3SH0s0J2OmNrn9ZWc6eVLKyV
	nDyE6C6VGP2dkTGW9oHesO6JfGlN9ImPpu21rXA3prqRcRfBdJQJIrY9dQ7OQY1HamS/iUq0Bwgnz
	/DY8NI9SkHJhbhg3wBLgG5wlg7WbvnnO/fz+pxl8e/G/OQMM3AsHDPPIPQAM44sNSwW+ACad3X2bO
	vlhQGGFiG0WhW0FF1BQQJ/kWmaxT/ALvvH5iCOoGS06opxIBnjAafn7XKFOGgxBbs0nZ3ZtPmcd5G
	u4XlDa+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4azk-00AJ55-Ab; Tue, 04 Jan 2022 04:00:20 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4azh-00AJ4d-3v
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 04:00:18 +0000
Received: from kwepemi500003.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JSf2g6hQQz8wDf
 for <linux-mtd@lists.infradead.org>; Tue,  4 Jan 2022 11:57:31 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500003.china.huawei.com (7.221.188.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 12:00:05 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 12:00:05 +0800
Subject: Re: UBIFS: ubifs_recover_leb() always execute fix_unclean_leb() even
 all the nodes are valid
To: =?UTF-8?B?6Z+p5LuB5p2w?= <hanrenjie123@gmail.com>
CC: <linux-mtd@lists.infradead.org>
References: <CADPmmj4xHLvptkPXga-Cv1WfBr+qXbaib1io1FUfRx+Ac1e+sQ@mail.gmail.com>
 <9c6d1f5d-0f84-4e2a-3d05-9bbb11eb985c@huawei.com>
 <CADPmmj6kcEYYHE4w-BKQ2y4ceATTU7N=h-M821ksrt1eTLpiOg@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0b3bb085-2313-e965-9402-1e100def5425@huawei.com>
Date: Tue, 4 Jan 2022 12:00:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADPmmj6kcEYYHE4w-BKQ2y4ceATTU7N=h-M821ksrt1eTLpiOg@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_200017_367450_BEB4452E 
X-CRM114-Status: GOOD (  11.84  )
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

SGksIOS7geadsAo+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4gSSBzYXcgdGhlIGNvbW1lbnQg
aW4gdGhlIGNvbW1pdCwgYnV0IEkgZG9u4oCZdAo+IHVuZGVyc3RhbmQgdGhlIG1lYW5pbmcgb2Yg
dW5zdGFibGUgYml0cyB2ZXJ5IHdlbGwuIERvZXMgaXQgbWVhbiB0aGF0Cj4gdW5zdGFibGUgYml0
cyBtYXkgYXBwZWFyIGluIHRoZSBhcmVhIGFmdGVyIHRoZSBjdXJyZW50IG9mZnNldCBhbmQgY2F1
c2UKPiBzdWJzZXF1ZW50IHdyaXRlIG9wZXJhdGlvbnMgdG8gZmFpbD8gQnV0IHdoZW4gSSBjb3B5
IHRoZSBvcmlnaW5hbCBkYXRhCj4gdG8gYW5vdGhlciBQRUIsIHRoZXJlIHNob3VsZCBiZSB0aGUg
c2FtZSBwcm9iYWJpbGl0eSB0aGF0IHVuc3RhYmxlIGJpdHMKPiB3aWxsIGFwcGVhcj8KSSBtZWFu
dCB1bnN0YWJsZSBiaXRzIG1heSBsb29rIGdvb2QgaW4gZmlyc3QgcmVjb3ZlcnkgcHJvY2Vzcywg
YnV0IHRoZXkgCm1pZ2h0IGJlIGNoYW5nZWQgYWZ0ZXIgcnVubmluZyBmb3IgYSB3aGlsZS4KPiBJ
IGhhdmUgYSBndWVzcy4gSXMgaXQgcG9zc2libGUgdGhhdCB0aGUgZGF0YSBpcyBjb3BpZWQgdG8g
YW5vdGhlciBQRUIKPiBiZWNhdXNlIHRoZXJlIG1heSBiZSBtb3JlIHVzZWxlc3MgZGF0YSBpbiB0
aGUgY3VycmVudCBQRUIgaW4gb3JkZXIKPiB0byByZWNvdmVyIHRoZSBlbnRpcmUgUEVCPwo+IApM
YXN0IHdyaXR0ZW4gbGVicyBhcmUgcHJvY2Vzc2VkIGJ5IHViaWZzX3JlY292ZXJfbGViKCksIHNv
bWUgb2YgdGhlbSAKY2FycnkgbXVjaCB1c2VmdWxsIGRhdGEsIGxpa2UgR0NIRCBhbmQgREFUQUhE
KGZvciBjcmVhdGlvbiBub2RlcykuIEluIG15IApvcGluaW9uLCBmaXhfdW5jbGVhbl9sZWIoKSBp
cyB1c2VkIHRvIGhhbmRsZSBoYXJkd2FyZSBlcnJvci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
