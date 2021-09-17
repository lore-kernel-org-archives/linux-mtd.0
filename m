Return-Path: <SRS0=wNtg=OH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFA8C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Sep 2021 17:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1121460EC0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Sep 2021 17:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1121460EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQBlaizKyZ9xEjeH81ZIXzQOkD6MBNhx9VeybVLuDCo=; b=ftwBVzJXYS38Vw
	8CjybZovbhEMIKWYeqll3FU8jVUSZjVM9DBmkPTWYfqAUhzk0zs7H6cO7TAjvpz3TItRtrLGVS7Yy
	b2N455HiOhHM+phRNtECz+RM4Oxpz0g0RgWnn2kgFenOCIV0fqmQehBqXV6tuFILeuY1pkR9RorFS
	PWJ9ctRQTsj0LIvVPfFtPRGvpHQp49hsR/d8ajpuAuM5k3tJF/7w4QlvaDBMiPXFvlpgglgcuOGAv
	hQUKkHc83wALOuC2bhya65FlnioiU/QwHilt6b8JllOi0vqs78N0MjKHtpyWKJUFKofQvf0JfGCl8
	1NaDq2OzfF7GAR7f49Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRHFW-00Ehai-NU; Fri, 17 Sep 2021 17:02:06 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRHFS-00EhZh-OU
 for linux-mtd@lists.infradead.org; Fri, 17 Sep 2021 17:02:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B0AE740006;
 Fri, 17 Sep 2021 17:01:55 +0000 (UTC)
Date: Fri, 17 Sep 2021 19:01:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jan Hoffmann <jan@3e8.eu>
Cc: Daniel Kestrel <kestrelseventyfour@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210917190154.76203a9a@xps13>
In-Reply-To: <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu>
References: <20210808072643.GA5084@ubuntu>
 <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_100202_979342_864FB5EB 
X-CRM114-Status: GOOD (  26.65  )
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

