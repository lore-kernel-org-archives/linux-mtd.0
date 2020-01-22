Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FDFC2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 15:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39FF021734
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 15:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kxN5GPvD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39FF021734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vdqz1kusRcIhLpluLIppobHuMiECJnGBaZXr/iHPKII=; b=kxN5GPvDAPO+5Iv98FsbixpxF
	xnhXTVrm/qGZ6VGT6HhFo7ruPyh8ESqcUHEtCspz/2j+uMFATYt4EJnEUflRmtkt2C/OTzETXwIDN
	nEsHMIQMf3Zd7Q8QS4dw2YWx7OOzOq3YSvXLWCrnJiq0YEwwAyJy80Gnw/3u9E8B9Xq3f7EsVatND
	Qku6B8kiCpVbryT+DnxRwMqd4uHDlikEzehBjpzxTvlKMbEw778XrT0tWiXUjLm8w5i7vBZVpFZ6I
	zfGpkb1r55TQW6UkL9RFGCSj8oVvgGvUjnCfzxE6Tvu4b0H/aDYBHcIybiaHRigr78kqRn9U6Bvwl
	sYJn1CoTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuHVd-0001uv-J7; Wed, 22 Jan 2020 15:01:33 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuHVZ-0001tg-I0
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 15:01:31 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07484593|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.243332-0.015942-0.740726;
 DS=CONTINUE|ham_system_inform|0.377455-0.00372375-0.618821;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07440; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.GgEOwdx_1579705279; 
Received: from 192.168.43.221(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.GgEOwdx_1579705279)
 by smtp.aliyun-inc.com(10.147.44.118);
 Wed, 22 Jan 2020 23:01:21 +0800
Subject: Re: [PATCH v1 06/11] Documentation: pstore/blk: blkoops: create
 document for pstore_blk
To: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-7-git-send-email-liaoweixiong@allwinnertech.com>
 <b9cd734b-8bb1-5e26-a7ed-fbc79ab2d958@infradead.org>
 <c87bdf3a-f129-a2a7-40b2-2220f79b505a@allwinnertech.com>
 <40d7f57a-119e-e51f-99a5-63e85ab5ab91@infradead.org>
 <3337f687-a668-c058-178b-a1438641c519@allwinnertech.com>
 <597e2b49-667a-490e-91b6-641ca25401d8@infradead.org>
