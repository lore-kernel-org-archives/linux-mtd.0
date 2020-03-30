Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218A9C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 08:45:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E378A20757
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 08:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmnbZG3l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E378A20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FzklAQKgqacerKSiTrz/oiDOFmc7OcGJOcGy6NjJ/gM=; b=pmnbZG3lALOF0sQGKtmKv5zlJ
	PltgPQkFj0cgvrp8DtJh2bw+gbMMyuw15nVu3HnZZBpi1rwl+S0Qxi/XLVo3fSetkPYP+DTcYvRHz
	7xDMFJ9WtwPSFzakA0jzkYUBJAgMN+N+DOzGxYrVZafQel3H0wvasB2E3+KoRFBUDy3dm9QZFuoK2
	OYXOi31oDYm3uX4cp4RxemrJeNhNIk1uFTRBjhfp7EX2+q1AiCNd06BDoLNR0Kqc9oV57N4DuLEkk
	eNxZTQ0PCAh0z1ICzp8WSWTbORRl/6SsQvcdkJykKxjF13Gayn9/En3tr5UohWhkHtydnE+62gUJE
	Ecauc9lxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIq2Z-0006mC-MP; Mon, 30 Mar 2020 08:45:03 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIq2T-0006S1-Oz
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 08:45:02 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 75258CA3697BEB96955C;
 Mon, 30 Mar 2020 16:44:45 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.197) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 16:44:34 +0800
Subject: Re: [PATCH] mtd:clear cache_state to avoid writing to bad clocks
 repeatedly
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1585400477-65705-1-git-send-email-nixiaoming@huawei.com>
 <20200330095341.284048c3@xps13>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <a012c55f-e7c4-fd6d-3e3f-f132474a0b06@huawei.com>
Date: Mon, 30 Mar 2020 16:44:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200330095341.284048c3@xps13>
X-Originating-IP: [10.67.102.197]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_014501_308711_7EFE1A8F 
X-CRM114-Status: GOOD (  12.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC8zLzMwIDE1OjUzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFhpYW9taW5nLAo+
IAo+IFhpYW9taW5nIE5pIDxuaXhpYW9taW5nQGh1YXdlaS5jb20+IHdyb3RlIG9uIFNhdCwgMjgg
TWFyIDIwMjAgMjE6MDE6MTcKPiArMDgwMDoKPiAKPj4gVGhlIGZ1bmN0aW9uIGNhbGwgcHJvY2Vz
cyBpcyBhcyBmb2xsb3dzOgo+PiAJbXRkX2Jsa3RyYW5zX3dvcmsoKQo+PiAJICB3aGlsZSAoMSkK
Li4uLgoKPj4gKwkgKgo+PiArCSAqIGlmIHRoaXMgY2FjaGVfb2Zmc2V0IHBvaW50cyB0byBhIGJh
ZCBibG9jawo+IAo+IENhbiB5b3Ugc3RhcnQgeW91ciBzZW50ZW5jZXMgd2l0aCBhIGNhcGl0YWwg
bGV0dGVyIHBsZWFzZT8KPiAKPiAJICogSWYKPiAKPj4gKwkgKiBkYXRhIGNhbm5vdCBiZSB3cml0
dGVuIHRvIHRoZSBkZXZpY2UuCj4+ICsJICogY2xlYXIgY2FjaGVfc3RhdGUgdG8gYXZvaWQgd3Jp
dGluZyB0byBiYWQgY2xvY2tzIHJlcGVhdGVkbHkKPiAKPiAJICogQ2xlYXIKPiAKPiBBbmQgYWxz
byBwbGVhc2UgYnJlYWsgeW91ciBsaW5lcyDDoCA4MCwgbm90IDcwLgo+IAo+PiAgIAkgKi8KPj4g
LQltdGRibGstPmNhY2hlX3N0YXRlID0gU1RBVEVfRU1QVFk7Cj4+IC0JcmV0dXJuIDA7Cj4+ICsJ
aWYgKHJldCA9PSAwIHx8IHJldCA9PSAtRUlPKQo+PiArCQltdGRibGstPmNhY2hlX3N0YXRlID0g
U1RBVEVfRU1QVFk7ClNob3VsZCBJIGFkZCBhIHdhcm5pbmcgcHJpbnQgZm9yIEVJTyBoZXJlCgoK
Pj4gKwlyZXR1cm4gcmV0Owo+PiAgIH0KPj4gICAKPj4gICAKPiAKPiBPdGhlcndpc2UgbG9va3Mg
Z29vZCB0byBtZS4KPiAKPiBXaXRoIHRoZSBhYm92ZSBhZGRyZXNzZWQ6Cj4gCj4gUmV2aWV3ZWQt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKPiAKPiAuCgpUaGFua3MgZm9yIHlvdXIgYWR2aWNlLCBJIHdpbGwgc2Vu
ZCB2MiBwYXRjaCBsYXRlcgoKVGhhbmtzLApYaWFvbWluZyBOaQoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
