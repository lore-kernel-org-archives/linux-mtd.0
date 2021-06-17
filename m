Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50515C48BE5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 01:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D08B8613DE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 01:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D08B8613DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwWV18K6K9AHyM/V22OEak6Z1r5FUef/dGWSXvR29eQ=; b=4vyfZUbR9eI7dBoDGcUnH+/NSh
	K/6giCzPbyOlTUs3zEOzzb/EXltjTHvGkqZAgn72U+bG4u9M5Ki+d3v3kyYyfflXSMbc3E/lqeCKA
	YLDw9QWu/kPP5uGH8Ph8G3ZOZMNvzKJy6KzTlSa37dV8ZY6oWygm1A6B0an3r4jLp7abCUUemdOXd
	3L+4Ci7OwZ7GABXiTLQAq4c/0D0WBZ7FmRr0ePFxI4l4iYnZDlT9puP969BZjdoxOt4xtS4pqXi1W
	BhYwflS6A54wUrritYxp3ig2vLr/I1GVBIq4I73H5TBtqHy1NQvlQ3jfMN1Zxd2MX5P2WnTSJOEhS
	50oOPuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lthCT-008Tbv-NJ; Thu, 17 Jun 2021 01:52:09 +0000
Received: from regular1.263xmail.com ([211.150.70.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lthCG-008TaJ-1K; Thu, 17 Jun 2021 01:51:58 +0000
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 14F3B1B67;
 Thu, 17 Jun 2021 09:51:47 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P15326T140654340470528S1623894702990941_; 
 Thu, 17 Jun 2021 09:51:44 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8676accae82e1e2e8682e39c204adf18>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: macromorgan@hotmail.com
X-RCPT-COUNT: 21
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v7 1/9] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
To: Rob Herring <robh@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Jon Lin <jon.lin@rock-chips.com>, linux-spi <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Johan Jonker <jbx6244@gmail.com>, =?UTF-8?B?6buE5a626ZKX?=
 <hjc@rock-chips.com>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pratyush Yadav <p.yadav@ti.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609140412.16058-2-jon.lin@rock-chips.com>
 <20210610024350.GA697147@robh.at.kernel.org>
 <e8e7c8c1-4f71-538c-a8e1-b61a894bd4a8@rock-chips.com>
 <CAAEAJfCyXWvcqswXfmgXBX-et0mq3vxoUacUmHGso9t+XoNqOg@mail.gmail.com>
 <CAL_JsqL1Sb_TCw6TG7XGBDtmhMVD+_n7d-ii7N9N7w1+A627=w@mail.gmail.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <e2be59ae-37a0-4455-e5a6-f7156da29e95@rock-chips.com>
Date: Thu, 17 Jun 2021 09:51:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL1Sb_TCw6TG7XGBDtmhMVD+_n7d-ii7N9N7w1+A627=w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_185156_486583_3D67859A 
X-CRM114-Status: GOOD (  34.39  )
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

SGkgUm9iLAoKT24gMjAyMS82LzE2IOS4i+WNiDExOjM4LCBSb2IgSGVycmluZyB3cm90ZToKPiBP
biBGcmksIEp1biAxMSwgMjAyMSBhdCAxMDozMyBBTSBFemVxdWllbCBHYXJjaWEKPiA8ZXplcXVp
ZWxAdmFuZ3VhcmRpYXN1ci5jb20uYXI+IHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+IE9uIFRodSwg
MTAgSnVuIDIwMjEgYXQgMDA6MDQsIEtldmVyIFlhbmcgPGtldmVyLnlhbmdAcm9jay1jaGlwcy5j
b20+IHdyb3RlOgo+Pj4gSGkgUm9iLAo+Pj4KPj4+IE9uIDIwMjEvNi8xMCDkuIrljYgxMDo0Mywg
Um9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4gT24gV2VkLCBKdW4gMDksIDIwMjEgYXQgMTA6MDQ6MDRQ
TSArMDgwMCwgSm9uIExpbiB3cm90ZToKPj4+Pj4gRnJvbTogQ2hyaXMgTW9yZ2FuIDxtYWNyb21v
cmdhbkBob3RtYWlsLmNvbT4KPj4+Pj4KPj4+Pj4gQWRkIGJpbmRpbmdzIGZvciB0aGUgUm9ja2No
aXAgc2VyaWFsIGZsYXNoIGNvbnRyb2xsZXIuIE5ldyBkZXZpY2UKPj4+Pj4gc3BlY2lmaWMgcGFy
YW1ldGVyIG9mIHJvY2tjaGlwLHNmYy1uby1kbWEgaW5jbHVkZWQgaW4gZG9jdW1lbnRhdGlvbi4K
Pj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgTW9yZ2FuIDxtYWNyb21vcmdhbkBob3Rt
YWlsLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9uIExpbiA8am9uLmxpbkByb2NrLWNoaXBz
LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+IENoYW5nZXMgaW4gdjc6Cj4+Pj4+IC0gRml4IHVw
IHRoZSBzY2xrX3NmYyBwYXJlbnQgZXJyb3IgaW4gcmszMDM2Cj4+Pj4+IC0gVW5pZnkgdG8gInJv
Y2tjaGlwLHNmYyIgY29tcGF0aWJsZSBpZCBiZWNhdXNlIGFsbCB0aGUgZmVhdHVyZSB1cGRhdGUK
Pj4+Pj4gICAgIHdpbGwgaGF2ZSBhIG5ldyBJUCB2ZXJzaW9uLCBzbyB0aGUgZHJpdmVyIGlzIHVz
ZWQgZm9yIHRoZSBTRkMgSVAgaW4KPj4+Pj4gICAgIGFsbCBTb0NzCj4+Pj4+IC0gQ2hhbmdlIHRv
IHVzZSBub2RlICJzZmMiIHRvIG5hbWUgdGhlIFNGQyBwaW5jdHJsIGdyb3VwCj4+Pj4+IC0gQWRk
IHN1Ym5vZGUgcmVnIHByb3BlcnR5IGNoZWNrCj4+Pj4+IC0gQWRkIHJvY2tjaGlwX3NmY19hZGp1
c3Rfb3Bfc2l6ZSB0byB3b3JrYXJvdW5kIGluIENNRCArIERVTU1ZIGNhc2UKPj4+Pj4gLSBMaW1p
dCBtYXhfaW9zaXplIHRvIDMyS0IKPj4+Pj4KPj4+Pj4gQ2hhbmdlcyBpbiB2NjoKPj4+Pj4gLSBB
ZGQgc3VwcG9ydCBpbiBkZXZpY2UgdHJlZXMgZm9yIHJ2MTEyNihEZWNsYXJlZCBpbiBzZXJpZXMg
NSBidXQgbm90Cj4+Pj4+ICAgICBzdWJtaXR0ZWQpCj4+Pj4+IC0gQ2hhbmdlIHRvIHVzZSAiY2xr
X3NmYyIgImhjbGtfc2ZjIiBhcyBjbG9jayBsYWJsZSwgc2luY2UgaXQgZG9lcyBub3QKPj4+Pj4g
ICAgIGFmZmVjdCBpbnRlcnByZXRhdGlvbiBhbmQgaGFzIGJlZW4gd2lkZWx5IHVzZWQKPj4+Pj4g
LSBTdXBwb3J0IHNmYyB0eF9kdWFsLCB0eF9xdWFkKERlY2xhcmVkIGluIHNlcmllcyA1IGJ1dCBu
b3Qgc3VibWl0dGVkKQo+Pj4+PiAtIFNpbXBsaWZ5IHRoZSBjb2RlLCBzdWNoIGFzIHJlbW92ZSAi
cm9ja2NoaXBfc2ZjX3JlZ2lzdGVyX2FsbCIoRGVjbGFyZWQKPj4+Pj4gICAgIGluIHNlcmllcyA1
IGJ1dCBub3Qgc3VibWl0dGVkKQo+Pj4+PiAtIFN1cHBvcnQgU0ZDIHZlcjQgdmVyNShEZWNsYXJl
ZCBpbiBzZXJpZXMgNSBidXQgbm90IHN1Ym1pdHRlZCkKPj4+Pj4gLSBBZGQgYXV0aG9yIENocmlz
IE1vcmdhbiBhbmQgSm9uIExpbiB0byBzcGktcm9ja2NoaXAtc2ZjLmMKPj4+Pj4gLSBDaGFuZ2Ug
dG8gdXNlIGRldm1fc3BpX2FsbG9jX21hc3RlciBhbmQgc3BpX3VucmVnaXN0ZXJfbWFzdGVyCj4+
Pj4+Cj4+Pj4+IENoYW5nZXMgaW4gdjU6Cj4+Pj4+IC0gQWRkIHN1cHBvcnQgaW4gZGV2aWNlIHRy
ZWVzIGZvciBydjExMjYKPj4+Pj4gLSBTdXBwb3J0IHNmYyB0eF9kdWFsLCB0eF9xdWFkCj4+Pj4+
IC0gU2ltcGxpZnkgdGhlIGNvZGUsIHN1Y2ggYXMgcmVtb3ZlICJyb2NrY2hpcF9zZmNfcmVnaXN0
ZXJfYWxsIgo+Pj4+PiAtIFN1cHBvcnQgU0ZDIHZlcjQgdmVyNQo+Pj4+Pgo+Pj4+PiBDaGFuZ2Vz
IGluIHY0Ogo+Pj4+PiAtIENoYW5naW5nIHBhdGNoIGJhY2sgdG8gYW4gIlJGQyIuIEFuIGVuZ2lu
ZWVyIGZyb20gUm9ja2NoaXAKPj4+Pj4gICAgIHJlYWNoZWQgb3V0IHRvIG1lIHRvIGxldCBtZSBr
bm93IHRoZXkgYXJlIHdvcmtpbmcgb24gdGhpcyBwYXRjaCBmb3IKPj4+Pj4gICAgIHVwc3RyZWFt
LCBJIGFtIHN1Ym1pdHRpbmcgdGhpcyB2NCBmb3IgdGhlIGNvbW11bml0eSB0byBzZWUgaG93ZXZl
cgo+Pj4+PiAgICAgSSBleHBlY3QgSm9uIExpbiAoam9uLmxpbkByb2NrLWNoaXBzLmNvbSkgd2ls
bCBzdWJtaXQgbmV3IHBhdGNoZXMKPj4+Pj4gICAgIHNvb24gYW5kIHRoZXNlIGFyZSB0aGUgb25l
cyB3ZSBzaG91bGQgcHVyc3VlIGZvciBtYWlubGluaW5nLiBKb24ncwo+Pj4+PiAgICAgcGF0Y2gg
c2VyaWVzIHNob3VsZCBpbmNsdWRlIHN1cHBvcnQgZm9yIG1vcmUgaGFyZHdhcmUgdGhhbiB0aGlz
Cj4+Pj4+ICAgICBzZXJpZXMuCj4+Pj4+IC0gQ2xlYW4gdXAgZG9jdW1lbnRhdGlvbiBtb3JlIGFu
ZCBlbnN1cmUgaXQgaXMgY29ycmVjdCBwZXIKPj4+Pj4gICAgIG1ha2UgZHRfYmluZGluZ19jaGVj
ay4KPj4+Pj4gLSBBZGQgc3VwcG9ydCBpbiBkZXZpY2UgdHJlZXMgZm9yIHJrMzAzNiwgcmszMzA4
LCBhbmQgcnYxMTA4Lgo+Pj4+PiAtIEFkZCBhaGIgY2xvY2sgKGhjbGtfc2ZjKSBzdXBwb3J0IGZv
ciByazMwMzYuCj4+Pj4+IC0gQ2hhbmdlIHJvY2tjaGlwX3NmY193YWl0X2ZpZm9fcmVhZHkoKSB0
byB1c2UgYSBzd2l0Y2ggc3RhdGVtZW50Lgo+Pj4+PiAtIENoYW5nZSBJUlEgY29kZSB0byBvbmx5
IG1hcmsgSVJRIGFzIGhhbmRsZWQgaWYgaXQgaGFuZGxlcyB0aGUKPj4+Pj4gICAgIHNwZWNpZmlj
IElSUSAoRE1BIHRyYW5zZmVyIGZpbmlzaCkgaXQgaXMgc3VwcG9zZWQgdG8gaGFuZGxlLgo+Pj4+
Pgo+Pj4+PiBDaGFuZ2VzIGluIHYzOgo+Pj4+PiAtIENoYW5nZWQgdGhlIG5hbWUgb2YgdGhlIGNs
b2NrcyB0byBzZmMvYWhiIChmcm9tIGNsay1zZmMvY2xrLWhzZmMpLgo+Pj4+PiAtIENoYW5nZWQg
dGhlIGNvbXBhdGlibGUgc3RyaW5nIGZyb20gcm9ja2NoaXAsc2ZjIHRvCj4+Pj4+ICAgICByb2Nr
Y2hpcCxyazMwMzYtc2ZjLiBBIHF1aWNrIGdsYW5jZSBhdCB0aGUgZGF0YXNoZWV0cyBzdWdnZXN0
cyB0aGlzCj4+Pj4+ICAgICBkcml2ZXIgc2hvdWxkIHdvcmsgZm9yIHRoZSBQWDMwLCBSSzE4MHgs
IFJLMzAzNiwgUkszMTJ4LCBSSzMzMDggYW5kCj4+Pj4+ICAgICBSVjExMDggU29DcywgYW5kIHBv
c3NpYmx5IG1vcmUuIEhvd2V2ZXIsIEkgYW0gY3VycmVudGx5IG9ubHkgYWJsZQo+Pj4+PiAgICAg
dG8gdGVzdCB0aGlzIG9uIGEgUFgzMCAoYW4gUkszMzI2KS4gVGhlIHRlY2huaWNhbCByZWZlcmVu
Y2UgbWFudWFscwo+Pj4+PiAgICAgYXBwZWFyIHRvIGxpc3QgdGhlIHNhbWUgcmVnaXN0ZXJzIGZv
ciBlYWNoIGRldmljZS4KPj4+Pj4gLSBDb3JyZWN0ZWQgZGV2aWNldHJlZSBkb2N1bWVudGF0aW9u
IGZvciBmb3JtYXR0aW5nIGFuZCB0byBub3RlIHRoZXNlCj4+Pj4+ICAgICBjaGFuZ2VzLgo+Pj4+
PiAtIFJlcGxhY2VkIHRoZSBtYWludGFpbmVyIHdpdGggSGVpa28gU3R1ZWJuZXIgYW5kIG15c2Vs
ZiwgYXMgd2Ugd2lsbAo+Pj4+PiAgICAgdGFrZSBvd25lcnNoaXAgb2YgdGhpcyBnb2luZyBmb3J3
YXJkLgo+Pj4+PiAtIE5vdGVkIHRoYXQgdGhlIGRldmljZSAocGVyIHRoZSByZWZlcmVuY2UgbWFu
dWFsKSBzdXBwb3J0cyA0IENTLCBidXQKPj4+Pj4gICAgIEkgYW0gb25seSBhYmxlIHRvIHRlc3Qg
YSBzaW5nbGUgQ1MgKENTIDApLgo+Pj4+PiAtIFJlb3JkZXJlZCBwYXRjaGVzIHRvIGNvbXBseSB3
aXRoIHVwc3RyZWFtIHJ1bGVzLgo+Pj4+Pgo+Pj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4+PiAtIFJl
aW1wbGVtZW50ZWQgZHJpdmVyIHVzaW5nIHNwaS1tZW0gc3Vic3lzdGVtLgo+Pj4+PiAtIFJlbW92
ZWQgcG93ZXIgbWFuYWdlbWVudCBjb2RlIGFzIEkgY291bGRuJ3QgZ2V0IGl0IHdvcmtpbmcgcHJv
cGVybHkuCj4+Pj4+IC0gQWRkZWQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIE9kcm9pZCBHbyBB
ZHZhbmNlLgo+Pj4+Pgo+Pj4+PiBDaGFuZ2VzIGluIHYxOgo+Pj4+PiBoYW5nZXMgbWFkZSBpbiB0
aGlzIG5ldyBzZXJpZXMgdmVyc3VzIHRoZSB2OCBvZiB0aGUgb2xkIHNlcmllczoKPj4+Pj4gLSBB
ZGRlZCBmdW5jdGlvbiB0byByZWFkIHNwaS1yeC1idXMtd2lkdGggZnJvbSBkZXZpY2UgdHJlZSwg
aW4gdGhlCj4+Pj4+ICAgICBldmVudCB0aGF0IHRoZSBTUEkgY2hpcCBzdXBwb3J0cyA0eCBtb2Rl
IGJ1dCBvbmx5IGhhcyAyIHBpbnMKPj4+Pj4gICAgIHdpcmVkIChzdWNoIGFzIHRoZSBPZHJvaWQg
R28gQWR2YW5jZSkuCj4+Pj4+IC0gQ2hhbmdlZCBkZXZpY2UgdHJlZSBkb2N1bWVudGF0aW9uIGZy
b20gdHh0IHRvIHlhbWwgZm9ybWF0Lgo+Pj4+PiAtIE1hZGUgInJlc2V0IiBtZXNzYWdlIGEgZGV2
X2RiZyBmcm9tIGEgZGV2X2luZm8uCj4+Pj4+IC0gQ2hhbmdlZCByZWFkIGFuZCB3cml0ZSBmaWZv
IGZ1bmN0aW9ucyB0byByZW1vdmUgcmVkdW5kYW50IGNoZWNrcy4KPj4+Pj4gLSBDaGFuZ2VkIHRo
ZSB3cml0ZSBhbmQgcmVhZCBmcm9tIHJlbGF4ZWQgdG8gbm9uLXJlbGF4ZWQgd2hlbgo+Pj4+PiAg
ICAgc3RhcnRpbmcgdGhlIERNQSB0cmFuc2ZlciBvciByZWFkaW5nIHRoZSBETUEgSVJRLgo+Pj4+
PiAtIENoYW5nZWQgZnJvbSBkbWFfY29lcmNlX21hc2tfYW5kX2NvaGVyZW50IHRvIGp1c3QKPj4+
Pj4gICAgIGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQuCj4+Pj4+IC0gQ2hhbmdlZCBuYW1lIG9m
IGdldF9pZl90eXBlIHRvIHJvY2tjaGlwX3NmY19nZXRfaWZfdHlwZS4KPj4+Pj4KPj4+Pj4gICAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3JvY2tjaGlwLXNmYy55YW1sIHwgODggKysrKysr
KysrKysrKysrKysrKwo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKQo+
Pj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9yb2NrY2hpcC1zZmMueWFtbAo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9yb2NrY2hpcC1zZmMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvcm9ja2NoaXAtc2ZjLnlhbWwKPj4+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi40MmU0MTk4ZTky
YWYKPj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL3JvY2tjaGlwLXNmYy55YW1sCj4+Pj4+IEBAIC0wLDAgKzEsODggQEAK
Pj4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQo+Pj4+PiArJVlBTUwgMS4yCj4+Pj4+ICstLS0KPj4+Pj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL3JvY2tjaGlwLXNmYy55YW1sIwo+Pj4+PiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4+ICsK
Pj4+Pj4gK3RpdGxlOiBSb2NrY2hpcCBTZXJpYWwgRmxhc2ggQ29udHJvbGxlciAoU0ZDKQo+Pj4+
PiArCj4+Pj4+ICttYWludGFpbmVyczoKPj4+Pj4gKyAgLSBIZWlrbyBTdHVlYm5lciA8aGVpa29A
c250ZWNoLmRlPgo+Pj4+PiArICAtIENocmlzIE1vcmdhbiA8bWFjcm9tb3JnYW5AaG90bWFpbC5j
b20+Cj4+Pj4+ICsKPj4+Pj4gK2FsbE9mOgo+Pj4+PiArICAtICRyZWY6IHNwaS1jb250cm9sbGVy
LnlhbWwjCj4+Pj4+ICsKPj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4+ICsgIGNvbXBhdGlibGU6Cj4+
Pj4+ICsgICAgb25lT2Y6Cj4+Pj4+ICsgICAgICAtIGNvbnN0OiByb2NrY2hpcCxzZmMKPj4+PiBV
c2UgJ2VudW0nIGluc3RlYWQgb2Ygb25lT2YrY29uc3QuCj4+Pj4KPj4+PiBZb3UgbmVlZCBhbiBT
b0Mgc3BlY2lmaWMgY29tcGF0aWJsZS4KPj4+Cj4+PiBUaGUgcm9ja2NoaXAgc2ZjIGNvbnRyb2xs
ZXIgaXMgYSBzdGFuZGFsb25lIElQIHdpdGggdmVyc2lvbiByZWdpc3RlciwKPj4+IGFuZCB0aGUg
ZHJpdmVyIGNhbgo+Pj4KPj4+IGhhbmRsZSBhbGwgdGhlIGZlYXR1cmUgZGlmZmVyZW5jZSBpbnNp
ZGUgdGhlIElQLCBzbyB3ZSB3b3VsZCBsaWtlIHRvIHVzZQo+Pj4gYSBtb3JlIGdlbmVyaWMKPiBP
a2F5LCBpZiB0aGUgdmVyc2lvbiByZWdpc3RlciBjYW4gYmUgcmVsaWVkIG9uLCB0aGVuIHRoaXMg
aXMgZmluZS4KPiBKdXN0IGFkZCBhIGNvbW1lbnQgdGhhdCBmdXJ0aGVyIGRpZmZlcmVudGlhdGlv
biBpcyBkb25lIHVzaW5nIGEKPiB2ZXJzaW9uIHJlZ2lzdGVyLgoKClRoYW5rcyBmb3IgeW91ciBj
b25maXJtLCB0aGlzIHdpbGwgbWFrZSB0aGluZ3MgbXVjaCBzaW1wbGUgZm9yIGRyaXZlciAKbWFp
bnRhaW4uCgpASm9uLCBwbGVhc2UgdXBkYXRlIHlvdXIgcGF0Y2ggcGVyIFJvYidzIHJlcXVpcmVt
ZW50LgoKClRoYW5rcywKLSBLZXZlcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
