Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E784C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 05:50:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3F82229C5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 05:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3F82229C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bgG5Kj0O850IbdLvLQV7Al6V8wZt32obmH7yFMr/Krg=; b=IuqBYrdxyjfSsxRWumc2s29xm
	bBgaNuc8fMEd3NiSieail2DQOlYACzXOVYiHRAo9gY/+oAzfSR32W8tLxwMy2NaLgrwPruVpKJRWA
	P9zNn1dT05RS7Kmkk2iKSulo+ZIUQoQpXxr7mJkytK3HmR7ODd/GwHU5NHzkSOjBN2G0IsVPzGq7u
	Cl28MJirbM0NRmWC2nF4kIlyPoI4Po9u+mVLfbGXj4H9o8GafXOCugax9S+SxlV7eqLhD1euqKFpE
	IUKikkype62vkDxXZXAv51ecR2X4SC+WI8eLLSytk/S/uu7LnbjBCx2zJlegtmvDo7k43dTatckSf
	qA5+WjbeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3ukE-0007PO-Gz; Mon, 25 Jan 2021 05:48:58 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ukC-0007OQ-Ck
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 05:48:57 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DPJmc58zzzj9cc;
 Mon, 25 Jan 2021 13:47:44 +0800 (CST)
Received: from [10.174.176.235] (10.174.176.235) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 13:48:32 +0800
Subject: Re: [PATCH] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
To: Miquel Raynal <miquel.raynal@bootlin.com>, <zhongguohua1@huawei.com>,
 <joern@lazybastard.org>, <richard@nod.at>, <patrick@baymotion.com>,
 <linux-mtd@lists.infradead.org>
References: <20210104101830.3036-1-miquel.raynal@bootlin.com>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <01746715-84dc-cd7a-508a-52ba3172e339@huawei.com>
Date: Mon, 25 Jan 2021 13:48:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210104101830.3036-1-miquel.raynal@bootlin.com>
X-Originating-IP: [10.174.176.235]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_004856_667595_3730FEB5 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpSZWNoZWNrIHRoZSBwYXRjaCwgYW5kIGl0IHNlZW1zIHdlIG5lZWQgY2hlY2sgZXJhc2Vz
aXplIHRvIHByZXZlbnQgRElWLzAuLi4KClNvcnJ5IGZvciB0aGUgbWlzdGFrZS4gQ2FuIHlvdSBh
ZGQgYSBmaXggcGF0Y2ggZm9yIHRoaXM/CgpUaGFua3MsCkt1bi4KCtTaIDIwMjEvMS80IDE4OjE4
LCBNaXF1ZWwgUmF5bmFsINC0tcA6Cj4gT24gV2VkLCAyMDIwLTEyLTMwIGF0IDAyOjE3OjE4IFVU
QywgeWFuZ2Vya3VuIHdyb3RlOgo+PiBXZSBub3cgc3VwcG9ydCB1c2VyIHRvIHNldCBlcmFzZSBw
YWdlIHNpemUsIGFuZCB1c2UgZG9fZGl2IGJldHdlZW4gbGVuCj4+IGFuZCBlcmFzZSBzaXplIHRv
IGRldGVybWluZSB0aGUgcmVhc29uYWJsZW5lc3MgZm9yIHRoZSBlcmFzZSBzaXplLgo+PiBIb3dl
dmVyLCBkb19kaXYgaXMgYSBtYWNybyBhbmQgd2lsbCBvdmVyd3JpdGUgdGhlIHZhbHVlIG9mIGxl
bi4gV2hpY2gKPj4gcmVzdWx0cyBhIG10ZCBkZXZpY2Ugd2l0aCB1bmV4Y2VwdGVkIHNpemUuIEZp
eCBpdCBieSB1c2UgZGl2X3U2NF9yZW0uCj4+Cj4+IEZpeGVzOiBmZmFkNTYwMzk0ZGUgKCJtdGQ6
IHBocmFtOiBBbGxvdyB0aGUgdXNlciB0byBzZXQgdGhlIGVyYXNlIHBhZ2Ugc2l6ZS4iKQo+PiBT
aWduZWQtb2ZmLWJ5OiB5YW5nZXJrdW4gPHlhbmdlcmt1bkBodWF3ZWkuY29tPgo+IAo+IEFwcGxp
ZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgo+IAo+IE1pcXVlbAo+IC4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
