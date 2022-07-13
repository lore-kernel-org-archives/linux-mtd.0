Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF4DC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jul 2022 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ga8qYi0DORY/ZmMN9+Qzud4+MF6w+Fmw/zFpLYpGZZM=; b=P0Qb15jl7Cpw2k
	qoIloSUdT9igT1LTSH5E5fblZIK5eFK4Jx7ykA1UO5lUctjNNOQIeXVM5TNZqb+p92zeZZP2jd8v2
	Vtjeh+hAoEcWPf3hdiuuh6MmImeqpKr1kOOFlFpyqIYJInhTwzvc2ZIwD6BI2qNivKZdKjiLU7cRV
	FcdEUy+Gu8O7NFbxXspmkfD/sk3tj/ZIWkS/z6VSJJ0mF4os+jdCDER5IvaKe3M8/JnsdrE5Otd1p
	LhlGlE378s2irWlBwGrstU0yLtGBp6nSVjwuZdQAxmM2Qo9IMaRwmzPHJrnX9FG0wbFI7a6Jd/rFt
	cB5CprNDzlrO4N5X5yhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjTs-007sOg-Lv; Wed, 13 Jul 2022 21:01:12 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjTo-007sLd-1T
	for linux-mtd@lists.infradead.org; Wed, 13 Jul 2022 21:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657746068; x=1689282068;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LhXI5ldx+R/isqL5mJTcb3Kqhseql2na+Zu9Y+5xW08=;
  b=D4MQ0lOjRDSuuCEg2iclDPj50e5SdlEGkbm9goY+EGTDgr0GKfsdUY3I
   Ef9nS2xtUpiwkzV7aGYWPslOw7kYLo10z2cWKYTWJ66Pd7naHs9VNhdGk
   pdR2rWG3KXv6FHo8KoUkEWWHqm08wGTlVKWEmCyBDvZ3Zc7dQPdbqJxOa
   k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jul 2022 14:01:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 14:01:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 14:01:02 -0700
