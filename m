Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C31CF6499
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrrMD6RNibyLvCdC4uKBdqP9a+O7bv4ojyv5U8izx8U=; b=1labcBbuRPRFQT
	FwHhmRSfzBmLKXyaEaBZ22szDCGQdQ860vIyIeihc4PIhy4bX3PZnTa+3vBI0NFzoJxXIc4qR93u3
	JgydcpIt5xIjWC+l1Bq53kEIFOTeDw+3ULFm5QSNO6Lwv+W3m4x3Kmf+uhHxFOy2aZWK4ZSlRN6ea
	5BgonqkzfmtxtcgHCZsY8lA+09sj4Tb6ozYsOMsGOk5aMMSbF9jetF6LATr3vAtrChI8TUHCo7FE+
	HfTlhmsGh6Evbg1r4Ff3VJ37RFSUAdltNMGd0pJ80u74Umk84wV7eaaXszC3LAUMoyUKiyZBumFda
	YRdXzF5m7JsjsaImbQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1susrV-0000000EjL5-1DGT;
	Sun, 29 Sep 2024 12:17:17 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1susrS-0000000EjKY-0fCP
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 12:17:15 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_128_GCM_SHA256:128)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1susrI-000000007Nu-0u24;
	Sun, 29 Sep 2024 12:17:04 +0000
Date: Sun, 29 Sep 2024 12:16:58 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, John Crispin <john@phrozen.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_1/2=5D_dt-bindings=3A_mtd=3A_ubi?=
 =?US-ASCII?Q?-volume=3A_add_=27volume-is-critical=27_property?=
User-Agent: K-9 Mail for Android
In-Reply-To: <3fbc4221-5967-fb9a-3cee-91cd5de2b805@huawei.com>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org> <7a2e8819-ac70-4070-a731-53994c72cd79@kernel.org> <Zvf_84xxhxwpPgee@makrotopia.org> <18e9d774-813b-427e-9938-53853d695e18@kernel.org> <ZvgU0eBEwTJ3sHuN@makrotopia.org> <ad5a3811-c856-4f4b-f569-bb67a0e3f751@huawei.com> <Zvkxi-6J8R1K95PQ@makrotopia.org> <3fbc4221-5967-fb9a-3cee-91cd5de2b805@huawei.com>
Message-ID: <5FEB28F8-BE2B-4C97-848C-914CA760BF7F@makrotopia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_051714_224273_D3DB7817 
X-CRM114-Status: GOOD (  16.67  )
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

