Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61667C31E49
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 10:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3461A21479
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 10:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJ39iEfi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3461A21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZFmKAYg3QhT3eWvNfZHqGbaHU730B71F1m5jWQqAXuQ=; b=PJ39iEfidCCC/a3cULvu9rBuc
	3BR7dMZP/9+f1EW3couFb7m52SUB86xlQGCgKn0pyAva7SWvZkbzGV5267d6SI94VzAMSkGzLV37J
	HmFGoi1dAtq1PS0X8VFpp+3fqEodfyRmB9eSIe6XCkK3e+psEdjkAEblw445QgrkGo8/+/DqYrZIc
	HyGUmLiQmCoon84Bc0pfP5DCX9bu2k4XFOoZ/t3hmzWMiCdSBI+E+nvmlf6JrP0ryO2TKQpmkZUhw
	TCofAtTQrxwJ6BWFkg99hxdPcOvxi+LJFGNf9U7A9kWvYuSS9pI5Vcwwlsf3UOSBuzdxIi/wewbBM
	QqgbWyLFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdY9n-0008HO-Fc; Wed, 19 Jun 2019 10:49:35 +0000
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdY9j-0008EG-Ui
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 10:49:33 +0000
Received: from player728.ha.ovh.net (unknown [10.108.42.192])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 3A0E319E23C
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 12:49:24 +0200 (CEST)
Received: from RCM-web6.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
 (Authenticated sender: rafal@milecki.pl)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id C225A6EDDEAB;
 Wed, 19 Jun 2019 10:49:00 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 19 Jun 2019 12:49:00 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: xiaolei li <xiaolei.li@mediatek.com>
