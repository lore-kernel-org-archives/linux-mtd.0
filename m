Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEA5C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:09:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3951206F6
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 12:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x+RT1+NM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3951206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M1KJB2VXFOBl+nj0eO7VB5ZFf26+5WjIfUXizMhHsfI=; b=x+RT1+NMIVri1XkFLTJNK8ynL
	xQbnwdYr5lU9lsxjmQLktNOuj57Cz7tyiOErELPQVPAYlHn0UPbP6zreVDpzb2Oq4HWLffEaSe5tx
	d98QXvYgrVmqAHb6DhFt7Pk02fxi+MUjZpTVk6axl6zxdVi9uj+15LuKv8ZZMMCJyI1cBS04khy6k
	7A3FjJRoT8NDL7fIJkcyMRCU7JsxfKKCb+i8ZJZeMzeXaUtvIkafsA28EZXg0cAM8cdkXxUyoq9Ki
	A1FlQL1SQFVpcw22Db5ev9cNJPBEkAL/fu3Z/X8/IIYyH4RCtOtelzMm5CG20C5LI6oY3Hl+ARVsD
	Y6mDfm4bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsmPK-0006TJ-Ku; Tue, 07 Jul 2020 12:09:06 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsmPI-0006Sg-5Q
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 12:09:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D189D625BBF3;
 Tue,  7 Jul 2020 14:09:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Mk0HXEJkUekK; Tue,  7 Jul 2020 14:09:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 72852625BBF5;
 Tue,  7 Jul 2020 14:09:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MiZ7r6eBatiP; Tue,  7 Jul 2020 14:09:01 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 48BB9625BBD2;
 Tue,  7 Jul 2020 14:09:01 +0200 (CEST)
Date: Tue, 7 Jul 2020 14:09:01 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <1463101229.103384.1594123741187.JavaMail.zimbra@nod.at>
In-Reply-To: <082f18e0-d6f0-6389-43af-3159edb244cb@huawei.com>
References: <20200701112643.726986-1-chengzhihao1@huawei.com>
 <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
 <082f18e0-d6f0-6389-43af-3159edb244cb@huawei.com>
Subject: Re: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix a potential space leak problem while linking tmpfile
Thread-Index: LkuhB0ia7lKOM3lPkaKfNaLo45lo0g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_080904_319603_EAA4941D 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFBlcmhhcHMgSSBtaXN1bmRlcnN0b29k
IHdoYXQgY29tbWl0IDMyZmU5MDVjMTdmMDAxICgidWJpZnM6IEZpeAo+IE9fVE1QRklMRSBjb3Ju
ZXIgY2FzZSBpbiB1Ymlmc19saW5rKCkiKSB3YW50ZWQgdG8gZml4Lgo+IEkgdGhpbmsgb3JwaGFu
IGFyZWEgaXMgdXNlZCB0byByZW1pbmQgZmlsZXN5c3RlbSBkb24ndCBmb3JnZXQgdG8gZGVsZXRl
Cj4gaW5vZGVzICh3aG9zZSBubGluayBpcyAwKSBpbiBuZXh0IHVuY2xlYW4gcmVib290aW5nLiBH
ZW5lcmFsbHksIHRoZSBmaWxlCj4gc3lzdGVtIGlzIG5vdCBjb3JydXB0ZWQgY2F1c2VkIGJ5IHJl
cGxheWluZyBvcnBoYW4gbm9kZXMuCj4gUmFscGggcmVwb3J0ZWQgYSBmaWxlc3lzdGVtIGNvcnJ1
cHRpb24gaW4gY29tYmluYXRpb24gd2l0aCBvdmVybGF5ZnMuCj4gQ2FuIHlvdSB0ZWxsIG1lIHRo
ZSBkZXRhaWxzIGFib3V0IHRoYXQgcHJvYmxlbT8gVGhhbmtzLgoKT24gbXkgdGVzdCBiZWQgSSBk
aWRuJ3Qgc2VlIGEgZnMgY29ycnVwdGlvbiwgd2hhdCBJIHNhdyB3YXMgYSBmYWlsaW5nIG9ycGhh
bgpzZWxmIHRlc3Qgd2hpbGUgcGxheWluZyB3aXRoIE9fVE1QRklMRSBhbmQgbGlua2F0KCkuCgpX
aGVuIHlvdSBjcmVhdGUgYSB0bXBmaWxlIGl0IGhhcyBhIGxpbmsgY291bnQgb2YgMCBhbmQgYW4g
b3JwaGFuIGlzCmluc3RhbGxlZC4gU3VjaCB0aGF0IHRoZSB0bXBmaWxlIGlzIGdvbmUgYWZ0ZXIg
YSByZWJvb3QgYnV0IHlvdSBjYW4Kc3RpbGwgdXNlIGl0IHByaW9yIHRvIHRoYXQuCkJ5IHVzaW5n
IGxpbmthdCgpIHlvdSBjYW4gcmFpc2UgdGhlIGxpbmsgY291bnRlciB0byAxIGFnYWluLgpUaHVz
LCB0aGUgb3JwaGFuIG5lZWRzIHRvIGJlIHJlbW92ZWQuClRoaXMgaXMgcGF0dGVybiBvdmVybGF5
ZnMgdXNlcyBhIGxvdC4KClNpbmNlIFVCSUZTIG5ldmVyIHN1cHBvcnRlZCByYWlzaW5nIHRoZSBs
aW5rIGNvdW50ZXIgZnJvbSAwIHRvIDEKd2UgaGF2ZSBtYW55IGNvcm5lciBjYXNlcyBhbmQgZml4
aW5nIGFsbCB0aGVzZSB0dXJuZWQgb3V0IGludG8gYSBuaWdodG1hcmUuCi4uLmFzIHlvdSBjYW4g
c2VlIGZyb20gdGhlIGFtb3VudCBicm9rZW4gcGF0Y2hlcyBmcm9tIG1lIDotKC4KClRoYW5rcywK
Ly9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