From: liaoweixiong <liaoweixiong@allwinnertech.com>
Message-ID: <6d94b9d5-abef-db5e-1c80-00ea8c1b0003@allwinnertech.com>
Date: Wed, 22 Jan 2020 23:01:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <597e2b49-667a-490e-91b6-641ca25401d8@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_070129_931457_47D27243 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC8xLzIxIOS4i+WNiDExOjM0LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gT24gMS8yMS8y
MCAxMjoxOSBBTSwgbGlhb3dlaXhpb25nIHdyb3RlOgo+PiBoaSBSYW5keSBEdW5sYXAsCj4+Cj4+
IE9uIDIwMjAvMS8yMSAyOjM2IFBNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiAxLzIwLzIw
IDk6MjMgUE0sIGxpYW93ZWl4aW9uZyB3cm90ZToKPj4+PiBoaSBSYW5keSBEdW5sYXAsCj4+Pj4K
Pj4+PiBPbiAyMDIwLzEvMjEgUE0xMjoxMywgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pj4+PiBIaSwK
Pj4+Pj4KPj4+Pj4gSSBoYXZlIHNvbWUgZG9jdW1lbnRhdGlvbiBjb21tZW50cyBmb3IgeW91Ogo+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiAxLzE5LzIwIDU6MDMgUE0sIFdlaVhpb25nIExpYW8gd3JvdGU6
Cj4+Pj4+PiBUaGUgZG9jdW1lbnQsIGF0IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3Jl
LWJsb2NrLnJzdCwgdGVsbHMgdXMKPj4+Pj4+IGhvdyB0byB1c2UgcHN0b3JlL2JsayBhbmQgYmxr
b29wcy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWlYaW9uZyBMaWFvIDxsaWFvd2Vp
eGlvbmdAYWxsd2lubmVydGVjaC5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICDCoCBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3BzdG9yZS1ibG9jay5yc3QgfCAyNzggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+Pj4+ICDCoCBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+Pj4g
IMKgIGZzL3BzdG9yZS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCj4+Pj4+PiAgwqAgMyBmaWxlcyBjaGFuZ2VkLCAyODEg
aW5zZXJ0aW9ucygrKQo+Pj4+Pj4gIMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL3BzdG9yZS1ibG9jay5yc3QKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9wc3RvcmUtYmxvY2sucnN0IGIvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9wc3RvcmUtYmxvY2sucnN0Cj4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi41ODQxOGQ0MjljNTUKPj4+Pj4+IC0tLSAvZGV2
L251bGwKPj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3JlLWJsb2Nr
LnJzdAo+Pj4+Pj4gKwo+Pj4+Pj4gKwo+Pj4+Pj4gK2RtZXNnX3NpemUKPj4+Pj4+ICt+fn5+fn5+
fn5+Cj4+Pj4+PiArCj4+Pj4+PiArVGhlIGNodW5rIHNpemUgaW4gYnl0ZXMgZm9yIGRtZXNnKG9v
cHMvcGFuaWMpLiBJdCAqKk1VU1QqKiBiZSBhIG11bHRpcGxlIG9mCj4+Pj4+PiArNDA5Ni4gSWYg
eW91IGRvbid0IG5lZWQgaXQsIHNhZmVseSBzZXQgaXQgMCBvciBpZ25vcmUgaXQuCj4+Pj4+Cj4+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldCBpdCB0byAwIG9yIGlnbm9yZSBpdC4KPj4+Pj4K
Pj4+Pgo+Pj4+IEkgd2lsbCBmaXggaXQsIHRoYW5rIHlvdS4KPj4+Pgo+Pj4+PiBUaGUgZXhhbXBs
ZSBhYm92ZSBpczrCoCBibGtvb3BzLmRtZXNnX3NpemU9NjQKPj4+Pj4gd2hlcmUgNjQgaXMgbm90
IGEgbXVsdGlwbGUgb2YgNDA5Ni4gKD8pCj4+Pj4+Cj4+Pj4KPj4+PiBUaGUgbW9kdWxlIHBhcmFt
ZXRlciBkbWVzZ19zaXplIGlzIGluIHVuaXQgS0IuCj4+Pgo+Pj4gSSBkaWRuJ3Qgc2VlIHRoYXQg
ZG9jdW1lbnRlZCBhbnl3aGVyZS4KPj4+Cj4+Cj4+IE9oLCBzb3JyeSwgdGhhdCBpcyBteSBvdmVy
c2lnaHQuIEl0IHNlZW1zIHRoYXQgbm90IG9ubHkgdGhlIG90aGVyIHNpemUgaW50cm9kdWN0aW9u
cyBidXQgYWxzbyBpbnRyb2R1Y3Rpb25zIG9uIEtjb25maWcgc2hvdWxkIGJlIGNvcnJlY3RlZC4g
VGhhbmsgeW91IHZlcnkgbXVjaCBhbmQgaXMgdGhlIGZvbGxvd2luZyBtb2RpZmljYXRpb24gT0s/
Cj4+Cj4+IFRoZSBjaHVuayBzaXplIGluIEtCIGZvciBkbWVzZyhvb3BzL3BhbmljKS4gSXQgKipN
VVNUKiogYmUgYSBtdWx0aXBsZSBvZiA0Lgo+IAo+IE9LLgo+IAo+IAo+Pj4+Pj4gK0NvbXByZXNz
aW9uIGFuZCBoZWFkZXIKPj4+Pj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+PiArCj4+
Pj4+PiArQmxvY2sgZGV2aWNlIGlzIGxhcmdlIGVub3VnaCBmb3IgdW5jb21wcmVzc2VkIGRtZXNn
IGRhdGEuIEFjdHVhbGx5IHdlIGRvIG5vdAo+Pj4+Pj4gK3JlY29tbWVuZCBkYXRhIGNvbXByZXNz
aW9uIGJlY2F1c2UgcHN0b3JlL2JsayB3aWxsIGluc2VydCBzb21lIGluZm9ybWF0aW9uIGludG8K
Pj4+Pj4+ICt0aGUgZmlyc3QgbGluZSBvZiBkbWVzZyBkYXRhLiBGb3IgZXhhbXBsZTo6Cj4+Pj4+
PiArCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgUGFuaWM6IFRvdGFsIDE2IHRpbWVzCj4+Pj4+PiAr
Cj4+Pj4+PiArSXQgbWVhbnMgdGhhdCBpdCdzIHRoZSAxNnRoIHRpbWVzIHBhbmljIGxvZyBzaW5j
ZSB0aGUgZmlyc3QgYm9vdGluZy4gU29tZXRpbWVzCj4+Pj4+Cj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lIG9m
IGEgcGFuaWMgbG9nIHNpbmNlIC4uLgo+Pj4+Pgo+Pj4+Cj4+Pj4gU2hvdWxkIGl0IGJlIGxpa2Ug
dGhpcz8KPj4+PiBJdCBtZWFucyB0aGUgdGltZSBvZiBhIHBhbmljIGxvZyBzaW5jZSB0aGUgZmly
c3QgYm9vdGluZy4KPj4+Cj4+PiBUaGF0IHNvdW5kcyBsaWtlIGNsb2NrIHRpbWUsIG5vdCB0aGUg
bnVtYmVyIG9mIGluc3RhbmNlcyBvciBvY2N1cnJlbmNlcy4KPj4+Cj4+Cj4+IEl0IGlzIGFuIG9v
cHMvcGFuaWMgY291bnRlciB0b28uIEhvdyBhYm91dCB0aGlzPwo+Pgo+PiBJdCBtZWFucyB0aGF0
IGl0J3MgT09QUy9QQU5JQyBmb3IgdGhlIDE2dGggdGltZSBzaW5jZSB0aGUgZmlyc3QgYm9vdGlu
Zy4KPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaW5jZSB0aGUgbGFzdCBib290aW5nIHtvciBib290fS4KPiAKCk5vdCB0aGUgbGFzdCBib290
aW5nIGJ1dCB0aGUgZmlyc3QgYm9vdGluZy4gVGhpcyBpcyB0aGUgbnVtYmVyIG9mCnRyaWdnZXJz
IHNpbmNlIHRoZSBmaXJzdCB0aW1lIHRoZSBzeXN0ZW0gd2FzIGluc3RhbGxlZC4KCj4gdGhhbmtz
Lgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
