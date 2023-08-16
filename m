Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8717CC001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJVkT9ww7yaioLNEsOHguKY8lV2e6KGWivlr2ewGEgo=; b=3ZgA57C52qe2nwWu9wQ+R/3+Eg
	P6CymDGBSdsydOkWBDzau0HU14Smvk6BlZNReK2I3DFazmzocdbiluBAF29KIFsCmRlvkeU0wasr6
	t2UtNZOYcmhoOeHQmjOLeqFlW8D475hVQMn5fEBk46ByLZgnZbSVbAs02v63OpIUwpLODcFJetFo6
	JzJcvBrdbKU+ga2RmSj8p/HMaQZinmbwLDnYwMplX2UwQzBEXxZ2ec8bdolh1MeK6cyCZcrb8hwCW
	xZb+Qt5hS/8FuavJTWw+sI3cMbrPFciubKgPiV8Du20lVYOFLXJpjwNl66MhFxbS+ID8ZxW/EnoGG
	746h7k3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWEO2-003vrM-0R;
	Wed, 16 Aug 2023 11:08:26 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWENy-003vqS-0K
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 11:08:25 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQlgD5kYHzVk9b;
	Wed, 16 Aug 2023 19:06:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 16 Aug 2023 19:08:04 +0800
Subject: Re: Fwd: ubi: fastmap: Fix a series of wear leveling problems
To: Bagas Sanjaya <bagasdotme@gmail.com>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Linux MTD <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
References: <44f5a8f7-0bf4-c986-a0dc-dc12d0cb30ca@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1ee21a88-0969-47f5-fa87-b5090fc7718f@huawei.com>
Date: Wed, 16 Aug 2023 19:08:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <44f5a8f7-0bf4-c986-a0dc-dc12d0cb30ca@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_040823_189315_8195494D 
X-CRM114-Status: GOOD (  13.55  )
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

