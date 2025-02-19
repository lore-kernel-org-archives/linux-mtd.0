Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AC8C021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 12:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx5SPRUxrhVLkyn6OYCpYW5UifDyz2HVbsWR1vtgOsk=; b=A+Fhm3ag4JM5v0KSHDZ5voGzQ/
	EiYI91upaeG3RvQ/gbQV5b19AAJ+jF8gSJlLAuzTyFl86N1MXMUu8PirAm2ZpZ24CdgWf6FcJl74J
	0duOchtOlJneiRFDxX3k+PM/45aeQP78bAHyGfobxyyiE+9JIfA7JILArXwzBP9H4s+HA1E4iIdiP
	L4fCChLr/33IbJ092dOeqta+ahs+POFMMMyc6NcHDwynqc+Xwy8eH0qgQAuM75fkYD9wVE2HSr/Pm
	KvyY8DMtIu/2R9bFuoqzuVHL331A0XG489xELo7PJkMLTzF4WwjijgCKde6238eA0H2AddyOZSXVk
	p07gXsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkilL-0000000CZ0t-2KMw;
	Wed, 19 Feb 2025 12:01:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkikw-0000000CYtt-0wsj
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 12:00:47 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YyZd00gVLzhZsx
	for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 19:57:08 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AF92D1400D4
	for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 20:00:31 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Feb 2025 20:00:31 +0800
Subject: Re: [PATCH mtd-utils] tests: add test_DATA to EXTRA_DIST
To: Michael Olbrich <m.olbrich@pengutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <20250219082706.3956008-1-m.olbrich@pengutronix.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <06a76588-9c1d-2b62-0196-5f93697b8b00@huawei.com>
Date: Wed, 19 Feb 2025 20:00:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250219082706.3956008-1-m.olbrich@pengutronix.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_040046_410954_01FFFA60 
X-CRM114-Status: GOOD (  12.89  )
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

1NogMjAyNS8yLzE5IDE2OjI3LCBNaWNoYWVsIE9sYnJpY2gg0LS1wDoKPiBPdGhlcndpc2UsIHRo
ZSB0ZXN0IGZpbGVzIGFyZSBtaXNzaW4gaW4gdGhlIHRhcmJhbGwgYW5kIGJ1aWxkaW5nIGZhaWxz
Cj4gd2l0aDoKPiAKPiBtYWtlWzFdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAndGVzdHMv
dWJpZnNfdG9vbHMtdGVzdHMvaW1hZ2VzL2dvb2QuZ3onLCBuZWVkZWQgYnkgJ2FsbC1hbScuICBT
dG9wLgo+IAo+IHVubGVzcyAtLXdpdGhvdXQtdGVzdHMgaXMgdXNlcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIE9sYnJpY2ggPG0ub2xicmljaEBwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAg
IE1ha2VmaWxlLmFtIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCj4gaW5kZXggYzc1NjEy
NzJmYWIzLi45ZWZjYWNjNjk5MWEgMTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUuYW0KPiArKysgYi9N
YWtlZmlsZS5hbQo+IEBAIC03MCwzICs3MCw1IEBAIGVuZGlmCj4gICBpZiBVTklUX1RFU1RTCj4g
ICBpbmNsdWRlIHRlc3RzL3VuaXR0ZXN0cy9NYWtlbW9kdWxlLmFtCj4gICBlbmRpZgo+ICsKPiAr
RVhUUkFfRElTVCArPSAkKHRlc3RfREFUQSkKPiAKCkhpLCBNaWNoYWVsLiBIb3cgYWJvdXIgY2hh
bmdpbmcgbGlrZSB0aGlzPwpkaWZmIC0tZ2l0IGEvdGVzdHMvdWJpZnNfdG9vbHMtdGVzdHMvTWFr
ZW1vZHVsZS5hbSAKYi90ZXN0cy91Ymlmc190b29scy10ZXN0cy9NYWtlbW9kdWxlLmFtCmluZGV4
IDE3MTU3NTcuLmRiNzdiYWQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL01h
a2Vtb2R1bGUuYW0KKysrIGIvdGVzdHMvdWJpZnNfdG9vbHMtdGVzdHMvTWFrZW1vZHVsZS5hbQpA
QCAtMTAsOCArMTAsNyBAQCB0ZXN0X1NDUklQVFMgKz0gXAogICAgICAgICB0ZXN0cy91Ymlmc190
b29scy10ZXN0cy9mc2NrX3Rlc3RzL2ZzY2tfYmFkX2ltYWdlLnNoIFwKICAgICAgICAgdGVzdHMv
dWJpZnNfdG9vbHMtdGVzdHMvbWtmc190ZXN0cy9idWlsZF9mc19mcm9tX2Rpci5zaAoKLXRlc3Rf
REFUQSArPSBcCi0gICAgICAgdGVzdHMvdWJpZnNfdG9vbHMtdGVzdHMvaW1hZ2VzL2dvb2QuZ3og
XAorSU1BR0VfRklMRVMgPSB0ZXN0cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMvZ29vZC5neiBc
CiAgICAgICAgIHRlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL2ltYWdlcy9zYl9mYW5vdXQuZ3ogXAog
ICAgICAgICB0ZXN0cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMvc2JfZm10X3ZlcnNpb24uZ3og
XAogICAgICAgICB0ZXN0cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMvc2JfbGViX3NpemUuZ3og
XApAQCAtNjQsMyArNjMsNiBAQCB0ZXN0X0RBVEEgKz0gXAogICAgICAgICB0ZXN0cy91Ymlmc190
b29scy10ZXN0cy9pbWFnZXMvZGlyX2xvc3Rfbm90X3JlY292ZXIuZ3ogXAogICAgICAgICB0ZXN0
cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMvcm9vdF9kaXIuZ3ogXAogICAgICAgICB0ZXN0cy91
Ymlmc190b29scy10ZXN0cy9pbWFnZXMvZW1wdHlfdG5jLmd6CisKK3Rlc3RfREFUQSArPSAkKElN
QUdFX0ZJTEVTKQorRVhUUkFfRElTVCArPSAkKElNQUdFX0ZJTEVTKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
