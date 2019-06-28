Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44410C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 03:51:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1728B208CB
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 03:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gidBULL5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1728B208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTEr/mpXHUDJANuzxyDEg3Q3iNdLkENnxafyu0pNWK8=; b=gidBULL5H10pmC
	jOwOSZoZ2IPbopeQzXjm6jo+f8G3J8n2YPtdK+vRN1LmnOjTEoyyFvmoq7N2jGduKJXFloV3zKuiZ
	xjOsahY6+vshUpwHp3E2A2aOZk0IRAoc/pTaL/z6FV8IwQhu5WIs9TrfOryqjF1wY50QlLuGqZmHI
	Nz0efgkK6p/VJq4si+pO1ttBC4GV6X5bS5slXHKS/P4AXn06abwTfMXXRi4QKZQMB/Bsvcpzoge5a
	yW0cKrwUx18ilMvMTTHw7eXga7a3l5yh/cB2lpLG3xfYMtIl/UtcfGO2HAVdD4UqjFbYkJB+v1s/t
	9K705Mh/5oFLKLPjqFMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hghup-0007hi-Tx; Fri, 28 Jun 2019 03:51:11 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hghum-0007hH-Ut
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 03:51:10 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07491465|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.348959-0.0103707-0.64067; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03299; MF=liaoweixiong@allwinnertech.com; NM=1; PH=DS; RN=13; RT=13;
 SR=0; TI=SMTPD_---.Er3LMMF_1561693861; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.Er3LMMF_1561693861)
 by smtp.aliyun-inc.com(10.147.42.16); Fri, 28 Jun 2019 11:51:02 +0800
Subject: Re: [RESEND PATCH v2] mtd: spinand: read return badly if the last
 page has bitflips
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>
References: <1561424549-784-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190625030807.GA11074@kroah.com>
 <97adf58f-4771-90f1-bdaf-5a9d00eef768@kontron.de>
 <20190627190644.25aaaf31@xps13> <20190627201742.34059cdf@xps13>
