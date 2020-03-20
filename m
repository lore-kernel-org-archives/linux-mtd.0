Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADA2C4332B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 01:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3A120753
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 01:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nSx/OOZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3A120753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AURFdJ/xVI6eT7Jk91Nu4927HT1REMQmU4lgeeegpkU=; b=nSx/OOZZ6ZWXI1
	T4mYzOWs2hAKD6Kc3yI0NrPr+0UBs0PJ0gRI1S8LYOTD8v75uvjA8Ykg5kLkQD9Jia22mCpj5dQgZ
	Re+/vEbo7osupYIh+Q8WrK1gHil+31e73qLAWuEDCJ2SvkdcRaICbe4VRWTDNgkS587cwQbi0Mhgp
	YAgiBokdH07CMLZqec5+ao8R2sv6oyQsY+zKcTUZqEH3bWXJ4ekAc6iOnlLyroymTZ2ATPyJhmriy
	znselKoqJ4Qob8AP0PKeUXswPrVfAWuPlcWpWFQg5folnl4y6Oyh18d2JxU8479cmT/VS7ELbTPhn
	DqEZM0/BoYr+CJK7x0fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF6oA-0002sw-Ix; Fri, 20 Mar 2020 01:50:46 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF6o5-0002rd-Qw
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2020 01:50:44 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.0186957-0.00101085-0.980293;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16370; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.H2GhozF_1584669031; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.H2GhozF_1584669031)
 by smtp.aliyun-inc.com(10.147.44.129);
 Fri, 20 Mar 2020 09:50:32 +0800
