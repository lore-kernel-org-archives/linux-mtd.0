Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16C2C48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 14:19:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8363F611B0
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 14:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8363F611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYDCvnqXerR/2kfFLMcXgSrd6Til09vYMuQ9ngcG0Dk=; b=IbsjkCdCxxe+/y44u8T0wQh6da
	S8gbaserLDrJjSMmbYqWlFrmvzUO3mLbYUT4Saj2Y6XWSC/B75vXHxjPePq3HfAN/vBn8Hiuk02Ts
	t17Fqb+VbVfZjpX/CegnLqH0bHHhCGiRDcMHSKiP6pMptzM6aFHEYPXF6sBfXINJ88luGn9IF0+AU
	u4CkBVENI/UuwA2V+ifkBVSp5F9yQVdxibKPeJyEG7nnJqjnST/nXB4vGlSIlUVNL21u6pfJNeiyw
	EHChMcO4undAFwqjI62C3BNIbwWqNk2l4hhsbj9IUgDbXk7GXIZkydkMn0jFpqXa3JvlvhXKQxUbe
	jeYc3mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luFKK-00ES8j-H0; Fri, 18 Jun 2021 14:18:32 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luFKB-00ES6g-UP
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 14:18:26 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G61HG470rzB9GG;
 Fri, 18 Jun 2021 16:18:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qj7Pqh5zTfg8; Fri, 18 Jun 2021 16:18:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G61HG3C6mzB9HT;
 Fri, 18 Jun 2021 16:18:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 372638B840;
 Fri, 18 Jun 2021 16:18:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id u2Kos_8Jq7vy; Fri, 18 Jun 2021 16:18:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 726408B849;
 Fri, 18 Jun 2021 16:18:17 +0200 (CEST)
Subject: Re: nand: WARNING: a0000000.nand: the ECC used on your system
 (1b/256B) is too weak compared to the one required by the NAND chip (4b/512B)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
References: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
 <20210618084326.0a074fb7@xps13>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d37a8a7e-6181-9642-18fb-470d1d8cf006@csgroup.eu>
