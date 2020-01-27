Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEA7C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 12:07:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11EA0207FD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 12:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SzP0JKgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11EA0207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=streamunlimited.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDv8uz1FzlMuJ8ycgatlGnqPwVlNf37OjsZzR2g3R3c=; b=SzP0JKgUYE35zR
	XREibHw7nCetdHPSqVKYO1tDkuRyXCiKsB27rqIHSHLAvpuBz4uLiCKUkeB8sd0js2l4RdN83Koc/
	Twr0zYriIwtM93tfWKwlEEOz9c1raWGa31BF3t+W/Rw/NmnXflHJMg9A6du2Fb/8ktnN0/0xHntwz
	vxTvIc7LYz4CrTZVmuICmHJ9097P2WA1jo/jPHm6W29JN4HUTc4NFuypbMcJzeISasCgpia1aYRbW
	B9/bINBLv7PMR0UuG5wUl3agZ6YzXSZx70DdAv0FHnY+3sYKVX75N0kTpIJWGbAy5ruaktKCt+WLD
	RGqyu047q4h1wrXV9HWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw3AM-0005Eb-HF; Mon, 27 Jan 2020 12:06:54 +0000
Received: from bsmtp2.bon.at ([213.33.87.16])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw3AJ-00056Q-6m
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 12:06:53 +0000
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
 by bsmtp2.bon.at (Postfix) with ESMTPSA id 485pPr47PZz5tlF;
 Mon, 27 Jan 2020 13:06:40 +0100 (CET)
Date: Mon, 27 Jan 2020 13:06:39 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: JH <jupiter.hce@gmail.com>
Subject: Re: [yocto] lost busybox mysteriously
Message-ID: <20200127120638.2jpgvedxecwgwz6u@qschulz>
References: <CAA=hcWRQmXa4_hh3KzKmqeaEkGsbdTEimsPjh=tZWribMkM0dA@mail.gmail.com>
 <CAA=hcWRwi_EsMD2OBzVWtyX_SPJf05vqc09zhQzFdguKi0k=FA@mail.gmail.com>
 <emb3e01e23-7511-48c8-9229-85a767ab359c@andys-imac.leeshillfarm.local>
 <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_040651_406025_A6E29608 
X-CRM114-Status: GOOD (  20.56  )
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
Cc: connman <connman@lists.01.org>,
 Yocto discussion list <yocto@yoctoproject.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andy Pont <andy.pont@sdcsystems.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSkgsCgpPbiBNb24sIEphbiAyNywgMjAyMCBhdCAxMDoxMzozN1BNICsxMTAwLCBKSCB3cm90
