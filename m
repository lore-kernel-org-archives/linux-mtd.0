Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB81FE81806
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 01:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJTaNQObJt6iH0mEhBqLRCTwAqWbMOdgheTb+0mO7Tg=; b=kKp8+btv9cU6pA
	HaNfhTmCaNCMFp/vE/lpaSrM8HS9LS67Na8L8DB504OJHpOAQEX8grzlGupgifDM8lKitozeULzNL
	J2Tb7B+EUkgIicJ0x1s2aHkRDdHmcw5CQRM2Pftmp/dxjHQCMI+xnbNvmr9EkPMF5J8oaQRo5ssM+
	nIMlkeLXE/j9s9KN05YwyJAbFiXwkO4NcIvImnOpaxplNHB7STC7lt8Kou0DRdoqP9Po0xy38OxBp
	GyiW2KuhO6KfIClzeA/qRnhqzmxkFX8LlaHCvraz79E/DH3DXZd0yxciSXt+wvZFR8y/yfTAwJPr5
	W4leFNZMf3aTMwYcqG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkwYr-00FKdu-06;
	Tue, 26 Sep 2023 01:08:25 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkwYn-00FKdO-1H
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 01:08:23 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RvhNB6WwVzMlt2;
	Tue, 26 Sep 2023 09:04:26 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 09:08:07 +0800
Message-ID: <bd8c4e2b-2538-11d9-ed5c-34cd302703e2@huawei.com>
Date: Tue, 26 Sep 2023 09:08:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>
CC: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	chengzhihao1 <chengzhihao1@huawei.com>, yi zhang <yi.zhang@huawei.com>,
	yangerkun <yangerkun@huawei.com>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
 <1131184426.81026.1695650583370.JavaMail.zimbra@nod.at>
 <20230925163727.7ecebe9a@xps-13>
 <488305749.81257.1695653971403.JavaMail.zimbra@nod.at>
 <20230925170642.089e543b@xps-13>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <20230925170642.089e543b@xps-13>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_180821_597364_62CBAB0B 
X-CRM114-Status: UNSURE (   8.06  )
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

Cj4gcmljaGFyZEBub2QuYXQgd3JvdGUgb24gTW9uLCAyNSBTZXAgMjAyMyAxNjo1OTozMSArMDIw
MCAoQ0VTVCk6Cj4KPj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4gVm9uOiAi
TWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+Pj4gR2l2ZW4gdGhp
cyBhIHNlY29uZCB0aG91Z2h0LiBJIGRvbid0IHRoaW5rIGEgTkFORCBkcml2ZXIgaXMgYWxsb3dl
ZCB0byByZXR1cm4KPj4+PiBsZXNzIHRoYW4gcmVxdWVzdHMgYnl0ZXMgYW5kIHNldHRpbmcgRUJB
RE1TRy4KPj4+PiBVQkkncyBJTyBwYXRoIGhhcyBhIGNvbW1lbnQgb24gdGhhdDoKPj4+Pgo+Pj4+
ICAgICAgICAgICAgICAgICAgLyoKPj4+PiAgICAgICAgICAgICAgICAgICAqIFRoZSBkcml2ZXIg
c2hvdWxkIG5ldmVyIHJldHVybiAtRUJBRE1TRyBpZiBpdCBmYWlsZWQgdG8gcmVhZAo+Pj4+ICAg
ICAgICAgICAgICAgICAgICogYWxsIHRoZSByZXF1ZXN0ZWQgZGF0YS4gQnV0IHNvbWUgYnVnZ3kg
ZHJpdmVycyBtaWdodCBkbwo+Pj4+ICAgICAgICAgICAgICAgICAgICogdGhpcywgc28gd2UgY2hh
bmdlIGl0IHRvIC1FSU8uCj4+Pj4gICAgICAgICAgICAgICAgICAgKi8KPj4+PiAgICAgICAgICAg
ICAgICAgIGlmIChyZWFkICE9IGxlbiAmJiBtdGRfaXNfZWNjZXJyKGVycikpIHsKPj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWJpX2Fzc2VydCgwKTsKPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgZXJyID0gLUVJTzsKPj4+PiAgICAgICAgICAgICAgICAgIH0KPj4+IEludGVyZXN0
aW5nLiBTaGFsbCB3ZSBhZGQgdGhpcyBjaGVjayB0byB0aGUgbXRkX3JlYWQoKSBwYXRoIGFzIHdl
bGw/Cj4+Pgo+Pj4gTWF5YmUgd2l0aCBhIFdBUk5fT04oKT8KPj4gV0FSTl9PTl9PTkNFKCksIHBs
ZWFzZS4gQnV0IHllcywgbGV0J3MgYWRkIGl0Lgo+IFpoYW9sb25nLCBjYW4geW91IHRha2UgY2Fy
ZSBvZiBpdD8KPgo+PiBUaGFua3MsCj4+IC8vcmljaGFyZAo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwK
CgpZZXPvvIFUaGF0IGlzIGEgZ29vZCBpZGVhLCBhbmQgSSBhbSBwbGVhc2VkIHRvIGRvIHRoaXMu
CgpUaGFua3MsClpoYW9sb25nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
