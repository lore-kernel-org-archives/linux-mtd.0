Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D189CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1bvtGLC4yZ51APE76DDdXcY23MoO/rodHnE2t8mPaE=; b=IsaQsUnd21eB0M0K9D2Wxz5Bfg
	ExrSe5GOwetrxurDjCjK1Hp5Ynz8IuRs1Ukiqu6wmt1bRQM+hqwA5Ec5xue0muIeQy1S0BPtBH0zx
	xG6AmLDEi/fWfnRetefnwJ2vi62eqM57XQVFKeroWyNwjG/zekFBo92BnN5keDVtZknm2HQbv68/Y
	rRClM8fzZSQCvNllfv+WuPowim4t9/CxP0JBCzySVG7GPKPSDPj2sgCJt4zUlTLzJ720sfGmlI+HV
	dyVpm7Z8YmeTXGdR7UKoEfzUGNUajoJsIOq2+gSx4mar7fyzrRttMMnHt5zj5scnU5Fi4JsHzreW9
	5ZRRhmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qupUv-006fDL-0q;
	Mon, 23 Oct 2023 07:37:13 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qupUq-006fBh-2A
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 07:37:11 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SDRhl5q81zcdJs;
	Mon, 23 Oct 2023 15:31:51 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 23 Oct 2023 15:36:41 +0800
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Richard Weinberger <richard@nod.at>
CC: ZhaoLong Wang <wangzhaolong1@huawei.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	dpervushin <dpervushin@embeddedalley.com>, Artem Bityutskiy
	<Artem.Bityutskiy@nokia.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>,
	yangerkun <yangerkun@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com>
 <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at>
 <891e554b-c133-6378-3a65-836fc9147e54@huawei.com>
 <441107100.23734.1697904580252.JavaMail.zimbra@nod.at>
 <93b2d5ab-e36c-be08-7343-ef4ca16f991d@huawei.com>
 <879960555.29268.1698045341596.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <12400272-4449-040c-1ccd-6494a67f4da0@huawei.com>
Date: Mon, 23 Oct 2023 15:36:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <879960555.29268.1698045341596.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_003709_422723_3664251A 
X-CRM114-Status: GOOD (  10.17  )
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

5ZyoIDIwMjMvMTAvMjMgMTU6MTUsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gLS0tLS0g
VXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KPj4+PiBJZiB3ZSBhZGQgbmV3IGlvY3RscyB0byBjb250cm9sIGNy
ZWF0aW9uL2Rlc3Ryb3lpbmcgb2YgZ2x1ZWJpLCB0aGVuCj4+Pj4gZ2x1ZWJpIG10ZCB3b24ndCBi
ZSBhdXRvbWF0aWNhbGx5IGNyZWF0ZWQgd2hlbiBVQkkgdm9sdW1lIGlzIGFkZGVkLiBJJ20KPj4+
PiBub3QgY2VydGFpbiB3aGV0aGVyIHRoaXMgY2hhbmdlIHdpbGwgZWZmZWN0IGV4aXN0aW5nIHN0
YXJ0dXAgcHJvY2Vzcwo+Pj4+IHRoYXQgZGVwZW5kcyBvbiBnbHVlYmkuCj4+PiBMZXQncyB0YWtl
IGEgc3RhY2sgYmFjay4gVGhlIHNvbGUgcHVycG9zZSBvZiBnbHVlYmkgaXMgcHJvdmlkaW5nCj4+
PiBhIHdheSB0byBydW4gSkZGUzIgb24gdG9wIG9mIFVCSS4KPj4gSXMgaXQgcG9zc2libGUgdGhh
dCBzb21lb25lIHJ1bnMgZXh0NCBvbiBtdGRibG9jayBiYXNlZCBvbiBnbHVlYmksIGZvcgo+PiB0
aGUgYWR2YW50YWdlIG9mIHdlYXItbGV2ZWxpbmc/Cj4gVW5sZXNzIHRoZXkgd2FudCB0byBraWxs
IHRoZWlyIE5BTkQgaW1tZWRpYXRlbHksIG5vLgo+IFVCSWJsb2NrIGhhdCBpbml0aWFsbHkgYW4g
UlctTW9kZSBidXQgaXQgd2FzIHJlamVjdGVkIGJlY2F1c2UKPiBVQkkgaXMgbm90IGFuIEZUTCBh
bmQgd2lsbCBhbGwgZGFuZ2Vyb3VzIHNldHVwcy4KPgo+IFdoYXQgSSdtIHRyeWluZyB0byBzYXkg
aXMsIEknZCBsaWtlIHRvIGF2b2lkIGFkZGluZyBjb21wbGljYXRlZCBzb2x1dGlvbnMKPiBvciB3
b3JrYXJvdW5kcyBqdXN0IHRvIG1ha2UgYXJ0aWZpY2lhbCBzdGFja2luZyBvZiBvdXRkYXRlZCBN
VEQgY29tcG9uZW50cwo+IHBvc3NpYmxlLgo+IExldCdzIGtlZXAgdGhlIGJpZyBwaWN0dXJlIGlu
IG1pbmQuCgpNYWtlcyBzZW5zZS4gWmhhb2xvbmcgYW5kIEkgZGlkbid0IG1ha2UgY2xlYXIgdGhl
IGJvdW5kYXJ5IGJldHdlZW4gRlRMIAphbmQgdWJpYmxvY2svZ2x1ZWJpLiBOb3csIEkgYmVsaWV2
ZSB0aGF0IFVCSSBuZWVkbid0IGJlIHJlc3BvbnNpYmxlIG11Y2ggCmZvciB0aGUgZXh0ZW5zaW9u
IG1lY2hhbmlzbShlZy4gbXRkYmxvY2sgYmFzZWQgb24gZ2x1ZWJpKS4gU28sIGxldCdzIApwaWNr
IHlvdXIgc29sdXRpb24uCgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPgo+IC4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
