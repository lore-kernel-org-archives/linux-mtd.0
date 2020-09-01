Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F368C433E6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 11:42:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3624206FA
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 11:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HH+0DQdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3624206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vj0H2jyigdvHjO+/3YKOrcGSyE+roG0uMPNUHoJn4KE=; b=HH+0DQdp5fITCZ+tnZIxFrutB
	2oH8a6D+nZYwdWiM/Osp8Ij3McgarQRu8m2EHlcB+KiTPHPsScSYodU8AabeubstxVPvqsF0fYQ8g
	3hheZ7L+/956f+VElwqrUAo5mHvQhF83HC394UZRfAQLyvQpO4qK86kew011B9v3vfhIYFayyikwd
	y2fTJRTWdrh2oKR8Nu2BzAXN3DdK6HONs46mUGu/nax03x1tRwoZSJbBUzzyqwr4vC9ehAHLvF1qp
	VDlk+2WBD+tc9GxghhpFNpMd4Bg0aAkDJFf6TBkN9JgRag80KE6xvPWLBIeA3iV17eTVPdbuVJd1a
	rIM8egr1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD4fG-0006iX-K4; Tue, 01 Sep 2020 11:41:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD4fD-0006fQ-SA
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2020 11:41:24 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DDD53A8921BA1AF067FE;
 Tue,  1 Sep 2020 19:41:10 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 1 Sep 2020 19:41:03 +0800
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: =?UTF-8?Q?Matthias_Wei=c3=9fer?= <m.weisser.m@gmail.com>, <p.yadav@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <07f830cf-580a-4bc7-d2c3-6abb8713d332@hisilicon.com>
Date: Tue, 1 Sep 2020 19:41:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_074124_201598_6F4231D3 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGhpYXMsCgoKT24gMjAyMC85LzEgMTQ6MTYsIE1hdHRoaWFzIFdlacOfZXIgd3JvdGU6
Cj4gQW0gRGkuLCAxNi4gSnVuaSAyMDIwIHVtIDE1OjAzIFVociBzY2hyaWViIFlpY29uZyBZYW5n
Cj4gPHlhbmd5aWNvbmdAaGlzaWxpY29uLmNvbT46Cj4+IElmIHRoZSBmbGFzaCdzIHF1YWQgbW9k
ZSBpcyBlbmFibGVkLCBpdCdsbCByZW1haW4gaW4gdGhlIHF1YWQgbW9kZSB3aGVuCj4+IGl0J3Mg
cmVtb3ZlZC4gSWYgd2UgZHJpdmUgdGhlIGZsYXNoIG5leHQgdGltZSBpbiBTUEkvRHVhbCBtb2Rl
LCB0aGVuCj4+IHByb2JsZW0gb2NjdXJzIGFzIHRoZSBmbGFzaCdzIHF1YWQgZW5hYmxlIGJpdCBp
cyBub3QgY2xlYXJlZC4KPiBPbiBmbGFzaCBkZXZpY2VzIHdpdGggYSBub24tdm9sYXRpbGUgcXVh
ZCBlbmFibGUgYml0ICh3ZSB1c2UgUzI1Rkw1MTJTKQo+IHRoaXMgd2lsbCB3ZWFyIG91dCB0aGUg
cXVhZCBlbmFibGUgYml0IGFzIG9uIGV2ZXJ5IGJvb3QgdGhlIGJpdCBpcwo+IHNldCBhbmQgcmVz
ZXQgb24gc2h1dGRvd24uIE9yIGRvIEkgbWlzcyBzb21ldGhpbmcgaGVyZT8KPgo+PiBEaXNhYmxl
IHRoZSBxdWFkIG1vZGUgaW4gc3BpX25vcl9yZXN0b3JlKCksIHRoZSBmbGFzaCB3aWxsIGxlYXZl
Cj4+IHF1YWQgbW9kZSB3aGVuIHJlbW92ZS4gVGhpcyB3aWxsIG1ha2Ugc3VyZSB0aGUgZmxhc2gg
YWx3YXlzIGVudGVyIHRoZQo+PiBjb3JyZWN0IG1vZGUgd2hlbiBsb2FkZWQuCj4gV2UgaGF2ZSBh
IHN5c3RlbSB3aGljaCByZWxpZXMgb24gYW4gZW5hYmxlZCBxdWFkIG1vZGUgb24gYm9vdAo+IChi
b290bG9hZGVyIHVzZXMgcXVhZCBtb2RlIHdpdGhvdXQgZW5hYmxpbmcgaXQpIHNvIHVzaW5nIHRo
aXMgcGF0Y2gKPiB3aWxsIHByZXZlbnQgb3VyIGRldmljZSBmcm9tIGJvb3RpbmcuCgpGb3IgZmxh
c2hlcyBib290IHdpdGggc3RhbmRhcmQgc3BpIG1vZGUgYW5kIHdpdGggcXVhZCBtb2RlIGVuYWJs
ZWQgaW4ga2VybmVsLAppdCB3aWxsIHN0YXkgaW4gcXVhZCBtb2RlIHdoZW4gc2h1dGRvd24gYW5k
IG5leHQgdGltZSBib290LiBUaGlzIHBhdGNoIGludGVuZHMKdG8gYWRkcmVzcyB0aGlzIGlzc3Vl
IGFzIHdlIHNob3VsZCByZXN0b3JlIHRoZSBmbGFzaCdzIG9yaWdpbmFsIHN0YXRlLgoKRm9yIHRo
ZSBmbGFzaGVzIGJvb3Qgd2l0aCBxdWFkIG1vZGUsIHNlZW1zIHdlIGRvbid0IGByZXN0b3JlYCB0
aGUgZmxhc2gncyBzdGF0ZQpjb3JyZWN0bHkuIEl0J3MgYmV0dGVyIHRvIHJlY29yZCB0aGUgZmxh
c2gncyBxdWFkIG1vZGUgc3RhdGUgYW5kIGlmIGl0J3MgaW4gcXVhZAptb2RlIHdoZW4gYm9vdCwg
d2UnbGwgbm90IGRpc2FibGUgaXQgd2hlbiBzaHV0ZG93biBvciByZW1vdmUuCgpSZWdhcmRzLApZ
aWNvbmcKCj4KPiBSZWdhcmRzLAo+IE1hdHRoaWFzCj4gLgo+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
