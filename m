Return-Path: <SRS0=/qel=ZA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3851AC5DF60
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 04:46:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 096E121848
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 04:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1gAzUXi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xRn6UE1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 096E121848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VyBlpnlppZeZwt8l9+OnkjkT5MQdstsy8P3AuY0L3HU=; b=G1gAzUXiBwnLEbPekoCWYohIb
	6b0QdB2NPrXQAErN9K9FeifltA/n4rDtZ3g5R6fKP2yJnt3VoJ+JCITpujYme0d6VMD0k8H8xH1ix
	2FO2aDwnZdAAtMkM3r6738DVoxbqNaJaqzopRYixzK38VCJourqzvWdN8Rg9yTcrvCouSOZdBGDqE
	uqf2KB4WgRJ25ZkBN3hkWVjUMq5x4vOR9+9E8qof219WOV8tCFKSilYCZnl5OwoTiVz1XKzwoULrs
	5Za4z8RhFBucfqa32ym2+zizo4WNzsRrrBOdF/kqo+yzmdThvsySQ5CvqT8vAZK5Y3ZCgO1CBmC8t
	NUYaojZZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSwA4-0006FG-8a; Fri, 08 Nov 2019 04:46:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSwA1-0006EL-M3; Fri, 08 Nov 2019 04:46:15 +0000
Received: from [10.44.0.22] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC92721848;
 Fri,  8 Nov 2019 04:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573188373;
 bh=gH4YV/wqrobeQnaVD22aDnltH06bEHnjtZENRGZ48q4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xRn6UE1fCLscoGa0SSMS43OBs/hmPEGgj8EzH0pTY9x2nudK/0/KLYUDldyDZFBiW
 eefoao4dK85ZkzfVnGne6x8pop9UgAK0gyCag4BvbaJ1GqmvgyozJHyhg8t+8IWe7v
 Jqu6973Y1RC3ZxksXaZzEc2ZHihhNBSO+oKuM9iw=
Subject: Re: [PATCH] mtd: rawnand: driver for Mediatek MT7621 SoC NAND flash
 controller
To: =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
References: <20191107092053.Horde.i3MVcW9RqZDOQBMADZX9fuc@www.vdorst.com>
From: Greg Ungerer <gerg@kernel.org>
Message-ID: <b7e61be8-bd72-a4ef-6fb7-1047c7874342@kernel.org>
Date: Fri, 8 Nov 2019 14:46:07 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107092053.Horde.i3MVcW9RqZDOQBMADZX9fuc@www.vdorst.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_204613_744246_438728B3 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: devel@driverdev.osuosl.org, Weijie Gao <hackpascal@gmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 DENG Qingfang <dengqf6@mail2.sysu.edu.cn>, linux-mediatek@lists.infradead.org,
 neil@brown.name, linux-mtd@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDcvMTEvMTkgNzoyMCBwbSwgUmVuw6kgdmFuIERvcnN0IHdyb3RlOgo+IFF1b3RpbmcgZ2Vy
