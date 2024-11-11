Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB5D2E9FF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jc8+Hkn9P0d2T1SOzalsEUsHYLPhPwVucE+ioDETY3E=; b=F4pUDKAOhFMcrPMOno+iw6LayS
	gEnewqZOdxcIesHoekXh6/GuuuCK0NI4gs6m1EiUKvqaNi1b6yQRx8d5/EckTw4spLFUX73+VGHd1
	iwzdMCIngW/Zt4idnMZkrTXkAkTyhxl5bsu2cH7vTgwU/feJfqZupi7NNOlYWbkbY18KOb549kKt3
	zUpwJaA2P5EgWMPby4D47Yp7Zi6HHyWhKhcaixBwvnm6FEFpj8Y/S3JmqLuZU6uwSYtyzfgx7eNJX
	vXzF8YmmFT0XgwGYwLZ9nn/K1oJIEbJNRo/ZlKCtHBbxxt6MLUnSQX3Lorc3M+1OstfPztdqk9y02
	x3xkBsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVFG-00000000IN2-38zj;
	Mon, 11 Nov 2024 14:18:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVC7-00000000HwB-3HY9
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:15:10 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XnBML1wpdz10Qx9;
	Mon, 11 Nov 2024 22:12:30 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C8C2140392;
	Mon, 11 Nov 2024 22:14:57 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 Nov 2024 22:14:56 +0800
Subject: Re: Some information about direct-io support on ubifs
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
	<linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
References: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com>
Date: Mon, 11 Nov 2024 22:14:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_061508_026731_6BB78889 
X-CRM114-Status: GOOD (  14.88  )
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

5ZyoIDIwMjQvMTEvMTEgMTc6MzcsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSDlhpnpgZM6
Cj4gSGkgYWxsCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGhhdmUgc29tZSBpbmZvcm1hdGlvbiBvbiBo
b3cgdG8gaW1wbGVtZW50IGRpcmVjdC1pbwo+IHN1cHBvcnQgaW4gdWJpZnMuIEkgaGF2ZSB0cmll
ZCB0byBtb3VudCBzcXVhc2hmcyBpbWFnZSBhcyBmaWxlIGluCj4gdWJpZnMgdXNpbmcgbG9vcGJh
Y2sgYW5kIGRpcmVjdC1pbyBidXQgaXQgc2VlbXMgdGhhdCBsb29wIGNhbiBub3QKPiBoYW5kbGUg
d2hlbiB0aGlzIGlzIG9uIHRvcCBvZiB1Ymlmcy4gRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBmcm9t
IHRoZQo+IGNvZGUgaXQgc2VlbXMgdGhhdCB0aGUgcmVxdWlyZW1lbnQgaXMgdGhhdCB0aGUgZGly
ZWN0LWlvIGlzCj4gaW1wbGVtZW50ZWQgaW4gdGhlIGZpbGVzeXN0ZW0gd2hlcmUgdGhlIGZpbGUg
aXMgc3RvcmVkLiBJIGhhdmUKPiBzaW11bGF0ZWQgdXNpbmcgbmFuZCBzaW0uIFRoZSBpZGVhIGlz
IHRvIHJlZHVjZSB0aGUgYnVmZmVyaW5nLiBJJ20KPiBvcGVuIHRvIGhhdmUgb3RoZXIgc3VnZ2Vz
dGlvbnMgcmVnYXJkaW5nIHRoaXMgdG9vLgo+IAo+IE1pY2hhZWwKPiAuCj4gCkhpIE1pY2hhZWws
ClRoZXJlIGlzIGEgZGlzY3Vzc2lvbig5IHllYXJzIGFnbykgYWJvdXQgdWJpZnMgZGlvWzFdLCBv
ZiBjb3Vyc2Ugd2UgCmNhbm5vdCBpbXBsZW1lbnQgaXQgYXMgYSBmYWtlIGludGVyZmFjZSBub3cu
CkJlZm9yZSB0YWxraW5nIGFib3V0IGFkZGluZyBkaW8gc3VwcG9ydCBmb3IgVUJJRlMsIGxldCBt
ZSBrbm93IHNvbWUgCmJhY2tncm91bmQgaW5mb3JtYXRpb24uIFdoYXQncyB0aGUgcHVycG9zZSBv
ZiB1c2luZyBkaW8gZm9yIG9wZW5pbmcgCnNxdWFzaGZzIGltYWdlIGZpbGU/IFdoYXQncyB0aGUg
Z29hbCBvZiByZWR1Y2luZyBidWZmZXIgeW91IG1lbnRpb25lZCAKYWJvdmUsIEJldHRlciBwZXJm
b3JtYW5jZT8gTGVzcyBtZW1vcnkgdXNhZ2U/CgoKWzFdIApodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzE0NDAwMTY1NTMtMjY0ODEtMi1naXQtc2VuZC1lbWFpbC1yaWNoYXJkQG5vZC5hdC8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
