Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A991C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 05:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EToWThsxq7YYxhtF6Nkf/+5rP7uYH0OjE8XL34zqPcM=; b=hDWCjetqAAI6Ia
	JB13G7lDJ/vhH+1cVUxnG6ayoC6paePrLPFlJp9iSPg0XV3mf39v8PP8a+LPLXmGJ18gFFROU0dXo
	lmx+YEamCYCtCspPwEdt5pqSLkbpJENQ+Ox+6QuyohFXGY1pWM+oRW4LsjqX7p+mslSy6Ct+SoMpe
	3OGLXlr5ypuvVhp2LH5yBTmWGtkh3RpMgbIFIhPb0QtFGmsgK6pBdDYxhF8Gnzez3l99O/3kGYaRG
	coa8T14eK3keIf0VOSceH6fOxjmbKuSCbXlALWS6DPuYGzatej+2m+G+bYk4Jxg8HjW3GSdv/SGpR
	OqVbCP4lSletCeFDf50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCED0-004Tqx-IZ; Fri, 15 Jul 2022 05:49:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCECx-004Tqd-2S
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 05:49:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 983DAB8075A;
	Fri, 15 Jul 2022 05:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990CAC34115;
	Fri, 15 Jul 2022 05:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657864183;
	bh=x83VLxJPKHbGMJPFq42rSKpCidSJBC8OXcegnlkwv9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjbN0bpJYSW+af+eGdQANhi9PBXvftOJ/NIngjruJT5fpgqSjQEcJkTYffjhgQJq0
	 1ceN5Z4cCjak4RdUOJXqErmYB/Lqkh9NvijbBEXpC0JdAGyffAVvAVzk3DL+ztLbXk
	 Dhr4ImVX9h2NVrDZ5gJfrpiaZymfOt5Vsu4xiWZA=
Date: Fri, 15 Jul 2022 07:49:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Han Xu <han.xu@nxp.com>, kernel@pengutronix.de,
	stable@vger.kernel.org, k.drobinski@camlintechnologies.com
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Message-ID: <YtD/9KJZwlVj+6hS@kroah.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_224947_452989_5B3B5BE5 
X-CRM114-Status: GOOD (  27.67  )
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

