Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233DEC433E1
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 01:13:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C920D20771
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 01:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JPr0dYZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C920D20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XnyyhfUbh8Ly9zyPeJjHSg4BgxMbb56L7vseAGC9qL0=; b=JPr0dYZlXvtOB/WK5fXtjIwh+
	yAdLvtI8BmHBFnohtMKFtZ/lnfF/sI0fUgcy1y5bdg5FwRgGzfgQ4bJfxpdwCkiTLAvR0kq6rfxUK
	qsUJInvs/5Seb2lOoae5MiNz3twHqbvR5TjAyVqyNikaN68wNH4VuPdhOYLroeZoAbfUtJ2I/uPEK
	eBIZN8hosiC2G68Ae/+cEuQzkrMcy3E+o5fsOeZpSrh/hiH6/4ALniTWtvvkDqcCpCaJMBGSenYi6
	4iPtX/QLChaFC6r8eXwS+vC+f5IALobu7CKLxA+zWr7APQvCDJih6C/DcwB2sbViBFwzqTZql3N+H
	S0TGRQnlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqRI0-0000qK-RH; Wed, 01 Jul 2020 01:11:52 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqRHu-0000pz-Ag
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 01:11:47 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E0F2A8E5951461185D81;
 Wed,  1 Jul 2020 09:11:40 +0800 (CST)
Received: from [10.133.219.224] (10.133.219.224) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Jul 2020 09:11:35 +0800
Subject: Re: [PATCH 0/3] fixes for ubifs xattr operations
To: Richard Weinberger <richard@nod.at>
References: <20200630130438.141649-1-houtao1@huawei.com>
 <25305185.75764.1593522901565.JavaMail.zimbra@nod.at>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <8ed3f848-a1d2-e1ce-a3b0-d4e6d2d12d9d@huawei.com>