Z0BrZXJuZWwub3JnOgo+IAo+PiBGcm9tOiBHcmVnIFVuZ2VyZXIgPGdlcmdAa2VybmVsLm9yZz4K
Pj4KPj4gQWRkIGEgZHJpdmVyIHRvIHN1cHBvcnQgdGhlIE5BTkQgZmxhc2ggY29udHJvbGxlciBv
ZiB0aGUgTWVkaWFUZWsgTVQ3NjIxCj4+IFN5c3RlbS1vbi1DaGlwIGRldmljZS4gKFRoaXMgb25l
IGlzIHRoZSBNSVBTIGJhc2VkIHBhcnRzIGZyb20gTWVkaWF0ZWspLgo+Pgo+PiBUaGlzIGNvZGUg
aXMgYSByZS13b3JraW5nIG9mIHRoZSBlYXJsaWVyIHBhdGNoZXMgZm9yIHRoaXMgaGFyZHdhcmUg
dGhhdAo+PiBoYXZlIGJlZW4gZmxvYXRpbmcgYXJvdW5kIHRoZSBpbnRlcm5ldCBmb3IgeWVhcnM6
Cj4+Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9SZWNsYWltWW91clByaXZhY3kvY2xvYWsvYmxvYi9t
YXN0ZXIvdGFyZ2V0L2xpbnV4L3JhbWlwcy9wYXRjaGVzLTMuMTgvMDA0NS1tdGQtYWRkLW10NzYy
MS1uYW5kLXN1cHBvcnQucGF0Y2gKPj4KPj4gVGhpcyBpcyBhIG11Y2ggY2xlYW5lZCB1cCB2ZXJz
aW9uLCBwdXQgaW4gc3RhZ2luZyB0byBzdGFydCB3aXRoLgo+PiBJdCBkb2VzIHN0aWxsIGhhdmUg
c29tZSBwcm9ibGVtcywgbWFpbmx5IHRoYXQgaXQgc3RpbGwgdXNlcyBhIGxvdCBvZiB0aGUKPj4g
bXRkIHJhdyBuYW5kIGxlZ2FjeSBzdXBwb3J0Lgo+Pgo+PiBUaGUgZHJpdmVyIG5vdCBvbmx5IGNv
bXBpbGVzLCBidXQgaXQgd29ya3Mgd2VsbCBvbiB0aGUgc21hbGwgcmFuZ2Ugb2YKPj4gaGFyZHdh
cmUgcGxhdGZvcm1zIHRoYXQgaXQgaGFzIGJlZW4gdXNlZCBvbiBzbyBmYXIuIEkgaGF2ZSBiZWVu
IHVzaW5nCj4+IGZvciBxdWl0ZSBhIHdoaWxlIG5vdywgY2xlYW5pbmcgdXAgYXMgSSBnZXQgdGlt
ZS4KPj4KPj4gU28uLi4gSSBhbSBsb29raW5nIGZvciBjb21tZW50cyBvbiB0aGUgYmVzdCBhcHBy
b2FjaCBmb3J3YXJkIHdpdGggdGhpcy4KPj4gQXQgbGVhc3QgaW4gc3RhZ2luZyBpdCBjYW4gZ2V0
IHNvbWUgbW9yZSBleWViYWxscyBnb2luZyBvdmVyIGl0Lgo+Pgo+PiBUaGVyZSBpcyBhIG1lZGlh
dGVrIG5hbmQgZHJpdmVyIGFscmVhZHksIG10a19uYW5kLmMsIGZvciB0aGVpciBBUk0gYmFzZWQK
Pj4gU3lzdGVtLW9uLUNoaXAgZGV2aWNlcy4gVGhhdCBoYXJkd2FyZSBtb2R1bGUgbG9va3MgdG8g
aGF2ZSBzb21lIGhhcmR3YXJlCj4+IHNpbWlsYXJpdGllcyB3aXRoIHRoaXMgb25lLiBBdCB0aGlz
IHBvaW50IEkgZG9uJ3Qga25vdyBpZiB0aGF0IGNhbiBiZQo+PiB1c2VkIG9uIHRoZSA3NjIxIGJh
c2VkIGRldmljZXMuIChJIHRyaWVkIGEgcXVpY2sgYW5kIGRpcnR5IHNldHVwIGFuZCBoYWQKPj4g
bm8gc3VjY2VzcyB1c2luZyBpdCBvbiB0aGUgNzYyMSkuCj4+Cj4+IFRob3VnaHRzPwo+IAo+ICtD
QyBERU5HIFFpbmdmYW5nLCBDaHVhbmhvbmcgR3VvLCBXZWlqaWUgR2FvIHRvIHRoZSBsaXN0Lgo+
IAo+IEhpIEdyZWcsCj4gCj4gVGhhbmtzIGZvciBwb3N0aW5nIHRoaXMgZHJpdmVyLgo+IAo+IEJ1
dCBJIHdvdWxkIGxpa2UgdG8gbWVudGlvbiB0aGF0IHRoZSBvcGVud3J0IGNvbW11bml0eSBpcyBj
dXJyZW50bHkgd29ya2luZyBvbiBhCj4gbmV3IHZlcnNpb24gd2hpY2ggaXMgYmFzZWQgYSBuZXdl
ciB2ZXJzaW9uIG9mIHRoZSBNZWRpYVRlayB2ZW5kb3IgZHJpdmVyLgo+IFRoYXQgdmVyc2lvbiBp
cyBjdXJyZW50bHkgdGFyZ2V0ZWQgZm9yIHRoZSBvcGVud3J0IDQuMTkga2VybmVsLgo+IFNlZSBm
dWxsIHB1bGwgcmVxdWVzdCBbMV0gYW5kIE5BTkQgZHJpdmVyIHBhdGNoIFsyXQo+IAo+IEl0IHdv
dWxkIGJlIGEgc2hhbWUgaWYgZHVwbGljYXRlIHdvcmsgaGFzIGJlZW4gZG9uZS4KClRoYW5rcyBm
b3IgcG9pbnRpbmcgdGhhdCBvdXQuIEkgaGF2ZSBubyBwYXJ0aWN1bGFyIGF0dGFjaG1lbnQgdG8g
dGhlCnBhdGNoIGNvZGUgSSBzZW50IChJIGRpZG4ndCB3cml0ZSBpdCkuIFJlYWxseSBqdXN0IHdh
bnQgdG8gc2VlIGEgZHJpdmVyCmluIG1haW5saW5lLgoKSSBhbSBnb2luZyB0byBzcGluIGEgdjIg
b2YgaXQsIGxldHMgc2VlIGhvdyB0byB0aGUgMiBkcml2ZXJzIHN0YWNrIHVwCmFnYWluc3QgZWFj
aCBvdGhlci4KClJlZ2FyZHMKR3JlZwoKCgo+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL29wZW53
cnQvb3BlbndydC9wdWxsLzIzODUKPiBbMl06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29w
ZW53cnQvcHVsbC8yMzg1L2NvbW1pdHMvYjI1NjljMGE1OTQzZmU4Zjk0YmEwN2M5NTQwZWNkMTQw
MDZkNzI5YQo+IAo+IDxzbmlwPgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
