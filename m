Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B042C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y946r20zlE6a7Kqpox70HMx5lk4KOzpx0M+hrbecKHI=; b=sWwxxCJhMZb+ub
	MeQ8+z0j2Ny8fSrLMyFkiCujp+p3KtI1cBgT6Fa2mKQqUrpes/IC0rKAehs3v6fiLPjAHD1jgDB3G
	wYhZYWq87jk0jLSrA1BPqqce8qPOu5XhayT3bKiVyFyL04qgfVmfmdIUYPl8XQ7dJWsgj+Wae1spL
	5gXtB10vB/noFzZPGx6VmLQxfBZBGaphuyM8cst5BXf8cHwIJsqfrSieaDuZUKeyIzch5ypHl06po
	pNL6YnYj6mmDlA42ZajbUkWbmKxeCMGo1xL/BuSsGGJWAvpWpJENU6CvwRY+5eCSJ56B9rDyzQ5zY
	m/eLvmt8N+lxARl8DJkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qf6-002wk6-R0; Thu, 16 Jun 2022 14:39:56 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qdG-002uNM-F4
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 14:38:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1BA05240007;
	Thu, 16 Jun 2022 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655390276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AffThJ0/PxGNjxerxTAn0ejOKaeR6A8gRvY3EvAGqMk=;
	b=QXO2bGvu8Trep4mecw9AonLkzv9k4fOr6tBtBkomlPNpXhphHVgHbi7Hhj8hmxPcARoW/n
	6lp9/a+RL+/O3SN8dJ8P2jd4lBFJwVfmxjK4r9ZkC4HfK0QBke6ZkAJOzVAFb6cR076aQ5
	nTO/gG//tf3+mdtkQuebFCofIDBicPCR8IOKAeVEIsZB87/ZMLWAblNI+n02dd27VOC6nV
	uJrDpHaaiBQVvgNwIh648zJcMef6aAPHJVyydWSAtt7SP3o9zQELt4isdUgjS/jbExUnTw
	L+yLeRPq004Pna/T7Js29Yz2olNWugJQrjYe+ed3U4wC/EkvXw8juumsREhtrA==
Date: Thu, 16 Jun 2022 16:37:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
Message-ID: <20220616163751.2b5962df@xps-13>
In-Reply-To: <62aa76ad.1c69fb81.7e2d3.0c8e@mx.google.com>
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
	<20220615000612.3119-2-ansuelsmth@gmail.com>
	<20220615171132.GA3606@thinkpad>
	<62aa76ad.1c69fb81.7e2d3.0c8e@mx.google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_073802_670203_E1A9CB62 
X-CRM114-Status: GOOD (  14.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5zdWVsL0NocmlzdGlhbiwKCmFuc3VlbHNtdGhAZ21haWwuY29tIHdyb3RlIG9uIFRodSwg
MTYgSnVuIDIwMjIgMDI6MTg6MDggKzAyMDA6Cgo+IE9uIFdlZCwgSnVuIDE1LCAyMDIyIGF0IDEw
OjQxOjMyUE0gKzA1MzAsIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIFdlZCwg
SnVuIDE1LCAyMDIyIGF0IDAyOjA2OjEwQU0gKzAyMDAsIEFuc3VlbCBTbWl0aCB3cm90ZTogIAo+
ID4gPiBSZW9yZGVyIHN0cnVjdHMgaW4gbmFuZGMgZHJpdmVyIHRvIHNhdmUgaG9sZXMuCj4gPiA+
IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29t
PiAgCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2Vy
bmVsLm9yZz4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWFuaQo+ID4gIAo+IAo+IEknbSBzZW5kaW5n
IHY4IHdpdGggYSBkaWZmZXJlbnQgU29iIHNvIEknbSBub3QgYWRkaW5nIHRoZSByZXZpZXcgdGFn
IChpbgo+IHY4KS4KPiBJbiBzaG9ydCB0aGUgbmV3IFNvYiBpcyB3aGF0IEkgd2lsbCB1c2Ugb253
YXJkcywgd2FudGVkIHRvIGtlZXAgdGhlCj4gQW5zdWVsIHJlZmVyZW5jZSBidXQgaXQgd2FzIHN1
Z2dlc3RlZCB0byB1c2UgQ2hyaXN0aWFuIE1hcmFuZ2kgYW5kCj4gbm90aGluZyBtb3JlLiBJdCdz
IGp1c3QgYSBuYW1lIGNoYW5nZSBhbmQgd2UgYXJlIHRoZSBzYW1lIHBlcnNvbiBhbmQKPiBub2Jv
ZHkgaXMgc3RlYWxpbmcgb3duZXJzaGlwIG9mIHRoZSBwYXRjaC4KPiBTb3JyeSBmb3IgdGhlIG1l
c3MuCgpNbW1oIHN0cmFuZ2UsIGJ1dCBva2F5LiBZb3UgYXJlIHN1cHBvc2VkIHRvIGNvbnRyaWJ1
dGUgd2l0aCB5b3VyIHJlYWwKaWRlbnRpdHksIG5vdCB1bmRlciBwc2V1ZG9ueW0gYW55d2F5LgoK
QWxzbywgeW91IGNvdWxkIGhhdmUga2VwdCBNYW5pJ3MgUi1ieSBpbiB2OCBidXQgYW55d2F5LiBN
YW5pLCBjYW4KeW91IHJlc2VuZCB0aGVtPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