T24gRnJpLCBKdWwgMTUsIDIwMjIgYXQgMDc6Mjc6MDJBTSArMDIwMCwgVG9tYXN6IE1vxYQgd3Jv
dGU6Cj4gT24gTW9uLCAyMDIyLTA3LTExIGF0IDExOjEyICswMjAwLCBUb21hc3ogTW/FhCB3cm90
ZToKPiA+IE9uIEZyaSwgMjAyMi0wNy0wMSBhdCAxMzowMyArMDIwMCwgU2FzY2hhIEhhdWVyIHdy
b3RlOgo+ID4gPiAwNjc4MWE1MDI2MzUwIEZpeGVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgREVW
SUNFX0JVU1lfVElNRU9VVCByZWdpc3Rlcgo+ID4gPiB2YWx1ZSBmcm9tIGJ1c3lfdGltZW91dF9j
eWNsZXMuIGJ1c3lfdGltZW91dF9jeWNsZXMgaXMgY2FsY3VsYXRlZCB3cm9uZwo+ID4gPiB0aG91
Z2g6IEl0IGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gdGhlIG1heGltdW0gcGFnZSByZWFkIHRpbWUs
IGJ1dCB0aGUKPiA+ID4gdGltZW91dCBpcyBhbHNvIHVzZWQgZm9yIHBhZ2Ugd3JpdGUgYW5kIGJs
b2NrIGVyYXNlIG9wZXJhdGlvbnMgd2hpY2gKPiA+ID4gcmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0
dWRlIGJpZ2dlciB0aW1lb3V0cy4KPiA+ID4gCj4gPiA+IEZpeCB0aGlzIGJ5IGNhbGN1bGF0aW5n
IGJ1c3lfdGltZW91dF9jeWNsZXMgZnJvbSB0aGUgbWF4aW11bSBvZgo+ID4gPiB0QkVSU19tYXgg
YW5kIHRQUk9HX21heC4KPiA+IAo+ID4gMDY3ODFhNTAyNjM1MCB3YXMgbWVyZ2VkIGluIHY1LjE5
LXJjNCBhbmQgdGhlbiB3YXMgcGlja2VkIHVwIGJ5IHNldmVyYWwKPiA+IHN0YWJsZSBrZXJuZWxz
LCBpbmNsdWRpbmcgdjUuMTUuNTEuIEFmdGVyIHdlIGhhdmUgdXBncmFkZWQgdG8gdjUuMTUuNTEK
PiA+IHdlIGhhdmUgb2JzZXJ2ZWQgdGhlIGlzc3VlIHRoYXQgU2FzY2hhIG1lbnRpb25lZCBpbiBo
aXMgZW1haWwgWzFdLgo+ID4gCj4gPiBBcyB0aGUgdjUuMTktcmM2IHdhcyByZWxlYXNlZCB5ZXN0
ZXJkYXkgYW5kIHRoaXMgZml4IGlzIHN0aWxsIG5vdAo+ID4gYXBwbGllZCwgdGhlIHY1LjE5LXJj
NiAoYW5kIGFsbCBzdGFibGUga2VybmVscyB0aGF0IHBpY2tlZCB1cCB0aGUKPiA+IGJhY2twb3J0
KSBjYXVzZXMgTkFORCBmbGFzaCBkYXRhIGxvc3Mgb24gaW14IHRhcmdldHMuCj4gPiAKPiA+IEkg
aGF2ZSBiYWNrcG9ydGVkIHRoaXMgcGF0Y2ggdG8gb3VyIGludGVybmFsIHY1LjE1LjUxIGJhc2Vk
IGtlcm5lbCBvbgo+ID4gNHRoIEp1bHkgMjAyMiBhbmQgSSBjYW4gY29uZmlybSB0aGF0IGl0IGRv
ZXMgaW5kZWVkIHNvbHZlIHRoZSBOQU5EIGRhdGEKPiA+IGxvc3Mgb24gaW14IHRhcmdldHMuCj4g
PiAKPiA+IElzIGl0IHBvc3NpYmxlIGZvciB0aGlzIHBhdGNoIHRvIG1ha2UgaXQgdG8gdGhlIHY1
LjE5LXJjNz8KPiAKPiBObyByZXNwb25zZSwgc28gc2VuZGluZyB0aGUgZW1haWwgdG8gbW9yZSBw
ZW9wbGUgc28gdGhlIHZvaWNlIGlzIGhlYXJkLgo+IFNvcnJ5IGlmIHRoaXMgaXMgbm90IHRoZSBw
cm9wZXIgd2F5LCBidXQgSSB0aGluayB0aGUgaXNzdWUgaXMgc2VyaW91cy4KPiAKPiBDdXJyZW50
IHByZXBhdGNoIGtlcm5lbHMgc3RhcnRpbmcgd2l0aCB2NS4xOS1yYzQgYW5kIHN0YWJsZSBrZXJu
ZWxzCj4gc3RhcnRpbmcgd2l0aCB2NS40LjIwMi4gdjUuMTAuMTI3LCB2NS4xNS41MSwgdjUuMTgu
OCBjb250YWluIGEKPiAgICJbUEFUQ0hdIFtSRUFMTFkgUkVBTExZIEJST0tFTl0gbXRkOiByYXdu
YW5kOiBncG1pOiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0dGluZyIKPiB0aGF0IGlzIHdy
ZWFraW5nIGhhdm9jIHRvIGkuTVhbNjc4XSBvciBpLk1YMjggZGV2aWNlcyB3aXRoIE5BTkQKPiAg
ICIqKiBUSElTIFBBVENIIFdJTEwgQ0FVU0UgREFUQSBMT1NTIE9OIFlPVVIgTkFORCEhICoqIiBb
MV0KPiAKPiBUaGUgc29sdXRpb24gaXMgdG8gZWl0aGVyOgo+ICAgKiBSZXZlcnQgMDY3ODFhNTAy
NjM1MCAoIm10ZDogcmF3bmFuZDogZ3BtaTogRml4IHNldHRpbmcgYnVzeSB0aW1lb3V0Cj4gc2V0
dGluZyIpIGFuZCBhbGwgaXRzIGNoZXJyeS1waWNrcyB0byBzdGFibGUgYnJhbmNoZXMsICpPUioK
PiAgICogQXBwbHkgdGhlIGZpeCAoIm10ZDogcmF3bmFuZDogZ3BtaTogU2V0IFdBSVRfRk9SX1JF
QURZIHRpbWVvdXQKPiBiYXNlZCBvbiBwcm9ncmFtL2VyYXNlIHRpbWVzIikgWzJdCj4gCj4gUGxl
YXNlIGRvIHdoYXRldmVyIHlvdSBzZWUgZml0LgoKSSBjYW4gZG8gZG8gYSBzdGFibGUgcmVsZWFz
ZSB3aXRoIHRoaXMgcmV2ZXJ0ZWQsIGJ1dCBJIHJlYWxseSBleHBlY3RlZAp0byBzZWUgdGhlIGZp
eCBpbiBsaW51eC1uZXh0IGJ5IG5vdyBhdCB0aGUgdmVyeSBsZWFzdC4gIERvZXMgdGhpcyBkcml2
ZXIKbm90IGhhdmUgYW4gYWN0aXZlIG1haW50YWluZXIgYW5kIHN1YnN5c3RlbSBtYWludGFpbmVy
IGZvciBzb21lIHJlYXNvbj8KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
