Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3E2C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 13:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B7E20733
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 13:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="giAVCwOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B7E20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EO2nlQ+u4OYuvixGy1Y2ESsWkacuxAsJVWn3tmGCV50=; b=giAVCwOhxQ4lcj
	SXPZmy9QHigb1PYWPZK+HmqK3DSw+yrjtPDBKk2Lwx5sNd9LprSD0YpDBwwIIhxKXUUscm1djiexk
	bMSQoOBJudXFMiDxdPqxqugw4jVUBHBfq0YPKWPdkINWhnZ0gacmZJk6Zw1brjDVjgL5zUBs20QkT
	z8HeNtManZcclOz2+hQynFxSoR3TilyYggU2hyDQQ+HWLymxIaHRPBsc3gfoGMjJsKt+DJRA8zWJk
	R/2xC5qRHU5+ZX5IdisbMQbNPrXWEi8fDqarzlI8LoIKxtD1wpGH5RFm9Cni7rxLX1TUM8gqB9+l6
	yv9FosdibRDgwHQ8PPZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIuQJ-0000dx-F2; Mon, 30 Mar 2020 13:25:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIuQF-0000d1-Mm
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 13:25:49 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4A829FF806;
 Mon, 30 Mar 2020 13:25:41 +0000 (UTC)
Date: Mon, 30 Mar 2020 15:25:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH v2] mtd:clear cache_state to avoid writing to bad blocks
 repeatedly
Message-ID: <20200330152539.1395e456@xps13>
In-Reply-To: <1585573869-81863-1-git-send-email-nixiaoming@huawei.com>
References: <1585573869-81863-1-git-send-email-nixiaoming@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_062547_879134_AE72C1F9 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: wangle6@huawei.com, vigneshr@ti.com, richard@nod.at,
 zhangweimin12@huawei.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, houtao1@huawei.com, yebin10@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb21pbmcsCgpYaWFvbWluZyBOaSA8bml4aWFvbWluZ0BodWF3ZWkuY29tPiB3cm90ZSBv
biBNb24sIDMwIE1hciAyMDIwIDIxOjExOjA5CiswODAwOgoKPiBUaGUgZnVuY3Rpb24gY2FsbCBw
cm9jZXNzIGlzIGFzIGZvbGxvd3M6Cj4gCW10ZF9ibGt0cmFuc193b3JrKCkKPiAJICB3aGlsZSAo
MSkKPiAJICAgIGRvX2Jsa3RyYW5zX3JlcXVlc3QoKQo+IAkgICAgICBtdGRibG9ja193cml0ZXNl
Y3QoKQo+IAkgICAgICAgIGRvX2NhY2hlZF93cml0ZSgpCj4gCSAgICAgICAgICB3cml0ZV9jYWNo
ZWRfZGF0YSgpIC8qaWYgY2FjaGVfc3RhdGUgaXMgU1RBVEVfRElSVFkqLwo+IAkgICAgICAgICAg
ICBlcmFzZV93cml0ZSgpCj4gCj4gd3JpdGVfY2FjaGVkX2RhdGEoKSByZXR1cm5zIGZhaWx1cmUg
d2l0aG91dCBtb2RpZnlpbmcgY2FjaGVfc3RhdGUKPiBhbmQgY2FjaGVfb2Zmc2V0LiBTbyB3aGVu
IGRvX2NhY2hlZF93cml0ZSgpIGlzIGNhbGxlZCBhZ2FpbiwKPiB3cml0ZV9jYWNoZWRfZGF0YSgp
IHdpbGwgYmUgY2FsbGVkIGFnYWluIHRvIHBlcmZvcm0gZXJhc2Vfd3JpdGUoKQo+IG9uIHRoZSBz
YW1lIGNhY2hlX29mZnNldC4KPiAKPiBCdXQgaWYgdGhpcyBjYWNoZV9vZmZzZXQgcG9pbnRzIHRv
IGEgYmFkIGJsb2NrLCBlcmFzZV93cml0ZSgpIHdpbGwKPiBhbHdheXMgcmV0dXJuIC1FSU8uIFdy
aXRpbmcgdG8gdGhpcyBtdGRibGsgaXMgZXF1aXZhbGVudCB0byBsb3NpbmcKPiB0aGUgY3VycmVu
dCBkYXRhLCBhbmQgcmVwZWF0ZWRseSB3cml0aW5nIHRvIHRoZSBiYWQgYmxvY2suCj4gCj4gUmVw
ZWF0ZWRseSB3cml0aW5nIGEgYmFkIGJsb2NrIGhhcyBubyByZWFsIGJlbmVmaXRzLAo+IGJ1dCBi
cmluZ3Mgc29tZSBuZWdhdGl2ZSBlZmZlY3RzOgo+IDEgTG9zdCBzdWJzZXF1ZW50IGRhdGEKPiAy
IExvc3Mgb2YgZmxhc2ggZGV2aWNlIGxpZmUKPiAzIGVyYXNlX3dyaXRlKCkgYmFkIGJsb2NrcyBh
cmUgdmVyeSB0aW1lLWNvbnN1bWluZy4gRm9yIGV4YW1wbGU6Cj4gCXRoZSBmdW5jdGlvbiBkb19l
cmFzZV9vbmVibG9jaygpIGluIGNoaXBzL2NmaV9jbWRzZXRfMDAyMC5jIG9yCj4gCWNoaXBzL2Nm
aV9jbWRzZXRfMDAwMi5jIG1heSB0YWtlIG1vcmUgdGhhbiAyMCBzZWNvbmRzIHRvIHJldHVybgo+
IAo+IFRoZXJlZm9yZSwgd2hlbiBlcmFzZV93cml0ZSgpIHJldHVybnMgLUVJTyBpbiB3cml0ZV9j
YWNoZWRfZGF0YSgpLAo+IGNsZWFyIGNhY2hlX3N0YXRlIHRvIGF2b2lkIHdyaXRpbmcgdG8gYmFk
IGJsb2NrcyByZXBlYXRlZGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpYW9taW5nIE5pIDxuaXhp
YW9taW5nQGh1YXdlaS5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpUaGUgdGl0bGUgaXMgc3RpbGwgd3JvbmcuCgpBbmQgeW91J2xs
IG5lZWQgYSBGaXhlcyB0YWcgYXMgd2VsbC4gQ2M6IHN0YWJsZSBpcyBhbHNvIGEgZ29vZCBpZGVh
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