Subject: Re: [PATCH v2 01/11] pstore/blk: new support logger for block devices
To: Kees Cook <keescook@chromium.org>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-2-git-send-email-liaoweixiong@allwinnertech.com>
 <202002251626.63FE3E7C6@keescook>
 <5fd540be-6ed9-a1c7-4932-e67194dddca8@allwinnertech.com>
 <202003180944.3B36871@keescook>
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Message-ID: <dab67ab1-c03f-0507-3d56-4a9578e85f6b@allwinnertech.com>
Date: Fri, 20 Mar 2020 09:50:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <202003180944.3B36871@keescook>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_185042_104615_8279C7E6 
X-CRM114-Status: GOOD (  32.20  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2VlcyBDb29rLAoKT24gMjAyMC8zLzE5IEFNIDE6MjMsIEtlZXMgQ29vayB3cm90ZToKPiBP
biBUaHUsIEZlYiAyNywgMjAyMCBhdCAwNDoyMTo1MVBNICswODAwLCBsaWFvd2VpeGlvbmcgd3Jv
dGU6Cj4+IE9uIDIwMjAvMi8yNiBBTSA4OjUyLCBLZWVzIENvb2sgd3JvdGU6Cj4+PiBPbiBGcmks
IEZlYiAwNywgMjAyMCBhdCAwODoyNTo0NVBNICswODAwLCBXZWlYaW9uZyBMaWFvIHdyb3RlOgo+
Pj4+ICtvYmotJChDT05GSUdfUFNUT1JFX0JMSykgKz0gcHN0b3JlX2Jsay5vCj4+Pj4gK3BzdG9y
ZV9ibGsteSArPSBibGt6b25lLm8KPj4+Cj4+PiBXaHkgdGhpcyBkYW5jZSB3aXRoIGZpbGVzPyBJ
IHdvdWxkIGp1c3QgZXhwZWN0Ogo+Pj4KPj4+IG9iai0kKENPTkZJR19QU1RPUkVfQkxLKSAgICAg
Kz0gYmxrem9uZS5vCj4+Pgo+Pgo+PiBUaGlzIG1ha2VzIHRoZSBidWlsdCBtb2R1bGUgbmFtZWQg
Ymxrem9uZS5rbyByYXRoZXIgdGhhbgo+PiBwc3RvcmVfYmxrLmtvLgo+IAo+IFlvdSBjYW4ganVz
dCBkbyBhIHJlZ3VsYXIgYnVpbGQgcnVsZToKPiAKPiBvYmotJChDT05GSUdfUFNUT1JFX0JMSykg
Kz0gYmxrem9uZS5vCj4gCgpJIGRvbid0IGdldCBpdC4gSWYgbWFrZSBpdCBhcyB5b3VyIHdvcmRz
LCB0aGUgYnVpbHQgbW9kdWxlIHdpbGwgYmUKYmxrem9uZS5rby4KVGhlIG1vZHVsZSBpcyBuYW1l
ZCBwc3RvcmUvYmxrLCBob3dldmVyIGl0IGJ1aWx0IG91dCBibGt6b25lLmtvLiBJIHRoaW5rCml0
J3MKY29uZnVzaW5nLgoKPj4+PiArI2RlZmluZSBCTEtfU0lHICgweDQzNDc0MjQ0KSAvKiBEQkdD
ICovCj4+Pgo+Pj4gSSB3YXMgZ29pbmcgdG8gc3VnZ2VzdCBleHRyYWN0aW5nIFBFUlNJU1RFTlRf
UkFNX1NJRywgcmVuYW1pbmcgaXQgYW5kCj4+PiB1c2luZyBpdCBpbiBoZXJlIGFuZCBpbiByYW1f
Y29yZS5jLCBidXQgdGhlbiBJIHJlYWxpemUgdGhleSdyZSBub3QKPj4+IG1hcmtpbmcgdGhlIHNh
bWUgc3RydWN0dXJlLiBIb3cgYWJvdXQgY2hvb3NpbmcgYSBuZXcgbWFnaWMgc2lnIGZvciB0aGUK
Pj4+IGJsa3pvbmUgZGF0YSBoZWFkZXI/Cj4+Pgo+Pgo+PiBUaGF0J3MgT0sgdG8gbWUuIEkgZG9u
J3Qga25vdyBpZiB0aGVyZSBpcyBhIHJ1bGUgdG8gZ2V0IGEgbmV3IG1hZ2ljPwo+PiBJbiBhZGRp
dGlvbiwgYWxsIG1lbWJlcnMgb2YgdGhpcyBzdHJ1Y3R1cmUgYXJlIHRoZSBzYW1lIGFzCj4+IHN0
cnVjdCBwZXJzaXN0ZW50X3JhbV9idWZmZXIgYWZ0ZXIgcGF0Y2ggMi4gTWF5YmUgaXQncyBhIGdv
b2QgaWRlYSB0bwo+PiBleHRyYWN0IGl0Cj4+IGlmIHlvdSB3YW50IHRvIG1lcmdlIHJhbW9vcHMg
YW5kIHBzdG9yZS9ibGsuCj4gCj4gT2theSwgbGV0J3MgbGVhdmUgaXQgYXMtaXMgZm9yIG5vdy4K
PiAKPj4+PiArCXVpbnQzMl90IHNpZzsKPj4+PiArCWF0b21pY190IGRhdGFsZW47Cj4+Pj4gKwl1
aW50OF90IGRhdGFbXTsKPj4+PiArfTsKPj4+PiArCj4+Pj4gKy8qKgo+Pj4+ICsgKiBzdHJ1Y3Qg
Ymxrel9kbWVzZ19oZWFkZXI6IGRtZXNnIGluZm9ybWF0aW9uCj4+Pgo+Pj4gVGhpcyBpcyB0aGUg
b24tZGlzayBzdHJ1Y3R1cmUgYWxzbz8KPj4+Cj4+IFllcy4gVGhlIHN0cnVjdHVyZSBibGt6X2J1
ZmZlciBpcyBhIGdlbmVyaWMgaGVhZGVyIGZvciBhbGwgcmVjb3JkZXIKPj4gem9uZSwgYW5kIHRo
ZQo+PiBzdHJ1Y3R1cmUgYmxrel9kbWVzZ19oZWFkZXIgaXMgYSBoZWFkZXIgZm9yIGRtZXNnLCBz
YXZlZCBpbgo+PiBibGt6X2J1ZmZlci0+ZGF0YS4KPj4gVGhlIGRtZXNnIHJlY29yZGVyIHVzZSBp
dCB0byBzYXZlIGl0J3Mgc3BlY2lmaWMgYXR0cmlidXRlcy4KPiAKPiBPa2F5LCBjYW4geW91IGFk
ZCBjb21tZW50cyB0byBkaXN0aW5ndWlzaCB0aGUgb24tZGlzayBzdHJ1Y3R1cmVzIGZyb20KPiB0
aGUgaW4tbWVtb3J5LCBldGM/Cj4gCgpTdXJlLiBJIHdpbGwgZG8gaXQuCgo+Pj4+ICsjZGVmaW5l
IERNRVNHX0hFQURFUl9NQUdJQyAweDRkZmMzYWU1Cj4+Pgo+Pj4gSG93IHdhcyB0aGlzIG1hZ2lj
IGNob3Nlbj8KPj4KPj4gSXQncyBhIHJhbmRvbSBudW1iZXIuIE1heWJlIHNob3VsZCBJIGNob3Nl
IGEgbWVhbmluZ2Z1bCBtYWdpYz8KPiAKPiBUaGF0J3MgZmluZTsganVzdCBhZGQgYSBjb21tZW50
IHRvIHNheSBzby4KPiAKCk9LLgoKPj4+PiArICogQGRpcnR5Ogo+Pj4+ICsgKgltYXJrIHdoZXRo
ZXIgdGhlIGRhdGEgaW4gQGJ1ZmZlciBhcmUgZGlydHkgKG5vdCBmbHVzaCB0byBzdG9yYWdlIHll
dCkKPj4+PiArICovCj4+Pgo+Pj4gVGhhbmsgeW91IGZvciB0aGUga2VybmRvYyEgOikgSXMgaXQg
bGlua2VkIHRvIGZyb20gYW55IC5yc3QgZmlsZXM/Cj4+Pgo+Pgo+PiBJIGRvbid0IGdldCB5b3Vy
IHdvcmRzLiBUaGVyZSBpcyBhIGRvY3VtZW50IG9uIHRoZSA2dGggcGF0Y2guIEkgZG9uJ3Qga25v
dwo+PiB3aGV0aGVyIGl0IGlzIHdoYXQgeW91IHdhbnQ/Cj4gCj4gUGF0Y2ggNiBpcyBleGNlbGxl
bnQ7IEkgdGhpbmsgeW91IG1pZ2h0IHdhbnQgdG8gYWRkIHJlZmVyZW5jZXMgYmFjayB0bwo+IHRo
ZXNlIGtlcm4tZG9jIHN0cnVjdHVyZXMgdXNpbmcgdGhlICIuLiBrZXJuZWwtZG9jOjoKPiBmcy9w
c3RvcmUvYmxrem9uZS5jIiBzeW50YXg6Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC9sYXRlc3QvZG9jLWd1aWRlL2tlcm5lbC1kb2MuaHRtbCNpbmNsdWRpbmcta2VybmVsLWRvYy1j
b21tZW50cwo+IAoKV293ISBJIG1hcnZlbCBhdCBrZXJuZWwtZG9jLiBZb3VyIGxpbmsgaGFzIGhl
bHBlZCBtZSBhIGxvdC4KCkkgd2lsbCBvcHRpbWl6ZSBhbGwgbXkgY29tbWVudCBhbmQgZG9jdW1l
bnQgbGF0ZXIuCgo+Pj4+ICtzdGF0aWMgaW50IGJsa3pfem9uZV93cml0ZShzdHJ1Y3QgYmxrel96
b25lICp6b25lLAo+Pj4+ICsJCWVudW0gYmxrel9mbHVzaF9tb2RlIGZsdXNoX21vZGUsIGNvbnN0
IGNoYXIgKmJ1ZiwKPj4+PiArCQlzaXplX3QgbGVuLCB1bnNpZ25lZCBsb25nIG9mZikKPj4+PiAr
ewo+Pj4+ICsJc3RydWN0IGJsa3pfaW5mbyAqaW5mbyA9IGJsa3pfY3h0LmJ6aW5mbzsKPj4+PiAr
CXNzaXplX3Qgd2NudCA9IDA7Cj4+Pj4gKwlzc2l6ZV90ICgqd3JpdGVvcCkoY29uc3QgY2hhciAq
YnVmLCBzaXplX3QgYnl0ZXMsIGxvZmZfdCBwb3MpOwo+Pj4+ICsJc2l6ZV90IHdsZW47Cj4+Pj4g
Kwo+Pj4+ICsJaWYgKG9mZiA+IHpvbmUtPmJ1ZmZlcl9zaXplKQo+Pj4+ICsJCXJldHVybiAtRUlO
VkFMOwo+Pj4+ICsJd2xlbiA9IG1pbl90KHNpemVfdCwgbGVuLCB6b25lLT5idWZmZXJfc2l6ZSAt
IG9mZik7Cj4+Pj4gKwlpZiAoYnVmICYmIHdsZW4pIHsKPj4+PiArCQltZW1jcHkoem9uZS0+YnVm
ZmVyLT5kYXRhICsgb2ZmLCBidWYsIHdsZW4pOwo+Pj4+ICsJCWF0b21pY19zZXQoJnpvbmUtPmJ1
ZmZlci0+ZGF0YWxlbiwgd2xlbiArIG9mZik7Cj4+Pj4gKwl9Cj4+Pgo+Pj4gSWYgeW91J3JlIGV4
cGVjdGluZyBjb25jdXJyZW50IHdyaXRlcnMgKHVzZSBvZiBhdG9taWNfc2V0KCksIEkgd291bGQK
Pj4+IGV4cGVjdCB0aGUgd2hvbGUgd3JpdGUgdG8gYmUgbG9ja2VkIGluc3RlYWQuIChpLmUuIHdo
YXQgaGFwcGVucyBpZgo+Pj4gbXVsdGlwbGUgY2FsbGVycyBjYWxsIGJsa3pfem9uZV93cml0ZSgp
PykKPj4+Cj4+Cj4+IEkgZG9uJ3QgYWdyZWUgd2l0aCBpdC4gVGhlIGRhdGFsZW4gd2lsbCBiZSB1
cGRhdGVkIGV2ZXJ5d2hlcmUuIEl0J3MgdXNlbGVzcwo+PiB0byBsb2NrIGhlcmUuCj4gCj4gQnV0
IHRoZXJlIGNvdWxkIGJlIG11bHRpcGxlIHdyaXRlcnM7IGxvY2tpbmcgc2hvdWxkIGJlIG5lZWRl
ZC4KPiAKCkFsbCB0aGUgcmVjb3JkZXJzIHN1Y2ggYXMgZG1lc2csIHBtc2csIGNvbnNvbGUgYW5k
IGZ0cmFjZSBoYXZlIGJlZW4KbG9ja2VkIG9uCnBzdG9yZSBhbmQgdXBwZXIgbGF5ZXJzLiBTbywg
YSByZWNvcmRlciB3aWxsIG5vdCB3cml0ZSBpbiBwYXJhbGxlbCBhbmQKZGlmZmVyZW50CnJlY29y
ZGVycyBvcGVyYXRlIHByaXZhdGVseSB6b25lLiBUaGV5IGRvbid0IGhhdmUgYW55IGluZmx1ZW5j
ZSBvbiBlYWNoCm90aGVyLgoKVGhlIG9ubHkgcGFyYWxsZWwgY2FzZSBJIHRoaW5rIGlzIHRoYXQg
cmVjb3JkZXIgd3JpdGVzIHdoaWxlIGRpcnR5LWZsdXNoCnRocmVhZCBpcwp3b3JraW5nLiBBbmQg
dGhlIGRpcnR5LWZsdXNoZXIgd2lsbCBmbHVzaCB0aGUgd2hvbGUgem9uZSByYXRoZXIgdGhhbgpw
YXJ0IG9mIGl0LCBzbywKaXQgaXMgT0sgdG8gY2FsbCBpbiBwYXJhbGxlbC4KCkJhc2VkIG9uIHRo
ZXNlIHJlYXNvbnMsIEkgZG9uJ3QgdGhpbmsgbG9ja2luZyBzaG91bGQgYmUgbmVlZGVkLgoKPj4g
T25lIG1vcmUgdGhpbmdzLiBEdXJpbmcgdGhlIGFuYWx5c2lzLCBJIGZvdW5kIGFub3RoZXIgcHJv
YmxlbS4KPj4gUmVtb3Zpbmcgb2xkIGZpbGVzIHdpbGwgY2F1c2UgbmV3IGxvZ3MgdG8gYmUgbG9z
dC4gVGFrZSBjb25zb2xlIHJlY29yZGVyIGFzCj4+IGFtIGV4YW1wbGUuIEFmdGVyIG5ldyByZWJv
b3RpbmcsIG5ldyBsb2dzIGFyZSBzYXZlZCB0byBidWYgd2hpbGUgb2xkCj4+IGxvZ3MgYXJlCj4+
IHNhdmVkIHRvIG9sZF9idWYuIElmIHdlIHJlbW92ZSBvbGQgZmlsZSBhdCB0aGF0IHRpbWUsIG5v
dCBvbmx5IG9sZF9idWYKPj4gaXMgZnJlZWQsIGJ1dAo+PiBhbHNvIGxlbmd0aCBvZiBidWYgZm9y
IG5ldyBkYXRhIGlzIHJlc2V0IHRvIHplcm8uIFRoZSByYW1vb3BzIG1heSBhbHNvCj4+IGhhcyB0
aGlzCj4+IHByb2JsZW0uCj4gCj4gSG1tLiBJJ2xsIG5lZWQgdG8gZG91YmxlLWNoZWNrIHRoaXMu
IEl0J3MgcG9zc2libGUgdGhlIGNhbGwgdG8KPiBwZXJzaXN0ZW50X3JhbV96YXAoKSBpbiByYW1v
b3BzX3BzdG9yZV9lcmFzZSgpIGlzIG5vdCBuZWVkZWQuCj4gCj4+Pj4gK3N0YXRpYyBpbnQgYmxr
el9yZWNvdmVyX2RtZXNnX2RhdGEoc3RydWN0IGJsa3pfY29udGV4dCAqY3h0KQo+Pj4KPj4+IFdo
YXQgZG9lcyAicmVjb3ZlciIgbWVhbiBpbiB0aGlzIGNvbnRleHQ/IElzIHRoaXMgInJlYWQgZnJv
bSBzdG9yYWdlIj8KPj4KPj4gWWVzLiAicmVjb3ZlciIgbWVhbnMgcmVhZGluZyBkYXRhIGJhY2sg
ZnJvbSBzdG9yYWdlLgo+IAo+IE9rYXkuIFBsZWFzZSBhZGQgc29tZSBjb21tZW50cyBoZXJlLiBJ
IHdvdWxkIHRoaW5rIG9mIGl0IG1vcmUgYXMgInJlYWQiCj4gb3IgImxvYWQiLiBXaGVuIEkgdGhp
bmsgb2YgInJlY292ZXIiIEkgdGhpbmsgb2YgImZpbmRpbmcgc29tZXRoaW5nIHRoYXQKPiB3YXMg
bG9zdCIuIEJ1dCB0aGUgbmFtZSBpc24ndCBpbXBvcnRhbnQgYXMgbG9uZyBhcyB0aGVyZSBpcyBh
IGNvbW1lbnQKPiBzb21ld2hlcmUgYWJvdXQgd2hhdCBpdCdzIGRvaW5nLgo+IAoKT0suIEkgd2ls
bCBhZGQgc29tZSBjb21tZW50cyBvbiBlbnRyeSBmdW5jdGlvbiBibGt6X3JlY292ZXJ5KCnjgIIK
Cj4gLUtlZXMKPiAKCi0tIApXZWlYaW9uZyBMaWFvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
