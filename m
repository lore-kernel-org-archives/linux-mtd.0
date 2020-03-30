Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBF6C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 14:56:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620A02072E
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 14:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ggRtQ+i0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620A02072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiM2lWUKW4HdvLB6o9Rke1vgJc5NUympiyQGb71Dav8=; b=ggRtQ+i0jEjq70
	KuBUw9wM8iTtNa7zGtu/+F4ULtXYiSfA6X6es7U/g8qs1rEp4MKoNEgQvDE0ZaPWIhIpEF1SfGHWL
	8PR7RdHiX1hBYfdgZa9sKnDTET27+UhQDYb/l3ooPwTSrqiivc14stQji3baCbYKOXPr8/zJWufYU
	W5Y7FEUYhFMTA8lzynI0xOnHwKbw9WfX7uYqBqqhliCNBm680qC9O5D06nxVC1B7vw9rALnqlO2Qv
	Ctm/nqPCfGysoQRZG6e8aeGk0ru3jaRlBu643jcsbZ+MrFfrBLsyA/r0BbXXH7/cC3TK+yBePlSko
	W0EPui+uPknuAab+p04Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIvpW-0000JK-8b; Mon, 30 Mar 2020 14:55:58 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIvpS-0000HJ-UR
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 14:55:56 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 225DD20000C;
 Mon, 30 Mar 2020 14:55:48 +0000 (UTC)
Date: Mon, 30 Mar 2020 16:55:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH v3] mtd:fix cache_state to avoid writing to bad blocks
 repeatedly
Message-ID: <20200330165547.4e2acb9a@xps13>
In-Reply-To: <5bf71fe1-2dd1-f45a-5858-433f340b167e@huawei.com>
References: <1585575925-84017-1-git-send-email-nixiaoming@huawei.com>
 <20200330155222.20359293@xps13>
 <5bf71fe1-2dd1-f45a-5858-433f340b167e@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_075555_114325_F48D2E0C 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: wangle6@huawei.com, vigneshr@ti.com, richard@nod.at, houtao1@huawei.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 zhangweimin12@huawei.com, gregkh@linuxfoundation.org, stable@kernel.org,
 yebin10@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb21pbmcsCgpYaWFvbWluZyBOaSA8bml4aWFvbWluZ0BodWF3ZWkuY29tPiB3cm90ZSBv
