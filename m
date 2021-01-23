Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF439C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 02:46:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFEF23B5D
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 02:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFEF23B5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IqQm6NAj1ivtigtyL2hYlEVH89Pp99PNxgu4aQMrZCs=; b=OO4NZwTCELpK5gmeVhZPgcnht
	V7Ob5L1x0kKCQ87BKEzBbKidbFN/emqk6Rn9QsTbnhcAxs3laXSdhM8t9YFap8kErCUVCEHdwxjqd
	ckn4UGXkFX5bzyKYnhzwAP8g81GoQGmgdrlwmRnS1TRPWflwifHRL/GP7mdzxt0QHEScb1bJYRW67
	DHSZgdsPO108STSqXjuxDslYXZPeJNgdg7DYs75oyHMOE4YKVuxadYvB25LD0fAVKYfAcmSU6KGyF
	6epdqa80Y2+lEceR4RYU50o6GrG/V1incYA0f8yzYS3ULaAGif4EVDpicB+bNbKa5uDMhgiMJiE0F
	EYdc+PCLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l38vb-0007cG-PX; Sat, 23 Jan 2021 02:45:31 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l38vY-0007bU-IE
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 02:45:30 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DN0nQ0059zl7Zc;
 Sat, 23 Jan 2021 10:43:53 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Sat, 23 Jan 2021 10:45:16 +0800
Subject: Re: [PATCH 3/4] ubifs: Update directory size when creating whiteouts
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20210122212229.17072-1-richard@nod.at>
 <20210122212229.17072-4-richard@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5b51ff9c-8f5e-c348-5195-c0a0bf60b746@huawei.com>
Date: Sat, 23 Jan 2021 10:45:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210122212229.17072-4-richard@nod.at>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_214529_421283_AC89E746 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: david@sigma-star.at, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMS8xLzIzIDU6MjIsIFJpY2hhcmQgV2VpbmJlcmdlciDQtLXAOgo+IEFsdGhvdWdoIHdo
aXRlb3V0cyBhcmUgdW5saW5rZWQgZmlsZXMgdGhleSB3aWxsIGdldCByZS1saW5rZWQgbGF0ZXIs
CkkganVzdCB3YW50IHRvIG1ha2Ugc3VyZSwgaXMgdGhpcyB3aGVyZSB0aGUgY291bnQgaXMgaW5j
cmVhc2VkPwpkb19yZW5hbWUgLT4gaW5jX25saW5rKHdoaXRlb3V0KQo+IHRoZXJlZm9yZSB0aGUg
c2l6ZSBvZiB0aGUgcGFyZW50IGRpcmVjdG9yeSBuZWVkcyB0byBiZSB1cGRhdGVkIHRvby4KPiAK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiA5ZTBhMWZmZjhkYjUgKCJ1Ymlm
czogSW1wbGVtZW50IFJFTkFNRV9XSElURU9VVCIpCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiAtLS0KPiAgIGZzL3ViaWZzL2Rpci5jIHwgNCAr
KysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL2Rpci5jIGIvZnMvdWJpZnMvZGlyLmMKPiBpbmRleCA4YTM0ZTAxMThlZTkuLmI1
ZDUyM2U1ODU0ZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9kaXIuYwo+ICsrKyBiL2ZzL3ViaWZz
L2Rpci5jCj4gQEAgLTM2MSw2ICszNjEsNyBAQCBzdGF0aWMgaW50IGRvX3RtcGZpbGUoc3RydWN0
IGlub2RlICpkaXIsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSwKPiAgIAlzdHJ1Y3QgdWJpZnNfYnVk
Z2V0X3JlcSBpbm9fcmVxID0geyAuZGlydGllZF9pbm8gPSAxIH07Cj4gICAJc3RydWN0IHViaWZz
X2lub2RlICp1aSwgKmRpcl91aSA9IHViaWZzX2lub2RlKGRpcik7Cj4gICAJaW50IGVyciwgaW5z
dGFudGlhdGVkID0gMDsKPiArCWludCBzel9jaGFuZ2UgPSAwOwo+ICAgCXN0cnVjdCBmc2NyeXB0
X25hbWUgbm07Cj4gICAKPiAgIAkvKgo+IEBAIC00MTEsNiArNDEyLDggQEAgc3RhdGljIGludCBk
b190bXBmaWxlKHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksCj4gICAJ
CW1hcmtfaW5vZGVfZGlydHkoaW5vZGUpOwo+ICAgCQlkcm9wX25saW5rKGlub2RlKTsKPiAgIAkJ
KndoaXRlb3V0ID0gaW5vZGU7Cj4gKwkJc3pfY2hhbmdlID0gQ0FMQ19ERU5UX1NJWkUoZm5hbWVf
bGVuKCZubSkpOwo+ICsJCWRpci0+aV9zaXplICs9IHN6X2NoYW5nZTsKPiAgIAl9IGVsc2Ugewo+
ICAgCQlkX3RtcGZpbGUoZGVudHJ5LCBpbm9kZSk7Cj4gICAJfQo+IEBAIC00MzAsNiArNDMzLDcg
QEAgc3RhdGljIGludCBkb190bXBmaWxlKHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5
ICpkZW50cnksCj4gICAJcmV0dXJuIDA7Cj4gICAKPiAgIG91dF9jYW5jZWw6CkRvZXMgdGhpcyBu
ZWVkIGEganVkZ21lbnQ/IExpa2UgdGhpcywKaWYgKHdoaXRlb3V0KQogICAgIGRpci0+aV9zaXpl
IC09IHN6X2NoYW5nZTsKPiArCWRpci0+aV9zaXplIC09IHN6X2NoYW5nZTsKPiAgIAltdXRleF91
bmxvY2soJmRpcl91aS0+dWlfbXV0ZXgpOwo+ICAgb3V0X2lub2RlOgo+ICAgCW1ha2VfYmFkX2lu
b2RlKGlub2RlKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
