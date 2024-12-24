Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59F0E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSwRpChwpsSynWEgZ81wfyQfr6P6bLQr9EYopWBShuE=; b=wWHAc6Jmzwgug25Ae6OUlt4yQv
	3rC31+PYbFSnnNCJIXMeG9wf+nS4WMEg5owvR0R9sTBtX9hRkiQWrAuRtq8DemCUyu9o/2HasQ99n
	AGVAs36tghBVf1cReznscsW+DClE28vGsJBOdjCzH6BSuxijUJ01qYlViNUOP3fdSyYAhX93X9QSI
	xLUCTExIWHBCCkxt0oMKz/dcswz35zgT/VuYR5sqwbu/9YwEdjhvvf1xPSla5cyK/56DqdremnmjR
	MOCd1lYcFRHtTlk6kV4qe77CBPywVp57E+JGg/jSE22bxClZEKopgEFu4fVYVGo+sxs3WNeUV2ojJ
	zfpgNCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4tR-0000000C321-1NHy;
	Tue, 24 Dec 2024 13:24:13 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4tN-0000000C31A-30br
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 13:24:11 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YHbBN6j5Vz2DjMN
	for <linux-mtd@lists.infradead.org>; Tue, 24 Dec 2024 21:21:16 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 64A5F1A016C
	for <linux-mtd@lists.infradead.org>; Tue, 24 Dec 2024 21:23:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Dec 2024 21:23:58 +0800
Subject: Re: [PATCH mtd-utils] jffsX-utils: fix integer overflow in
 jffs2dump.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241224122709.39295-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a25caaad-3269-3dba-cba6-eec8eb151c79@huawei.com>
Date: Tue, 24 Dec 2024 21:23:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241224122709.39295-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_052409_917478_8D859B55 
X-CRM114-Status: GOOD (  15.00  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8xMi8yNCAyMDoyNywgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdkYXRzaXplICsgb29ic2l6ZScgaXMgYSBzdWJqZWN0IHRvIG92ZXJmbG93IGJlY2F1c2UgaXRz
IG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZv
cm1pbmcgYXJpdGhtZXRpYy4KPiAKPiBDb3JyZWN0aW9ucyBleHBsYWluZWQ6Cj4gLSBBZGRlZCBh
IGNoZWNrIHRvIHZhbGlkYXRlIGRhdHNpemUgYW5kIG9vYnNpemUgdG8gZW5zdXJlIHRoZXkgYXJl
IG5vbi1uZWdhdGl2ZSBhbmQgd2l0aGluIGEgc2FmZSByYW5nZS4KPiAtIENhc3QgZGF0c2l6ZSBh
bmQgb29ic2l6ZSB0byBsb25nIGJlZm9yZSBwZXJmb3JtaW5nIGFyaXRobWV0aWMgdG8gcHJldmVu
dCBwb3RlbnRpYWwgaW50ZWdlciBvdmVyZmxvdy4KPiAKPiBUaGlzIGNoYW5nZSBlbnN1cmVzIHNh
ZmUgY29tcHV0YXRpb24gb2Ygb2Zmc2V0cyBhbmQgcHJldmVudHMgdW5kZWZpbmVkIGJlaGF2aW9y
IGNhdXNlZCBieSBvdmVyZmxvdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8
YW50LnYubW9yeWFrb3ZAZ21haWwuY29tPgo+IC0tLQo+ICAgamZmc1gtdXRpbHMvamZmczJkdW1w
LmMgfCA5ICsrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1
YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2pmZnNYLXV0aWxzL2pmZnMyZHVtcC5jIGIvamZmc1gt
dXRpbHMvamZmczJkdW1wLmMKPiBpbmRleCAzMDQ1NWVhLi41YjBlMTQ0IDEwMDY0NAo+IC0tLSBh
L2pmZnNYLXV0aWxzL2pmZnMyZHVtcC5jCj4gKysrIGIvamZmc1gtdXRpbHMvamZmczJkdW1wLmMK
PiBAQCAtNzcyLDYgKzc3MiwxMyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4g
ICAJCWV4aXQoRVhJVF9GQUlMVVJFKTsKPiAgIAl9Cj4gICAKPiArCWlmIChkYXRzaXplIDwgMCB8
fCBvb2JzaXplIDwgMCB8fCBkYXRzaXplID4gaW1nbGVuIHx8IChsb25nKWRhdHNpemUgKyBvb2Jz
aXplIDwgMCkgewo+ICsJCWZwcmludGYoc3RkZXJyLCAiRXJyb3I6IGludmFsaWQgZGF0c2l6ZS9v
b2JzaXplLlxuIik7Cj4gKwkJZnJlZShkYXRhKTsKPiArCQljbG9zZSAoZmQpOwo+ICsJCWV4aXQo
RVhJVF9GQUlMVVJFKTsKPiArCX0KPiArCj4gICAJaWYgKGRhdHNpemUgJiYgb29ic2l6ZSkgewo+
ICAgCQlpbnQgIGlkeCA9IDA7Cj4gICAJCWxvbmcgbGVuID0gaW1nbGVuOwo+IEBAIC03ODMsNyAr
NzkwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQo+ICAgCQkJcmVhZF9ub2No
ZWNrIChmZCwgb29iLCBvb2JzaXplKTsKPiAgIAkJCWlkeCArPSBkYXRzaXplOwo+ICAgCQkJaW1n
bGVuIC09IG9vYnNpemU7Cj4gLQkJCWxlbiAtPSBkYXRzaXplICsgb29ic2l6ZTsKPiArCQkJbGVu
IC09IChsb25nKWRhdHNpemUgKyBvb2JzaXplOwo+ICAgCQl9Cj4gICAKPiAgIAl9IGVsc2Ugewo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
