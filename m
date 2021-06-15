Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917BAC48BE5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 17:01:39 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE5C6115C
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 17:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE5C6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7vNNyWEYXW47WkaOudeAef9PaeEuh5I0yR5MpV1XGk=; b=baTaPIpyzJZ4utbzIZ3p4gEj1K
	SDUnkoSMsttLuxQH96bAFYzFeU+CESO4hAGzUXHfuskbrZb+y2H6HaWgUgnd3Y1vMkybQKppmGcIo
	scmaYGEfHIJ4EMT787Ouwczkp73by//3T0Pe/TZxtGykwHBjxR8gbKd7Z3z2rf4x1hWj+o76KDN6T
	PBxihG/2GSonFyMNKcsShWxFg2OJu7asgwMEvQQc93mN6gZvrqmzQ800tCBktMBak+AH72W8JbWsQ
	7t0AmUzh5ZfaxaDfig8S9MxZN3M4/pBShXOugiJFGS4p1ax/3HX5QbY/Tm1xVlaKb3B61CixS2nQL
	ToGwFx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltCPH-001YF5-Ib; Tue, 15 Jun 2021 16:59:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9IW-000DwX-GL
 for linux-mtd@bombadil.infradead.org; Tue, 15 Jun 2021 13:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=uwr8Nlmjt/psBKk67+Qa3PRlmNK6YVQuqgbbB7VM75g=; b=iWuCX4JOaElwV3nRsBoxZuwd5N
 HJ46TA9GWYXnFuyTB0f5y3G9IylTnq41ANiApJoAHMlIqU46EKEc9ESfGnhTJOk4y2NNrdldZt4LK
 3XQiw3jrlNoWSbFj7PQRbWgDjzAYHXJLuf8qkeKXt2J0di+JLV4vbmsjoemijvPIArQqdhed7ShXL
 +kkqEv/f/P9hQw5Wp/gljG5QcVoTnoT2vdBWMaZmf0XcigZBe7cA4hsBt8TG429KjX+BVbsgobfgh
 xnEGMVztBw1zWR8wxFNA3PHEGtLujw5cDknLL8UPK26de2louEiy+4HFJA7RTMk7vhr7vVlVnV9JY
 bZ8rSLFQ==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt4xi-007XYU-Us
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 09:02:31 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G42KQ6Bv5z63Zn;
 Tue, 15 Jun 2021 16:58:18 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 17:02:14 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 15 Jun 2021 17:02:13 +0800
Subject: Re: [PATCH 0/6] Fix deadlock in ftl formating on mtd
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
 <20210613171208.64395d32@xps13>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5cbc703a-d5d1-7344-bcd3-fee1bb7278f7@huawei.com>
Date: Tue, 15 Jun 2021 17:02:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210613171208.64395d32@xps13>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_100230_139716_A1EA195A 
X-CRM114-Status: GOOD (  10.64  )
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

5ZyoIDIwMjEvNi8xMyAyMzoxMiwgTWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gSGkgWmhpaGFvLAo+
Cj4gWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGUgb24gU3VuLCAx
MyBKdW4gMjAyMQo+IDE5OjMwOjI5ICswODAwOgo+Cj4+IFRoZXJlIGlzIGFuIEFBLWRlYWRsb2Nr
IHByb2JsZW0gd2hpbGUgZm9ybWF0aW5nIG10ZCBkZXZpY2UgdG8gZ2VuZXJhdGUKPj4gYSBmdGwg
ZGV2aWNlLiBGaXggaXQgYnkgcmV2ZXJ0aW5nICJtdGQ6IGFsbG93IHRvIHVubG9hZCB0aGUgbXRk
dHJhbnMKPj4gbW9kdWxlIGlmIGl0cyBibG9jayBkZXZpY2VzIGFyZW4ndCBvcGVuIiByZWNvbW1l
bmRlZCBpbiBbMV0uCj4+Cj4gSSB1bmRlcnN0YW5kIHRoYXQgc29tZSBmaXhlcyBuZWVkIHRvIHJl
dmVydCBhIGNvdXBsZSBvZiBwYXRjaGVzLCBidXQKPiBpc24ndCByZXZlcnRpbmcgNiBjb21taXRz
IGZyb20gdGhlIHYyLjYuMzIga2VybmVsIGEgYml0IG9kZCBmb3IgdGhhdD8KPiBBdCBsZWFzdCwg
Y2FuIHlvdSBqdXN0aWZ5IHRoaXMgY2hvaWNlPyBBcmUgYWxsIHRoZXNlIGNvbW1pdHMgdXNlbGVz
cwo+IGFuZCBidWdneT8KPgpIaSBNaXF1ZWwsCgpUaGlzIHNlcmllcyBvZiByZXZlcnQgcGF0Y2hl
cyBjYW1lIGZyb20gaGlzdG9yeSBjb21taXRzIHdoaWNoIHJlbGF0ZWQgCndpdGggIm10ZDogYWxs
b3cgdG8gdW5sb2FkIHRoZSBtdGR0cmFucyBtb2R1bGUgaWYgaXRzIGJsb2NrIGRldmljZXMgCmFy
ZW4ndCBvcGVuIi4gSSBhZG1pbiBpdCdzIGEgd2VpcmQgbWV0aG9kIGFuZCBsZXQncyBmb3JnZXQg
aXQuCkFmdGVyIHNvbWUgbG9jYWwgdGVzdHMsIEkgdGhpbmsgd2UnZCBiZXR0ZXIgcmVzZXJ2ZSAi
bXRkOiBhbGxvdyB0byAKdW5sb2FkIHRoZSBtdGR0cmFucyBtb2R1bGUgaWYgaXRzIGJsb2NrIGRl
dmljZXMgYXJlbid0IG9wZW4iIHRvIHN1cHBvcnQgCnJlbW92aW5nIG10ZGJsb2NrIG1vZHVsZSBp
ZiBubyBvbmUgdGFrZXMgaXQuIEJ1dCB3ZSBtYXkgbW92ZSBnZXR8cHV0IAptdGRfZGV2aWNlIGlu
dG8gYWRkfGRlbF9tdGRfYmxrdHJhbnMgdG8gc29sdmUgZGVhZGxvY2sgcHJvYmxlbSwgbWF5YmUg
d2UgCmRvbid0IGhhdmUgdG8gZ2V0X210ZF9kZXZpY2UgZWFjaCB0aW1lIG9wZW4gbXRkIGJsb2Nr
IGRldmljZSBpbiAKYmxrdHJhbnNfb3BlbiBpZiB3ZSBoYXZlIGNhbGxlZCBnZXRfbXRkX2Rldmlj
ZSgpIGluIAphZGRfbXRkX2Jsa3RyYW5zX2RldigpLiBTZWUgdjIgIm10ZDogbXRkX2Jsa2RldnM6
IEdldHxQdXQgbXRkX2RldmljZSBpbiAKYWRkfGRlbF9tdGRfYmxrdHJhbnMiLgoKPiBUaGFua3Ms
Cj4gTWlxdcOobAo+IC4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
