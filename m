Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C1CC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:18:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E0860FDB
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E0860FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nDhAyvbDAG+rCSMwDITKDp02u9yptmClftLPL5oCXxY=; b=i2w3xqB998ufrrlT1ojPw/8k2
	Vbx5wUHTVpmsXZzYKltefIsC2EOzDVQuUehS6GxW6G8yehxlhgY0SU3J7ITzf7R8IDafoRXnnS+dL
	qPYdgztzbU2jujBSw+hcisI2WxK5TD+QP4OdRenVyBD6AWiA+jxanAcO7edkiPldOJkx+C40EplqM
	cUBtt8xK9m8xTnSR71ktidfGuSzB8tWEyFy3DZeuDhnspXuNIREF+5urbbWATFpGYvmJs9umS2V+1
	0AW9sOwPENbosUZqZioB1hMwI1J4Uu3+8nDvFlTNUpLLsqmSup6p/PBK+Ot81erPb+R0LDxf0j952
	Eo0ZY0nlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrlJ-00653q-T0; Mon, 12 Apr 2021 08:17:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrlH-00653X-M4
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 08:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=PiHC5JD20WP6NjpTZdIaeEjPg1YvEF5jRaa2d6nBHjE=; b=b7Cc/c1/FS9qhSLhZ0QtvqLpE/
 d6Zp3bR9SQxE9znoijXRfvduEXbTKEAQcOIszU8rPywJyhXJDKKxWwQdvpDXogp7gnfrgkeVNC22u
 IKekR4yjqwzI1L02NCHwuG7xVTCfzzkQ6bYOujwPyAbfvgkbEBTT4imUqVMcURwDcaW3fw63IqApn
 zv1Orz5qf97oGj+TKr6dtRKLuJropzYs04vJ1YFxJXhMqBWc8qIOtjooZiR7Pd6vyTapbAAudeW+z
 x302KjNZjJC3PlsEnDY8W8BaXvv1wwW7erz/g69mp3h/XDvbdeeC7eObUNz6Gdf6NUwTW4LS9M2xo
 E8jM079Q==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrlE-005y04-DX
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 08:17:34 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FJhPC6Hhwz9ygP;
 Mon, 12 Apr 2021 16:15:11 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Apr 2021
 16:17:18 +0800
Subject: Re: [PATCH] mtd: core: Convert sysfs sprintf/snprintf family to
 sysfs_emit
To: Richard Weinberger <richard@nod.at>
CC: Tian Tao <tiantao6@hisilicon.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
References: <1618209872-20034-1-git-send-email-tiantao6@hisilicon.com>
 <614928182.172774.1618210140227.JavaMail.zimbra@nod.at>
 <049f8110-5777-db77-d374-275d1ceee81d@huawei.com>
 <754065655.172978.1618214872038.JavaMail.zimbra@nod.at>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <009e80a0-8aaa-4824-10c4-a5a82b2c6528@huawei.com>
Date: Mon, 12 Apr 2021 16:17:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <754065655.172978.1618214872038.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_011732_634411_1D7609CE 
X-CRM114-Status: UNSURE (   9.66  )
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