Date: Fri, 18 Jun 2021 16:18:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618084326.0a074fb7@xps13>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_071824_187017_3014D802 
X-CRM114-Status: GOOD (  25.87  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpMZSAxOC8wNi8yMDIxIMOgIDA4OjQzLCBNaXF1ZWwgUmF5bmFsIGEgw6ljcml0wqA6Cj4gSGkg
Q2hyaXN0b3BoZSwKPiAKPiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+IHdyb3RlIG9uIFRodSwgMTcgSnVuCj4gMjAyMSAxOToxNzowNSArMDIwMDoKPiAKPj4g
SGVsbG8gTWlxdWVsLAo+Pgo+PiBJIGhhdmUgYSBib2FyZCBydW5uaW5nIGxhdGVzdCBrZXJuZWwg
d2l0aCB0aGUgZm9sbG93aW5nIE5BTkQ6Cj4+Cj4+IFsgICAgMS41MjMwNzZdIG5hbmQ6IGRldmlj
ZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweDJjLCBDaGlwIElEOiAweGRhCj4+IFsgICAgMS41
Mjk1MDVdIG5hbmQ6IE1pY3JvbiBNVDI5RjJHMDhBQkFFQVdQCj4+IFsgICAgMS41MzM1MjZdIG5h
bmQ6IDI1NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBP
T0Igc2l6Cj4+IGU6IDY0Cj4+IFsgICAgMS41NDExOTZdIG5hbmQ6IFdBUk5JTkc6IGEwMDAwMDAw
Lm5hbmQ6IHRoZSBFQ0MgdXNlZCBvbiB5b3VyIHN5c3RlbSAoMWIvMjU2Cj4+IEIpIGlzIHRvbyB3
ZWFrIGNvbXBhcmVkIHRvIHRoZSBvbmUgcmVxdWlyZWQgYnkgdGhlIE5BTkQgY2hpcCAoNGIvNTEy
QikKPj4KPj4gVW50aWwgbm93IEkgd2FzIHVzaW5nIGtlcm5lbCA0LjE0IGFuZCBJIHdhcyBoYXZp
bmcgbm8gcHJvYmxlbSwgYWxsdGhvdWdoIGl0IHdhcyBhbHNvIGV4aGliaXRpbmcgdGhlIGZvbGxv
d2luZyAobGVzcyBkZXRhaWxlZCkgd2FybmluZwo+IAo+IFllcywgSSBkZWNpZGVkIHRvIGdpdmUg
bW9yZSBpbmZvIG9mIHdoYXQgaXMgdGhlIG1pbmltdW0gRUNDIHNjaGVtZSB0aGF0Cj4gc2hvdWxk
IGJlIHVzZWQgYW5kIHdoYXQgaXMgdGhlIG9uZSBiZWluZyBhcHBsaWVkLgoKWWVzIGl0IHdhcyBh
IGdvb2QgaWRlYS4KCj4gCj4+IFsgICAgMC41OTEwMDldIG5hbmQ6IFdBUk5JTkc6IGEwMDAwMDAw
Lm5hbmQ6IHRoZSBFQ0MgdXNlZCBvbiB5b3VyIHN5c3RlbSBpcyB0b28gd2VhayBjb21wYXJlZCB0
byB0aGUgb25lIHJlcXVpcmVkIGJ5IHRoZSBOQU5EIGNoaXAKPj4KPj4gTm93IGFuZCB0aGVuIEkn
bSB1c2luZyBvbmUgb2YgdGhlIGxhdGVzdCBrZXJuZWxzIChUb2RheSBpcyA1LjEzLXJjNiksIGFu
ZCBzb21ldGltZSBpbiBvbmUgb2YgdGhlIDUueCByZWxlYXNlcywgSSBzdGFydGVkIHRvIGdldCBl
cnJvcnMgbGlrZToKPj4KPj4gWyAgICA1LjA5ODI2NV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDog
dW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPj4gWyAgICA1LjEwMzg1OV0gdWJpMCB3YXJuaW5nOiB1
YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjAKPj4gICAg
Ynl0ZXMgZnJvbSBQRUIgOTk6NTk4MjQsIHJlYWQgb25seSA2MCBieXRlcywgcmV0cnkKPj4gWyAg
ICA1LjUyNTg0M10gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJy
b3IKPj4gWyAgICA1LjUzMTU3MV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJs
ZSBFQ0MgZXJyb3IKPj4gWyAgICA1LjUzNzQ5MF0gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDog
ZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgMzAKPj4gNzMgYnl0ZXMgZnJvbSBQ
RUIgMTA3OjEwODk3NiwgcmVhZCBvbmx5IDMwNzMgYnl0ZXMsIHJldHJ5Cj4+IFsgICAgNS42OTEx
MjFdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4+IFsg
ICAgNS42OTY3MDldIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVy
cm9yCj4+IFsgICAgNS43MDI0MjZdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFi
bGUgRUNDIGVycm9yCj4+IFsgICAgNS43MDgxNDFdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVu
Y29ycmVjdGFibGUgRUNDIGVycm9yCj4+IFsgICAgNS43MTQxMDNdIHViaTAgd2FybmluZzogdWJp
X2lvX3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDMwCj4+IDM1IGJ5
dGVzIGZyb20gUEVCIDEwNzoyNTE0NCwgcmVhZCBvbmx5IDMwMzUgYnl0ZXMsIHJldHJ5Cj4+IFsg
ICAyMC41MjM2ODldIHJhbmRvbTogY3JuZyBpbml0IGRvbmUKPj4gWyAgIDIxLjg5MjEzMF0gZWNj
X3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPj4gWyAgIDIxLjg5
NzczMF0gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdo
aWxlIHJlYWRpbmcgMTMKPj4gOTQgYnl0ZXMgZnJvbSBQRUIgMTE2Ojc1Nzc2LCByZWFkIG9ubHkg
MTM5NCBieXRlcywgcmV0cnkKPj4KPj4gTW9zdCBvZiB0aGUgdGltZSwgd2hlbiB0aGUgcmVhZGlu
ZyBvZiB0aGUgZmlsZSBmYWlscywgSSBqdXN0IGhhdmUgdG8gcmVhZCBpdCBvbmNlIG1vcmUgYW5k
IGl0IGdldHMgcmVhZCB3aXRob3V0IHRoYXQgZXJyb3IuCj4gCj4gSXQgcmVhbGx5IGxvb2tzIGxp
a2UgYSByZWd1bGFyIGJpdGZsaXAgaGFwcGVuaW5nICJzb21ldGltZXMiLiBJcyB0aGlzIGEKPiBi
b2FyZCB3aGljaCBhbHJlYWR5IGhhZCBhIGxpZmU/IFdoYXQgYXJlIHRoZSB1c2FnZSBjb3VudGVy
cyAoVUJJIHNob3VsZAo+IHRlbGwgeW91IHRoaXMpIGNvbXBhcmVkIHRvIHRoZSBvZmZpY2lhbCBl
bmR1cmFuY2Ugb2YgeW91ciBjaGlwIChzZWUgdGhlCj4gZGF0YXNoZWV0KT8KClRoZSBib2FyZCBo
YWQgYSBwZWFjZWZ1bGwgbGlmZToKClVCSSByZXBvcnRzICJ1YmkwOiBtYXgvbWVhbiBlcmFzZSBj
b3VudGVyOiA0OS8yMCwgV0wgdGhyZXNob2xkOiA0MDk2IgoKSSBoYXZlIHRyaWVkIHdpdGggaGFs
ZiBhIGRvemVuIG9mIGJvYXJkcyBhbmQgYWxsIGhhdmUgdGhlIGlzc3VlLgoKPiAKPj4gV2hhdCBh
bSBJIHN1cHBvc2VkIHRvIGRvIHRvIGF2b2lkIHRoZSBFQ0Mgd2Vha25lc3Mgd2FybmluZyBhdCBz
dGFydHVwIGFuZCB0byBmaXggdGhhdCBFQ0MgZXJyb3IgaXNzdWUgPwo+IAo+IEkgaG9uZXN0bHkg
ZG9uJ3QgdGhpbmsgdGhlIGVycm9ycyBjb21lIGZyb20gdGhlIDUuMXgga2VybmVscyBnaXZlbiB0
aGUKPiBhYm92ZSBsb2dzLiBJZiB5b3UgZmxhc2ggYmFjayB5b3VyIG9sZCA0LjE0IEkgYW0gcHJl
dHR5IHN1cmUgeW91J2xsCj4gaGF2ZSB0aGUgc2FtZSBlcnJvcnMgYXQgc29tZSBwb2ludC4KCkkg
ZG9uJ3QgaGF2ZSBhbnkgcHJvYmxlbSBsaWtlIHRoYXQgd2l0aCA0LjE0IHdpdGggYW55IG9mIHRo
ZSBib2FyZC4KCldoZW4gYm9vdGluZyBhIDQuMTQga2VybmVsIEkgZG9uJ3QgZ2V0IGFueSBwcm9i
bGVtIG9uIHRoZSBzYW1lIGJvYXJkLgoKPiAKPiBOQU5EIHJlYWxseSBpcyBhIGZyYWdpbGUgc3Rv
cmFnZSBtZWRpdW0sIG5vdCBmb2xsb3dpbmcgaW4gYSBwcm9kdWN0aW9uCj4gZW52aXJvbm1lbnQg
dGhlIG1pbmltdW0gRUNDIHNjaGVtZSAodGhlcmUgaXMgYSByZWFsIGRpZmZlcmVuY2UgYmV0d2Vl
bgo+IDEvMjU2IHZzIDQvNTEyKSByZWFsbHkgbGVhZHMgdG8gY29tcGxpY2F0ZWQgc29sdXRpb25z
IGxpa2UgdGhpcyBvbmUsCj4gdW5mb3J0dW5hdGVseS4uLgoKSSBzZWUga2VybmVsIGhhcyAiU29m
dHdhcmUgQkNIIEVDQyIuIFNob3VsZCBJIHVzZSB0aGF0IHdpdGggdGhhdCBjaGlwID8KCklmIHll
cywgaG93IGRvIEkgdXNlIGl0ID8gU2VlbXMgbGlrZSBzZWxlY3RpbmcgdGhlIG9wdGlvbiBhdCBL
ZXJuZWwgYnVpbGQgaXMgbm90IGVub3VnaCwgZG8gSSBoYXZlIAp0byBjb25maWd1cmUgc29tZXRo
aW5nIHNvbWV3aGVyZSwgZm9yIGluc3RhbmNlIGluIHRoZSBkZXZpY2UgdHJlZSA/IEF0IHRoZSB0
aW1lIGJlaW5nIEkgaGF2ZSB0aGUgCmZvbGxvd2luZyBpbiB0aGUgZGV2aWNlIHRyZWU6CgoJCW5h
bmRAMiwwIHsKCQkJY29tcGF0aWJsZSA9ICJncGlvLWNvbnRyb2wtbmFuZCI7CgkJCXJlZyA9IDwy
IDB4MDAwMCAweDE+OwoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3NpemUtY2VsbHMgPSA8
MT47CgkJCXJkeS1ncGlvID0gPCZjcGxkX2V0YXQgMTMgMD47CS8qIFJEWSAqLwoJCQluY2UtZ3Bp
byA9IDwmQ1BNMV9QSU9fRCAxNSAwPjsJLyogbkNFICovCgkJCWFsZS1ncGlvID0gPCZDUE0xX1BJ
T19EIDEzIDA+OwkvKiBBTEUgKi8KCQkJY2xlLWdwaW8gPSA8JkNQTTFfUElPX0QgMTIgMD47CS8q
IENMRSAqLwoJCX07CgoKVGhhbmtzCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
