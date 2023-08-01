Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC02DC001DE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 02:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd/NlB1hsev2TamgiAtBFVSbPn/j0XkYl45DN4sDBew=; b=aFIn/o5/AL1Ezte0wQLVhtOicO
	DgkU8zfJf83agANEmtHvJnJsyKirzIEGOjou65/JPslmF9fTCxCeEahxYkMxoeiAwcS7kZ5FDlJFB
	XoDSXGjkE4c4E9cZ+qjwkgkeViyPWY9IFPIzb87TvNBy59yvhrt/r71/FWH0pV8/IXytv6CoGta89
	FKnusOU657ZgwQ1w+N4y2wA79ekG+nwHwlJgXnYdB9fOOmgaSI+zZdOU7P9+Cc7AWQwJG8rSNX9pO
	WqGDi/wI63SkrnDkJQsWb3GKW7EkuuRQwO9NNTawpMXXwVkSlwaOGco3L2BwublYQQxmcGBm3t+rU
	JKUFlNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQfAq-000Co8-1C;
	Tue, 01 Aug 2023 02:31:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQfAn-000Cnm-2T
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 02:31:47 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFJwh1C6lzVjvD
	for <linux-mtd@lists.infradead.org>; Tue,  1 Aug 2023 10:29:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 10:31:38 +0800
Subject: Re: mtd-utils flash_erase progress
To: <linux-mtd@lists.infradead.org>
References: <CAKj80Vd-DPPfSmZCeXd4OV9nqETYW7RNw-02fd33Yh+xQ2ucvA@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f66aa05a-8cf9-4b06-68ae-9511a978a8f4@huawei.com>
Date: Tue, 1 Aug 2023 10:31:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKj80Vd-DPPfSmZCeXd4OV9nqETYW7RNw-02fd33Yh+xQ2ucvA@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_193145_977520_3AD93971 
X-CRM114-Status: GOOD (  11.70  )
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

1NogMjAyMy83LzMxIDIyOjM2LCBFcmljIEtlbm55INC0tcA6Cj4gVGhlcmUgc2VlbXMgdG8gYmUg
YSBwcm9ibGVtIHdpdGggZmxhc2hfZXJhc2UgaW4gdGhhdCBpdCBkb2VzIG5vdAo+IHVwZGF0ZSBw
cm9ncmVzcy4gIEkgYmVsaWV2ZSB0aGlzIHBhdGNoIGZpeGVzIGl0Ogo+IAo+IGRpZmYgLS1naXQg
YS9taXNjLXV0aWxzL2ZsYXNoX2VyYXNlLmMgYi9taXNjLXV0aWxzL2ZsYXNoX2VyYXNlLmMKPiBp
bmRleCA0OWE4ODBmLi44Y2RlZmFmIDEwMDY0NAo+IC0tLSBhL21pc2MtdXRpbHMvZmxhc2hfZXJh
c2UuYwo+ICsrKyBiL21pc2MtdXRpbHMvZmxhc2hfZXJhc2UuYwo+IEBAIC01Myw4ICs1MywxMCBA
QCBpbnQgdGFyZ2V0X2VuZGlhbiA9IF9fQllURV9PUkRFUjsKPiAKPiAgIHN0YXRpYyB2b2lkIHNo
b3dfcHJvZ3Jlc3Mob2ZmX3Qgc3RhcnQsIGludCBlYiwgaW50IGViX3N0YXJ0LCBpbnQKPiBlYl9j
bnQsIGludCBzdGVwKQo+ICAgewo+IC0gICAgICAgYmFyZXZlcmJvc2UoIXF1aWV0LCAiXHJFcmFz
aW5nICVkIEtpYnl0ZSBAICVsbHggLS0gJTJpICUlIGNvbXBsZXRlICIsCj4gLSAgICAgICAgICAg
ICAgIHN0ZXAgLyAxMDI0LCAodW5zaWduZWQgbG9uZyBsb25nKXN0YXJ0LCAoKGViIC0KPiBlYl9z
dGFydCkgKiAxMDApIC8gZWJfY250KTsKPiArICAgICAgIHByaW50ZigiXHJFcmFzaW5nICVkIEtp
Ynl0ZSBAICUiUFJJeG9mZl90IiAtLSAlMi4wZiAlJSBjb21wbGV0ZSAiLAo+ICsgICAgICAgICBt
dGQtPmViX3NpemUgLyAxMDI0LAo+ICsgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKXN0YXJ0
ICsgKGViICogbXRkLT5lYl9zaXplKSwKPiArICAgICAgICAgKChmbG9hdCkoZWIgLSBlYl9zdGFy
dCkqMTAwIC8gZWJfY250KSk7Cj4gICAgICAgICAgZmZsdXNoKHN0ZG91dCk7Cj4gICB9Cj4gCgpU
aGUgZmxhc2hfZXJhc2UgdG9vbCB3aWxsIGRpc3BsYXkgcHJvZ3Jlc3MgaW4gZGVmYXVsdCwgdW5s
ZXNzIHVzZXIgYWRkcyAKJy1xJyBvciAnLS1zaWxlbnQnLgoKQlRXLCBJIGNhbid0IGFwcGx5IHRo
ZSBwYXRjaDoKZ2l0IGFwcGx5IG10ZC11dGlscy1mbGFzaF9lcmFzZS1wcm9ncmVzcy5wYXRjaApl
cnJvcjogY29ycnVwdCBwYXRjaCBhdCBsaW5lIDE1OQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
