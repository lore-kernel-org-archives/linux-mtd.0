Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54460C433E7
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:28:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E314F2078A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BtudqaN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E314F2078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aprjdCUbzMXHQTt/fNgLzrx938AUEwT5XVYdqsux3ps=; b=BtudqaN3wzV5s2xyLmgUYRECh
	r8YdxchW8z5cB1pFPZG+GIzs7dxVJqm8CfpqUNJ00kQtxaWoowxEPrEPSkZ7qoj8/v0Lxy1SGLkWd
	jHuNnoboFeOG62NgPkJ7L41pGKAFJ7yOQhdl52vOcNR+HfAaglSZn9Uv9py+ec+YygYxGcTp2GgJU
	kiXKWDZcrKIzd3AA86wpvAs+AZFWECafW5M/kMnNaFqa67Qw+h2uAERGTWp4y0XHwNv9SNgB71m9F
	ptsjoDuO1enAzARd9Vem+dB9rBHtUq5BVQ8s64S+QjUHfD93f7v8cZNN5mSWH1dUwAwRdjQa5/Kjg
	LzMGNa08A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSUdA-0004O1-J3; Wed, 14 Oct 2020 00:27:02 +0000
Received: from regular1.263xmail.com ([211.150.70.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSUcx-0004Gp-54; Wed, 14 Oct 2020 00:26:48 +0000
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id C095310D7;
 Wed, 14 Oct 2020 08:26:43 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P18907T140199826794240S1602635202134719_; 
 Wed, 14 Oct 2020 08:26:43 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e3f77f875e6cfdb329f84277ad795cbf>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v10 3/8] MAINTAINERS: add maintainers to ROCKCHIP NFC
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
 <20200930020710.7394-4-yifeng.zhao@rock-chips.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <fc80d29f-de2d-6cc6-9fee-d10e9a85aec2@rock-chips.com>
Date: Wed, 14 Oct 2020 08:26:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930020710.7394-4-yifeng.zhao@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_202647_467702_1ECB02D1 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvOS8zMCDkuIrljYgxMDowNywgWWlmZW5nIFpoYW8gd3JvdGU6Cj4gQWRkIG1haW50
YWluZXJzIHRvIFJPQ0tDSElQIE5GQy4KPgo+IFNpZ25lZC1vZmYtYnk6IFlpZmVuZyBaaGFvIDx5
aWZlbmcuemhhb0Byb2NrLWNoaXBzLmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjEwOiBOb25l
Cj4gQ2hhbmdlcyBpbiB2OTogTm9uZQo+IENoYW5nZXMgaW4gdjg6IE5vbmUKPiBDaGFuZ2VzIGlu
IHY3OiBOb25lCj4gQ2hhbmdlcyBpbiB2NjogTm9uZQo+IENoYW5nZXMgaW4gdjU6IE5vbmUKPiBD
aGFuZ2VzIGluIHY0OiBOb25lCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+IENoYW5nZXMgaW4gdjI6
IE5vbmUKPgo+ICAgTUFJTlRBSU5FUlMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpMb29rcyBnb29kIHRvIG1lLAoKUmV2aWV3ZWQt
Ynk6IEtldmVyIFlhbmc8a2V2ZXIueWFuZ0Byb2NrLWNoaXBzLmNvbT4KClRoYW5rcywKLSBLZXZl
cgoKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggMTkw
YzdmYTJlYTAxLi41NTAwZGYzNDk4MzYgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysg
Yi9NQUlOVEFJTkVSUwo+IEBAIC0yMzgyLDEyICsyMzgyLDEyIEBAIEw6CWxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCj4g
ICBMOglsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gICBTOglNYWludGFpbmVk
Cj4gICBUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L21taW5kL2xpbnV4LXJvY2tjaGlwLmdpdAo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvKi8qcm9ja2NoaXAqLnlhbWwKPiAgIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvaTJjLXJrM3gueWFtbAo+IC1GOglEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbW1jL3JvY2tjaGlwLWR3LW1zaGMueWFtbAo+IC1GOglEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1yb2NrY2hpcC55YW1sCj4gICBGOglhcmNoL2Fy
bS9ib290L2R0cy9yazMqCj4gICBGOglhcmNoL2FybS9ib290L2R0cy9ydjExMDgqCj4gICBGOglh
cmNoL2FybS9tYWNoLXJvY2tjaGlwLwo+ICtGOglkcml2ZXJzLyovKi8qLypyb2NrY2hpcCoKPiAg
IEY6CWRyaXZlcnMvKi8qLypyb2NrY2hpcCoKPiAgIEY6CWRyaXZlcnMvKi8qcm9ja2NoaXAqCj4g
ICBGOglkcml2ZXJzL2Nsay9yb2NrY2hpcC8KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
