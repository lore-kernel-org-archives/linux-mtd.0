Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D8DC77B7D
	for <linux-mtd@archiver.kernel.org>; Sat, 13 May 2023 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oWLgIHI0N8+F6ixMwgiqWXRU55WXBTcyp/IO1ZbHWI=; b=V19YwsPCtmqGSt
	8V/1zgH9boEBIjq89jPkMLdwb/NRcHmqHdXoXKtMsW/fnFbDD2nLLhyPl4GKTz08ToNrG5LoSve29
	oyWklC66ZJzzjiAS78YOiWmZKXUIp5y4nJagFaut7Hnsa12u6AftYQuVFa+wHd8N2QmdUCdIV8Ss1
	jzCVQ9DQN1y4OX/N41bXH5b1G6Rr7u2IhL9lJvJnGrHugXWwmPk7iWf8X6CDSdlzMciz1+9KgOHz0
	ekhHEJELygeNAfOKxjJCNZbLhdO8EeWMXfSdbxIMVF2PniDm4ax16hR1zGBdB5pBeSTWnn46sbalg
	0hzZo478CXdHbSYM9zcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxpHl-00F7fJ-22;
	Sat, 13 May 2023 13:27:45 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxpHe-00F7cE-2M;
	Sat, 13 May 2023 13:27:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 0405E5FD1A;
	Sat, 13 May 2023 16:27:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683984449;
	bh=6s5t1h5bNWHI3YCWI4siWjtZBnr+VzeI83m2ZwBqCms=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=kUELyJhDMFZkdvk948EyayBbGbwsD50k5oy5acdZqr84v8Q8HXQQ9kpWG8cRcvCUb
	 BV09ulczuwqkhTnpTR9aGShyjPcQh+Pvip6bHcOMifsbramB4xu0OUHPLnnpuP/2bY
	 noJlZ72GgUTtltqRnGMxZ1Ui6/WxvmrJPqwSk3hiKYu5hOuttUG4EtdEKt3ZbXLmqx
	 ljhH06Id8+Lnih60cAGscwvVDeGXIap20c5E6g1GdvCuDvzXZ4o4TZFWQse51/pn+E
	 D8y8V+KQtW4/yFVydHTl4OvXYb1wI94fhlwdXxa6tyrNizmiZ5rxJbQ/bYfporS46g
	 RMr8JJuBprUBA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Sat, 13 May 2023 16:27:26 +0300 (MSK)
