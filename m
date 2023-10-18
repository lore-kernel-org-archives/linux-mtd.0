Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A18CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TPuJOdhAF5IL09n6l72NwsN2GE5ogqbhLrJFPy60SA=; b=OaPpf80tm7y5yGMEsmHqCvBgfe
	PFoG+VgWZqRB1kE9Pada6hhorQ5anY/FS0PkVK1A8+fAwxc7Cu0joB26datoJVNLnBLjlJdp7yzU2
	3YeIXl3l0Ne6L8O1hroowPZN9BcQ1ZP044GhUDR0Z4ZoNJGkyYO6cInGZ2gz/6IMOxdSwHf6P08wM
	74okq2lXxkj+pt19N+Qcq7WTU10cOi/JmG/kY/LDfRd5PNoggqsLZMHpQfvvg8j0MeDN+KIaRbaU+
	Kvses8dwsBVQPVrgXvsn2WGCGQV/pRPDa0JzPUvYlnA5iEXC9T/Uzytl7tqmdLG/MxCrt5NwzvXK5
	Z7nzcv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt05d-00Dwib-0S;
	Wed, 18 Oct 2023 06:31:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt05Z-00Dwhn-1A
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 06:31:31 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S9LVv4TzbzVljj
	for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2023 14:27:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 18 Oct 2023 14:31:15 +0800
Subject: Re: ubi: some invalid code in the function scan_peb
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
References: <MEYP282MB3164B8C92CD51ACC0897F0F2BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <497aa593-5999-821d-a2b7-69c0953e1e3e@huawei.com>
Date: Wed, 18 Oct 2023 14:31:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB3164B8C92CD51ACC0897F0F2BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_233129_656494_4C3DC9CD 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjMvMTAvMTggMTM6NTksIFJ5ZGVyIFdhbmcg5YaZ6YGTOgo+IEkganVzdCBmaW5kIHNv
bWUgZGVhZCBjb2RlIGluIHRoZSBmdW5jdGlvbsKgc2Nhbl9wZWIgaW4gZHJ2aWVyL210ZC91Ymkv
YXR0YWNoLmMuCj4gCj4gSW4gdGhlIGZ1bmN0aW9uIHNjYW5fcGViLCBpdCBjYWxscyB2YWxpZGF0
ZV9lY19oZHIgd2hpY2ggY2FsbHMgdmFsaWRhdGVfZWNfaGRyLiBJZiB1YmkgdmVyc2lvbiBvciBl
cmFzZSBjb3VudCBpcyBpbmNvcnJlY3QsIGl0IHdpbGwgcmVwb3J0IC1FSU5WQUwgYW5kIGFib3J0
IHRoZSBmdW5jdGlvbiBzY2FuX3BlYi4gSG93ZXZlciwgdWJpIHZlcnNpb24gb3IgZXJhc2UgY291
bnQgd2lsbCBiZSBjaGVja2VkIGFnYWluIGluIHNjYW5fcGViIGFuZCBzdWNoIGNoZWNrIGNvZGUg
d2lsbCBuZXZlciBmaW5kIHRoZSBlcnJvcnMgYmVjYXVzZSBzdWNoIGVycm9ycyBzaG91bGQgaGF2
ZSBiZWVuIGRldGVjdGVkIGJ5IHZhbGlkYXRlX2VjX2hkciAoYWJvcnRpbmcpLgo+IAoKWWVzLCBy
ZWR1bmRhbnQgY2hlY2tpbmcgaW5kZWVkIGV4aXN0cyBpbiBzY2FuX3BlYigpLCBjb3VsZCB5b3Ug
c2VuZCBhIApwYXRjaCB0byBjbGVhbiBpdCB1cD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