biBNb24sIDMwIE1hciAyMDIwIDIyOjI1OjM2CiswODAwOgoKPiBPbiAyMDIwLzMvMzAgMjE6NTIs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBYaWFvbWluZywKPiA+IAo+ID4gWGlhb21pbmcg
TmkgPG5peGlhb21pbmdAaHVhd2VpLmNvbT4gd3JvdGUgb24gTW9uLCAzMCBNYXIgMjAyMCAyMTo0
NToyNQo+ID4gKzA4MDA6Cj4gPiAgIAo+ID4+IFRoZSBmdW5jdGlvbiBjYWxsIHByb2Nlc3MgaXMg
YXMgZm9sbG93czoKPiA+PiAJbXRkX2Jsa3RyYW5zX3dvcmsoKQo+ID4+IAkgIHdoaWxlICgxKQo+
ID4+IAkgICAgZG9fYmxrdHJhbnNfcmVxdWVzdCgpCj4gPj4gCSAgICAgIG10ZGJsb2NrX3dyaXRl
c2VjdCgpCj4gPj4gCSAgICAgICAgZG9fY2FjaGVkX3dyaXRlKCkKPiA+PiAJICAgICAgICAgIHdy
aXRlX2NhY2hlZF9kYXRhKCkgLyppZiBjYWNoZV9zdGF0ZSBpcyBTVEFURV9ESVJUWSovCj4gPj4g
CSAgICAgICAgICAgIGVyYXNlX3dyaXRlKCkKPiA+Pgo+ID4+IHdyaXRlX2NhY2hlZF9kYXRhKCkg
cmV0dXJucyBmYWlsdXJlIHdpdGhvdXQgbW9kaWZ5aW5nIGNhY2hlX3N0YXRlCj4gPj4gYW5kIGNh
Y2hlX29mZnNldC4gU28gd2hlbiBkb19jYWNoZWRfd3JpdGUoKSBpcyBjYWxsZWQgYWdhaW4sCj4g
Pj4gd3JpdGVfY2FjaGVkX2RhdGEoKSB3aWxsIGJlIGNhbGxlZCBhZ2FpbiB0byBwZXJmb3JtIGVy
YXNlX3dyaXRlKCkKPiA+PiBvbiB0aGUgc2FtZSBjYWNoZV9vZmZzZXQuCj4gPj4KPiA+PiBCdXQg
aWYgdGhpcyBjYWNoZV9vZmZzZXQgcG9pbnRzIHRvIGEgYmFkIGJsb2NrLCBlcmFzZV93cml0ZSgp
IHdpbGwKPiA+PiBhbHdheXMgcmV0dXJuIC1FSU8uIFdyaXRpbmcgdG8gdGhpcyBtdGRibGsgaXMg
ZXF1aXZhbGVudCB0byBsb3NpbmcKPiA+PiB0aGUgY3VycmVudCBkYXRhLCBhbmQgcmVwZWF0ZWRs
eSB3cml0aW5nIHRvIHRoZSBiYWQgYmxvY2suCj4gPj4KPiA+PiBSZXBlYXRlZGx5IHdyaXRpbmcg
YSBiYWQgYmxvY2sgaGFzIG5vIHJlYWwgYmVuZWZpdHMsCj4gPj4gYnV0IGJyaW5ncyBzb21lIG5l
Z2F0aXZlIGVmZmVjdHM6Cj4gPj4gMSBMb3N0IHN1YnNlcXVlbnQgZGF0YQo+ID4+IDIgTG9zcyBv
ZiBmbGFzaCBkZXZpY2UgbGlmZQo+ID4+IDMgZXJhc2Vfd3JpdGUoKSBiYWQgYmxvY2tzIGFyZSB2
ZXJ5IHRpbWUtY29uc3VtaW5nLiBGb3IgZXhhbXBsZToKPiA+PiAJdGhlIGZ1bmN0aW9uIGRvX2Vy
YXNlX29uZWJsb2NrKCkgaW4gY2hpcHMvY2ZpX2NtZHNldF8wMDIwLmMgb3IKPiA+PiAJY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMgbWF5IHRha2UgbW9yZSB0aGFuIDIwIHNlY29uZHMgdG8gcmV0dXJu
Cj4gPj4KPiA+PiBUaGVyZWZvcmUsIHdoZW4gZXJhc2Vfd3JpdGUoKSByZXR1cm5zIC1FSU8gaW4g
d3JpdGVfY2FjaGVkX2RhdGEoKSwKPiA+PiBjbGVhciBjYWNoZV9zdGF0ZSB0byBhdm9pZCB3cml0
aW5nIHRvIGJhZCBibG9ja3MgcmVwZWF0ZWRseS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFhp
YW9taW5nIE5pIDxuaXhpYW9taW5nQGh1YXdlaS5jb20+Cj4gPj4gUmV2aWV3ZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPj4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcgIAo+ID4gCj4gPiBTdGlsbCBtaXNzaW5nOgo+ID4gKiBGaXhlczogdGFnCj4g
PiAqIFdyb25nIHRpdGxlIHByZWZpeAo+ID4gICAKPiAKPiBGaXhlczogCTFkYTE3N2U0YzNmNDE1
MjRlODggIkxpbnV4LTIuNi4xMi1yYzIiCj4gCj4gSXMgaXQgZGVzY3JpYmVkIGxpa2UgdGhpcz8K
ClRoZSB3YXkgdG8gZGVzY3JpYmUgYSBjb21taXQgaXM6CgpGaXhlczogMWRhMTc3ZTRjM2Y0ICgi
TGludXgtLi4uIikKCkJ1dCBpdCBpcyB0b28gb2xkIHRvIGJlIHBvaW50ZWQsIGp1c3QgZHJvcCBi
b3RoIEZpeGVzL0NjIHRhZ3MgYW5kIGp1c3QKZml4IHRoZSB0aXRsZSBwbGVhc2UuCgo+IAo+IERv
IEkgbmVlZCB0byBnbyB0bwo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2hpc3RvcnkvaGlzdG9yeS5naXQKPiB0byB0cmFjZSBiYWNrIHRoZSBvbGRlciBj
b21taXQgcmVjb3Jkcz8KPiAKPiBUaGFua3MKPiBYaWFvbWluZyBOaQo+IAo+IAo+IAo+IAoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