SGkgSmFuLAoKamFuQDNlOC5ldSB3cm90ZSBvbiBUaHUsIDE2IFNlcCAyMDIxIDIxOjM4OjI2ICsw
MjAwOgoKPiBIZWxsbywKPiAKPiBDb25maWd1cmF0aW9uIG9mIHRoZSBFQ0MgZW5naW5lIHR5cGUg
dXNpbmcgZGV2aWNlIHRyZWUgaGFzIGFjdHVhbGx5Cj4gd29ya2VkIGJlZm9yZS4gSSBhbSB1c2lu
ZyBPcGVuV3J0IG9uIGEgRnJpdHpib3ggNzM2MiBTTCwgd2hpY2ggaGFzIGEKPiBNaWNyb24gMjlG
MUcwOEFCQURBIGZsYXNoIGNoaXAuIFRoZSBib290bG9hZGVyIG9mIHRoZSBkZXZpY2UgdXNlcyBv
bi1kaWUKPiBFQ0MsIHNvIHRoYXQgaGFzIHRvIGJlIHVzZWQgZm9yIExpbnV4IGFzIHdlbGwuIEl0
IGlzIGNvbmZpZ3VyZWQgaW4gRFRTCj4gdXNpbmcgIm5hbmQtZWNjLW1vZGUgPSAib24tZGllIjsi
LiBUaGlzIHdvcmtlZCBmaW5lIHdpdGgga2VybmVsIDUuNC4KPiBIb3dldmVyLCBhZnRlciBzd2l0
Y2hpbmcgdG8ga2VybmVsIDUuMTAgaXQgaXMgaWdub3JlZCBhbmQgc29mdHdhcmUgRUNDCj4gaXMg
dXNlZCBpbnN0ZWFkLgo+IAo+IElmIEkgdW5kZXJzdGFuZCB0aGlzIGNvcnJlY3RseSwgdGhlIHNp
dHVhdGlvbiBpcyBhcyBmb2xsb3dzOgo+IAo+IE9yaWdpbmFsbHksIHh3YXktbmFuZCBkaWQgc2V0
IGRlZmF1bHRzIGZvciBFQ0MgbW9kZSBhbmQgYWxnb3JpdGhtLCBidXQKPiBkaWZmZXJlbnQgdmFs
dWVzIGNvdWxkIGJlIGNvbmZpZ3VyZWQgdXNpbmcgZGV2aWNlIHRyZWUuCj4gCj4gQ29tbWl0IGQ3
MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3JrIHVzZXIgaW5w
dXQKPiBwYXJzaW5nIGJpdHMiKSBicm9rZSB0aGVzZSBkZWZhdWx0IHZhbHVlcywgYXMgdGhlIEVD
QyBhbGdvcml0aG0gaXMgbm93Cj4gdW5jb25kaXRpb25hbGx5IHNldCBmcm9tIHRoZSB1c2VyIGNv
bmZpZ3VyYXRpb24gaW4gcmF3bmFuZF9kdF9pbml0Lgo+IFByZXZpb3VzbHksIHRoZSBkZWZhdWx0
IHZhbHVlIHdhcyBvbmx5IG92ZXJ3cml0dGVuIGlmIHRoZSBkZXZpY2UgdHJlZQo+IGFjdHVhbGx5
IGNvbnRhaW5lZCBhIHZhbHVlLgo+IAo+IFRoaXMgaXMgZml4ZWQgaW4gZDUyNTkxNGI1YmQ4ICgi
bXRkOiByYXduYW5kOiB4d2F5OiBNb3ZlIHRoZSBFQ0MKPiBpbml0aWFsaXphdGlvbiB0byAtPmF0
dGFjaF9jaGlwKCkiKS4gSG93ZXZlciwgdGhpcyBtYWtlcyBpdCBpbXBvc3NpYmxlCj4gdG8gY29u
ZmlndXJlIHRoZSBFQ0MgZW5naW5lIHR5cGUgaW4gdGhlIGRldmljZSB0cmVlLCBhcyBpdCBpcyBu
b3cKPiBvdmVyd3JpdHRlbiBieSB0aGUgZGVmYXVsdCB2YWx1ZSBpbiB4d2F5X2F0dGFjaF9jaGlw
Lgo+IAo+IEkgYW0gbm90IHN1cmUgaWYgdGhpcyBwYXRjaCBpcyB0aGUgYmVzdCBhcHByb2FjaCBm
b3IgZml4aW5nIHRoaXMsIGFzIGl0Cj4gd291bGQgYWdhaW4gY2F1c2UgYnJlYWthZ2UgZm9yIGFu
eW9uZSB3aG8gcmVsaWVzIG9uIHRoZSBleGlzdGluZwo+IGRlZmF1bHQgdmFsdWUuIEFuZCB0aGlz
IGtpbmQgb2YgYnJlYWthZ2Ugc2VlbXMgdG8gaGF2ZSBiZWVuIHRoZSByZWFzb24KPiBmb3IgbW92
aW5nIHRoZSBkZWZhdWx0IHZhbHVlcyB0byBhdHRhY2hfY2hpcCBpbiB0aGUgZmlyc3QgcGxhY2Ug
KHNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDExMDUwODQ5MzkuNzJlYTZi
ZmRAeHBzMTMvICkuCj4gCj4gQXMgc2ltaWxhciBjaGFuZ2VzIHdlcmUgYXBwbGllZCB0byBvdGhl
ciBOQU5EIGRyaXZlcnMsIHRoZSBzYW1lIGlzc3VlCj4gcHJvYmFibHkgYWxzbyBleGlzdHMgdGhl
cmUuIE1heWJlIGl0IG1ha2VzIHNlbnNlIHRvIGFkZCBhIHByb3BlciBmaXgKPiBmb3IgYWxsIG9m
IHRoZW0/CgpJIGFtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgeW91ciBtZXNzYWdlIGFzIGFuc3dl
ciB0byB0aGlzIHRocmVhZC4KVGhlcmUgYXJlIHR3byBwcm9ibGVtcyBoZXJlOgoxLyBUaGUgRFQg
dmFsdWVzIG5vdCBiZWluZyB0YWtlbiBpbnRvIGFjY291bnQKMi8gS2VzdHJlbCdzIGlzc3VlIHdp
dGggdHdvIGRpZmZlcmVudCBpbnRlZ3JhdGlvbnMgd2l0aCBubyB3YXkgdG8KZGlzdGluZ3Vpc2gg
YmV0d2VlbiB0aGVtLgoKMS8gSGFzIGFscmVhZHkgYmVlbiBmaXhlZCAoYXQgbGVhc3QgdGhhdCBp
cyB3aGF0IEkgdGhpbmspCjIvIENhbm5vdCBlYXNpbHkgYmUgZml4ZWQgYW5kIEkgZG9uJ3QgdGhp
bmsgdGhlcmUgaXMgYW55dGhpbmcgd2UgY2FuIGRvCmJlc2lkZXMgdGhlIG1hbnVmYWN0dXJlciAi
Zml4aW5nIiB0aGUgYm9hcmQgZGVzY3JpcHRpb24uCgpBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
