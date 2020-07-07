Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45528C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:58:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D54206BE
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ov+LTKAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D54206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K3XouFVK5AWZgDRsKnLLIPR9z/u0bcsMJ1xpKwrInhs=; b=ov+LTKAzHQa0jhZyGJDa8qWQV
	f7/g0BqCoDbDnxmi6He72MKr8eaXIz0vXf5SQ3qaPJUv45n1OCDYsL+5jydv36NHr0eriBRBnOguM
	LCJs8ZcSfFTOFBAwQPS5izfyp+3zjD0ZaZuTdb3uuQgd/fB27lX3T6muvctVoeDx/nHeSuCJd4Irt
	gVJ8nhuIC7T4NqAJ0gm8zypFhPqC1aJOzwqrRBu6xwPb1zQVLbJwPPGULEadRtX8VgXSpf3fZhotY
	YGMJxMiHusgjM6Q6GVQc/y+GjtvhPWZuqhU2cgN4zZcXwXFXAAnlC5qssVHdoLpxBmyfwWxLXrI9K
	wEuI441zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsmEC-0003TP-Bg; Tue, 07 Jul 2020 11:57:36 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsmE9-0003SK-5E
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 11:57:34 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D659616BD5B4F6A04B78;
 Tue,  7 Jul 2020 19:57:27 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 7 Jul 2020 19:57:21 +0800
Subject: Re: [PATCH] ubifs: Fix wrong orphan node deletion in
 ubifs_jnl_update()
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200702152048.1819867-1-chengzhihao1@huawei.com>
 <CAFLxGvybobVbhS4zQSxSmq3xR40QP=pkyDG8j7jA8a6eOOKfHg@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <37d3628a-1904-bb94-e225-348dfeafe6b1@huawei.com>
Date: Tue, 7 Jul 2020 19:57:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvybobVbhS4zQSxSmq3xR40QP=pkyDG8j7jA8a6eOOKfHg@mail.gmail.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_075733_462155_6280C69B 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvNy83IDE5OjUyLCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IE9uIFRodSwg
SnVsIDIsIDIwMjAgYXQgNToyMSBQTSBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWku
Y29tPiB3cm90ZToKPj4gVGhlcmUgYSB3cm9uZyBvcnBoYW4gbm9kZSBkZWxldGluZyBpbiBlcnJv
ciBoYW5kbGluZyBwYXRoIGluCj4+IHViaWZzX2pubF91cGRhdGUoKSwgd2hpY2ggbWF5IGNhdXNl
IGZvbGxvd2luZyBlcnJvciBtc2c6Cj4+Cj4+ICAgIFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDE1
MjIpOiB1Ymlmc19kZWxldGVfb3JwaGFuIFt1Ymlmc106Cj4+ICAgIG1pc3Npbmcgb3JwaGFuIGlu
byA2NQo+Pgo+PiBGaXggdGhpcyBieSBjaGVja2luZyB3aGV0aGVyIHRoZSBub2RlIGhhcyBiZWVu
IG9wZXJhdGVkIGZvcgo+PiBhZGRpbmcgdG8gb3JwaGFuIGxpc3QgYmVmb3JlIGJlaW5nIGRlbGV0
ZWQsCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+Cj4+IC0tLQo+PiAgIGZzL3ViaWZzL2pvdXJuYWwuYyB8IDUgKysrLS0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvam91cm5hbC5jIGIvZnMvdWJpZnMvam91cm5hbC5jCj4+IGluZGV4IGU1
ZWMxYWZlMWM2Ni4uZGIwYTgwZGQ5ZDUyIDEwMDY0NAo+PiAtLS0gYS9mcy91Ymlmcy9qb3VybmFs
LmMKPj4gKysrIGIvZnMvdWJpZnMvam91cm5hbC5jCj4+IEBAIC01MzksNyArNTM5LDcgQEAgaW50
IHViaWZzX2pubF91cGRhdGUoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9k
ZSAqZGlyLAo+PiAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZzY3J5cHRfbmFt
ZSAqbm0sIGNvbnN0IHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+ICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgZGVsZXRpb24sIGludCB4ZW50KQo+PiAgIHsKPj4gLSAgICAgICBpbnQgZXJyLCBkbGVu
LCBpbGVuLCBsZW4sIGxudW0sIGlub19vZmZzLCBkZW50X29mZnM7Cj4+ICsgICAgICAgaW50IGVy
ciwgZGxlbiwgaWxlbiwgbGVuLCBsbnVtLCBpbm9fb2ZmcywgZGVudF9vZmZzLCBvcnBoYW5fYWRk
ZWQgPSAwOwo+PiAgICAgICAgICBpbnQgYWxpZ25lZF9kbGVuLCBhbGlnbmVkX2lsZW4sIHN5bmMg
PSBJU19ESVJTWU5DKGRpcik7Cj4+ICAgICAgICAgIGludCBsYXN0X3JlZmVyZW5jZSA9ICEhKGRl
bGV0aW9uICYmIGlub2RlLT5pX25saW5rID09IDApOwo+PiAgICAgICAgICBzdHJ1Y3QgdWJpZnNf
aW5vZGUgKnVpID0gdWJpZnNfaW5vZGUoaW5vZGUpOwo+PiBAQCAtNjMwLDYgKzYzMCw3IEBAIGlu
dCB1Ymlmc19qbmxfdXBkYXRlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1Y3QgaW5v
ZGUgKmRpciwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZpbmlzaDsKPj4g
ICAgICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgICAgICAgICAgdWktPmRlbF9jbXRubyA9IGMt
PmNtdF9ubzsKPj4gKyAgICAgICAgICAgICAgIG9ycGhhbl9hZGRlZCA9IDE7Cj4+ICAgICAgICAg
IH0KPj4KPj4gICAgICAgICAgZXJyID0gd3JpdGVfaGVhZChjLCBCQVNFSEQsIGRlbnQsIGxlbiwg
JmxudW0sICZkZW50X29mZnMsIHN5bmMpOwo+PiBAQCAtNzAyLDcgKzcwMyw3IEBAIGludCB1Ymlm
c19qbmxfdXBkYXRlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1Y3QgaW5vZGUgKmRp
ciwKPj4gICAgICAgICAga2ZyZWUoZGVudCk7Cj4+ICAgb3V0X3JvOgo+PiAgICAgICAgICB1Ymlm
c19yb19tb2RlKGMsIGVycik7Cj4+IC0gICAgICAgaWYgKGxhc3RfcmVmZXJlbmNlKQo+PiArICAg
ICAgIGlmIChsYXN0X3JlZmVyZW5jZSAmJiBvcnBoYW5fYWRkZWQpCj4gSSB0aGluayB5b3UgY2Fu
IGp1c3QgY2hlY2sgZm9yIG9ycGhhbl9hZGRlZCBoZXJlLgo+IExvb2tzIGdvb2Qgb3RoZXJ3aXNl
LCB0aGFua3MgZm9yIGZpeGluZyEgOi0pClNvdW5kcyByZWFzb25hYmxlLiBJIHdpbGwgc2VuZCB2
Mi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
