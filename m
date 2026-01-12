Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F059C9EC94
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jan 2026 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bETqriSw8RiVZNzX7usIOKBwNfLBJ3QP2ZkVDw3d7n4=; b=vsmnwOyTzgjsSI
	732pHmu0qIVDvz26M6VeRTkf5iGHius66YGbguri6nhCVtoVnkW6przJ2kYxvMM7VuH7iKW8ID0Vm
	xMYrCFV5lO6bSI98rFBTkzUrDV5jNMGt0JQtxIDs48t4XgrY601n0CLgpXNmPsmu7XOlAJXVdxqje
	QDNKJWiehGoCMotDbc51QkfnLr8KjU0s52Vo/6JWc8Nqym8zyAe0VzYv/XGLHMEtpnZVXAEjfDgPF
	Se4i8QNWm/U0k0WJEoNyrjcOVS8GuHiuUc/DXMxuih4+AyoScfW/jOQLTPw3UyQ0AIqxQlt0SvZiP
	ksu3mHubfHT97Z/Hx5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfK9K-00000005f6O-2koH;
	Mon, 12 Jan 2026 15:48:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfK9H-00000005f5t-3pVz
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jan 2026 15:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8284440973;
	Mon, 12 Jan 2026 15:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4705BC19422;
	Mon, 12 Jan 2026 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232886;
	bh=o6bLg0ySoZFHDQc+FNwqUrcZpZi5SIhfxu4HKAZ3x7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWusaK509HA0eIMXPq06mOSRxySQ4nCsiv9htDK34SN6ExfuIvfN1c2LG5UQcRjKE
	 YGHBEbL7iaGIR1Ssl05VuiGyf+/WlYaReCV/Z+z3RX/3hcRAhu+OITBgT5dMI2j150
	 3uPzWuU42Cn12bbM9fmqGhlWdgIn86/RSi8na6s2F3z4d2050vP4HDwTEn5Rcp5Q+M
	 Dh8JOUUuULMpnUEGkCJyb7g5nhHPm491sI/+YSFRK6aXSQUJo1uZtIVuK+BEdsERW7
	 cNizGOxXSIIMzXy06HWwvjW62qWyoVEu6bAqMDvIDyl7GdIm4Qc4OuyAgK0ffEtq+1
	 +rYs/0VMe1sGA==
Date: Mon, 12 Jan 2026 09:48:05 -0600
From: Rob Herring <robh@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>, Nick Terrell <terrelln@fb.com>,
	David Sterba <dsterba@suse.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: mtd: brcm,brcmnand: Drop
 "brcm,brcmnand" compatible for iProc
Message-ID: <20260112154805.GA271138-robh@kernel.org>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-1-124a53ce6279@kernel.org>
 <CAHi4H7GvSsX=BO2AWy4BB=FfQ8bWx_C3PBh9UQHYOo+G247P_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHi4H7GvSsX=BO2AWy4BB=FfQ8bWx_C3PBh9UQHYOo+G247P_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_074807_996065_35ACDCDA 
X-CRM114-Status: GOOD (  23.79  )
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

T24gRnJpLCBKYW4gMDksIDIwMjYgYXQgMTA6MDU6MDRBTSAtMDgwMCwgV2lsbGlhbSBaaGFuZyB3
cm90ZToKPiBIaSBSb2IsCj4gCj4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCA5OjUz4oCvQU0gUm9i
IEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gU29tZSB1c2Vy
cyBvZiAiYnJjbSxuYW5kLWlwcm9jIiBpbmNsdWRlICJicmNtLGJyY21uYW5kIiBhbmQgc29tZSBk
b24ndC4KPiA+IFRoZSAiYnJjbSxicmNtbmFuZCIgY29tcGF0aWJsZSBpcyBub3QgdXNlZnVsIGZv
ciBpUHJvYyBzeXN0ZW1zIGFzCj4gPiB0aGVyZSdzIGEgc2VwYXJhdGUgZHJpdmVyIGZvciBpUHJv
Yy4gU28gZHJvcCBpdCBhcyBhIGZhbGxiYWNrLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBI
ZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbCB8IDEgLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWwKPiA+IGlu
ZGV4IDA2NGU4NDBhZWFhMS4uMzEwNWY4ZTZjYmQ2IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWwKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1s
Cj4gPiBAQCAtNjYsNyArNjYsNiBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgaXRlbXM6Cj4g
PiAgICAgICAgICAgIC0gY29uc3Q6IGJyY20sbmFuZC1pcHJvYwo+ID4gICAgICAgICAgICAtIGNv
bnN0OiBicmNtLGJyY21uYW5kLXY2LjEKPiA+IC0gICAgICAgICAgLSBjb25zdDogYnJjbSxicmNt
bmFuZAo+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IEJDTTYzMTY4IFNvQy1zcGVjaWZpYyBOQU5E
IGNvbnRyb2xsZXIKPiA+ICAgICAgICAgIGl0ZW1zOgo+ID4gICAgICAgICAgICAtIGNvbnN0OiBi
cmNtLG5hbmQtYmNtNjMxNjgKPiA+Cj4gPiAtLQo+ID4gMi41MS4wCj4gPgo+IAo+IEFub3RoZXIg
Zml4IHdvdWxkIGJlIGFkZGluZyBicmNtLGJyY21uYW5kIHRvIHRoZSB1c2VycyBvZgo+IGJyY20s
bmFuZC1pcHJvYyB0byBrZWVwIGNvbnNpc3RlbmN5IHdpdGggYWxsIG90aGVyIGJyY21uYW5kIGNo
aXBzIGFuZAo+IHV0aWxpemUgdGhlIGZhbGxiYWNrIG1lY2hhbmlzbSBpbiB0aGUgZHJpdmVyLCBh
bHRob3VnaCBJIGFncmVlIGl0IGRvZXMKPiBub3QgaGFwcGVuIGluIHJlYWwgbGlmZSBjYXNlLgo+
IEkgZG9uJ3QgaGF2ZSBhbnkgc3Ryb25nIG9waW5pb24gZWl0aGVyIHdheSBidXQgYSBmb2xsb3ct
dXAgY2hhbmdlIGlzCj4gbmVlZGVkIHRvIHJlbW92ZSB0aGUgZmFsbGJhY2sgZnJvbSB0aGUgYnJj
bSxuYW5kLWlwcm9jIGR0cyBmaWxlcyBpZiB3ZQo+IGdvIHRoaXMgcm91dGUuCgpUaGUgcXVlc3Rp
b24gdG8gYXNrIG9uIGEgZmFsbGJhY2sgaXMgImlzIGl0IHVzYWJsZSBvbiBpdHMgb3duPyIuIElP
VywgCndvdWxkIGEgZHJpdmVyIHRoYW4gb25seSB1bmRlcnN0YW5kcyBicmNtLGJyY21uYW5kIGZ1
bmN0aW9uIGluIHRoaXMgCmNhc2UuIEdpdmVuIGlwcm9jIG5lZWRzIGl0cyBvd24gZHJpdmVyIGFu
ZCBzcGVjaWZpYyBoYW5kbGluZywgdGhlIGFuc3dlciAKaXMgbm8gaGVyZS4KClBsdXMsIHRoaXMg
bWF0Y2hlcyB3aGF0IGR0cyBmaWxlcyBhY3R1YWxseSBoYXZlIGF0IGxlYXN0IGZvciB0aGUgYXJt
NjQgCm9uZXMuIAoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
