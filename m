Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25A5C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:37:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C519E206F6
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RZ8QEp2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C519E206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/AOHxxvavYC15ziH6l16dNNk81ASdv2eh1asZ/CBlmk=; b=RZ8QEp2l1mz3jmCJ/X3jgN3qj
	H8jL+ed/Yk+njDLIotxkPxkwVa6uAzUoUO087uQb5QQQNnRD+yxbTrq4zGoxK9eE32xembmuVHv32
	Xlv2XjKLc4+KnvXsy7MVPXPxt7nmAlAGyzeoFcNg8gqkaFHx2xDxK71mu6Cqnzd1m+e9/7sV36lCq
	HaANXLUIW+RrIfIX2Oku/+z3a5g+JafZj8XY8NCYA/n1MNMGCD7OxtFnm35pdbsE5oRkWmel07dc+
	MRaSDDCubVb01eeGAbELHJ8AN13UekPdnYRJR1m4qn29uj081NzTGuS/tMPfGAt0AyGvWteIcxscB
	S2qx5U3WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsmpm-0002Jn-Nl; Tue, 07 Jul 2020 12:36:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsmpk-0002Hx-9d
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 12:36:25 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A32FFF6769E724F418DA;
 Tue,  7 Jul 2020 20:36:18 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 7 Jul 2020 20:36:11 +0800
Subject: Re: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
To: Richard Weinberger <richard@nod.at>
References: <20200701112643.726986-1-chengzhihao1@huawei.com>
 <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
 <082f18e0-d6f0-6389-43af-3159edb244cb@huawei.com>
 <1463101229.103384.1594123741187.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <963fa5c8-414f-783f-871e-47e751b54d87@huawei.com>
Date: Tue, 7 Jul 2020 20:36:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1463101229.103384.1594123741187.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_083624_610238_02EDF290 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvNy83IDIwOjA5LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gUGVyaGFwcyBJIG1pc3VuZGVyc3Rvb2Qgd2hhdCBj
b21taXQgMzJmZTkwNWMxN2YwMDEgKCJ1YmlmczogRml4Cj4+IE9fVE1QRklMRSBjb3JuZXIgY2Fz
ZSBpbiB1Ymlmc19saW5rKCkiKSB3YW50ZWQgdG8gZml4Lgo+PiBJIHRoaW5rIG9ycGhhbiBhcmVh
IGlzIHVzZWQgdG8gcmVtaW5kIGZpbGVzeXN0ZW0gZG9uJ3QgZm9yZ2V0IHRvIGRlbGV0ZQo+PiBp
bm9kZXMgKHdob3NlIG5saW5rIGlzIDApIGluIG5leHQgdW5jbGVhbiByZWJvb3RpbmcuIEdlbmVy
YWxseSwgdGhlIGZpbGUKPj4gc3lzdGVtIGlzIG5vdCBjb3JydXB0ZWQgY2F1c2VkIGJ5IHJlcGxh
eWluZyBvcnBoYW4gbm9kZXMuCj4+IFJhbHBoIHJlcG9ydGVkIGEgZmlsZXN5c3RlbSBjb3JydXB0
aW9uIGluIGNvbWJpbmF0aW9uIHdpdGggb3ZlcmxheWZzLgo+PiBDYW4geW91IHRlbGwgbWUgdGhl
IGRldGFpbHMgYWJvdXQgdGhhdCBwcm9ibGVtPyBUaGFua3MuCj4gT24gbXkgdGVzdCBiZWQgSSBk
aWRuJ3Qgc2VlIGEgZnMgY29ycnVwdGlvbiwgd2hhdCBJIHNhdyB3YXMgYSBmYWlsaW5nIG9ycGhh
bgo+IHNlbGYgdGVzdCB3aGlsZSBwbGF5aW5nIHdpdGggT19UTVBGSUxFIGFuZCBsaW5rYXQoKS4K
RG8gd2UgaGF2ZSBhIHJlcHJvZHVjZXIsIG9yIGNhbiBJIGdldCB0aGUgZmFpbCB0ZXN0Y2FzZT8g
SXMgaXQgYSB4ZnN0ZXN0IApjYXNlPwo+Cj4gV2hlbiB5b3UgY3JlYXRlIGEgdG1wZmlsZSBpdCBo
YXMgYSBsaW5rIGNvdW50IG9mIDAgYW5kIGFuIG9ycGhhbiBpcwo+IGluc3RhbGxlZC4gU3VjaCB0
aGF0IHRoZSB0bXBmaWxlIGlzIGdvbmUgYWZ0ZXIgYSByZWJvb3QgYnV0IHlvdSBjYW4KPiBzdGls
bCB1c2UgaXQgcHJpb3IgdG8gdGhhdC4KPiBCeSB1c2luZyBsaW5rYXQoKSB5b3UgY2FuIHJhaXNl
IHRoZSBsaW5rIGNvdW50ZXIgdG8gMSBhZ2Fpbi4KPiBUaHVzLCB0aGUgb3JwaGFuIG5lZWRzIHRv
IGJlIHJlbW92ZWQuCj4gVGhpcyBpcyBwYXR0ZXJuIG92ZXJsYXlmcyB1c2VzIGEgbG90Lgo+Cj4g
U2luY2UgVUJJRlMgbmV2ZXIgc3VwcG9ydGVkIHJhaXNpbmcgdGhlIGxpbmsgY291bnRlciBmcm9t
IDAgdG8gMQo+IHdlIGhhdmUgbWFueSBjb3JuZXIgY2FzZXMgYW5kIGZpeGluZyBhbGwgdGhlc2Ug
dHVybmVkIG91dCBpbnRvIGEgbmlnaHRtYXJlLgo+IC4uLmFzIHlvdSBjYW4gc2VlIGZyb20gdGhl
IGFtb3VudCBicm9rZW4gcGF0Y2hlcyBmcm9tIG1lIDotKC4KPgo+IFRoYW5rcywKPiAvL3JpY2hh
cmQKPgo+IC4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