ZToKPiBIaSBBbmR5LAo+IAo+IFRoYW5rcyBmb3IgdGhlIHJlc3BvbnNlLgo+IAo+IE9uIDEvMjcv
MjAsIEFuZHkgUG9udCA8YW5keS5wb250QHNkY3N5c3RlbXMuY29tPiB3cm90ZToKPiA+IEpIIHdy
b3RlLi4uCj4gPgo+ID4+VGhhdCB0aGUgc2FtZSBwcm9ibGVtIG9mIG1pc3NpbmcgYnVzeWJveCB3
YXMgbm90IGp1c3Qgb2NjdXJyZWQgZHVyaW5nCj4gPj50aGUgZGV2aWNlIHJ1bm5pbmcgaW4gdGhl
IG1pZGRsZSBvZiBvcGVyYXRpb24sIGl0IHdhcyBhbHNvIG9jY3VycmVkCj4gPj5kdXJpbmcgYm9v
dGluZyBpbWFnZSBmcm9tIE5BTkQsIEkgc2F3IHNldmVyYWwgdGltZXMgdGhhdCB0aGUgZmlyc3Qg
YW5kCj4gPj5zZWNvbmQgY3ljbGVzIG9mIGJvb3RpbmcgaW1hZ2UgZnJvbSBOQU5EIHdlcmUgd29y
a2luZyB3ZWxsLCB0aGVuIHNvbWUKPiA+PmZvbGxvd2luZyBib290aW5nIHByb2Nlc3Mgd291bGQg
YmUgY3Jhc2hlZCBieSBtaXNzaW5nIGJ1c3lib3gsIHRoZW4KPiA+PmNvdWxkIG5vdCBydW4gd2hv
bGUgc2hlbGwgY29tbWFuZHMuIEkgaGF2ZSBiZWVuIHBvbmRlcmluZyBpZiBpdCBjb3VsZAo+ID4+
YmUgY2F1c2VkIGJ5IE5BTkQgaXNzdWUgb3IgbmV0d29yayB2aXJ1cyAvIGZpc2h5PyBBcHByZWNp
YXRlIGFueQo+ID4+Y2x1ZXMuCj4gPiBUaGUgZmlyc3Qgc3RlcCBpcyBmb3IgdXMgdG8gdW5kZXJz
dGFuZCB3aGF0IOKAnG1pc3NpbmfigJ0gbWVhbnM/ICBIYXZlIHlvdQo+ID4gZ290IGFueSBtZWNo
YW5pc20gKFUtQm9vdCwgU0QgY2FyZCBib290LCBldGMuKSB0aGF0IHdpbGwgYWxsb3cgeW91IHRv
Cj4gPiBtb3VudCBhbmQgbG9vayBhdCB0aGUgY29udGVudHMgb2YgdGhlIE5BTkQgZmlsZSBzeXN0
ZW0/Cj4gCj4gTWVhbnMgdGhhdCBidXN5Ym94IHdhcyBub3QgdGhlcmUgYW55bW9yZSwgaXQgbXlz
dGVyaW91c2x5IGxvc3QsIGFsbAo+IHNoZWxsIGNvbW1hbmRzIHdvdWxkIG5vIGxvbmdlciBhdmFp
bGFibGUuIEl0IGNhbm5vdCB0byBydW4gbW91bnQgb3IKPiBhbnkgc2hlbGwgY29tbWFuZHMuIFRo
ZXJlIHdhcyB0d28gc2NlbmFyaW9zIHdoZW4gdGhhdCBoYXBwZW5lZDoKPiAKPiAtIEluIHRoZSBt
aWRkbGUgb2YgcnVubmluZywgdGhlIGRldmljZSBhbGwgb2YgY2VydGFpbiBjb3VsZCBub3QgcnVu
Cj4gc2hlbGwgY29tbWFuZHMgYW5kIGZhaWxlZCBteXN0ZXJpb3VzbHkKPiAKPiAtIER1cmluZyB0
aGUgdS1ib290IGJvb3Rpbmcga2VybmVsIHByb2Nlc3MsIHRoZXJlIHdlcmUgZnVsbCBlcnJvcnMg
b2YKPiBmYWlsaW5nIHNoZWxsIGNvbW1hbmRzLiBMZXQgbWUgbWFrZSBpdCBjbGVhciwgIHRoYXQg
Ym9vdGluZyBlcnJvciBkaWQKPiBub3Qgb2NjdXIgaW4gdGhlIGZpcnN0IG9yIHNlY29uZCBrZXJu
ZWwgYm9vdGluZyBhZnRlciB0aGUgbmV3IGltYWdlCj4gaW5zdGFsbGF0aW9uLCBpdCBoYXBwZW5l
ZCBpbiB0aGUgZm9sbG93aW5nIGtlcm5lbCBib290aW5nLCBidXQgdGhlcmUKPiB3YXMgbm90aGlu
ZyB0byBkZWxldGUgYnVzeWJveCBhY2NpZGVudGFsbHksIGJ1c3lib3ggd2FzIGp1c3QKPiBteXN0
ZXJpb3VzbHkgZGlzYXBwZWFyZWQuIEJlY2F1c2UgSSBjb3VsZCBub3QgcnVuIGxzLCBJIGRpZCBu
b3Qga25vdwo+IGlmIHRoZXJlIGFyZSBvdGhlciB0aGluZ3MgbWlzc2luZy4gSWYgeW91IGFzayBo
b3cgSSBjb3VsZCBrbm93IHRoZQo+IGJ1c3lib3ggd2FzIG1pc3NpbmcsIEkgcmFuIHRoZSB6SW1h
Z2UtaW5pdHJhbWZzIHRvIGJvb3QgdGhlIGxpbnV4IGluCj4gUkFNLCB0aGVuIG1vdW50IHRoZSB1
YmkwIHRvIGZpbmQgIG91dCBidXN5Ym94IHdhcyBnb25lLgo+IAo+IAo+ID4gSWYgeW91IGxvb2sg
YXQgdGhlIC9iaW4gZGlyZWN0b3J5IChscyAtbGEgL2Jpbi9idXN5Kikgd2hhdCBkbyB5b3Ugc2Vl
Pwo+ID4gSGF2ZSB0aGUgZmlsZXMgYmVlbiBkZWxldGVkPyBUcnVuY2F0ZWQ/IFplcm8gbGVuZ3Ro
Pwo+IAo+IENvdWxkIG5vdCBydW4gbHMgb3IgYW55IHNoZWxsIGNvbW1hbmRzIHdoZW4gdGhlIGJ1
c3lib3ggd2FzIG1pc3NpbmcuCj4gCgovYmluL2xzIC1sYSAvYmluL2J1c3kqID8KCk1heWJlIHNv
bWV0aGluZyBpcyBtZXNzaW5nIHdpdGggdGhlIFBBVEggZW52aXJvbm1lbnQgdmFyaWFibGUuIE9y
CnNvbWV0aGluZyBpcyByZW1vdmluZyB0aGUgc3ltbGlua3MgZnJvbSBzb21lIGJpbmFyaWVzIHRv
IGJ1c3lib3guCgo+ID4gV2hhdCBmaWxlIHN5c3RlbSBhcmUgeW91IHVzaW5nIG9uIHRoZSBOQU5E
IGZsYXNoPyAgSG93IGFyZSB0aGUgZGV2aWNlcwo+ID4gYmVpbmcgcmVzZXQgZHVyaW5nIHRoZSB2
YXJpb3VzIGJvb3QgY3ljbGVzPyAgSWYgaXQgaXMgYSBoYXJkd2FyZSByZXNldAo+ID4gdGhlbiBz
b21lIGZpbGUgc3lzdGVtcyBhcmUgbGVzcyByZXNpbGllbnQgdG8gaXQgdGhhbiBvdGhlcnMgYnV0
IEkgd291bGQKPiA+IGV4cGVjdCBpbiB0aGF0IGNhc2UgbW9yZSBmdW5kYW1lbnRhbCBib290IGlz
c3Vlcy4KPiAKPiBVQklGUywgbW9zdCBkZXZpY2UgcmVzZXQgb3IgYm9vdCBjeWNsZXMgd2VyZSBj
YWxsaW5nIGhhbHQgb3IgcmVib290LAo+IGJ1dCBpdCBzb21ldGltZSBpdCBjb3VsZCBqdXN0IHVz
ZSBwb3dlciBjeWNsZS4KPiAKCklJUkMsIFVCSUZTIGlzIHNhZmUgZnJvbSBwb3dlciBjeWNsZXMu
CgpRdWVudGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
