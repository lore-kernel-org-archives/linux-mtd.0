Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MONEY_NOHTML,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A40C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 16:10:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C746023EB1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 16:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C746023EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ebo.tv
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vn5Tru4M5QIlP4PRKbj98mox60YM5Nee+K6/E3WuRBc=; b=j5KtC8qasEhoHr
	XEUXJLi042lQxWJ+ezH1Dnh5F0PfNqom5mMF+qFqEiO9O11xJdY+lYm3UMtOTIhEYei5HLHc26p/a
	y4zDsbxWmoVZg0hwUhrVumMe18Yiq/Smie9e0tFQbFMjMCfCyZTQDNb/wFw+BQYPabdos14J57gmd
	3LCwbfK9PKt0XCPaXnSxeMCVdYMWp2hX5/Me/inxzJFD2MHQ4BSxCo+Zh6tDoy/nuG90ar6yEkWVt
	bx0x1SpY7otKn9ItwBWZwEw3ZMABYYSi9M47NmPcocYiopB7VelPBww1J+18A1ndPfS+O47wcw/uR
	Wg2DG2KxCFtbxDo80ypQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knkzk-0005IP-5j; Fri, 11 Dec 2020 16:10:12 +0000
Received: from noc.ebotel.net ([72.29.77.203])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knkzg-0005EH-AJ
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 16:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ebo.tv;
 s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZUaQRg4v80LeEI59hNFm5Y9MW3IkZJM5gPZ6kgrM/ww=; b=SMIDcj7HzakPJU2a6THy92xBuL
 uSvv+9nr/+aBhpzTx27/wdUlh0BYt5Q5DWaj3CDamHndj3YYu2M/LocNbs6GMnNq7sUqvMpWfXbQ6
 66eUhpZoS12SOP1TT2Eow8GKGds2kwZc9u/YjUxI/i5hzRvaUgE/LWR7gSh7mPk7ywBE=;
Received: from [14.226.235.220] (port=35457 helo=ebo.tv)
 by noc.ebotel.net with esmtpa (Exim 4.87)
 (envelope-from <gerencia@ebo.tv>)
 id 1knkyr-0003E1-81; Fri, 11 Dec 2020 12:09:18 -0400
To: "linux mm" <linux-mm@kvack.org>, "Matt Mackall" <mpm@selenic.com>,
 "Christoph Lameter" <cl@linux.com>, "Fengguang Wu" <fengguang.wu@intel.com>,
 "Lars Peter Clausen" <lars@metafoo.de>,
 "torvalds" <torvalds@linux-foundation.org>,
 "Stany MARCEL" <smarcel@pactenovation.fr>,
 "linux mtd" <linux-mtd@lists.infradead.org>, "dedekind1" <dedekind1@gmail.com>
