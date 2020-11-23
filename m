Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4294EC2D0E4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 14:49:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34BBA2075A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 14:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aTjyBXv+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34BBA2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RlebTq9RioOUbCl/73BpyfN49ggBVqslGH389UaFzVI=; b=aTjyBXv+kCtQOLRuSi1CYp24x
	G/aNsYa9E2UlnIZMv2Aw2tE1WeIqfKvcgTfLoMillpumfyVBgZkiLIiZzENe1yfZdhcHz1QmviZ+B
	hl9jQNxQUDxDXu9J33MiKluAGkHpgaJUpZjLwNmym6Wyj+knBqNUQNdA2PHZe94ZnnZKaVpt1UKhU
	RBN/i59vC0RucI81PscVI5Sbcwddr0zpLkNpcupXz/sIRSFrOUJn2WSJ+7fjOkoL+T7MG+x4MqXMK
	9cFlS07/GltazEhuS1BxJ10U6KY0PYugRzMz3btJm30nhHgEp/ws8uZiXhhR1bgQAG/SiC4t58pyf
	aGV+/47fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khD9g-0001wV-QU; Mon, 23 Nov 2020 14:49:24 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khD9e-0001vc-Fb
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 14:49:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 321D96736F; Mon, 23 Nov 2020 15:49:15 +0100 (CET)
Date: Mon, 23 Nov 2020 15:49:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: =?utf-8?B?5buW5aiB6ZuE?= <gmpy.liaowx@gmail.com>
Subject: Re: [PATCH 8/9] pstore/blk: use the normal block device I/O path
Message-ID: <20201123144914.GA667@lst.de>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-9-hch@lst.de>
 <CAL3PxMpk_HV40EozhWMDZgc85vvLvosJ-e9CKWyZ+tRBB27hDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL3PxMpk_HV40EozhWMDZgc85vvLvosJ-e9CKWyZ+tRBB27hDA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_094922_645789_A71D37AF 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>, linux-mtd@lists.infradead.org,
 Colin Cross <ccross@android.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBOb3YgMDgsIDIwMjAgYXQgMTA6NDM6MjlQTSArMDgwMCwg5buW5aiB6ZuEIHdyb3Rl
Ogo+ID4gKyAgICAgICBjb25zdCBjaGFyIGRldm5hbWVbXSA9ICIvZGV2L3BzdG9yZS1ibGsiOwo+
ID4gKyAgICAgICBkZXZfdCBkZXYgPSBuYW1lX3RvX2Rldl90KGJsa2Rldik7Cj4gPiArCj4gPiAr
ICAgICAgIGlmICghZGV2KQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ICsgICAgICAg
aW5pdF91bmxpbmsoZGV2bmFtZSk7Cj4gPiArICAgICAgIGluaXRfbWtub2QoZGV2bmFtZSwgU19J
RkJMSyB8IDA2MDAsIG5ld19lbmNvZGVfZGV2KGRldikpOwo+ID4gKyAgICAgICBfX3BzdG9yZV9i
bGtfaW5pdChkZXZuYW1lKTsKPiAKPiBIb3cgYWJvdXQgcHN0b3JlL2JsayBtYWtpbmcgL2Rldi9w
c3RvcmUtYmxrIG5vZGUgbm8gbWF0dGVyIGJ1aWxkLWluCj4gb3IgbW9kdWxlLiBUaGVuIHBzdG9y
ZS9ibGsgYWx3YXlzIG9wZW5zIC9kZXYvcHN0b3JlLWJsay4gQnkgdGhpcyB3YXksCj4gYmxrZGV2
IGNhbiBhbHNvIGJlIGEgZGV2aWNlIG51bWJlciBpZiBwc3RvcmUvYmxrIGJ1aWx0IGFzIGEgbW9k
dWxlLgoKUGxlYXNlIHJlYWQgdGhlIGNvbW1lbnQgYWJvdmUgYmxrZGV2X2dldF9ieV9kZXYgb24g
d2h5IG5vIG9uZSBzaG91bGQKYWRkIG5ldyBpbnRlcmZhY2VzIGJhc2VkIG9uIHRoZSBkZXZpY2Ug
bnVtYmVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
