Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93860C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F90E207DE
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xol485pk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F90E207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hvt5kfHuqp6cG4P8rpWl6N4cqthNmEw6hk6/mVg5a58=; b=Xol485pk8cIAEyFIm2leGOj39
	oKqahdooCWexEk8cxqJEAOXUfqlcfOOVZIfah5HE9gTAU2dWgGlKTNflbZNWurN7GIH6D+4Sk3Wcz
	g4iI1aXKHx5n46gbh3UNBla+jjrVwQtpPzPJD/KdUMLPcRDt2D2YMXUPcOu5RHv5u4zxo947eN3bZ
	dANY5O5gsn2mtUZO5ZPjeomDYHhZARo60D4Tbi4EQs3xtBjRbtv89zGZxHygO37BJDUHmptf3248w
	83aWpJeP+mfPZe2DXBFSoOSOEmt33owAEuiZAJFsoVnrN6K0SyXzoZeXUa0Lb20XUAxzFXUUr2cIN
	GTH+Y6PwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSUfH-0005d0-3H; Wed, 14 Oct 2020 00:29:12 +0000
Received: from regular1.263xmail.com ([211.150.70.203])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSUeM-0004xc-Me; Wed, 14 Oct 2020 00:28:15 +0000
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id CFAAC7F7;
 Wed, 14 Oct 2020 08:28:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P30218T139798299801344S1602635289936229_; 
 Wed, 14 Oct 2020 08:28:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <092ed86f293027f386d50ecd0a6b6597>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v10 8/8] arm: dts: rockchip: Add NFC node for RK3036 SoC
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
 <20200930020902.7522-1-yifeng.zhao@rock-chips.com>
 <20200930020902.7522-4-yifeng.zhao@rock-chips.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <cd4ac8ed-49b4-fe7d-f483-f267376acec6@rock-chips.com>