From: nik_bin_nek_alwi <gerencia@ebo.tv>
Subject: =?UTF-8?Q?Na._wie_geht=E2=80=99s=3F?=
Message-ID: <bc694df8-70ae-4804-b3b4-4bee56be392e@ebo.tv>
Date: Fri, 11 Dec 2020 08:59:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - noc.ebotel.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ebo.tv
X-Get-Message-Sender-Via: noc.ebotel.net: authenticated_id: gerencia@ebo.tv
X-Authenticated-Sender: noc.ebotel.net: gerencia@ebo.tv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_111008_586934_96E82374 
X-CRM114-Status: UNSURE (   3.68  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cgrwn5KMIExhc3MgZGljaCBncsO8w59lbi4gR2VodCBlcyBkaXIgZ3V0PwpodHRwczovL2JpdC5s
eS8zbFVic0xGCgoKCiBuaWtfYmluX25la19hbHdpQHlhaG9vLmNvbQoKCiAxMi8xMS8yMDIwIDc6
NTk6MjUgQU0KCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwogRGFuIE1hcmlubyB0YWxrcyBQZXl0b24gTWFubmlu
Zywgc3RyYXRlZ3kgaW4gU3VwZXIgQm93bCBYTFZJSUkgbWF0Y2gtdXAKTkZMIEhhbGwgb2YgRmFt
ZSBxdWFydGVyYmFjayBEYW4gTWFyaW5vIGpvaW5zIHRoZSAiQ0JTIFRoaXMgTW9ybmluZyIgY28t
aG9zdHMgdG8gZGlzY3VzcyB0aGUgQnJvbmNvcycgUGV5dG9uIE1hbm5pbmcsIHRoZSBSaWNoYXJk
IFNoZXJtYW4gY29tbWVudHMgY29udHJvdmVyc3ksIGhpcyBTdXBlciBCb3dsIGV4cGVyaWVuY2Us
IGFuZCBoaXMgd29yayB3aXRoIE51dHJpU3lzdGVtLgpBZHZlbnR1cmVycyBDcm9zcyB0aGUgR2xv
YmUgYnkgRm9vdCBhbmQgSGFuZApJdCB0b29rIHRoZW0gdHdvIHllYXJzLCBidXQgQ29saW4gQW5n
dXMgYW5kIEp1bGllIFdhZmFlaSBhcmUgdGhlIGZpcnN0IHBlb3BsZSB0byBjaXJjdW1uYXZpZ2F0
ZSB0aGUgZ2xvYmUgY29tcGxldGVseSBieSBzZWxmLXByb3B1bHNpb24uIFRoYXQgbWVhbnMgdGhl
eSByb3dlZCBhY3Jvc3MgdGhlIEF0bGFudGljIC0tIG5vIHNhaWxzLiAgQW5kIGJpa2VkIGFuZCBo
aWtlZCBhY3Jvc3MgU2liZXJpYS4KRmFsc2Vob29kcyBhbmQgVGhyZWF0cwpBbmQgd2hhdCBlbHNl
IHlvdSBuZWVkIHRvIGtub3cgdG9kYXkuCkRvZXMgU2NvdGxhbmQgbmVlZCB0byBjaGFuZ2UgaXRz
IGxhd3Mgb24gcHJvc3RpdHV0aW9uPwpBIFNjb3R0aXNoIGdvdmVybm1lbnQgY29uc3VsdGF0aW9u
IGNhbGxlZCBmb3Igdmlld3Mgb24gaG93IGJlc3QgdG8gcHJvdGVjdCB3b21lbiBpbnZvbHZlZCBp
biBwcm9zdGl0dXRpb24uCkNhbmFkaWFuIG9mZmljaWFscyB3YXJuIGRyaXZlcnMgbm90IHRvIGxl
dCBtb29zZSBsaWNrIHRoZWlyIGNhcnMKQ2FuYWRpYW5zLCBvZmZpY2lhbHMgaGF2ZSBhbiBpbXBv
cnRhbnQgbWVzc2FnZSBmb3IgeW91OiAiRG8gbm90IGxldCBtb29zZSBsaWNrIHlvdXIgY2FyLiIK
Q2FsbHMgZm9yIGNsYXJpdHkgb24gcG9zdC1CcmV4aXQgdHJhdmVsIGFmdGVyIGZlYXJzIG5vbi1l
c3NlbnRpYWwgRVUgdHJpcHMgY291bGQgYmUgYmFubmVkClRyYXZlbCBhZ2VudHMgYW5kIGhvbGlk
YXltYWtlcnMgYXJlIGNhbGxpbmcgZm9yIG1vcmUgY2xhcml0eSBmcm9tIHRoZSBnb3Zlcm5tZW50
IGFmdGVyIEJyZXhpdCBhbWlkIGZlYXJzIG5vbi1lc3NlbnRpYWwgRVUgdHJhdmVsIGNvdWxkIGJl
IGJhbm5lZC4gClR1cmtleSBGaW5lcyBTb2NpYWwgTWVkaWEgR2lhbnRzICQzLjhNIGZvciBGYWls
dXJlIHRvIEhpcmUgTG9jYWwgUmVwcmVzZW50YXRpdmVzLCBSZXBvcnQgU2F5cwpNT1NDT1csIChT
cHV0bmlrKSAtIFR1cmtleSdzIEluZm9ybWF0aW9uIGFuZCBDb21tdW5pY2F0aW9uIFRlY2hub2xv
Z2llcyBBdXRob3JpdHkgKEJUSykgb24gRnJpZGF5IG9yZGVyZWQgc2V2ZXJhbCBnbG9iYWwgc29j
aWFsIG1lZGlhIHBsYXRmb3JtcyB0byBwYXkgYSBmaW5lIG9mIDMwIG1pbGxpb24gVHVya2lzaCBs
aXJhcyAoJDMuOCBtaWxsaW9uKSBlYWNoIGZvciBmYWlsaW5nIHRvIGFwcG9pbnQgbG9jYWwgcmVw
cmVzZW50YXRpdmVzLCBhcyBtYW5kYXRlZCBieSByZWNlbnQgbGVnaXNsYXRpb24sIHRoZSBuYXRp
b25hbCBBbmFkb2x1IEFnZW5jeSByZXBvcnRlZC4KWW91ciBuZXh0IHN0aW11bHVzIGNoZWNrIGNv
dWxkIGJlIGZvciAkMSwyMDAsICQ2MDAgb3IgJDAKTGF3bWFrZXJzIGFyZSBuZWdvdGlhdGluZyBh
bm90aGVyIHN0aW11bHVzIHBhY2thZ2UgdGhhdCBjb3VsZCBiZSBwYXNzZWQgYmVmb3JlIHllYXIt
ZW5kLCBidXQgbXVjaCByZW1haW5zIGluIGZsdXguClByZXBhcmluZyBQdXBzIEZvciBUaGUgUG9z
dC1QYW5kZW1pYyBMaWZlCkFsZXhhbmRyYSBIb3Jvd2l0eiBpcyB0aGUgZGlyZWN0b3Igb2YgdGhl
IERvZyBDb2duaXRpb24gTGFiIGF0IEJhcm5hcmQgQ29sbGVnZS4gU2hlIHNheXMgcGV0cyB3aWxs
IG5lZWQgaGVscCBhZGp1c3RpbmcgdG8gbGlmZSBhZnRlciB0aGUgcGFuZGVtaWMuCkZhbHNlaG9v
ZHMgYW5kIFRocmVhdHMKQW5kIHdoYXQgZWxzZSB5b3UgbmVlZCB0byBrbm93IHRvZGF5LgpFbG9u
IE11c2sncyBTdGFyc2hpcCB0YWtlcyB0byB0aGUgc2tpZXMKVGhlIFVTIHRlY2ggYmlsbGlvbmFp
cmUgbGF1bmNoZXMgdGhlIGxhdGVzdCBwcm90b3R5cGUgb2YgaGlzICJNYXJzIHNwYWNlc2hpcCIu
Ck5hZGFsIGFkdmFuY2VzIHRvIHRoZSBsYXN0IGZvdXIgb2YgdGhlIEFUUCBGaW5hbHMgYWZ0ZXIg
YmVhdGluZyBUc2l0c2lwYXMKUmFmYWVsIE5hZGFsIHByb2dyZXNzZWQgaW50byB0aGUgZmluYWwg
Zm91ciBvZiB0aGUgQVRQIEZpbmFscyBmb3IgdGhlIGZpcnN0IHRpbWUgaW4gZml2ZSB5ZWFycyBh
ZnRlciBiZWF0aW5nIFN0ZWZhbm9zIFRzaXRzaXBhcyAtLSA2LTQgNC02IDYtMiAtLSBvbiBUaHVy
c2RheS4KQ09WSUQtMTkgY2FzZXMgaW4gRW5nbGFuZCBmYWxsIGJlbG93IDUwMCwwMDAsIGVzdGlt
YXRlZCBmaWd1cmVzIHNob3cKVGhlIG51bWJlciBvZiBuZXcgQ09WSUQtMTkgaW5mZWN0aW9ucyBp
biBFbmdsYW5kIGlzIGNvbnRpbnVpbmcgdG8gZmFsbCwgYWNjb3JkaW5nIHRvIHRoZSBsYXRlc3Qg
ZXN0aW1hdGVzLgpNYXN0ZXJjYXJkIFNheXMgRW5kaW5nIFVzZSBvZiBJdHMgQ2FyZHMgb24gUG9y
bmh1YiAtIFJlcG9ydApJdCB3YXMgZWFybGllciByZXBvcnRlZCB0aGF0IFZpc2EgYW5kIE1hc3Rl
cmNhcmQgd2VyZSBpbnZlc3RpZ2F0aW5nIGEgcmVwb3J0IG9mIHVubGF3ZnVsIGNvbnRlbnQgb24g
dGhlIHdlYnNpdGUsIGluY2x1ZGluZyB0aGUgYWxsZWdlZCBwcmVzZW5jZSBvZiB2aWRlb3Mgb2Yg
Y2hpbGQgYWJ1c2UgYW5kIG5vbi1jb25zZW5zdWFsIHNleHVhbCB2aW9sZW5jZS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