CuWcqCAyMDIxLzQvMTIgMTY6MDcsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gLS0tLS0g
VXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4+IEZpeCB0aGUgZm9sbG93aW5nIGNvY2NpY2hl
Y2sgd2FybmluZzoKPj4+PiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6Mjk2OjgtMTY6IFdBUk5JTkc6
IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+Pj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzozMDY6
OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+Pj4gZHJpdmVycy9tdGQv
bXRkY29yZS5jOjIzNzo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+
PiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6Mjc1OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYg
b3Igc3ByaW50Zgo+Pj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoyODY6OC0xNjogV0FSTklORzog
dXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+Pj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjI2NDo4
LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+PiBkcml2ZXJzL210ZC9t
dGRjb3JlLmM6MjI3OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+Pj4+
IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoxNjI6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBv
ciBzcHJpbnRmCj4+Pj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjE0Mzo4LTE2OiBXQVJOSU5HOiB1
c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+PiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6MjE4Ojgt
MTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+Pj4+IGRyaXZlcnMvbXRkL210
ZGNvcmUuYzoyMDg6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+Pj4g
ZHJpdmVycy9tdGQvbXRkY29yZS5jOjE5OTo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9y
IHNwcmludGYKPj4+PiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6MTkwOjgtMTY6IFdBUk5JTkc6IHVz
ZSBzY25wcmludGYgb3Igc3ByaW50Zgo+Pj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoxNTI6OC0x
NjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4+Pj4gZHJpdmVycy9tdGQvbXRk
Y29yZS5jOjE4MTo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPj4+PiBk
cml2ZXJzL210ZC9tdGRjb3JlLmM6MTM0OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Ig
c3ByaW50Zgo+Pj4+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoxNzE6OC0xNjogV0FSTklORzogdXNl
IHNjbnByaW50ZiBvciBzcHJpbnRmCj4+PiBzZWU6IFsKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW10ZC9DQUZMeEd2eEM0S3R2dFUycnphX2FHeDJSUE9OeHI3WHlnVXdYQ0RyaVlp
Q3I4cU4zcWdAbWFpbC5nbWFpbC5jb20vCj4+PiB8Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1tdGQvQ0FGTHhHdnhDNEt0dnRVMnJ6YV9hR3gyUlBPTnhyN1h5Z1V3WENEcmlZaUNy
OHFOM3FnQG1haWwuZ21haWwuY29tLwo+Pj4gXSBQbGVhc2UgZXhwbGFpbiB3aHkgYSBwYXRjaCBp
cyBuZWVkZWQgYW5kIHdoYXQgaXQgZml4ZXMuCj4+IFVzaW5nIHN5ZnNfZW1pdCB3aWxsIGF2b2lk
IGJ1ZmZlciBvdmVycnVuIGJ5IGF2b2lkaW5nIGJ1ZiBiZWluZyBudWxsIG9yIGJ1Zgo+PiBiZWlu
ZyBpbiB0aGUgbWlkZGxlIG9mIHRoZSBwYWdlLgo+PiBubyBmdW5jdGlvbiBjaGFuZ2UuCj4gQWxs
IHRoaXMgbmVlZHMgdG8gZ28gaW50byB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gTGlrZSBJIHNhaWQs
IHBsZWFzZSBleHBsYWluIGNoYW5nZXMuCj4KPiBUaGUgY29jY2ljaGVjayB3YXJuaW5nIGluIHRo
ZSBjb21taXQgbWVzc2FnZSBpcyBhbHNvIGNsb3NlIHRvIHVzZWxlc3MgYmVjYXVzZQo+IGl0IGFk
dmlzZXMgeW91IHRvIHVzZSBzY25wcmludGYgb3Igc3ByaW50Ziwgd2hpY2ggaXMgbm90IHdoYXQg
eW91ciBwYXRjaCBkb2VzLgoKdW5kZXJzdGFuZC4KCldoYXQgZG8geW91IHRoaW5rIG9mIHRoZSBm
b2xsb3dpbmcgY29tbWl0IG1lc3NhZ2UKClVzZSBzeXNmc19lbWl0IGluc3RlYWQgb2Ygc25wcmlu
dGYgdG8gYXZvaWQgYnVmIG92ZXJydW4sYmVjYXVzZSBpbiAKc3lzZnNfZW1pdCBpdCBzdHJpY3Rs
eSBjaGVja3MKCndoZXRoZXIgYnVmIGlzIG51bGwgb3IgYnVmIHdoZXRoZXIgcGFnZXNpemUgYWxp
Z25lZCwgb3RoZXJ3aXNlIGl0IApyZXR1cm5zIGFuIGVycm9yLgoKPgo+IFRoYW5rcywKPiAvL3Jp
Y2hhcmQKPiAuCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