From: liaoweixiong <liaoweixiong@allwinnertech.com>
Message-ID: <26a4597e-3881-73a2-07e3-6171ddd15d51@allwinnertech.com>
Date: Fri, 28 Jun 2019 11:51:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190627201742.34059cdf@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_205109_160135_5E8DC0AE 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMjAxOS82LzI4IEFNMjoxNywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBNaXF1ZWwsCj4gCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g
d3JvdGUgb24gVGh1LCAyNyBKdW4gMjAxOQo+IDE5OjA2OjQ0ICswMjAwOgo+IAo+PiBIZWxsbywK
Pj4KPj4gU2NocmVtcGYgRnJpZWRlciA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiB3cm90
ZSBvbiBUdWUsIDI1IEp1bgo+PiAyMDE5IDA3OjA0OjA2ICswMDAwOgo+Pgo+Pj4gSGkgbGlhb3dl
aXhpb25nLAo+Pj4KPj4+IE9uIDI1LjA2LjE5IDA1OjA4LCBHcmVnIEtIIHdyb3RlOiAgCj4+Pj4g
T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDk6MDI6MjlBTSArMDgwMCwgbGlhb3dlaXhpb25nIHdy
b3RlOiAgICAKPj4+Pj4gSW4gY2FzZSBvZiB0aGUgbGFzdCBwYWdlIGNvbnRhaW5pbmcgYml0Zmxp
cHMgKHJldCA+IDApLAo+Pj4+PiBzcGluYW5kX210ZF9yZWFkKCkgd2lsbCByZXR1cm4gdGhhdCBu
dW1iZXIgb2YgYml0ZmxpcHMgZm9yIHRoZSBsYXN0Cj4+Pj4+IHBhZ2UuIEJ1dCB0byBtZSBpdCBs
b29rcyBsaWtlIGl0IHNob3VsZCBpbnN0ZWFkIHJldHVybiBtYXhfYml0ZmxpcHMgbGlrZQo+Pj4+
PiBpdCBkb2VzIHdoZW4gdGhlIGxhc3QgcGFnZSByZWFkIHJldHVybnMgd2l0aCAwLgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBsaWFvd2VpeGlvbmcgPGxpYW93ZWl4aW9uZ0BhbGx3aW5uZXJ0
ZWNoLmNvbT4gIAo+Pgo+PiBQbGVhc2Ugd3JpdGUgeW91ciBlbnRpcmUgb2ZmaWNpYWwgZmlyc3Qv
bGFzdCBuYW1lKHMpCj4+CgpPSy4KCj4+Pj4+IFJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24g
PGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+Pj4+PiBSZXZpZXdlZC1ieTogRnJpZWRl
ciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiAgCj4+Cj4+IEkgYW0gd2Fp
dGluZyB5b3VyIG5leHQgdmVyc2lvbiB3aXRoIEFja2VkLWJ5IGluc3RlYWQgb2YgUmV3aWV2ZWQt
YnkKPj4gdGFncyBhbmQgR3JlZydzIGNvbW1lbnQgYWRkcmVzc2VkLgo+IAo+IFNvcnJ5IGZvciB0
aGUgbWlzdGFrZSwgUi1iIHRhZ3MgYXJlIGZpbmUgaGVyZSwgZG9uJ3QgdG91Y2ggdGhhdC4KPiBU
aGUgcmVzdCBuZWVkcyB0byBiZSBmaXhlZCB0aG91Z2guCj4gCgpPSy4KCj4+Pj4+IEZpeGVzOiA3
NTI5ZGY0NjUyNDggKCJtdGQ6IG5hbmQ6IEFkZCBjb3JlIGluZnJhc3RydWN0dXJlIHRvIHN1cHBv
cnQgU1BJIE5BTkRzIikgIAo+Pgo+PiBGaW5hbGx5LCB3aGVuIHdlIGFzayB5b3UgdG8gcmVzZW5k
IGEgcGF0Y2gsIGl0IG1lYW5zIHNlbmRpbmcgYSBuZXcKPj4gdmVyc2lvbiBvZiB0aGUgcGF0Y2gu
IFNvIGluIHRoZSBzdWJqZWN0LCB5b3Ugc2hvdWxkIG5vdCB1c2UgdGhlCj4+IFtSRVNFTkRdIGtl
eXdvcmQgKHdoaWNoIG1lYW5zIHlvdSBhcmUgc2VuZGluZyBzb21ldGhpbmcgYWdhaW4gZXhhY3Rs
eQo+PiBhcyBpdCB3YXMgYmVmb3JlLCB5b3UganVzdCBnb3QgaWdub3JlZCwgZm9yIGV4YW1wbGUp
IGJ1dCBpbnN0ZWFkIHlvdQo+PiBzaG91bGQgaW5jcmVtZW50IHRoZSB2ZXJzaW9uIG51bWJlciAo
djMpIGFuZCBhbHNvIHdyaXRlIGEgbmljZQo+PiBjaGFuZ2Vsb2cgYWZ0ZXIgdGhlIHRocmVlIGRh
c2hlcyAnLS0tJyAod2lsbCBiZSBpZ25vcmVkIGJ5IEdpdCB3aGVuCj4+IGFwcGx5aW5nKS4KPj4K
Pj4gSSB3b3VsZCBsaWtlIHRvIHF1ZXVlIHRoaXMgZm9yIHRoZSBuZXh0IHJlbGVhc2Ugc28gaWYg
eW91IGNhbiBkbyBpdAo+PiBBU0FQLCB0aGF0IHdvdWxkIGJlIGdyZWF0Lgo+PgoKSSB3aWxsIGRv
IGl0IHJpZ2h0IG5vdy4KCj4+IFRoYW5rIHlvdSwKPj4gTWlxdcOobAo+IAo+IAo+IAo+IAo+IFRo
YW5rcywKPiBNaXF1w6hsCj4gCgotLSAKbGlhb3dlaXhpb25nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