CgpPbiAyOSBTZXB0ZW1iZXIgMjAyNCAxMToyMzoxMiBVVEMsIFpoaWhhbyBDaGVuZyA8Y2hlbmd6
aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+5ZyoIDIwMjQvOS8yOSAxODo1MiwgRGFuaWVsIEdv
bGxlIOWGmemBkzoKPj4gT24gU3VuLCBTZXAgMjksIDIwMjQgYXQgMTI6MDM6MTFQTSArMDgwMCwg
WmhpaGFvIENoZW5nIHdyb3RlOgo+Pj4g5ZyoIDIwMjQvOS8yOCAyMjozOCwgRGFuaWVsIEdvbGxl
IOWGmemBkzoKPj4+PiBPbiBTYXQsIFNlcCAyOCwgMjAyNCBhdCAwMzo0NTo0OVBNICswMjAwLCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+IFsuLi5dCj4+Pj4gVGhlIGNhc2UgSSB3YW50
IHRvIGNvdmVyIGhlcmUgaXMgdGhlIGJvb3Rsb2FkZXIgaXRzZWxmIGJlaW5nIHN0b3JlZAo+Pj4+
IGluc2lkZSBhIFVCSSB2b2x1bWUuIE1lZGlhVGVrJ3MgZm9yayBvZiBBUk0gVHJ1c3RlZEZpcm13
YXJlLUEgYmwyIGNvbWVzCj4+Pj4gd2l0aCBzdXBwb3J0IGZvciBVQkkgYW5kIGxvYWRzIEJMMyAo
d2hpY2ggaXMgVEYtQSBCTDMxIGFuZCBVLUJvb3QsIGFuZAo+Pj4+IG1heWJlIE9QLVRFRSBhcyB3
ZWxsKSBmcm9tIGEgc3RhdGljIFVCSSB2b2x1bWUuIFJlbW92aW5nLCByZW5hbWluZyBvcgo+Pj4+
IGFsdGVyaW5nIHRoYXQgdm9sdW1lIHJlc3VsdHMgaW4gdGhlIGRldmljZSBub3QgYmVpbmcgYWJs
ZSB0byBib290IGFueQo+Pj4+IG1vcmUgYW5kIHJlcXVpcmluZyBhIGNvbXBsaWNhdGVkIGludGVy
dmVudGlvbiAoYXQgYXR0YWNoaW5nIGRlYnVnZ2luZwo+Pj4+IFVBUlQgYW5kIHVzaW5nIGxvdy1s
ZXZlbCByZWNvdmVyeSB0b29sKSBpbiBvcmRlciB0byByZWNvdmVyLgo+Pj4gCj4+PiBXaG8gcmVt
b3Zlcy9yZW5hbWVzIHRoZSAnY3JpdGljYWwnIHZvbHVtZT8gSSBzdWdnZXN0IHRvIGZpeCBpdCBp
biB0aGUgdXBwZXIKPj4+IGxheWVyKG5vdCBpbiBrZXJuZWwpLiBBZnRlciBsb29raW5nIHRocm91
Z2ggdGhlIHBhdGNoIDIsIGl0IHNlZW1zIGEgaGFjawo+Pj4gc29sdXRpb24uCj4+IAo+PiBUaGUg
ZW5lbXkgaXMgdGhlIHVzZXIsIHRoZSB1cHBlciBsYXllciBpcyBiZXR3ZWVuIHRoZSBrZXlib2Fy
ZCBhbmQgdGhlCj4+IHNjcmVlbi4gSnVzdCBsaWtlIGZvciAncmVhZC1vbmx5JyBNVEQgcGFydGl0
aW9ucyBJJ20gbG9va2luZwo+PiBmb3IgYSBzaW1pbGFyIHNvbHV0aW9uIGZvciBVQkkgd2hpY2gg
cHJldmVudHMgdGhlIHVzZXIgZnJvbSBhY2NpZGVudGFsbHkKPj4gZGVsZXRpbmcgb3IgZGVzdHJv
eWluZyB0aGUgYm9vdGxvYWRlciwgbGV0cyBzYXksIHdoZW4gbG9nZ2VkIGluIHZpYSBTU0guCj4+
IC4KPj4gCj4KPkkgZ3Vlc3MgdGhhdCBvdGhlciBwYXJ0aXRpb25zKGV4Y2VwdHMgbXRkKSBoYXZl
IHRoZSBzaW1pbGFyIHNpdHVhdGlvbnMsIHVzZXJzIGNvdWxkIGRlbGV0ZSBhIHJvb3RmcyhleHQ0
KSBwYXJ0aXRpb24gYnkgb3BlcmF0aW9uIHRoZSByYXcgYmxvY2sgZGV2aWNlLiBUaGUga2VybmVs
IGhhcyBubyB3YXkgdG8gc3RvcCB1c2VyIGRvaW5nIHRoaXMsIHdoYXQgaWYgdGhlIHVzZXIganVz
dCB3YW50IHRvIHJlYnVpbGQgcGFydGlvbnM/CgpUcnVlLCBidXQgYXMgeW91IGNvcnJlY3RseSBw
b2ludGVkIG91dCB0aGUgd29yc3QtY2FzZSBzY2VuYXJpbyB3b3VsZCBiZSBMaW51eCBubyBsb25n
ZXIgYm9vdGluZy4gWW91IHdvdWxkIGZpeCB0aGF0IGJ5IHVzaW5nIGEgYm9vdGFibGUgVVNCIHBl
bmRyaXZlLgpIb3dldmVyLCB0aGUgdXNlciB3b250IGVhc2lseSBtYW5hZ2UgdG8gZGVsZXRlIHRo
ZSBib290bG9hZGVyIG9yIEJJT1MgYnkgYWNjaWRlbnQsIHN1Y2ggYXMgYSBzaW1wbGUgdHlwbyBv
ZiB0aGUgcGFydGl0aW9uIG51bWJlciBvciBhY2NpZGVudGFsbHkgZGVzdHJveWluZyBHUFQuIElm
IHRoZSBzdG9yYWdlIG9mIGxvdy1sZXZlbCBib290IGZpcm13YXJlIGlzIGFjY2lzc2libGUgZnJv
bSB3aXRoaW4gTGludXggdGhlbiB0aGVyZSBhcmUgYWx3YXlzIGFkZGl0aW9uYWwgc2FmZWd1YXJk
cywgc3VjaCBhcyB0aGUgd3JpdGUtcHJvdGVjdGlvbiBvZiBtbWNibGtYYm9vdFkgaHctcGFydGl0
aW9uLCBvciBNVEQgcGFydGl0b25zIGhvbGRpbmcgYm9vdGxvYWRlciBjb21wb25lbnRzIGJlaW5n
IG1hcmtlZCBhcyByZWFkLW9ubHkuCgo+TWFya2luZyB2b2x1bWUgYXMgY3JpdGljYWwoYnkgYSBz
dG9wcGVyIGluIGtlcm5lbCkgY291bGQgcHJldmVudCB1c2VyIG1pc3Rha2VubHkgb3BlcmF0aW5n
LCBidXQgSSB0aGluayBpdCBpcyBtb3JlIGltcG9ydGFudCB0aGF0IHVzZXIgbmVlZCB0byBrbm93
IHdoYXQgaGUvc2hlIGlzIGRvaW5nLgoKSSBhZ3JlZSB0aGF0IGVkdWNhdGlvbiBvZiB1c2VycyBp
cyBjcnVjaWFsLCB5ZXQgSSB0aGluayB0aGUgcmlzayBvZiBuZWVkaW5nIGNvbXBsaWNhdGVkIGhh
cmR3YXJlIGludGVydmVudGlvbnMgKGRpcmVjdCBhY2Nlc3MgdG8gTkFORCBmbGFzaCBjaGlwLCBh
dHRhY2hpbmcgSlRBRywgLi4uKSB3aGljaCBhcmUgcmVxdWlyZWQgaW4gb3JkZXIgdG8gcmVjb3Zl
ciBmcm9tIGEgbWlzdGFrZSBzaG91bGQgYWxzbyBiZSB0YWtlbiBpbnRvIGFjY291bnQuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
