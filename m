Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6B3C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 07:58:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 995412222A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 07:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 995412222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vp4lc53DYN0v+ywYT9527e4akcCzNeSMAkHu9G/3QMg=; b=q/+S2AA6yBwoIFB4OJvlHQmUt
	GCV6baJ7qbNKBACgEYCZnxKMyG5hZmHWABt7spapybTFJKHcNlZBlf827E8reIdhwVINKGrCIym3x
	3FVpRQaqZCsiIxQzgvWydUlQapChmAvr4u2ouvBUUFtsqOLjsjHDFf+jFXUhYmuoQlwc216Ark2qE
	6aBES9ww6urwTz16z3xYLyy7gTN5zxk49pG/94LuS888Olyq2rU51to0RVjaa/QnWtlyQo699q/hr
	+LkaG4cVRD4EM+5C5uuwhN79q40+G4cAONpD2V6ZlTyLcceYSqii/huCvBM7N81jBiLRCYEtzQmOT
	h/rZL2bgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwhDo-0005GZ-3N; Tue, 05 Jan 2021 07:57:40 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwhDk-0005FS-L4
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 07:57:37 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D94ZK6mygz7Qby;
 Tue,  5 Jan 2021 15:56:25 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 5 Jan 2021 15:57:16 +0800
Subject: Re: [PATCH] ubifs: Fix memleak in ubifs_init_authentication
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, <kjlu@umn.edu>
References: <20210105060340.7990-1-dinghao.liu@zju.edu.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <98a5ebbe-f5ff-2454-1b7f-3fb2fad6c118@huawei.com>
Date: Tue, 5 Jan 2021 15:57:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210105060340.7990-1-dinghao.liu@zju.edu.cn>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_025736_947335_67A51C2D 
X-CRM114-Status: GOOD (  12.57  )
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
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMS8xLzUgMTQ6MDMsIERpbmdoYW8gTGl1INC0tcA6Cj4gV2hlbiBjcnlwdG9fc2hhc2hf
ZGlnZXN0c2l6ZSgpIGZhaWxzLCBjLT5obWFjX3RmbQo+IGhhcyBub3QgYmVlbiBmcmVlZCBiZWZv
cmUgcmV0dXJuaW5nLCB3aGljaCBsZWFkcwo+IHRvIG1lbWxlYWsuCj4gCj4gRml4ZXM6IDQ5NTI1
ZTVlZWNjYTUgKCJ1YmlmczogQWRkIGhlbHBlciBmdW5jdGlvbnMgZm9yIGF1dGhlbnRpY2F0aW9u
IHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUu
ZWR1LmNuPgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4KPiAtLS0KPiAgIGZzL3ViaWZzL2F1dGguYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9h
dXRoLmMgYi9mcy91Ymlmcy9hdXRoLmMKPiBpbmRleCA1MWE3YzhjMmMzZjAuLmU1NjRkNWZmODc4
MSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9hdXRoLmMKPiArKysgYi9mcy91Ymlmcy9hdXRoLmMK
PiBAQCAtMzI3LDcgKzMyNyw3IEBAIGludCB1Ymlmc19pbml0X2F1dGhlbnRpY2F0aW9uKHN0cnVj
dCB1Ymlmc19pbmZvICpjKQo+ICAgCQl1Ymlmc19lcnIoYywgImhtYWMgJXMgaXMgYmlnZ2VyIHRo
YW4gbWF4aW11bSBhbGxvd2VkIGhtYWMgc2l6ZSAoJWQgPiAlZCkiLAo+ICAgCQkJICBobWFjX25h
bWUsIGMtPmhtYWNfZGVzY19sZW4sIFVCSUZTX0hNQUNfQVJSX1NaKTsKPiAgIAkJZXJyID0gLUVJ
TlZBTDsKPiAtCQlnb3RvIG91dF9mcmVlX2hhc2g7Cj4gKwkJZ290byBvdXRfZnJlZV9obWFjOwo+
ICAgCX0KPiAgIAo+ICAgCWVyciA9IGNyeXB0b19zaGFzaF9zZXRrZXkoYy0+aG1hY190Zm0sIHVr
cC0+ZGF0YSwgdWtwLT5kYXRhbGVuKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