5ZyoIDIwMjMvOC8xNiAxNzo1NiwgQmFnYXMgU2FuamF5YSDlhpnpgZM6CkhpLAo+IEhpLAo+IAo+
IEkgbm90aWNlIGEgYnVnIHJlcG9ydCB3aXRoIHByb3Bvc2VkIGZpeGVzIG9uIEJ1Z3ppbGxhIFsx
XS4gUXVvdGluZyBmcm9tIGl0Cj4gKG9ubHkgdGhlIGZpcnN0IHByb2JsZW0gdGhhdCBpcyBxdW90
ZWQpOgo+IAo+PiBQcm9ibGVtIDE6IGxhcmdlIGVyYXNlIGNvdW50ZXIgZm9yIHNpbmdsZSBmYXN0
bWFwIGRhdGEgUEVCCj4+Cj4+IENvbmZpZzoKPj4geDg2XzY0IHFlbXUKPj4gZmxhc2g6IG5hbmRz
aW0KPj4gQ09ORklHX01URF9VQklfV0xfVEhSRVNIT0xEPTEyOAo+PiBDT05GSUdfTVREX1VCSV9G
QVNUTUFQPXkKPj4gdWJpLT5iZWJfcnN2ZF9wZWJzPTAKPj4KPj4gUnVubmluZyBmc3N0cmVzcyBv
biB1YmlmcyBmb3IgM2goZmFzdG1hcCBkYXRhIFBFQiBoYXMgbGFyZ2UgZXJhc2UgY291bnRlciB0
aGFuIG90aGVycyk6Cj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+PiBmcm9tICAgICAgICAgICAgICB0byAgICAgY291bnQgICAgICBt
aW4gICAgICBhdmcgICAgICBtYXgKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IDAgICAgICAgIC4uICAgICAgICA5OiAgICAgICAg
MCAgICAgICAgMCAgICAgICAgMCAgICAgICAgMAo+PiAxMCAgICAgICAuLiAgICAgICA5OTogICAg
ICA1MzIgICAgICAgODQgICAgICAgOTIgICAgICAgOTkKPj4gMTAwICAgICAgLi4gICAgICA5OTk6
ICAgIDE1Nzg3ICAgICAgMTAwICAgICAgMTQ3ICAgICAgMjI5Cj4+IDEwMDAgICAgIC4uICAgICA5
OTk5OiAgICAgICA2NCAgICAgNDY5OSAgICAgNDc2NSAgICAgNDgyNgo+PiAxMDAwMCAgICAuLiAg
ICA5OTk5OTogICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAKPj4gMTAwMDAwICAg
Li4gICAgICBpbmY6ICAgICAgICAxICAgMjcyOTM1ICAgMjcyOTM1ICAgMjcyOTM1Cj4+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBU
b3RhbCAgICAgICAgICAgICAgIDogICAgMTYzODQgICAgICAgODQgICAgICAxODAgICAyNzI5MzUK
Pj4gUEVCIDgwMzEoZWM9MjcyOTM1KSBpcyBhbHdheXMgdGFrZW4gZm9yIGZhc3RtYXAgZGF0YS4K
Pj4KPj4gQWZ0ZXIgZml4LCBydW5uaW5nIGZzc3RyZXNzIG9uIHViaWZzIGZvciAxMmgobm8gcG9v
bCByZXNlcnZhdGlvbiksIG5vIGluZGl2aWR1YWwgcGViIGhhcyBiaWcgZXJhc2UgY291bnRlcjoK
Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Cj4+IGZyb20gICAgICAgICAgICAgIHRvICAgICBjb3VudCAgICAgIG1pbiAgICAgIGF2ZyAg
ICAgIG1heAo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4gMCAgICAgICAgLi4gICAgICAgIDk6ICAgICAgICAwICAgICAgICAwICAg
ICAgICAwICAgICAgICAwCj4+IDEwICAgICAgIC4uICAgICAgIDk5OiAgICAgICAgMCAgICAgICAg
MCAgICAgICAgMCAgICAgICAgMAo+PiAxMDAgICAgICAuLiAgICAgIDk5OTogICAgMTYzMjAgICAg
ICA2MDkgICAgICA2NDIgICAgICA3MDUKPj4gMTAwMCAgICAgLi4gICAgIDk5OTk6ICAgICAgICAw
ICAgICAgICAwICAgICAgICAwICAgICAgICAwCj4+IDEwMDAwICAgIC4uICAgIDk5OTk5OiAgICAg
ICA2NCAgICAxODE3NiAgICAxODIzNCAgICAxODMwMwo+PiAxMDAwMDAgICAuLiAgICAgIGluZjog
ICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAKPj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IFRvdGFsICAgICAgICAg
ICAgICAgOiAgICAxNjM4NCAgICAgIDYwOSAgICAgIDcxMCAgICAxODMwMwo+IAo+IFNlZSBCdWd6
aWxsYSBmb3IgdGhlIGZ1bGwgdGhyZWFkICh3aXRoIG90aGVyIHByb2JsZW1zIG1lbnRpb25lZCkg
YW5kCj4gYXR0YWNoZWQgcGF0Y2ggc2VyaWVzIHRoYXQgZml4ZXMgdGhlbS4KPiAKPiBaaGloYW86
IEkgYXNrZWQgeW91IG9uIEJaIHRvIHNlbmQgeW91ciBwYXRjaGVzIHRvIGxpbnV4LW10ZCBsaXN0
LAo+IGJ1dCB5b3UgZGlkbid0IHJlc3BvbmQgdGhlcmUuIFdvdWxkIHlvdSBsaWtlIHRvIHNlbmQg
dGhlbSBmb3IKPiByZXZpZXc/Cj4gCgpTb3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UuIFll
cywgSSBoYXZlIHNlbnQgdGhlIGZpeCBwYXRjaGVzIGluIApodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvP3Nlcmllcz0zNjg1MzQuCkFueSBzdWdnZXN0
aW9ucyBhcmUgd2VsY29tZWQuCgoKPiBUaGFua3MuCj4gCj4gWzFdOiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzc4Nwo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
