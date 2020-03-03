Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D807EC3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 06:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77B020870
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 06:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pNI2REd8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77B020870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xEbe6vsgyCOft2iHAxVS6Za3KxCjv19BgE6zZBO47ZQ=; b=pNI2REd84jjnh2xAsXCObf56q
	ps97FW9X3nW8phL2wrI6zuNFih56ZF+d59g46Kb2eEL/vmiXGXd7IRuZZb61hZXxeLKVILDUyyti0
	6TFJORqYI0QXxpWRuh8hkV3VY8Si+dehW9ZH5SUckB5HoeXftcKTCvruEEYxJ8zy7XOTa3pjmCpkP
	TUrvfwosJQNRgCcb6LfaGPDNk5ROusB2qSgqidRseDGVMtUR9dVeI88W9fKJpnXQ3Ak51fszYiuT8
	49axBTHgt111SlE5x3veIBMQJG9esvjduDF2jNtQ54ao1KjEsjIFjAmnQhs3u7OqneZH6iIQv9KYk
	2NzJEqbZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j90o6-0005mO-Dm; Tue, 03 Mar 2020 06:13:30 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j90o2-0005aB-Ne
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 06:13:28 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3C0997EDCB890DB2F6A6;
 Tue,  3 Mar 2020 14:13:09 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.98) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
 14:13:00 +0800
Subject: Re: [PATCH] ubifs: Don't discard nodes in recovery when ecc err
 detected
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <1582293853-136727-1-git-send-email-chengzhihao1@huawei.com>
 <CAFLxGvyJdWcXQt3H2aknTuGhCJpV5YvAbW_wuHfs3m+KcNSjtw@mail.gmail.com>
 <58b11ca2-6b91-52b3-bc75-d44abb202cfb@huawei.com>
 <CAFLxGvyYFEiEe108Hf_TO7q0ZsiLPswVsgPBQOU29aFqebD4XA@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ee6578cf-a4be-a4eb-30d9-379926e3ed1e@huawei.com>
Date: Tue, 3 Mar 2020 14:13:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyYFEiEe108Hf_TO7q0ZsiLPswVsgPBQOU29aFqebD4XA@mail.gmail.com>
X-Originating-IP: [10.173.221.98]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_221326_956700_D9A4E1B5 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvMy8zIDU6MTQsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gT24gTW9uLCBN
YXIgMiwgMjAyMCBhdCA0OjU4IEFNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgo+PiBJIG1lYW4sIHRoZSB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvciBpcyBjYXVz
ZWQgYnkgaGFyZHdhcmUgd2hpY2ggbWF5IGxlYWQKPj4gdG8gY29ycnVwdGVkIG5vZGVzIGRldGVj
dGVkIGluIFVCSUZTLiBJIGZvdW5kIHVuY29ycmV0YWJsZSBFQ0MgZXJyb3JzIG9uCj4+IG15IE5B
TkQsIGluIHRoZSBlbnZpcm9ubWVudCBvZiBoaWdoIHRlbXBlcmF0dXJlIGFuZCBodW1pZGl0eS4K
Pj4KPj4gQXQgcHJlc2VudCwgVUJJRlMgaWdub3JlcyBhbGwgRUJBRE1TRyBlcnJvcnMsIHNvIHRo
ZSBjb3JydXB0ZWQgbm9kZSBpcwo+PiBvbmx5IGNvbnNpZGVyZWQgaW4gYmVpbmcgY2F1c2VkIGJ5
IHVuZmluaXNoZWQgd3JpdGluZy4gSSB0aGluayBVQklGUwo+PiBzaG91bGQgY29uc2lkZXIgdGhl
IGNvcnJ1cHRlZCBhcmVhIGNhdXNlZCBieSBFQ0MgZXJyb3JzIGluIHByb2Nlc3MKPj4gdWJpZnNf
cmVjb3Zlcl9sZWIoKS4gbm9fbW9yZV9ub2RlcygpIHdpbGwgc2tpcCBhIHJlYWQtd3JpdGUgdW5p
dC4gTWF5YmUKPj4gdGhlIGNvcnJ1cHRlZCBhcmVhIGlzIHNraXBwZWQuCj4gV2VsbCwgaWYgeW91
ciBOQU5EIGRhdGEgaXMgY29ycnVwdGVkIGJ5IHlvdXIgZW52aXJvbm1lbnQgVUJJRlMgY2Fubm90
Cj4gZG8gbXVjaC4gU3VyZSwgd2UgY2FuIHBhcGVyIG92ZXIgc29tZSBwbGFjZXMgYnV0IGF0IHRo
ZSBlbmQgb2YgdGhlIGRheQo+IHlvdSB3aWxsIGFsd2F5cyBsb3NlLgo+Cj4gV2hhdCBpZiB0aGUg
VUJJIFZJRCBoZWFkZXIgYmVjb21lcyB1bnJlYWRhYmxlIG9yIHRoZSByb290IG5vZGUgb2YgdGhl
Cj4gaW5kZXggdHJlZT8KPgpBZ3JlZSwgdGhhbmtzIGZvciByZW1pbmRpbmcuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
