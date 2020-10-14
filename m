Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A90EC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70D521D40
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H+g1+mEh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70D521D40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bzn3JV42vqU4rFxl8yUJa0l1ezhel1uR+HCj1+gp/pI=; b=H+g1+mEh+fsubSwO8ABfQ7Yml
	5SU0xk5w0j6qNJrG1phBQKIeTP10/1I4Pl5SxG0KFiBn0msM8+GuIwdVFNMpaMTZi6sZHXpPfSS9Q
	GBOu6tJvndViyqbm4dbAGPCp/mMic15fepPjTTE3pABucJ2dVaNDDvM37Blm12b6BYnlVOI0pv+7s
	BzY6t66EMYGVV/OY7ICbEdCC7aZLiNOpiKsinDGOaWnVekG7mBffBvgrfLQxiezz/PdbeImb17JaP
	NQHdhKrRzVcXJRkKJQXj9GeRy30fyU20XUzV/MkcvTlPiLnk2+1XjQ8UUT09y2grRoFTt+/d7GOYt
	tA3jHJVwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSUlu-0008Vk-El; Wed, 14 Oct 2020 00:36:02 +0000
Received: from regular1.263xmail.com ([211.150.70.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSUlm-0008TF-S6; Wed, 14 Oct 2020 00:35:56 +0000
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id E513A1819;
 Wed, 14 Oct 2020 08:35:52 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P18907T140200013461248S1602635751373857_; 
 Wed, 14 Oct 2020 08:35:52 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <54d03ae8eef3293f97bdf5fd605b3e77>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v10 0/8] Add Rockchip NFC drivers for RK3308 and others
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <5288a031-5dbe-e32d-f706-a70a8109110d@rock-chips.com>
Date: Wed, 14 Oct 2020 08:35:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_203555_386469_076CA343 
X-CRM114-Status: GOOD (  23.48  )
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

SGkgTWlxdWVsIGFuZCBtYWludGFpbmVycywKCiDCoMKgwqAgVGhpcyBwYXRjaCBzZXQgc2VlbXMg
cmVhZHkgZm9yIHVwc3RyZWFtLCBjb3VsZCB5b3UgcGljayBhbmQgbWVyZ2UgCnRvIGxpbnV4LW10
ZD8KCgpUaGFua3MsCgotIEtldmVyCgpPbiAyMDIwLzkvMzAg5LiK5Y2IMTA6MDcsIFlpZmVuZyBa
aGFvIHdyb3RlOgo+IFJvY2tjaHAncyBORkMoTmFuZCBGbGFzaCBDb250cm9sbGVyKSBoYXMgZm91
ciB2ZXJzaW9uczogVjYwMCwgVjYyMiwgVjgwMCBhbmQKPiBWOTAwLlRoaXMgc2VyaWVzIHBhdGNo
IGNhbiBzdXBwb3J0IGFsbCBmb3VyIHZlcnNpb25zLgo+Cj4KPiBDaGFuZ2VzIGluIHYxMDoKPiAt
IEZpeCBjb21waWxlIGVycm9yIG9uIG1hc3RlciB2NS45LXJjNwo+Cj4gQ2hhbmdlcyBpbiB2OToK
PiAtIFRoZSBuZmMtPmJ1ZmZlciB3aWxsIHJlYWxsb2Mgd2hpbGUgdGhlIHBhZ2Ugc2l6ZSBvZiB0
aGUgc2Vjb25kIG10ZAo+ICAgIGlzIGxhcmdlIHRoYW4gdGhlIGZpcnN0IG9uZQo+IC0gRml4IGNv
ZGluZyBzdHlsZS4KPiAtIFJlbW92ZSBzdHJ1Y3QgcmtfbmZjX2Nsay4KPiAtIFByZXBlbmQgc29t
ZSBmdW5jdGlvbiB3aXRoIHJrX25mY18uCj4gLSBSZXBsYWNlIGZ1bmN0aW9uIHJlYWRsX3BvbGxf
dGltZW91dF9hdG9taWMgd2l0aCByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dC4KPiAtIFJlbW92
ZSBmdW5jdGlvbiBya19uZmNfcmVhZF9ieXRlIGFuZCBya19uZmNfd3JpdGVfYnl0ZS4KPiAtIERv
bid0IHNlbGVjdCB0aGUgZGllIGlmICdjaGVja19vbmx5ID09IHRydWUnIGluIGZ1bmN0aW9uIHJr
X25mY19leGVjX29wLgo+IC0gTW9kaWZ5IGZ1bmN0aW9uIHJrX25mY193cml0ZV9wYWdlIGFuZCBy
a19uZmNfd3JpdGVfcGFnZV9yYXcuCj4KPiBDaGFuZ2VzIGluIHY4Ogo+IC0gRml4IG1ha2UgZHRf
YmluZGluZ19jaGVjayBlcnJvcgo+Cj4gQ2hhbmdlcyBpbiB2NzoKPiAtIEZpeCBzb21lIHdyb25n
IGRlZmluZQo+IC0gUmViYXNlIHRvIGxpbnV4LW5leHQuCj4gLSBGaXggY29kaW5nIHN0eWxlLgo+
IC0gUmVzZXJ2ZWQgNCBieXRlcyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBvb2IgYXJlYS4KPiAt
IFBhZ2UgcmF3IHJlYWQgYW5kIHdyaXRlIGluY2x1ZGVkIGVjYyBkYXRhLgo+Cj4gQ2hhbmdlcyBp
biB2NjoKPiAtIEZpeCBzb21lIHdyb25nIGRlZmluZQo+IC0gTW9kaWZpZWQgdGhlIGRlZmluaXRp
b24gb2YgY29tcGF0aWJsZQo+IC0gVGhlIG10ZC0+bmFtZSBzZXQgYnkgTkFORCBsYWJlbCBwcm9w
ZXJ0eS4KPiAtIEFkZCBzb21lIGNvbW1lbnRzLgo+IC0gRml4IGNvbXBpbGUgZXJyb3IuCj4KPiBD
aGFuZ2VzIGluIHY1Ogo+IC0gRml4IHNvbWUgd3JvbmcgZGVmaW5lLgo+IC0gQWRkIGJvb3QtbWVk
aXVtIGRlZmluZS4KPiAtIFJlbW92ZSBzb21lIGNvbXBhdGlibGUgZGVmaW5lLgo+IC0gQWRkIGJv
b3QgYmxvY2tzIHN1cHBvcnQgIHdpdGggZGlmZmVyZW50IEVDQyBmb3IgYm9vdFJPTS4KPiAtIFJl
bmFtZSByb2NrY2hpcC1uYW5kLmMgdG8gcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMuCj4gLSBV
bmlmaWNhdGlvbiBvZiBvdGhlciB2YXJpYWJsZSBuYW1lcy4KPiAtIFJlbW92ZSBzb21lIGNvbXBh
dGlibGUgZGVmaW5lLgo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAtIFRoZSBjb21wYXRpYmxlIGRlZmlu
ZSB3aXRoIHJreHhfbmZjLgo+IC0gQWRkIGFzc2lnbmVkLWNsb2Nrcy4KPiAtIEZpeCBzb21lIHdy
b25nIGRlZmluZUNoYW5nZXMgaW4uCj4gLSBEZWZpbmUgcGxhdGZvcm0gZGF0YSBzdHJ1Y3R1cmUg
Zm9yIHRoZSByZWdpc3RlciBvZmZzZXRzLgo+IC0gVGhlIGNvbXBhdGlibGUgZGVmaW5lIHdpdGgg
cmt4eF9uZmMuCj4gLSBVc2UgU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMgdG8gZGVmaW5lIFBNX09Q
Uy4KPiAtIFVzZSBleGVjX29wIGluc3RlYWQgb2YgbGVnYWN5IGhvb2tzLgo+Cj4gQ2hhbmdlcyBp
biB2MzoKPiAtIENoYW5nZSB0aGUgdGl0bGUgZm9yIHRoZSBkdC1iaW5kaW5ncy4KPgo+IENoYW5n
ZXMgaW4gdjI6Cj4gLSBGaXggY29tcGlsZSBlcnJvci4KPiAtIEluY2x1ZGUgaGVhZGVyIGZpbGVz
IHNvcnRlZCBieSBmaWxlIG5hbWUuCj4KPiBZaWZlbmcgWmhhbyAoOCk6Cj4gICAgZHQtYmluZGlu
Z3M6IG10ZDogRGVzY3JpYmUgUm9ja2NoaXAgUkszeHh4IE5BTkQgZmxhc2ggY29udHJvbGxlcgo+
ICAgIG10ZDogcmF3bmFuZDogcm9ja2NoaXA6IE5GQyBkcml2ZXJzIGZvciBSSzMzMDgsIFJLMjky
OCBhbmQgb3RoZXJzCj4gICAgTUFJTlRBSU5FUlM6IGFkZCBtYWludGFpbmVycyB0byBST0NLQ0hJ
UCBORkMKPiAgICBhcm02NDogZHRzOiByb2NrY2hpcDogQWRkIE5GQyBub2RlIGZvciBSSzMzMDgg
U29DCj4gICAgYXJtNjQ6IGR0czogcm9ja2NoaXA6IEFkZCBORkMgbm9kZSBmb3IgUFgzMCBTb0MK
PiAgICBhcm06IGR0czogcm9ja2NoaXA6IEFkZCBORkMgbm9kZSBmb3IgUlYxMTA4IFNvQwo+ICAg
IGFybTogZHRzOiByb2NrY2hpcDogQWRkIE5GQyBub2RlIGZvciBSSzI5MjggYW5kIG90aGVyIFNv
Q3MKPiAgICBhcm06IGR0czogcm9ja2NoaXA6IEFkZCBORkMgbm9kZSBmb3IgUkszMDM2IFNvQwo+
Cj4gICAuLi4vbXRkL3JvY2tjaGlwLG5hbmQtY29udHJvbGxlci55YW1sICAgICAgICAgfCAgMTYy
ICsrCj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICA0ICstCj4gICBhcmNoL2FybS9ib290L2R0cy9yazMwMzYuZHRzaSAgICAgICAgICAgICAgICAg
fCAgIDUyICsKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3JrM3h4eC5kdHNpICAgICAgICAgICAgICAg
ICB8ICAgIDkgKwo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvcnYxMTA4LmR0c2kgICAgICAgICAgICAg
ICAgIHwgICAxMSArCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3B4MzAuZHRzaSAg
ICAgICAgfCAgIDE1ICsKPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzA4LmR0
c2kgICAgICB8ICAgMTUgKwo+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgIHwgICAxMiArCj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgfCAgICAxICsKPiAgIC4uLi9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1j
b250cm9sbGVyLmMgICB8IDE0NTUgKysrKysrKysrKysrKysrKysKPiAgIDEwIGZpbGVzIGNoYW5n
ZWQsIDE3MzQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3JvY2tjaGlwLG5hbmQt
Y29udHJvbGxlci55YW1sCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9y
YXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMKPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
