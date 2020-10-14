Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F30C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:28:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9BF208B3
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmf98wHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9BF208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=si6wuaUs6DpPRc17LcdNT9uDOpb2Vgep/M3fvgPeWPU=; b=pmf98wHKi/bosMZ/YZ66Q6Sxt
	stpR7UjCCpKKGzAJv7FtYuRpsLq8Mpl5PKDQZ479Pa4ZmuWK79W1kaRw5j5+8iwWIppy4e80LMude
	dFAx1ion0ISl6oi55r8Ogh+tY+1kN9qTIZRx65njpU/vbMJWN2sckduQQ8lAcz8gUeOhc6UK7yg3/
	TmH9HYfLquIM0w3GFQGZtZuYRH+2XlV9HnPhfWJIrYhT139r72B68PssZokVlwyRwp4POaeaKVoHR
	y9RJkhEqdV78cT2cSg2Uas7Z6brB4B9yzNV/p0sOlrIX2co0xGQX07M3c5qonBbHh0Hm5yKBDr5CO
	UDuczvVuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSUeG-0004us-54; Wed, 14 Oct 2020 00:28:08 +0000
Received: from regular1.263xmail.com ([211.150.70.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSUdk-0004dk-S3; Wed, 14 Oct 2020 00:27:41 +0000
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 6D1EB1410;
 Wed, 14 Oct 2020 08:27:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P19667T139950929123072S1602635253071439_; 
 Wed, 14 Oct 2020 08:27:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c059e3b8dae9b4aba3b46bc811c4c4a5>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v10 6/8] arm: dts: rockchip: Add NFC node for RV1108 SoC
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
 <20200930020902.7522-1-yifeng.zhao@rock-chips.com>
 <20200930020902.7522-2-yifeng.zhao@rock-chips.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <fd4ed2c6-b8a6-c2df-1086-10460f855344@rock-chips.com>
Date: Wed, 14 Oct 2020 08:27:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930020902.7522-2-yifeng.zhao@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_202737_788888_566258FD 
X-CRM114-Status: GOOD (  15.44  )
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

Ck9uIDIwMjAvOS8zMCDkuIrljYgxMDowOSwgWWlmZW5nIFpoYW8gd3JvdGU6Cj4gQWRkIE5BTkQg
RkxBU0ggQ29udHJvbGxlcihORkMpIG5vZGUgZm9yIFJWMTEwOCBTb0MuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZaWZlbmcgWmhhbyA8eWlmZW5nLnpoYW9Acm9jay1jaGlwcy5jb20+Cj4gLS0tCj4KPiBD
aGFuZ2VzIGluIHYxMDogTm9uZQo+IENoYW5nZXMgaW4gdjk6IE5vbmUKPiBDaGFuZ2VzIGluIHY4
OiBOb25lCj4gQ2hhbmdlcyBpbiB2NzogTm9uZQo+IENoYW5nZXMgaW4gdjY6IE5vbmUKPiBDaGFu
Z2VzIGluIHY1OiBOb25lCj4gQ2hhbmdlcyBpbiB2NDogTm9uZQo+IENoYW5nZXMgaW4gdjM6IE5v
bmUKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3J2MTEwOC5k
dHNpIHwgMTEgKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
CgpMb29rcyBnb29kIHRvIG1lLAoKUmV2aWV3ZWQtYnk6IEtldmVyIFlhbmc8a2V2ZXIueWFuZ0By
b2NrLWNoaXBzLmNvbT4KClRoYW5rcywKLSBLZXZlcgoKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9ydjExMDguZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3J2MTEwOC5kdHNpCj4g
aW5kZXggYTFhMDhjYjkzNjRlLi4xNjk2ZWExOTQ4OGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvcnYxMTA4LmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9ydjExMDguZHRz
aQo+IEBAIC00NTIsNiArNDUyLDE3IEBACj4gICAJCSNyZXNldC1jZWxscyA9IDwxPjsKPiAgIAl9
Owo+ICAgCj4gKwluZmM6IG5hbmQtY29udHJvbGxlckAzMDEwMDAwMCB7Cj4gKwkJY29tcGF0aWJs
ZSA9ICJyb2NrY2hpcCxydjExMDgtbmZjIjsKPiArCQlyZWcgPSA8MHgzMDEwMDAwMCAgMHgxMDAw
PjsKPiArCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4g
KwkJY2xvY2tzID0gPCZjcnUgSENMS19OQU5EQz4sIDwmY3J1IFNDTEtfTkFOREM+Owo+ICsJCWNs
b2NrLW5hbWVzID0gImFoYiIsICJuZmMiOwo+ICsJCWFzc2lnbmVkLWNsb2NrcyA9IDwmY3J1IFND
TEtfTkFOREM+Owo+ICsJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDE1MDAwMDAwMD47Cj4gKwkJ
c3RhdHVzID0gImRpc2FibGVkIjsKPiArCX07Cj4gKwo+ICAgCWVtbWM6IG1tY0AzMDExMDAwMCB7
Cj4gICAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscnYxMTA4LWR3LW1zaGMiLCAicm9ja2NoaXAs
cmszMjg4LWR3LW1zaGMiOwo+ICAgCQlyZWcgPSA8MHgzMDExMDAwMCAweDQwMDA+OwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