Subject: Re: [RFC PATCH v4 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver
 as Dual MIT/GPL
In-Reply-To: <1560936760.19057.1.camel@mhfsdcap03>
References: <20190507092020.1917-1-xiaolei.li@mediatek.com>
 <20190507092020.1917-2-xiaolei.li@mediatek.com>
 <CAK8P3a3d-2U=hpb0P0+W-eZ0cviwKVwy6dWvHbhBCgF4CJUWKA@mail.gmail.com>
 <5052ea548ce89c1a588236d00319960b@milecki.pl>
 <1558685891.18315.33.camel@mhfsdcap03>
 <75974a2066425e5852d0295b22d2b259@milecki.pl>
 <1560936760.19057.1.camel@mhfsdcap03>
Message-ID: <ce02eca83c4d28f7ea32a586f25b0d35@milecki.pl>
X-Sender: rafal@milecki.pl
User-Agent: Roundcube Webmail/1.3.9
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 1382886563342683679
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddvgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_034932_132505_371ACF74 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Ryder Lee <ryder.lee@mediatek.com>, srv_heupstream@mediatek.com,
 Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, jorge.ramirez-ortiz@linaro.org,
 yingjoe.chen@mediatek.com, boris.brezillon@collabora.com,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Wei Yongjun <weiyongjun1@huawei.com>, yellowriver2010@hotmail.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 rogercc.lin@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>,
 peterpandong@micron.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAxOS0wNi0xOSAxMTozMiwgeGlhb2xlaSBsaSB3cm90ZToKPiBPbiBUdWUsIDIwMTktMDYt
MTggYXQgMTE6MzYgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gT24gMjAxOS0wNS0y
NCAxMDoxOCwgeGlhb2xlaSBsaSB3cm90ZToKPj4gPiBPbiBGcmksIDIwMTktMDUtMjQgYXQgMDk6
NTUgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gPj4gT24gMjAxOS0wNS0yNCAwOTo1
MiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4gPj4gPiBPbiBUdWUsIE1heSA3LCAyMDE5IGF0IDEx
OjIwIEFNIFhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+PiA+PiA+IHdyb3Rl
Ogo+PiA+PiA+Pgo+PiA+PiA+PiBJdCBpcyB3YW50ZWQgdG8gdXNlIE1USyBOQU5EIGRyaXZlciB3
aXRoIEdQTC0yLjAgb3IgTUlUIGxpY2Vuc2UuCj4+ID4+ID4+IEJ1dCBub3cgaXQgaXMgb25seSBs
aWNlbnNlZCBhcyBHUEwtMi4wLgo+PiA+PiA+PiBTbyByZS1saWNlbnNlIGl0IGFzIGR1YWwgTUlU
L0dQTCBhbmQgcmVwbGFjZSBsaWNlbnNlIHRleHQgd2l0aAo+PiA+PiA+PiBTUERYIHRhZy4KPj4g
Pj4gPj4KPj4gPj4gPj4gU2lnbmVkLW9mZi1ieTogWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRp
YXRlay5jb20+Cj4+ID4+ID4+IEFja2VkLWJ5OiBKb3JnZSBSYW1pcmV6LU9ydGl6IDxqb3JnZS5y
YW1pcmV6LW9ydGl6QGxpbmFyby5vcmc+Cj4+ID4+ID4+IEFja2VkLWJ5OiBSeWRlciBMZWUgPHJ5
ZGVyLmxlZUBtZWRpYXRlay5jb20+Cj4+ID4+ID4+IEFja2VkLWJ5OiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Cj4+ID4+ID4+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiA+PiA+PiBBY2tlZC1ieTogQm9yaXMgQnJlemlsbG9u
IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPj4gPj4gPj4gQWNrZWQtYnk6IFJvZ2Vy
Q0MgTGluIDxyb2dlcmNjLmxpbkBtZWRpYXRlay5jb20+Cj4+ID4+ID4KPj4gPj4gPiBBY2tlZC1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gPj4gPgo+PiA+PiA+IFNvcnJ5IGZv
ciBtaXNzaW5nIHRoaXMgZWFybGllci4KPj4gPj4KPj4gPj4gVGhhbmsgeW91IQo+PiA+Pgo+PiA+
PiBYaWFvbGVpOiBwbGVhc2UgcmVzZW5kIHRoaXMgcGF0Y2ggd2l0aG91dCBSRkMgaW4gYSBzdWJq
ZWN0LiBJIGJlbGlldmUKPj4gPj4gaXQKPj4gPj4gY2FuIGJlIGFwcGxpZWQvcHVzaGVkIG5vdy4K
Pj4gPgo+PiA+IFRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVzcG9uc2UhCj4+ID4gSSB3aWxs
IHNlbmQgYSBmb3JtYWwgcGF0Y2ggc29vbi4KPj4gCj4+IEhpIFhpYW9sZWksIHdoYXQncyB0aGUg
c3RhdHVzIG9mIHRoaXM/Cj4+IAo+PiBJdCB0b29rIHNvbWUgZWZmb3J0IHRvIHNvcnQgdGhhdCBs
aWNlbnNpbmcgb3V0LCBJIGJlbGlldmUgaGFuZGxpbmcgCj4+IHRoaXMKPj4gc29vbmVyIHRoYW4g
bGF0ZXIgaXMgaGlnaGx5IHJlY29tbWVuZGVkLgo+IAo+IFRoYW5rcyBmb3IgeW91ciBhdHRlbnRp
b24uCj4gSSBzZW50IHRoZSBmb3JtYWwgcGF0Y2ggYWJvdXQgdHdvIHdlZWtzIGFnby4gU28sIHlv
dSBkaWRuJ3QgcmVjZWl2ZSBpdCwKPiByaWdodCA/CgpJdCBoYXMgbmV2ZXIgcmVhY2hlZCBtZSBv
ciBtYWlsaW5nIGxpc3QuCgpTZWU6Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFp
bC9saW51eC1tdGQvMjAxOS1KdW5lL3RocmVhZC5odG1sCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVzPSZzdWJtaXR0ZXI9NzE1OTkmc3Rh
dGU9KiZxPSZhcmNoaXZlPSZkZWxlZ2F0ZT0KClRoZSBsYXRlc3Qgb25lIGlzIFJGQyB2NC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
