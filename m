Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA021C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 16:16:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674DB22248
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 16:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ea8Aqwnh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 674DB22248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Aabf25xwhU0qQ7jUwdkA8m9grGaQzPVdmizDMv19d5E=; b=ea8Aqwnh/yW8TwUnrtiInC32Q
	uW40uE/EeJ+6wT5VbFq/GQEPS+x4zIlE74CNGFfvuCNujPm+NoY0tgsbYexsmknamFrNxNEaNuphQ
	qes4QHPsb7Cay8vCw9e7chXKt+OGMsNwLb8b82z6AvSBjD/B2talCuon8WnX4R5CsfyLHgIFZScaW
	h6pxTYYDnRzD350cLrgWfncvs3kGYRDv8CwuxZq0mFRl6qedYKO889z+X/yF9Z0nsYJI6TXLc7wfb
	ZU88dqI9hFVSJljZ0tKXdTIDL3jT9aLHvDcUcM4OKEGkiKlYOyZDNqFQ1k8aqNcqmQG1i6sCqX7x1
	PRi7nw7ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdFFo-0003OU-SK; Thu, 12 Nov 2020 16:15:20 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdFFi-0003Nd-6f
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 16:15:15 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 62D4420000B;
 Thu, 12 Nov 2020 16:15:11 +0000 (UTC)
Date: Thu, 12 Nov 2020 17:15:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <20201112171510.0b0b8b80@xps13>
In-Reply-To: <20201112161043.brhpuo7rykdip3hs@mobilestation>
References: <202011021254.XC70BaQT-lkp@intel.com>
 <20201110113827.hl5i27cpl6exo3md@mobilestation>
 <20201110163556.3e3423f6@xps13>
 <20201111192259.ovdyjcuue7fx2bqa@mobilestation>
 <20201112092715.7e466405@xps13>
 <8cdc6166-7183-c8a9-5c27-93a511e6471a@ti.com>
 <20201112152739.r4673zyeixkcwukx@mobilestation>
 <20201112164301.60032276@xps13>
 <20201112161043.brhpuo7rykdip3hs@mobilestation>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_111514_479813_E508B354 