Date: Wed, 14 Oct 2020 08:28:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930020902.7522-4-yifeng.zhao@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_202815_223509_187D681B 
X-CRM114-Status: GOOD (  15.96  )
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
RkxBU0ggQ29udHJvbGxlcihORkMpIG5vZGUgZm9yIFJLMzAzNiBTb0MuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZaWZlbmcgWmhhbyA8eWlmZW5nLnpoYW9Acm9jay1jaGlwcy5jb20+Cj4gLS0tCj4KPiBD
aGFuZ2VzIGluIHYxMDogTm9uZQo+IENoYW5nZXMgaW4gdjk6IE5vbmUKPiBDaGFuZ2VzIGluIHY4
OiBOb25lCj4gQ2hhbmdlcyBpbiB2NzogTm9uZQo+IENoYW5nZXMgaW4gdjY6IE5vbmUKPiBDaGFu
Z2VzIGluIHY1OiBOb25lCj4gQ2hhbmdlcyBpbiB2NDogTm9uZQo+IENoYW5nZXMgaW4gdjM6IE5v
bmUKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzAzNi5k
dHNpIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCgpMb29rcyBnb29kIHRvIG1lLAoKUmV2aWV3ZWQtYnk6
IEtldmVyIFlhbmc8a2V2ZXIueWFuZ0Byb2NrLWNoaXBzLmNvbT4KClRoYW5rcywKLSBLZXZlcgoK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMwMzYuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3JrMzAzNi5kdHNpCj4gaW5kZXggMDkzNTY3MDIyMzg2Li5kZGE1YTFmNzlhY2Eg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMDM2LmR0c2kKPiArKysgYi9hcmNo
L2FybS9ib290L2R0cy9yazMwMzYuZHRzaQo+IEBAIC0yOTIsNiArMjkyLDIxIEBACj4gICAJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAJfTsKPiAgIAo+ICsJbmZjOiBuYW5kLWNvbnRyb2xsZXJA
MTA1MDAwMDAgewo+ICsJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMDM2LW5mYyIsCj4gKwkJ
CSAgICAgInJvY2tjaGlwLHJrMjkyOC1uZmMiOwo+ICsJCXJlZyA9IDwweDEwNTAwMDAwIDB4NDAw
MD47Cj4gKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE4IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+
ICsJCWNsb2NrcyA9IDwmY3J1IEhDTEtfTkFOREM+LCA8JmNydSBTQ0xLX05BTkRDPjsKPiArCQlj
bG9jay1uYW1lcyA9ICJhaGIiLCAibmZjIjsKPiArCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNydSBT
Q0xLX05BTkRDPjsKPiArCQlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwxNTAwMDAwMDA+Owo+ICsJ
CXBpbmN0cmwtMCA9IDwmZmxhc2hfYWxlICZmbGFzaF9idXM4ICZmbGFzaF9jbGUgJmZsYXNoX2Nz
bjAKPiArCQkJICAgICAmZmxhc2hfcmRuICZmbGFzaF9yZHkgJmZsYXNoX3dybj47Cj4gKwkJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJfTsK
PiArCj4gICAJY3J1OiBjbG9jay1jb250cm9sbGVyQDIwMDAwMDAwIHsKPiAgIAkJY29tcGF0aWJs
ZSA9ICJyb2NrY2hpcCxyazMwMzYtY3J1IjsKPiAgIAkJcmVnID0gPDB4MjAwMDAwMDAgMHgxMDAw
PjsKPiBAQCAtNjQzLDYgKzY1OCw0MyBAQAo+ICAgCQkJfTsKPiAgIAkJfTsKPiAgIAo+ICsJCW5m
YyB7Cj4gKwkJCWZsYXNoX2FsZTogZmxhc2gtYWxlIHsKPiArCQkJCXJvY2tjaGlwLHBpbnMgPSA8
MiBSS19QQTAgMSAmcGNmZ19wdWxsX2RlZmF1bHQ+Owo+ICsJCQl9Owo+ICsKPiArCQkJZmxhc2hf
YnVzODogZmxhc2gtYnVzOCB7Cj4gKwkJCQlyb2NrY2hpcCxwaW5zID0gPDEgUktfUEQwIDEgJnBj
ZmdfcHVsbF9kZWZhdWx0PiwKPiArCQkJCQkJPDEgUktfUEQxIDEgJnBjZmdfcHVsbF9kZWZhdWx0
PiwKPiArCQkJCQkJPDEgUktfUEQyIDEgJnBjZmdfcHVsbF9kZWZhdWx0PiwKPiArCQkJCQkJPDEg
UktfUEQzIDEgJnBjZmdfcHVsbF9kZWZhdWx0PiwKPiArCQkJCQkJPDEgUktfUEQ0IDEgJnBjZmdf
cHVsbF9kZWZhdWx0PiwKPiArCQkJCQkJPDEgUktfUEQ1IDEgJnBjZmdfcHVsbF9kZWZhdWx0PiwK
PiArCQkJCQkJPDEgUktfUEQ2IDEgJnBjZmdfcHVsbF9kZWZhdWx0PiwKPiArCQkJCQkJPDEgUktf
UEQ3IDEgJnBjZmdfcHVsbF9kZWZhdWx0PjsKPiArCQkJfTsKPiArCj4gKwkJCWZsYXNoX2NsZTog
Zmxhc2gtY2xlIHsKPiArCQkJCXJvY2tjaGlwLHBpbnMgPSA8MiBSS19QQTEgMSAmcGNmZ19wdWxs
X2RlZmF1bHQ+Owo+ICsJCQl9Owo+ICsKPiArCQkJZmxhc2hfY3NuMDogZmxhc2gtY3NuMCB7Cj4g
KwkJCQlyb2NrY2hpcCxwaW5zID0gPDIgUktfUEE2IDEgJnBjZmdfcHVsbF9kZWZhdWx0PjsKPiAr
CQkJfTsKPiArCj4gKwkJCWZsYXNoX3JkbjogZmxhc2gtcmRuIHsKPiArCQkJCXJvY2tjaGlwLHBp
bnMgPSA8MiBSS19QQTMgMSAmcGNmZ19wdWxsX2RlZmF1bHQ+Owo+ICsJCQl9Owo+ICsKPiArCQkJ
Zmxhc2hfcmR5OiBmbGFzaC1yZHkgewo+ICsJCQkJcm9ja2NoaXAscGlucyA9IDwyIFJLX1BBNCAx
ICZwY2ZnX3B1bGxfZGVmYXVsdD47Cj4gKwkJCX07Cj4gKwo+ICsJCQlmbGFzaF93cm46IGZsYXNo
LXdybiB7Cj4gKwkJCQlyb2NrY2hpcCxwaW5zID0gPDIgUktfUEEyIDEgJnBjZmdfcHVsbF9kZWZh
dWx0PjsKPiArCQkJfTsKPiArCQl9Owo+ICsKPiAgIAkJZW1hYyB7Cj4gICAJCQllbWFjX3hmZXI6
IGVtYWMteGZlciB7Cj4gICAJCQkJcm9ja2NoaXAscGlucyA9IDwyIFJLX1BCMiAxICZwY2ZnX3B1
bGxfZGVmYXVsdD4sIC8qIGNyc19kdmFsaWQgKi8KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
