Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B84C43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB1720684
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sp5R8ynE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB1720684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t0F4mTA8tac+CSw8/PJqua10HAFGBM1aXI90cuh4sCU=; b=sp5R8ynEHeHO0Skqdg8XHflzY
	fUZtramdUihkR3tT9jy8fkYRCI7IkbXjvyRcxIwUASu9au3EL9LRDtrtshLVtNhP/D59+x0sZMBGH
	n5F5bMsmqIGrRrkmqNLyg3utqBc50zTtFU+Qv59623cIZ32LHiALEAM9Ny4xO1sTMDgCMz9MIZtdH
	yXHQx20KtnM9JQxqbRWKcj8BrzvfBToAzXuqjmdROq8RozhHMtiRcyJPlAN/oTHQKmu5Wh6+zlVaz
	hoj6SrveShqFsU3BZTg/8RZkWGhPuOUeIOOsj863Uxi1wgaWUlhpRfYmKoiTVJJ7hCU7De9VFgo5k
	oTohEn+pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1tBZ-0003n3-RQ; Thu, 07 Mar 2019 13:35:45 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tBO-0003cx-Uk; Thu, 07 Mar 2019 13:35:36 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 7 Mar
 2019 21:36:37 +0800
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
To: Miquel Raynal <miquel.raynal@bootlin.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
 <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
 <20190307140959.10092d45@xps13>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <c507cbf2-5b68-7ac1-dd5d-75df2fe8407c@amlogic.com>
