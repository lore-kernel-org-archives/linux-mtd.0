Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AD3C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E62D20780
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E62D20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N3ZjdpBFgj1PRPWKiZjh+jdpl/y/6M4+DOeFMDS2Ys4=; b=cv6//5Sz1g7cJ1gzZkvTv6Dqn
	h0gyu24cZOaiDUW8IVs1G+uTSK7F5OHZbRqntPT4+T/3IOWwJU+W9mpXjELVcJ9EzsNCyrl8+nDfS
	h47IotFfeBffcFkGX7/ooBfc0v4N8YJNrfCk5NY6tNEgosGc6EU9jccPywOzpwBf7gok1K66q4p9x
	cFvEG4jTYmQ2+CBhf79Hud9MCf5BcpeVFeumYd6DQFe2RkhdCfLESrp6u60w2ZpAIVdUh2cioqJA5
	8Ja77NAb8eFylKZqMWh/aKpWtgO44C/oGykQI68vYO+L67Fv02FYJGWMo4hf7MOaFyvKkKi8k/v9r
	UqaRNM99A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwMnP-0007pI-Pt; Mon, 04 Jan 2021 10:09:03 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwMnN-0007nu-4e
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 10:09:02 +0000
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D69C3200007;
 Mon,  4 Jan 2021 10:08:56 +0000 (UTC)
Date: Mon, 4 Jan 2021 11:08:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: yangerkun <yangerkun@huawei.com>
Subject: Re: [PATCH] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
Message-ID: <20210104110854.7c3848b9@xps13>
In-Reply-To: <20201230021718.2043147-1-yangerkun@huawei.com>
References: <20201230021718.2043147-1-yangerkun@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_050901_325171_210E0A9A 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: zhongguohua1@huawei.com, yi.zhang@huawei.com, richard@nod.at,
 joern@lazybastard.org, linux-mtd@lists.infradead.org, patrick@baymotion.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgeWFuZ2Vya3VuLAoKeWFuZ2Vya3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4gd3JvdGUgb24g
V2VkLCAzMCBEZWMgMjAyMCAxMDoxNzoxOAorMDgwMDoKCj4gV2Ugbm93IHN1cHBvcnQgdXNlciB0
byBzZXQgZXJhc2UgcGFnZSBzaXplLCBhbmQgdXNlIGRvX2RpdiBiZXR3ZWVuIGxlbgo+IGFuZCBl
cmFzZSBzaXplIHRvIGRldGVybWluZSB0aGUgcmVhc29uYWJsZW5lc3MgZm9yIHRoZSBlcmFzZSBz
aXplLgo+IEhvd2V2ZXIsIGRvX2RpdiBpcyBhIG1hY3JvIGFuZCB3aWxsIG92ZXJ3cml0ZSB0aGUg
dmFsdWUgb2YgbGVuLiBXaGljaAo+IHJlc3VsdHMgYSBtdGQgZGV2aWNlIHdpdGggdW5leGNlcHRl
ZCBzaXplLiBGaXggaXQgYnkgdXNlIGRpdl91NjRfcmVtLgoKICAgICAgICAgICAgICAgICAgICAg
ICB3aXRoIHVuZXhwZWN0ZWQgc2l6ZS4gVXNlIGRpdl91NjRfcmVtIGluc3RlYWQuCgooSSB3aWxs
IGZpeCBpdCB3aGVuIGFwcGx5aW5nLCBubyBuZWVkIHRvIHJlc2VuZCkKCj4gCj4gRml4ZXM6IGZm
YWQ1NjAzOTRkZSAoIm10ZDogcGhyYW06IEFsbG93IHRoZSB1c2VyIHRvIHNldCB0aGUgZXJhc2Ug
cGFnZSBzaXplLiIpCj4gU2lnbmVkLW9mZi1ieTogeWFuZ2Vya3VuIDx5YW5nZXJrdW5AaHVhd2Vp
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jIHwgNCArKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9w
aHJhbS5jCj4gaW5kZXggY2ZkMTcwOTQ2YmE0Li42ZTcyYjBhYmNiNzEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9w
aHJhbS5jCj4gQEAgLTIyMiw2ICsyMjIsNyBAQCBzdGF0aWMgaW50IHBocmFtX3NldHVwKGNvbnN0
IGNoYXIgKnZhbCkKPiAgCXVpbnQ2NF90IHN0YXJ0Owo+ICAJdWludDY0X3QgbGVuOwo+ICAJdWlu
dDY0X3QgZXJhc2VzaXplID0gUEFHRV9TSVpFOwo+ICsJdWludDMyX3QgcmVtOwo+ICAJaW50IGks
IHJldDsKPiAgCj4gIAlpZiAoc3Rybmxlbih2YWwsIHNpemVvZihidWYpKSA+PSBzaXplb2YoYnVm
KSkKPiBAQCAtMjYzLDggKzI2NCw5IEBAIHN0YXRpYyBpbnQgcGhyYW1fc2V0dXAoY29uc3QgY2hh
ciAqdmFsKQo+ICAJCX0KPiAgCX0KPiAgCj4gKwlkaXZfdTY0X3JlbShsZW4sICh1aW50MzJfdCll
cmFzZXNpemUsICZyZW0pOwo+ICAJaWYgKGxlbiA9PSAwIHx8IGVyYXNlc2l6ZSA9PSAwIHx8IGVy
YXNlc2l6ZSA+IGxlbgo+IC0JICAgIHx8IGVyYXNlc2l6ZSA+IFVJTlRfTUFYIHx8IGRvX2Rpdihs
ZW4sICh1aW50MzJfdCllcmFzZXNpemUpICE9IDApIHsKPiArCSAgICB8fCBlcmFzZXNpemUgPiBV
SU5UX01BWCB8fCByZW0pIHsKPiAgCQlwYXJzZV9lcnIoImlsbGVnYWwgZXJhc2VzaXplIG9yIGxl
blxuIik7Cj4gIAkJZ290byBlcnJvcjsKPiAgCX0KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
