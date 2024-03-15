Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05158C54E67
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8HnFrXlC4SYC0/cenNhl9HwBXFiU4GKTHP7uiQ/RSI=; b=hkFJ/MKd2tEfgnxIc37GFOElwu
	OUDL1pqNzWjzdjBNk+1mvQY3SPEkn34DGdlrryJEfc6iiPuWwJU0t8YjBeUA3pEwp4gdT0QeuNn8y
	opd43hbM7t2N9JU6mtMNil6Hb7t1hr4HZmGlSFZJZlpL2tP+Elhtb1zc8vqUaCGCTucuG2t+tOTwu
	9t2gOudWi5PudjYWndiPm3pLJLdcg5NAtAgBGpRcJmWwC0Wm5eomhEXvJMQlh6LFzOa2FUt5agFrj
	IUp+72B0jgDJnI50dDRxKoP+249o65RLsZesYEdTz/5uSMR9k281yMm2CcMck9i920jAHVynI0LvE
	g2LnrCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl78y-00000000FcT-0HJl;
	Fri, 15 Mar 2024 12:58:40 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl78u-00000000FZf-0WFt
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 12:58:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tx46p4dRSz1FMCq;
	Fri, 15 Mar 2024 20:58:10 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 945701402CC;
	Fri, 15 Mar 2024 20:58:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 20:58:27 +0800
Subject: Re: [RFC PATCH] jffs2: fix recursive fs_reclaim deadlock
To: Qingfang Deng <dqfext@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240315075946.587679-1-dqfext@gmail.com>
 <ff19df82-3fd4-9098-667c-0502b2452334@huawei.com>
 <CALW65jbKBUDN8ybE1oqrNW5VK1QGpZ1RmnFCCzxjQCo4obaA4A@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e5c2c285-0b10-0d23-2c02-7582c026dbfd@huawei.com>
Date: Fri, 15 Mar 2024 20:58:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALW65jbKBUDN8ybE1oqrNW5VK1QGpZ1RmnFCCzxjQCo4obaA4A@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_055836_387296_DB3058E1 
X-CRM114-Status: GOOD (  11.15  )
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

5ZyoIDIwMjQvMy8xNSAyMDoxOSwgUWluZ2ZhbmcgRGVuZyDlhpnpgZM6Cj4gSGkgWmhpaGFvLAo+
IAo+IE9uIEZyaSwgTWFyIDE1LCAyMDI0IGF0IDc6MTnigK9QTSBaaGloYW8gQ2hlbmcgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPj4gSSB0aGluayBpdCdzIGEgZmFsc2UgcG9zaXRp
dmUgd2FybmluZy4gSmZmczIgaXMgdHJ5aW5nIHRvIGdldCByb290IGlub2RlCj4+IGluIHByb2Nl
c3MgJyMxJywgd2hpY2ggbWVhbnMgdGhhdCB0aGUgZmlsZXN5c3RlbSBpcyBub3QgbW91bnRlZAo+
PiB5ZXQoQmVjYXVzZSBkX21ha2Vfcm9vdCBpcyBhZnRlciBqZmZzMl9pZ2V0KHNiLDEpLCB0aGVy
ZSBpcyBubyB3YXkgdG8KPj4gYWNjZXNzIG90aGVyIGlub2Rlcy4pLCBzbyBpdCBpcyBpbXBvc3Np
YmxlIHRoYXQgamZmczIgaW5vZGUgaXMgYmVpbmcKPj4gZXZpY3RlZCBpbiAnIzAnLgo+Pgo+IAo+
IFlvdSdyZSByaWdodCB0aGF0IHByb2Nlc3MgJyMxJyBpcyBnZXR0aW5nIHRoZSByb290IGlub2Rl
LiBIb3dldmVyLAo+IGxvY2tkZXAgb25seSByZWNvcmRzIHRoZSBzdGFjayBvZiB0aGUgZmlyc3Qg
dW5pcXVlIGxvY2sgb3JkZXJpbmcgKHNlZQo+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2xvY2tp
bmcvbG9ja2RlcC1kZXNpZ24uaHRtbCNwZXJmb3JtYW5jZSApLCBhbmQKPiB0aGVyZSBhcmUgbWFu
eSBvY2Nhc2lvbnMgd2hlcmUgR0ZQX0tFUk5FTCBpcyB1c2VkIGluc2lkZSBhCj4gamZmczJfaW5v
ZGVfaW5mbzo6c2VtICdzIGNyaXRpY2FsIHNlY3Rpb24uCj4gLgo+IApBbGxvY2F0aW5nIG1lbW9y
eSB3aXRob3V0IEdGUF9OT0ZTIGZsYWdzIHVuZGVyIHNsZWVwaW5nIGxvY2sgaXMgYSBub3JtYWwg
CnRoaW5nLiBUaGUgdmZzX3dyaXRlIGlzIGFuIGV4YW1wbGUoZWcuIGV4dDQpLCBwYWdlIGlzIGFs
bG9jYXRlZCB3aXRoIApGR1BfV1JJVEVCRUdJTiBmbGFnKG5vIEZHUF9OT0ZTKSB3aGVuIGhvbGRp
bmcgaW5vZGUgbG9jay4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