Received: from [10.110.120.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 13 Jul
 2022 14:01:01 -0700
Message-ID: <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
Date: Wed, 13 Jul 2022 14:01:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: <clg@kaod.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
	<quic_ggregory@quicinc.com>, <quic_jiles@quicinc.com>,
	<tudor.ambarus@microchip.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_140108_133360_03B167B2 
X-CRM114-Status: GOOD (  16.01  )
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

SGkgTWljaGFlbCwKCk9uIDcvMTMvMjAyMiA3OjMyIEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+
IEhpLAo+IAo+IEFtIDIwMjItMDctMTMgMTY6MjYsIHNjaHJpZWIgSmFlIEh5dW4gWW9vOgo+Pj4+
ICvCoMKgwqAgeyAidzI1cTUxMm53cSIsIElORk8oMHhlZjYwMjAsIDAsIDY0ICogMTAyNCwgMTAy
NCkKPj4+Cj4+PiBQbGVhc2UgdXNlIElORk8oMHhlZjYwMjAsIDAsIDAsIDApIGFuZCB0ZXN0IHdl
dGhlciBpdCB3aWxsIHN0aWxsCj4+PiB3b3JrIGNvcnJlY3RseS4gV2Ugd2lsbCB0aGVuIGJlIGFi
bGUgdG8gY29udmVydCBpdCB0byBTTk9SX0lEMygpCj4+PiBsYXRlci4KPj4KPj4gVGVzdGVkIGl0
IGJ1dCBpdCBkb2Vzbid0IHdvcmsgd2l0aCBJTkZPKDB4ZWY2MDIwLCAwLCAwLCAwKS4gSSdsbCBr
ZWVwCj4+IGl0IGFzIGlzLgo+IAo+IENhbiB5b3UgcGxlYXNlIGxvb2sgaW50byB0aGlzPyBJJ2Qg
ZXhwZWN0IHRoaXMgdG8gd29yayBpZiB0aGUgU0ZEUAo+IHRhYmxlcyBhcmUgY29ycmVjdCBiZWNh
dXNlIGFsbCB0aGlzIHNob3VsZCBjb21lIGZyb20gdGhlIHRhYmxlcy4KPiBZb3UgY2FuIGxvb2sg
YXQgL3N5cy9rZXJuZWwvZGVidWcvc3BpLW5vci9zcGkwLjAvcGFyYW1zIGFuZCBzZWUKPiB3aGF0
IGlzIGNoYW5naW5nIHRoZXJlLgoKSSB0ZXN0ZWQgaXQgYWdhaW4gYnV0IHJlc3VsdCBpcyBzdGls
bCB0aGUgc2FtZS4gSSBjYW4gY2hlY2sgdGhlIHBhcnNlZAppbmZvIGxpa2UgYmVsb3cgaWYgSSB1
c2UgSU5GTygweGVmNjAyMCwgMCwgNjQgKiAxMDI0LCAxMDI0KSBidXQgSSBjYW4ndApldmVuIGNo
ZWNrIHRoZSBkZWJ1Z2ZzIGluZm8gaWYgSSB1c2UgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkgc2lu
Y2UgaXQKZG9lc24ndCBib290IGF0IGFsbC4gSSB0aGluaywgdGhpcyBwYXRjaCBzaG91bGQgZ28g
YXMgaXMgYW5kIHRoZSBzaXplCnBhcnNpbmcgaXNzdWUgY291bGQgYmUgZml4ZWQgdXNpbmcgYSBz
ZXBhcmF0ZSBmaXguCgpUaGFua3MsCkphZQoKJCBjYXQgL3N5cy9rZXJuZWwvZGVidWcvc3BpLW5v
ci9zcGkwLjAvY2FwYWJpbGl0aWVzClN1cHBvcnRlZCByZWFkIG1vZGVzIGJ5IHRoZSBmbGFzaAog
IDFTLTFTLTFTCiAgIG9wY29kZSAgICAgICAgMHgxMwogICBtb2RlIGN5Y2xlcyAgIDAKICAgZHVt
bXkgY3ljbGVzICAwCiAgMVMtMVMtMVMgKGZhc3QgcmVhZCkKICAgb3Bjb2RlICAgICAgICAweDBj
CiAgIG1vZGUgY3ljbGVzICAgMAogICBkdW1teSBjeWNsZXMgIDgKICAxUy0xUy0yUwogICBvcGNv
ZGUgICAgICAgIDB4M2MKICAgbW9kZSBjeWNsZXMgICAwCiAgIGR1bW15IGN5Y2xlcyAgOAogIDFT
LTJTLTJTCiAgIG9wY29kZSAgICAgICAgMHhiYwogICBtb2RlIGN5Y2xlcyAgIDIKICAgZHVtbXkg
Y3ljbGVzICAyCiAgMVMtMVMtNFMKICAgb3Bjb2RlICAgICAgICAweDZjCiAgIG1vZGUgY3ljbGVz
ICAgMAogICBkdW1teSBjeWNsZXMgIDgKICAxUy00Uy00UwogICBvcGNvZGUgICAgICAgIDB4ZWMK
ICAgbW9kZSBjeWNsZXMgICAyCiAgIGR1bW15IGN5Y2xlcyAgNAogIDRTLTRTLTRTCiAgIG9wY29k
ZSAgICAgICAgMHhlYwogICBtb2RlIGN5Y2xlcyAgIDIKICAgZHVtbXkgY3ljbGVzICAwCgpTdXBw
b3J0ZWQgcGFnZSBwcm9ncmFtIG1vZGVzIGJ5IHRoZSBmbGFzaAogIDFTLTFTLTFTCiAgIG9wY29k
ZSAgICAgICAgMHgxMgogIDFTLTFTLTRTCiAgIG9wY29kZSAgICAgICAgMHgzNAokIGNhdCAvc3lz
L2tlcm5lbC9kZWJ1Zy9zcGktbm9yL3NwaTAuMC9wYXJhbXMKbmFtZSAgICAgICAgICAgIHcyNXE1
MTJud3EKaWQgICAgICAgICAgICAgIGVmIDYwIDIwCnNpemUgICAgICAgICAgICA2NC4wIE1pQgp3
cml0ZSBzaXplICAgICAgMQpwYWdlIHNpemUgICAgICAgMjU2CmFkZHJlc3Mgd2lkdGggICA0CmZs
YWdzICAgICAgICAgICA0Ql9PUENPREVTIHwgSEFTXzRCQUlUIHwgSEFTXzE2QklUX1NSIHwgU09G
VF9SRVNFVAoKb3Bjb2RlcwogIHJlYWQgICAgICAgICAgIDB4NmMKICAgZHVtbXkgY3ljbGVzICA4
CiAgZXJhc2UgICAgICAgICAgMHhkYwogIHByb2dyYW0gICAgICAgIDB4MTIKICA4RCBleHRlbnNp
b24gICBub25lCgpwcm90b2NvbHMKICByZWFkICAgICAgICAgICAxUy0xUy00UwogIHdyaXRlICAg
ICAgICAgIDFTLTFTLTFTCiAgcmVnaXN0ZXIgICAgICAgMVMtMVMtMVMKCmVyYXNlIGNvbW1hbmRz
CiAgMjEgKDQuMDAgS2lCKSBbMV0KICBkYyAoNjQuMCBLaUIpIFszXQogIGM3ICg2NC4wIE1pQikK
CnNlY3RvciBtYXAKICByZWdpb24gKGluIGhleCkgICB8IGVyYXNlIG1hc2sgfCBmbGFncwogIC0t
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLQogIDAwMDAwMDAwLTAzZmZm
ZmZmIHwgICAgIFsgMTIzXSB8Cgo+IFRoYW5rcywKPiAtbWljaGFlbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