Date: Wed, 1 Jul 2020 09:11:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <25305185.75764.1593522901565.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-Originating-IP: [10.133.219.224]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_211146_666578_2A042923 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDIwLzYvMzAgMjE6MTUsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPiBUYW8s
Cj4gCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJIb3UgVGFvIiA8
aG91dGFvMUBodWF3ZWkuY29tPgo+PiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJs
aW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPj4gQ0M6ICJIb3UgVGFv
IiA8aG91dGFvMUBodWF3ZWkuY29tPgo+PiBHZXNlbmRldDogRGllbnN0YWcsIDMwLiBKdW5pIDIw
MjAgMTU6MDQ6MzUKPj4gQmV0cmVmZjogW1BBVENIIDAvM10gZml4ZXMgZm9yIHViaWZzIHhhdHRy
IG9wZXJhdGlvbnMKPiAKPj4gSGksCj4+Cj4+IFRoZSBwYXRjaCBzZXQgdHJpZXMgdG8gZml4IHRo
ZSByYWNlIGJldHdlZW4gdWJpZnMgeGF0dHIgcmVhZAo+PiBvcGVyYXRpb25zIGFuZCB3cml0ZSBv
cGVyYXRpb25zLgo+Pgo+PiBOb3cgaW5vZGVfbG9jaygpIGlzIGFjcXVpcmVkIGR1cmluZyB4YXR0
ciB3cml0ZSBvcHMgKHNldCAmIHJlbW92ZSksCj4+IGhvd2V2ZXIgbm8gZXh0cmEgbG9jayBpcyB0
YWtlbiBpbiB4YXR0ciByZWFkIG9wcyAobGlzdCAmIGdldCksIGFuZAo+PiBpdCBsZWFkcyB0byB0
aHJlZSBwcm9ibGVtczoKPj4KPj4gKDEpIHViaWZzX2xpc3R4YXR0cigpIG1heSBpbmN1ciBtZW1v
cnkgY29ycnVwdGlvbiBhbmQgYXNzZXJ0aW9uIGZhaWx1cmUKPj4KPj4gKDIpIHViaWZzX3hhdHRy
X2dldCgpIG1heSBpbmN1ciBhc3NlcnRpb24gZmFpbHVyZQo+Pgo+PiAoMykgdWJpZnNfeGF0dHJf
Z2V0KCkgbWF5IHJldHVybiBhIHN0YWxlIHhhdHRyIHZhbHVlCj4+Cj4+IFRvIGZpeCBpdCwgaW5z
dGVhZCBvZiBhZGRpbmcgYSB4YXR0ci1yZWxhdGVkIHJ3c2VtIGZvciB1YmlmcyBpbm9kZSwKPj4g
d2UgZGVjaWRlIHRvIGZpeCB0aGVzZSBwcm9ibGVtcyBzaW1wbHkgYW5kIHN0aWxsIGRvIHhhdHRy
IHJlYWQgb3BlcmF0aW9uCj4+IGxvY2tsZXNzbHkuIFRoZSBtYWpvciBjb25jZXJuIGlzIHRoYXQg
eGF0dHIgcmVhZCBvcGVyYXRpb25zIChsaXN0ICYgZ2V0KQo+PiBtYXkgcmV0dXJuIHhhdHRyIG5h
bWVzIG9yIHZhbHVlcyB3aGljaCBpcyBzdGlsbCBpbiBjcmVhdGlvbiBvciByZW1vdmFsCj4+IHBy
b2Nlc3MsIGJ1dCB3ZSB0aGluayB0aGF0J3MgT0sgYmVjYXVzZSBubyBzdGFsZSBuYW1lIG9yIHZh
bHVlIGlzCj4+IHJldHVybmVkLCBqdXN0IGVpdGhlciB0aGUgb2xkIG9uZXMgb3IgdGhlIG5ldyBv
bmVzLgo+Pgo+PiBDb21tZW50cyBhcmUgd2VjbG9tZS4KPiAKPiBUaGFua3MgYSBsb3QgZm9yIGRp
Z2dpbmcgaW50byB0aGlzLgo+IERvIHlvdSBoYXZlIGEgdGVzdCBmb3IgdGhpcz8gKHhmc3Rlc3Qg
cHJlZmVyZWQpLgo+IApUaGUgZmlyc3QgdHdvIHByb2JsZW0gY2FuIGJlIHJlcHJvZHVjZWQgcmVs
YXRpdmVseSBlYXNpbHksIGFuZCB0aGUgdGhpcmQgcHJvYmxlbQppcyBoYXJkIHRvIHJlcHJvZHVj
ZSAoSSBkbyBpdCB0aHJvdWdoIGluamVjdGluZyBkZWxheSBpbiB4YXR0ciBvcHMpLCBzbyBJIHdp
bGwKYWRkIHhmc3Rlc3RzIGZvciB0aGUgZmlyc3QgdHdvIHByb2JsZW0gZmlyc3RseSwgdGhlbiBJ
IHdpbGwgdHJ5IHRvIGFkZCBhbiB4ZnN0ZXN0cwpmb3IgdGhlIGxhc3Qgb25lLiBNYXliZSB3ZSBj
YW4gYWRkIGEgdGhpbiAiaW5mcmFzdHJ1Y3R1cmUiIGxheWVyIHRvIGluamVjdCBkZWxheS4KCj4g
SSdtIGEgYml0IHN1cnByaXNlZCB0aGF0IHRoaXMgY2FuIGFjdHVhbGx5IGhhcHBlbiwgSSB3YXMg
dW5kZXIgdGhlIGltcHJlc3Npb24KPiB0aGF0IHZmcyBjYXJlcyBhYm91dCB0aGlzLgo+IApNb3N0
IGZpbGVzeXN0ZW1zIGhhbmRsZSB0aGUgcmFjZSBieSBhZGRpbmcgYSBydy1zZW1hcGhvcmUsIGJ1
dCBJIHRoaW5rIHdlIGNhbgpzaW1wbHkgZG8gaW4gYSAibG9ja2xlc3MiIHdheS4KClJlZ2FyZHMs
ClRhbwoKPiBUaGFua3MsCj4gLy9yaWNoYXJkCj4gLgo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