X-CRM114-Status: GOOD (  29.09  )
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
Cc: kbuild-all@lists.01.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-mtd@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VyZ2UsCgpTZXJnZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0cm9uaWNzLnJ1
PiB3cm90ZSBvbiBUaHUsIDEyIE5vdgoyMDIwIDE5OjEwOjQzICswMzAwOgoKPiBPbiBUaHUsIE5v
diAxMiwgMjAyMCBhdCAwNDo0MzowMVBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4g
SGkgU2VyZ2UsCj4gPiAKPiA+IFNlcmdlIFNlbWluIDxTZXJnZXkuU2VtaW5AYmFpa2FsZWxlY3Ry
b25pY3MucnU+IHdyb3RlIG9uIFRodSwgMTIgTm92Cj4gPiAyMDIwIDE4OjI3OjM5ICswMzAwOgo+
ID4gICAKPiA+ID4gSGVsbG8gVmlnbmVzaAo+ID4gPiAKPiA+ID4gT24gVGh1LCBOb3YgMTIsIDIw
MjAgYXQgMDg6MzA6NDJQTSArMDUzMCwgVmlnbmVzaCBSYWdoYXZlbmRyYSB3cm90ZTogIAo+ID4g
PiA+IAo+ID4gPiA+IAo+ID4gPiA+IE9uIDExLzEyLzIwIDE6NTcgUE0sIE1pcXVlbCBSYXluYWwg
d3JvdGU6ICAgIAo+ID4gPiA+ID4gSGkgU2VyZ2V5LAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTZXJn
ZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0cm9uaWNzLnJ1PiB3cm90ZSBvbiBXZWQs
IDExIE5vdgo+ID4gPiA+ID4gMjAyMCAyMjoyMjo1OSArMDMwMDoKPiA+ID4gPiA+ICAgICAKPiA+
ID4gPiA+PiBPbiBUdWUsIE5vdiAxMCwgMjAyMCBhdCAwNDozNTo1NlBNICswMTAwLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOiAgICAKPiA+ID4gPiA+Pj4gSGkgU2VyZ2UsCj4gPiA+ID4gPj4+Cj4gPiA+
ID4gPj4+IFNlcmdlIFNlbWluIDxTZXJnZXkuU2VtaW5AYmFpa2FsZWxlY3Ryb25pY3MucnU+IHdy
b3RlIG9uIFR1ZSwgMTAgTm92Cj4gPiA+ID4gPj4+IDIwMjAgMTQ6Mzg6MjcgKzAzMDA6Cj4gPiA+
ID4gPj4+ICAgICAgIAo+ID4gPiA+ID4+Pj4gSGVsbG8gTWlxdWVsLAo+ID4gPiA+ID4+Pj4KPiA+
ID4gPiA+Pj4+IEEgc2l0dWF0aW9uIG5vdGVkIGJ5IHRoZSB3YXJuaW5nIGJlbG93IHdvbid0IGNh
dXNlIGFueSBwcm9ibGVtIGJlY2F1c2UKPiA+ID4gPiA+Pj4+IHRoZSBjYXN0aW5nIGlzIGRvbmUg
dG8gYSBub24tZGVyZWZlcmVuY2VkIHZhcmlhYmxlLiBJdCBpcyB1dGlsaXplZAo+ID4gPiA+ID4+
Pj4gYXMgYSBwb2ludGVyIGJpYXMgbGF0ZXIgaW4gdGhhdCBmdW5jdGlvbi4gU2hhbGwgd2UganVz
dCBpZ25vcmUgdGhlCj4gPiA+ID4gPj4+PiB3YXJuaW5nIG9yIHN0aWxsIGZpeCBpdCBzb21laG93
PyAgICAgIAo+ID4gPiA+ID4+PiAgICAgICAKPiA+ID4gPiA+PiAgICAKPiA+ID4gPiA+Pj4gRG8g
eW91IHRoaW5rIHRoZSBjYXN0IHRvIGEgIV9faW9tZW0gdmFsdWUgaXMgbWFuZGF0b3J5IGhlcmU/
ICAgICAgCj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBJdCdzIG5vdCBtYW5kYXRvcnkgdG8gaGF2ZSB0
aGUgY2FzdGluZyB3aXRoIG5vIF9faW9tZW0sIGJ1dCB3b3VsZG4ndAo+ID4gPiA+ID4+IGRvaW5n
IGxpa2UgdGhpczoKPiA+ID4gPiA+PiArIAlzaGlmdCA9IChzc2l6ZV90IF9faW9tZW0pc3JjICYg
MHgzOwo+ID4gPiA+ID4+IGJlIGxvb2tpbmcgd2VpcmQ/IFJlYWxseSwgaXMgdGhlcmUgYSBnb29k
IHdheSB0byBzb21laG93IGV4dHJhY3QgdGhlIGZpcnN0Cj4gPiA+ID4gPj4gdHdvIGJpdHMgb2Yg
YSBfX2lvbWVtIHBvaW50ZXIgd2l0aG91dCBnZXR0aW5nIHRoZSBzcGFyc2Ugd2FybmluZz8gICAg
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgYXNrZWQgYXJvdW5kIG1lLCB3aGF0IGFib3V0IHRyeWlu
ZyB1aW50cHRyX3Q/Cj4gPiA+ID4gPiAgICAgCj4gPiA+ID4gICAgIAo+ID4gPiAgIAo+ID4gPiA+
IE9uZSBtb3JlIHdheSBpcyB0byB1c2UgX19mb3JjZSB0byB0ZWxsIHNwYXJzZSB0aGF0IHRoaXMg
Y2FzdGluZyBpcwo+ID4gPiA+IGludGVudGlvbmFsOgo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICBz
aGlmdCA9IChfX2ZvcmNlIHNzaXplX3Qpc3JjICYgMHgzOyAgICAKPiA+ID4gCj4gPiA+IE9oLCBn
cmVhdCEgVGhhdCBzb2x1dGlvbiBpcyBhY3R1YWxseSBtdWNoIGJldHRlciB0aGFuIHVzaW5nIHNv
bWUKPiA+ID4gY3VycmVudGx5IHVuZXhwbGFpbmVkIHNwYXJzZSBwZWN1bGlhcml0eSEgSSB3YXMg
dGhpbmtpbmcgYWJvdXQgYXBwbHlpbmcKPiA+ID4gc29tZSBvdGhlciBhdHRyaWJ1dGUsIGJ1dCBf
X2ZvcmNlIGp1c3QgZGlkbid0IGNvbWUgdG8gbXkgbWluZC4gVGhhbmsKPiA+ID4geW91IHZlcnkg
bXVjaCBmb3IgdGhlIHN1Z2dlc3Rpb24uIEknbGwgcG9zdCB0aGUgZml4IHdpdGggdGhlIHNvbHV0
aW9uCj4gPiA+IHN1Z2dlc3RlZCBieSB5b3UuICAKPiA+ICAgCj4gCj4gPiBJcyB0aGUgc3NpemVf
dCBjYXN0IHRoZSByaWdodCBvbmUgYnR3PyBJIHdvdWxkIGRlZmluaXRlbHkgcHJlZmVyIGFuCj4g
PiB1bnNpZ25lZCB0eXBlIGhlcmUuICAKPiAKPiBUaGUgcmVhc29uIG9mIG1lIGRlY2lkaW5nIHRv
IHVzZSB0aGUgc3NpemVfdCB0eXBlIGhlcmUgd2FzIHRvIHByZXZlbnQKPiB0aGUgdHlwZXMgY2Fz
dGluZyBhY3Jvc3MgdGhlICJzaGlmdCIsICJjaHVuayIgYW5kICJsZW4iIHZhcmlhYmxlcwo+IHdp
dGhpbiB0aGlzIG1ldGhvZC4gSXQgc2VlbWVkIGEgYml0IGJldHRlciB0aGFuIGhhdmluZyBhIHN0
YW5kYXJkIHR5cGUKPiBsaWtlICJ1bnNpZ25lZCBpbnQiIGhlcmUgc2VlaW5nIHRoZSBzc2l6ZV90
IHR5cGUgd2lkdGggd29uJ3QgZXhjZWVkCj4gdGhlIGxvbmcgdHlwZSBzaXplIGFueXdheS4gTW9y
ZW92ZXIgc2luY2UgdGhlICJsZW4iIHZhcmlhYmxlIGhhcyBnb3QKPiB0aGUgc3NpemVfdCB0eXBl
IGFuZCBJIGNvdWxkbid0IGNoYW5nZSBpdCAodGhlIG1ldGhvZCBpcyB0aGUgbWFwX2luZm8KPiBj
YWxsYmFjayksIEkndmUgZGVjaWRlZCB0byBzdGljayB3aXRoIHdoYXQgaXMgYXZhaWxhYmxlIGFu
ZCBkZWZpbmVkCj4gInNoaWZ0IiBhbmQgImNodW5rIiBhcyBzc2l6ZV90LWVzLiBBbm90aGVyIGNh
bGxiYWNrIG1ldGhvZAo+IGJ0MV9yb21fbWFwX3JlYWQoKSBpbiBoaXMgbW9kdWxlIGhhcyBiZWVu
IGRlc2lnbmVkIGluIHRoZSBzYW1lIHdheS4KPiAKPiBEbyB5b3UgdGhpbmsgaXQncyBiZXR0ZXIg
dG8gY2hhbmdlIGl0IGluIGZhdm9yIG9mIHVzaW5nIGEgZGlmZmVyZW50Cj4gdHlwZSBsaWtlICJ1
bnNpZ25lZCBpbnQiIGhlcmUgYW55d2F5PwoKSSB3b3VsZCBzYXkgeWVzLgoKPiBJZiBzbyBmb3Ig
dW5pZmljYXRpb24gSSdkIG5lZWQgdG8KPiBjaGFuZ2UgYnQxX3JvbV9tYXBfcmVhZCgpICh0aG91
Z2ggdGhlICJzaGlmdCIgdmFyaWFibGUgaGFzIGJlZW4KPiBkZWZpbmVkIGFzICJ1bnNpZ25lZCBs
b25nIiB0aGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UgYmVjYXVzZSB0aGUgb2Zmcwo+IGFyZ3VtZW50
IGhhcyBnb3QgdGhhdCB0eXBlKS4KCkZpbmUuCgo+IAo+IFdoYXQgdG8gZG8gd2l0aCB0aGUgX19m
b3JjZSBhdHRyaWJ1dGUgaGVyZT8gSXQgZG9lcyBzZWVtIGFwcHJvcHJpYXRlCj4gZXZlbiBpZiBm
b3Igc29tZSBteXN0aWNhbCByZWFzb25zIHdlIGhhdmVuJ3QgZ290IHRoZSBzcGFyc2Ugd2Fybmlu
Zwo+IGZvciB0aGUgdW5zaWduZWQgdHlwZXMuCgpZZWFoIHRoaXMgaXMgc3RyYW5nZS4gSSB3b3Vs
ZCwgaG93ZXZlciwgc3VnZ2VzdCBub3QgdG8gYWRkIHRoaXMga2V5d29yZAppZiB3ZSBkb24ndCBu
ZWVkIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