Date: Thu, 7 Mar 2019 21:36:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307140959.10092d45@xps13>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_053534_985972_1891DAC2 
X-CRM114-Status: GOOD (  20.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKT24gMjAxOS8zLzcgMjE6MDksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVs
bG8sCj4gCj4gTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4gd3JvdGUgb24gVHVlLAo+IDUgTWFyIDIwMTkgMjM6MTI6NTEgKzAxMDA6Cj4gCj4+
IEhpIExpYW5nLAo+Pgo+PiBPbiBNb24sIE1hciA0LCAyMDE5IGF0IDU6NTUgQU0gTGlhbmcgWWFu
ZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gSGVsbG8gTWFydGluLAo+
Pj4KPj4+IE9uIDIwMTkvMy8yIDI6MjksIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4+Pj4g
SGkgTGlhbmcsCj4+Pj4KPj4+PiBJIGFtIHRyeWluZyB0byBhZGQgc3VwcG9ydCBmb3Igb2xkZXIg
U29DcyB0byB0aGUgbWVzb24tbmFuZCBkcml2ZXIuCj4+Pj4gQmFjayB3aGVuIHRoZSBkcml2ZXIg
d2FzIGluIGRldmVsb3BtZW50IEkgdXNlZCBhbiBlYXJseSByZXZpc2lvbiAob2YKPj4+PiB5b3Vy
IGRyaXZlcikgYW5kIGRpZCBzb21lIG1vZGlmaWNhdGlvbnMgdG8gbWFrZSBpdCB3b3JrIG9uIG9s
ZGVyIFNvQ3MuCj4+Pj4KPj4+PiBOb3cgdGhhdCB0aGUgZHJpdmVyIGlzIHVwc3RyZWFtIEkgd2Fu
dGVkIHRvIGdpdmUgaXQgYW5vdGhlciB0cnkgYW5kCj4+Pj4gbWFrZSBhIHJlYWwgcGF0Y2ggb3V0
IG9mIGl0LiBVbmZvcnR1bmF0ZWx5IGl0J3Mgbm90IHdvcmtpbmcgYW55bW9yZS4KPj4+Pgo+Pj4+
IEFzIGZhciBhcyBJIGtub3cgdGhlIE5GQyBJUCBibG9jayByZXZpc2lvbiBvbiBHWEwgaXMgc2lt
aWxhciAob3IgZXZlbgo+Pj4+IHRoZSBzYW1lPykgYXMgb24gYWxsIG9sZGVyIFNvQ3MuIEFzIGZh
ciBhcyBJIGNhbiB0ZWxsIG9ubHkgdGhlIGNsb2NrCj4+Pj4gc2V0dXAgaXMgZGlmZmVyZW50IG9u
IHRoZSBvbGRlciBTb0NzICh3aGljaCBoYXZlIGEgZGVkaWNhdGVkIE5BTkQKPj4+PiBjbG9jayk6
Cj4+Pj4gLSB3ZSBkb24ndCBuZWVkIHRoZSAiYW1sb2dpYyxtbWMtc3lzY29uIiBwcm9wZXJ0eSBv
biB0aGUgb2xkZXIgU29Dcwo+Pj4+ICAgICBiZWNhdXNlIHdlIGRvbid0IG5lZWQgdG8gc2V0dXAg
YW55IG11eGluZyAoY29tbW9uIGNsb2NrIGZyYW1ld29yawo+Pj4+ICAgICB3aWxsIGRvIGV2ZXJ5
dGhpbmcgZm9yIHVzKQo+Pj4+IC0gInJ4IiBhbmQgInR4IiBjbG9ja3MgZG9uJ3QgZXhpc3QKPj4+
PiAtIEkgY291bGQgbm90IGZpbmQgYW55IG90aGVyIGRpZmZlcmVuY2VzIGJldHdlZW4gTWVzb244
LCBNZXNvbjhiLAo+Pj4+ICAgICBNZXNvbjhtMiwgR1hCQiBhbmQgR1hMCj4+Pj4gICAKPj4+IFRo
YXQgaXMgcmlnaHQuIHRoZSBzZXJpYWxzIE5GQyBpcyBhbG1vc3QgdGhlIHNhbWUgZXhjZXB0Ogo+
Pj4gMSkgVGhlIGNsb2NrIGNvbnRyb2wgYW5kIHNvdXJjZSB0aGF0IE04LXNlcmlhbHMgYXJlIG5v
dCBzaGFyZSB3aXRoIEVNTUMuCj4+PiAyKSBUaGUgYmFzZSByZWdpc3RlciBhZGRyZXNzCj4+PiAz
KSBETUEgZW5jcnlwdGlvbiBvcHRpb24gd2hpY2ggd2UgZG9uJ3QgY2FyZSBvbiBORkMgZHJpdmVy
Lgo+PiBncmVhdCwgdGhhbmsgeW91IGZvciBjb25maXJtaW5nIHRoaXMhCj4+Cj4+Pj4gSW4gdGhp
cyBzZXJpZXMgSSdtIHNlbmRpbmcgdHdvIHBhdGNoZXMgd2hpY2ggYWRkIHN1cHBvcnQgZm9yIHRo
ZSBvbGRlcgo+Pj4+IFNvQ3MuCj4+Pj4KPj4+PiBVbmZvcnR1bmF0ZWx5IHRoZXNlIHBhdGNoZXMg
YXJlIGN1cnJlbnRseSBub3Qgd29ya2luZyBmb3IgbWUgKGhlbmNlIHRoZQo+Pj4+ICJSRkMiIHBy
ZWZpeCkuIEkgZ2V0IGEgKHN0cmFuZ2UpIGNyYXNoIHdoaWNoIGlzIHRyaWdnZXJlZCBieSB0aGUK
Pj4+PiBremFsbG9jKCkgaW4gbWVzb25fbmZjX3JlYWRfYnVmKCkgLSBzZWUgYmVsb3cgZm9yIG1v
cmUgZGV0YWlscy4KPj4+Pgo+Pj4+IENhbiB5b3UgcGxlYXNlIGhlbHAgbWUgb24gdGhpcyBvbmU/
IEknZCBsaWtlIHRvIGtub3cgd2hldGhlcjoKPj4+PiAtIHRoZSBtZXNvbi1uYW5kIGRyaXZlciB3
b3JrcyBmb3IgeW91IG9uIEdYTCBvciBBWEcgb24gbGludXgtbmV4dD8KPj4+PiAgICAgKEkgd2Fz
IHJ1bm5pbmcgdGhlc2UgcGF0Y2hlcyBvbiB0b3Agb2YgbmV4dC0yMDE5MDMwMSBvbiBteSBNOFMK
Pj4+PiAgICAgYm9hcmQgd2hpY2ggdXNlcyBhIDMyLWJpdCBNZXNvbjhtMiBTb0MuIEkgZG9uJ3Qg
aGF2ZSBhbnkgYm9hcmQgdXNpbmcKPj4+PiAgICAgYSBHWEwgU29DIHdoaWNoIGFsc28gaGFzIE5B
TkQpCj4+PiBZZXMsIGl0IHdvcmtzIG9uIEFYRyBwbGF0Zm9ybSB1c2luZyBhIE1YSUMgc2xjIG5h
bmQgZmxhc2goTVgzMExGNEcpOyBidXQKPj4+IGkgYW4gbm90IHN1cmUgaXQgcnVucyB0aGUgc2Ft
ZSBmbG93IHdpdGggeW91cnMuIGJlY2F1c2UgaSBzZWUgdGhlIHByaW50Cj4+PiAiQ291bmxkIG5v
dCBmaW5kIGEgdmFsaWQgT05GSSBwYXJhbWV0ZXIgcGFnZSwgLi4uLiIgaW4geW91cnMuIGkgd2ls
bCB0cnkKPj4+IHRvIHJlcHJvZHVjZSBpdCBvbiBBWEcoaSBkb24ndCBoYXZlIGEgTTggcGxhdGZv
cm0gbm93KS4KPj4gSSdtIGxvb2tpbmcgZm9yd2FyZCB0byBoZWFyIGFib3V0IHRoZSB0ZXN0IHJl
c3VsdHMgb24geW91ciBBWEcgYm9hcmRzCj4+IGZvciByZWZlcmVuY2U6IG15IGJvYXJkIGhhcyBh
IFNLIEh5bml4IEgyN1VDRzhUMkIgKElEIGJ5dGVzOiAweGFkIDB4ZGUKPj4gMHg5NCAweGViIDB4
NzQgMHg0NCwgMjBubSBNTEMpCj4+IEkgaGF2ZSBhbm90aGVyIGJvYXJkICh3aGVyZSBJIGhhdmVu
J3QgdGVzdGVkIHRoZSBORkMgZHJpdmVyIHlldCkgd2l0aAo+PiBhIFNLIEh5bml4IEgyN1VDRzhU
MkUgKElEIGJ5dGVzOiAweGFkIDB4ZGUgMHgxNCAweGE3IDB4NDIgMHg0YSwgMVlubQo+PiBNTEMp
LiBpZiBpdCBoZWxwcyB3aXRoIHlvdXIgYW5hbHlzaXMgSSBjYW4gdGVzdCBvbiB0aGF0IGJvYXJk
IGFzIHdlbGwKPiAKPiBMaWFuZywgeW91IGp1c3QgaGF2ZSB0byBmYWtlIHRoZSBvdXRwdXQgb2Yg
dGhlIE9ORkkgcGFnZSBkZXRlY3Rpb24gYW5kCj4geW91IHdpbGwgcHJvYmFibHkgcnVuIGludG8g
dGhpcyBlcnJvciB3aGljaCB3aWxsIHRoZW4gYmUgZWFzeSB0bwo+IHJlcHJvZHVjZS4KPgoKSSBo
YXZlIHRlc3RlZCBpdCBvbiBBWEcgcGxhdGZvcm07IEkgZmluZCBNWDMwTEY0RyBhbHNvIGVudGVy
IHRoaXMgZmxvdyAsIApidXQgaXQgZG9lc24ndCBjcmFzaC4gbG9nIGFzIGZvbGxvdzoKWyAgICAx
LjAxODA1Nl0gQ291bGQgbm90IGZpbmQgYSB2YWxpZCBPTkZJIHBhcmFtZXRlciBwYWdlLCB0cnlp
bmcgCmJpdC13aXNlIG1ham9yaXR5IHRvIHJlY292ZXIgaXQKWyAgICAxLjAyMTA1N10gT05GSSBw
YXJhbWV0ZXIgcmVjb3ZlcnkgZmFpbGVkLCBhYm9ydGluZwpbICAgIDEuMDI1OTY2XSBuYW5kOiBk
ZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHhjMiwgQ2hpcCBJRDogMHhkYwpbICAgIDEu
MDMyMjM3XSBuYW5kOiBNYWNyb25peCBOQU5EIDUxMk1pQiAzLDNWIDgtYml0ClsgICAgMS4wMzY4
ODldIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAy
MDQ4LCAKT09CIHNpemU6IDY0ClsgICAgMS4wNDU3NDFdIEJhZCBibG9jayB0YWJsZSBub3QgZm91
bmQgZm9yIGNoaXAgMApbICAgIDEuMDUwMDc3XSBCYWQgYmxvY2sgdGFibGUgbm90IGZvdW5kIGZv
ciBjaGlwIDAKWyAgICAxLjA1MzUzOF0gU2Nhbm5pbmcgZGV2aWNlIGZvciBiYWQgYmxvY2tzClsg
ICAgMS4wNjkwOTRdIEJhZCBlcmFzZWJsb2NrIDIwIGF0IDB4MDAwMDAwMjgwMDAwClsgICAgMS4w
NzEwNzRdIEJhZCBlcmFzZWJsb2NrIDI0IGF0IDB4MDAwMDAwMzAwMDAwClsgICAgMS4xMjc0OTRd
IHJhbmRvbTogZmFzdCBpbml0IGRvbmUKWyAgICAxLjM0ODc1NF0gQmFkIGVyYXNlYmxvY2sgNTE5
IGF0IDB4MDAwMDA0MGUwMDAwClsgICAgMS42MzI4MTldIEJhZCBlcmFzZWJsb2NrIDEwMjggYXQg
MHgwMDAwMDgwODAwMDAKWyAgICAyLjQwNTQyMF0gQmFkIGVyYXNlYmxvY2sgMjQxMSBhdCAweDAw
MDAxMmQ2MDAwMApbICAgIDMuMzQ5Mjc2XSBCYWQgYmxvY2sgdGFibGUgd3JpdHRlbiB0byAweDAw
MDAxZmZlMDAwMCwgdmVyc2lvbiAweDAxClsgICAgMy4zNTA5NjddIEJhZCBibG9jayB0YWJsZSB3
cml0dGVuIHRvIDB4MDAwMDFmZmMwMDAwLCB2ZXJzaW9uIDB4MDEKWyAgICAzLjM1NjQyOV0gNSBm
aXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSAKZmZlMDc4MDAu
bmZjClsgICAgMy4zNjI5MjVdIENyZWF0aW5nIDUgTVREIHBhcnRpdGlvbnMgb24gImZmZTA3ODAw
Lm5mYyI6ClsgICAgMy4zNjgxODhdIDB4MDAwMDAwMDAwMDAwLTB4MDAwMDAwMjAwMDAwIDogImJv
b3QiClsgICAgMy4zNzM5NzBdIDB4MDAwMDAwMjAwMDAwLTB4MDAwMDAwNjAwMDAwIDogImVudiIK
WyAgICAzLjM3ODU2NF0gMHgwMDAwMDA2MDAwMDAtMHgwMDAwMDEwMDAwMDAgOiAic3lzdGVtIgpb
ICAgIDMuMzgzNTExXSAweDAwMDAwMTAwMDAwMC0weDAwMDAwNDAwMDAwMCA6ICJyb290ZnMiClsg
ICAgMy4zODg1MjVdIDB4MDAwMDA0MDAwMDAwLTB4MDAwMDBjMDAwMDAwIDogIm1lZGlhIgoKSSBh
bSBsb29raW5nIGZvcndhcmQgdG8gYSBIeW5peCBuYW5kIGZsYXNoIHRvIHRlc3Qgb24gR1hMIHBs
YXRmb3JtLCBhbmQgCnRoZXJlIHNob3VsZCBiZSBzb21ldGhpbmcgZGlmZmVyZW50IGZyb20gTVhJ
QyBmbGFzaCBvbiBPTkZJIHBhZ2UgCmRldGVjdGlvbi4gSSB3aWxsIHVwZGF0ZSB0aGUgcmVzdWx0
IGFzYXAgbmV0IHdlZWsuCkRvIHlvdSBoYXZlIGFub3RoZXIgdHlwZSBvZiBuYW5kIGZsYXNoIHRv
IHRlc3Qgb24gTTggcGxhdGZvcm0gPwo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gLgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