Message-ID: <59d2c9d1-dc68-2427-5ff4-ca22bc51d5b3@sberdevices.ru>
Date: Sat, 13 May 2023 16:22:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Michael
 Walle <michael@walle.cc>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
 <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
 <CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
 <20230510225359.061c2df6@xps-13>
 <6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
 <20230511111204.0b0b3d70@xps-13>
 <dd25efa3-e46a-e857-d355-53330a8a4181@sberdevices.ru>
 <4561f558-1d34-a7a9-2a05-f6453b0ed9a9@sberdevices.ru>
 <20230511141114.04cbd9f1@xps-13>
 <0b0bb315-8e5c-fb30-7786-34824b8d385d@sberdevices.ru>
 <20230512164918.59f8965f@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230512164918.59f8965f@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/13 07:34:00 #21275929
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_062739_456505_1E97CCA0 
X-CRM114-Status: GOOD (  25.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi4wNS4yMDIzIDE3OjQ5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gSSdtIGFkZGluZyBSYWZhxYIgJiBNaWNoYWVsOiBhbnkgaWRlYSB3aGF0IGNvdWxkIGJl
IHdyb25nPyBUaGUgYmVoYXZpb3IKPiBiZWxvdyBkb2VzIG5vdCBsb29rIGV4cGVjdGVkIGF0IGFs
bCwgYnV0IEkgdGhvdWdodCB3ZSAoPSBSYWZhxYIsIG1haW5seSkKPiBhbHJlYWR5IHNvcnRlZCB0
aGlzIG91dD8KPiAKCkhpIE1pcXVlbCwgdGhhbmtzIGZvciBoZWxwIQoKanVzdCB0byBjbGFyaWZ5
IGFuIGV4cGVjdGVkIGJlaGF2aW91cjogaWYgaSBoYXZlIHRoZSBmb2xsb3dpbmcgbGF5b3V0IGlu
IHRoZSBkZXZpY2UgdHJlZQoKbXRkX25hbmQ6IG5mY0A3ODAwIHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCiAJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWF4Zy1uZmMiOwogCS4uLgog
CW5hbmRAMCB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgCXJlZyA9
IDwwPjsKICAgICAgICAgfTsKfQoKbm9kZSB1c2VkIGJ5ICdudm1lbV9hZGRfY2VsbHNfZnJvbV9v
ZigpJyBtdXN0IGJlIE5VTEw/IG9yICduYW5kQDAnPwoKSSBndWVzcywgdGhhdCBpbiBhYm92ZSBk
dHMgSSBoYXZlIG5vZGUgJ25mY0A3ODAwJyBpbiB1c2UsIGJlY2F1c2UgJ210ZF9vdHBfbnZtZW1f
cmVnaXN0ZXIoKScgdXNlcwp0aGUgZm9sbG93aW5nIGRldmljZSBiZWZvcmUgcGFzc2luZyAnY29u
ZmlnJyB0byAnbnZtZW1fcmVnaXN0ZXIoKSc6CgogICAgICAgIC8qIE9UUCBudm1lbSB3aWxsIGJl
IHJlZ2lzdGVyZWQgb24gdGhlIHBoeXNpY2FsIGRldmljZSAqLyAgICAgICAKICAgICAgICBjb25m
aWcuZGV2ID0gbXRkLT5kZXYucGFyZW50OwoKJ210ZC0+ZGV2LnBhcmVudCcgaXMgJ25mY0A3ODAw
Jy4KCk1heSBiZSAnbXRkX290cF9udm1lbV9yZWdpc3RlcigpJyBtdXN0IGluaXRpYWxpemUgJ25v
X29mX25vZGUnIGZpZWxkIG9mICdjb25maWcnIGxpa2UgaW4gJ210ZF9udm1lbV9hZGQoKScgPwpU
aGlzIGZpZWxkIGlzIGRvY3VtZW50ZWQgYXM6CgoqIEBub19vZl9ub2RlOglEZXZpY2Ugc2hvdWxk
IG5vdCB1c2UgdGhlIHBhcmVudCdzIG9mX25vZGUgZXZlbiBpZiBpdCdzICFOVUxMLgoKSW4gdGhp
cyBjYXNlIG5vZGUgcGFzc2VkIHRvICdudm1lbV9hZGRfY2VsbHNfZnJvbV9vZigpJyB3aWxsIGJl
IE5VTEwuCgpUaGFua3MsIEFyc2VuaXkKCj4+Pj4+Pj4+PiBPbiBXZWQsIE1heSAxMCwgMjAyMyBh
dCAxOjEz4oCvUE0gQXJzZW5peSBLcmFzbm92Cj4+Pj4+Pj4+PiA8QVZLcmFzbm92QHNiZXJkZXZp
Y2VzLnJ1PiB3cm90ZTogICAgICAKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRoaXMgcmVuYW1lcyBu
b2RlIHdpdGggdmFsdWVzIGZvciBjaGlwIHNlbGVjdCBmcm9tICJyZWciIHRvICJjcyIuIEl0IGlz
Cj4+Pj4+Pj4+Pj4gbmVlZGVkIGJlY2F1c2Ugd2hlbiBPVFAgYWNjZXNzIGlzIGVuYWJsZWQgb24g
dGhlIGF0dGFjaGVkIHN0b3JhZ2UsIE1URAo+Pj4+Pj4+Pj4+IHN1YnN5c3RlbSByZWdpc3RlcnMg
dGhpcyBzdG9yYWdlIGluIHRoZSBOVk1FTSBzdWJzeXN0ZW0uIE5WTUVNIGluIHR1cm4KPj4+Pj4+
Pj4+PiB0cmllcyB0byB1c2UgInJlZyIgbm9kZSBpbiBpdHMgb3duIG1hbm5lciwgc3VwcG9zZXMg
dGhhdCBpdCBoYXMgYW5vdGhlcgo+Pj4+Pj4+Pj4+IGxheW91dC4gQWxsIG9mIHRoaXMgbGVhZHMg
dG8gZGV2aWNlIGluaXRpYWxpemF0aW9uIGZhaWx1cmUuICAgICAgICAKPj4+Pj4+Pj4+IEluIGdl
bmVyYWw6IGlmIHdlIGNoYW5nZSB0aGUgZGV2aWNlLXRyZWUgaW50ZXJmYWNlIChpbiB0aGlzIGNh
c2U6Cj4+Pj4+Pj4+PiByZXBsYWNpbmcgYSAicmVnIiB3aXRoIGEgImNzIiBwcm9wZXJ0eSkgdGhl
IGR0LWJpbmRpbmdzIGhhdmUgdG8gYmUKPj4+Pj4+Pj4+IHVwZGF0ZWQgYXMgd2VsbC4gICAgICAK
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gVHJ1ZSwgYW5kIEkgd291bGQgYWRkLCBiaW5kaW5ncyBzaG91bGQg
bm90IGJlIGJyb2tlbi4gICAgICAKPj4+Pj4+Pgo+Pj4+Pj4+IEkgc2VlLCB0aGF0J3MgdHJ1ZS4g
VGhhdCBpcyBiYWQgd2F5IHRvIGNoYW5nZSBiaW5kaW5ncy4KPj4+Pj4+PiAgICAKPj4+Pj4+Pj4g
ICAgICAgCj4+Pj4+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25h
bmQtY29udHJvbGxlci55YW1sIGFuZAo+Pj4+Pj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCBzaG93Cj4+Pj4+Pj4+PiB0aGF0
IHRoZSBjaGlwIHNlbGVjdCBvZiBhIE5BTkQgY2hpcCBpcyBzcGVjaWZpZWQgd2l0aCBhICJyZWci
Cj4+Pj4+Pj4+PiBwcm9wZXJ0eS4gICAgICAKPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWxsIE5BTkQgY29u
dHJvbGxlciBiaW5kaW5nIGV4cGVjdCB0aGUgY2hpcC1zZWxlY3QgdG8gYmUgaW4gdGhlCj4+Pj4+
Pj4+ICdyZWcnIHByb3BlcnR5LCB2ZXJ5IG11Y2ggbGlrZSBhIHNwaSBkZXZpY2Ugd291bGQgdXNl
IHJlZyB0byBzdG9yZSB0aGUKPj4+Pj4+Pj4gY3MgYXMgd2VsbDogdGhlIHJlZyBwcm9wZXJ0eSB0
ZWxscyB5b3UgaG93IHlvdSBhZGRyZXNzIHRoZSBkZXZpY2UuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkg
YWxzbyBmdWxseSBhZ3JlZSB3aXRoIE1hcnRpbidzIGNvbW1lbnRzIGJlbG93LiBDaGFuZ2luZyBy
ZWcgaXMgbGlrZWx5Cj4+Pj4+Pj4+IGEgd3JvbmcgYXBwcm9hY2ggOikKPj4+Pj4+Pj4gICAgICAg
Cj4+Pj4+Pj4+PiBBbHNvIHRoZSBjb2RlIGhhcyB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3
aXRoIG9sZCAuZHRicy4KPj4+Pj4+Pj4+ICAgICAgCj4+Pj4+Pj4+Pj4gRXhhbXBsZToKPj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+IFsuLi5dIG52bWVtIG10ZDAtdXNlci1vdHA6IG52bWVtOiBpbnZhbGlk
IHJlZyBvbiAvc29jL2J1c0BmZmUwMDAwMC8uLi4KPj4+Pj4+Pj4+PiBbLi4uXSBtdGQgbXRkMDog
RmFpbGVkIHRvIHJlZ2lzdGVyIE9UUCBOVk1FTSBkZXZpY2UKPj4+Pj4+Pj4+PiBbLi4uXSBtZXNv
bi1uYW5kIGZmZTA3ODAwLm5mYzogZmFpbGVkIHRvIHJlZ2lzdGVyIE1URCBkZXZpY2U6IC0yMgo+
Pj4+Pj4+Pj4+IFsuLi5dIG1lc29uLW5hbmQgZmZlMDc4MDAubmZjOiBmYWlsZWQgdG8gaW5pdCBO
QU5EIGNoaXBzCj4+Pj4+Pj4+Pj4gWy4uLl0gbWVzb24tbmFuZDogcHJvYmUgb2YgZmZlMDc4MDAu
bmZjIGZhaWxlZCB3aXRoIGVycm9yIC0yMiAgICAgICAgCj4+Pj4+Pj4+PiBUaGlzIGlzIG9kZCAt
IGNhbiB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgZGVmaW5pdGlvbiBvZiB0aGUgJm5mYyBub2RlPyAg
ICAgIAo+Pj4+Pj4+Cj4+Pj4+Pj4gU3VyZSwgaGVyZSBpdCBpczoKPj4+Pj4+Pgo+Pj4+Pj4+IG10
ZF9uYW5kOiBuZmNANzgwMCB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+Pj4+Pj4+IAlj
b21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYXhnLW5mYyI7Cj4+Pj4+Pj4gCS4uLgo+Pj4+Pj4+
IAluYW5kQDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4+Pj4+Pj4gICAgICAg
ICAJcmVnID0gPDA+Owo+Pj4+Pj4+ICAgICAgICAgfTsKPj4+Pj4+PiB9Cj4+Pj4+Pj4KPj4+Pj4+
PiBJIGNoZWNrZWQsIHRoYXQgJ25hbmRfc2V0X2ZsYXNoX25vZGUoKScgaXMgY2FsbGVkIHdpdGgg
J25hbmRAMCcgYW5kIGkgc3VwcG9zZQo+Pj4+Pj4+IHRoYXQgaXQgaXMgY29ycmVjdCAoYXMgWW91
IG1lbnRpb25lZCBiZWxvdykuIEJ1dCwgJ252bWVtX2FkZF9jZWxsc19mcm9tX29mKCknIGlzIGNh
bGxlZAo+Pj4+Pj4+IHdpdGggcGFyZW50OiAnbmZjQDc4MDAnLCB0aGVuIGl0IGl0ZXJhdGVzIG92
ZXIgaXRzIGNoaWxkcywgZS5nLiAnbmFuZEAwJyBhbmQgdGh1cyBpIGdldCBzdWNoCj4+Pj4+Pj4g
c2l0dWF0aW9uLiBJIGd1ZXNzLCB0aGF0ICdudm1lbV9hZGRfY2VsbHNfZnJvbV9vZigpJyBtdXN0
IGJlIGNhbGxlZCB3aXRoICduYW5kQDAnID8gICAgCj4+Pj4+Pgo+Pj4+Pj4gV2UgcmVjZW50bHkg
aGFkIGlzc3VlcyB3aXRoIG52bWVtIHBhcnNpbmcsIGJ1dCBJIGJlbGlldmUgYSBtYWlubGluZQo+
Pj4+Pj4ga2VybmVsIHNob3VsZCBub3cgYmUgcGVyZmVjdGx5IHdvcmtpbmcgb24gdGhpcyByZWdh
cmQuIFdoYXQgdmVyc2lvbiBvZgo+Pj4+Pj4gdGhlIExpbnV4IGtlcm5lbCBhcmUgeW91IHVzaW5n
PyAgICAKPj4+Pj4KPj4+Pj4gTXkgY3VycmVudCB2ZXJzaW9uIGlzOgo+Pj4+Pgo+Pj4+PiBWRVJT
SU9OID0gNiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKPj4+Pj4gUEFUQ0hMRVZFTCA9IDIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4+Pj4+IFNVQkxFVkVMID0gMCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+
Pj4+PiBFWFRSQVZFUlNJT04gPSAtcmM4IAo+Pj4+Pgo+Pj4+PiBGaXggd2FzIGluIGRyaXZlcnMv
bnZtZW0vKiA/Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywgQXJzZW5peSAgICAKPj4+Pgo+Pj4+IFVwZDog
SSByZXNvbHZlZCBwcm9ibGVtIGluIHRoZSBmb2xsb3dpbmcgd2F5Ogo+Pj4+Cj4+Pj4gbmFuZEAw
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+Pj4+IAlyZWcgPSA8MD47Ly9jaGlw
IHNlbGVjdAo+Pj4+ICAKPj4+IAlwYXJ0aXRpb25zIHsKPj4+IAkJY29tcGF0aWJsZSA9IC4uLgo+
Pj4gICAKPj4+PiAJb3RwQDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAKPj4+PiAJCSNhZGRy
ZXNzLWNlbGxzID0gPDI+OyAgIAo+Pj4+IAkJI3NpemUtY2VsbHMgPSA8MD47ICAgICAgICAKPj4+
Cj4+PiAjYWRkcmVzcy9zaXplLWNlbGxzIGlzIG5vdCBuZWVkZWQgaGVyZQo+Pj4gICAKPj4+PiAJ
CWNvbXBhdGlibGUgPSAidXNlci1vdHAiOwo+Pj4+IAkJcmVnID0gPEEgQj47ICAgICAgICAgICAg
Cj4+Pj4gCX07ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4+Pj4gCW90cEAxIHsgICAg
ICAgICAgICAgICAgICAgICAgICAgCj4+Pj4gCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsgICAKPj4+
PiAJCSNzaXplLWNlbGxzID0gPDA+OyAgICAgICAgCj4+Pgo+Pj4gRGl0dG8KPj4+ICAgCj4+Pj4g
CQljb21wYXRpYmxlID0gImZhY3Rvcnktb3RwIjsKPj4+PiAJCXJlZyA9IDxDIEQ+OyAgICAgICAg
ICAgIAo+Pj4+IAl9OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4+Pgo+Pj4gCX07
Cj4+PiAgIAo+Pj4+IH07Cj4+Pj4KPj4+PiBOb3cgbnZtZW0gc3Vic3lzdGVtIHBhcnNlcyAnb3Rw
QDAnIGFuZCAnb3RwQDEnIGFuZCBlcnJvciBpcyBnb25lLiAnY29tcGF0aWJsZScgdmFsdWVzIGFy
ZQo+Pj4+IHRoZSBzYW1lIGFzIGluIGRyaXZlcnMvbXRkL210ZGNvcmUuYzptdGRfb3RwX252bWVt
X2FkZCgpLiAncmVnJyBpbiAnbmFuZEAwJyBpcyB1c2VkIGFzCj4+Pj4gY2hpcCBzZWxlY3QgYXMg
c3VwcG9zZWQuICAKPj4+Cj4+PiBJIGRvbid0IGZ1bGx5IGdldCBpdC4gVGhlIHBhcnNpbmcgb24g
dGhlIG52bWVtIHNpZGUgc2hvdWxkIG5vdCBmYWlsIGlmCj4+PiB0aGVyZSBpcyBubyBzdWJwYXJ0
aXRpb24vb3RwLXJlZ2lvbiBkZWZpbmVkLiBDYW4geW91IGNvbmZpcm0gYW4gZW1wdHkKPj4+IE5B
TkQgZGV2aWNlIG5vZGUgd29ya3M/IEJlY2F1c2UgeW91ciBsYXN0IGUtbWFpbCBzdWdnZXN0ZWQg
dGhlIG9wcG9zaXRlLiAgCj4+Cj4+IE9rLCBzbyBpJ2xsIGRlc2NyaWJlIHdoYXQgaGFwcGVucyBp
biBteSBjYXNlLiBMZXQncyBOQU5EIG5vZGUgYmUgbGlrZSB0aGlzIChJSVVDIHRoaXMgaXMKPj4g
Y29uc2lkZXJlZCBhcyBlbXB0eSBOQU5EIGRldmljZSk6Cj4+Cj4+IG10ZF9uYW5kOiBuZmNANzgw
MCB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+PiAJY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LG1lc29uLWF4Zy1uZmMiOwo+PiAJLi4uCj4+IAluYW5kQDAgeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCj4+IAkgICAgICAgCXJlZyA9IDwwPjsKPj4gCX07Cj4+IH0KPj4KPj4gSSBz
ZWUsIHRoYXQKPj4KPj4gMSkgJ210ZF9vdHBfbnZtZW1fYWRkKCknIGNhbGxzICdtdGRfb3RwX252
bWVtX3JlZ2lzdGVyKCknIHR3aWNlIGZvciB0d28gdHlwZXMgb2YKPj4gICAgT1RQIG1lbW9yeSAi
dXNlci1vdHAiIGFuZCAiZmFjdG9yeS1vdHAiLiBMZXQncyB0YWtlIGEgbG9vayBvbmx5IG9uICJ1
c2VyLW90cCIuCj4+IDIpICdtdGRfb3RwX252bWVtX3JlZ2lzdGVyKCknIHRyaWVzIHRvIGxvb2t1
cCBmb3Igbm9kZSBpbiAnbmFuZEAwJyB3aGljaCBpcyBjb21wYXRpYmxlIHdpdGgKPj4gICAgInVz
ZXItb3RwIiBhbmQgdGhlbiBwYXNzZXMgZm91bmQgKG9yIG5vdCBmb3VuZCwgZS5nLiBOVUxMKSBu
b2RlIHRvICAnbnZtZW1fcmVnaXN0ZXIoKScuCj4+IDMpICdudm1lbV9yZWdpc3RlcigpJyB1c2Vz
IHRoaXMgbm9kZSBpdGVyYXRpbmcgb3ZlciBpdHMgY2hpbGRzIGFuZCBzZWFyY2hpbmcgdmFsdWUg
InJlZyIgaW4KPj4gICAgZWFjaCBjaGlsZC4gSWYgInVzZXItb3RwIiBub2RlIGlzIG5vdCBmb3Vu
ZCBpbiAyKSwgJ252bWVtX3JlZ2lzdGVyKCknIHVzZXMgbm9kZSAnbmZjQDc4MDAnCj4+ICAgIGFs
c28gbG9va2luZyBmb3IgInJlZyIgdmFsdWUgaW4gZWFjaCBvZiBpdHMgY2hpbGQuIEluIHRoaXMg
Y2FzZSBpdCBmb3VuZCAicmVnIiBpbiAnbmFuZEAwJwo+PiAgICBhbmQgZmFpbHMuCj4+Cj4+IE5v
dywgaWYgaSBhZGQgImNvbXBhdGlibGUgPSAidXNlci1vdHAiOyIgdG8gJ25hbmRAMCcsIGluIHN0
ZXAgMikgc2VhcmNoIHdpbGwgYmUgc3VjY2Vzc2Z1bCwKPj4gYW5kICJyZWciIHZhbHVlIHdpbGwg
YmUgdXNlZCBmcm9tIHRoaXMgbmV3IG5vZGUgKG9yIHdlIHJlbW92ZSAicmVnIiBmcm9tIGl0IC0g
bm90aGluZyBoYXBwZW5zCj4+IGFzIFlvdSB3cm90ZSkuIFNvLCBwcm9ibGVtIGlzIHRoYXQgbnZt
ZW0gdHJpZXMgdG8gcGFyc2Ugbm9kZSB3aXRoIGludmFsaWQgInJlZyIgdmFsdWUuCj4+Cj4+IEFs
c28gSSBzZWUsIHRoYXQgJ252bWVtX3JlZ2lzdGVyKCknIGlzIGNhbGxlZCBlYXJsaWVyIGluICdt
dGRfbnZtZW1fYWRkKCknLCBidXQgd2l0aCBubyBlZmZlY3QuCj4+IEkgdGhpbmssIHRoYXQgaXQg
aXMgbm90IHJlbGF0ZWQgd2l0aCBlbmFibGVkIE9UUCBmZWF0dXJlLgo+Pgo+PiBUaGFua3MsIEFy
c2VuaXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
