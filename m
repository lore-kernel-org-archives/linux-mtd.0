Return-Path: <SRS0=qE3A=UG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8FBC2BCA1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 20:50:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFEBD208C3
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 20:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PeM0nNO4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFEBD208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCjXWG04kYhtTgDj1E2e8ffcle4hhQXKcbMwmNhvNMc=; b=PeM0nNO4o2OVJ7
	vSPRiSq5mjctC2J43UVzXUb/gztpULLs3N7t51Ykvj09QlTzYkD7GpB2Wst1STrbInpPgLocdOfNN
	4Bs1OeWq2O1xnxQz0j+3jUnv/MSxvBVoshEPHskPNN4u8S74UN1SN+pdMuuZeObH2BbL0dAVer26o
	+OoDJI1uQJ0QWoXniXmiWEa6wJd4t0Fi8xs7u19GUlaaMQyODlzMH8TfCT8G//ONTEG9MfQU8cEiz
	IT+wLc78HodO+F8UdtLjHChedY1papKAQze+flnTZ8Yi07HCOj4CokTXhlcR7TLS01EEXDg4BCeBV
	kbZfHRRfdNkQ+s88uH/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZLoE-0006RG-IL; Fri, 07 Jun 2019 20:49:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZLoA-0006Qr-Rf
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2019 20:49:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 88DA9608310F;
 Fri,  7 Jun 2019 22:49:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rHXN-8rB8r0w; Fri,  7 Jun 2019 22:49:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D7FA46074CFD;
 Fri,  7 Jun 2019 22:49:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JNgeMnXRlRNU; Fri,  7 Jun 2019 22:49:52 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id AEF6A608310F;
 Fri,  7 Jun 2019 22:49:52 +0200 (CEST)
Date: Fri, 7 Jun 2019 22:49:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Emil Lenngren <emil.lenngren@gmail.com>
Message-ID: <1342653998.84700.1559940592644.JavaMail.zimbra@nod.at>
In-Reply-To: <CAO1O6scuNXfgtaex_Ty4-5=DmBV43Sg28ntkzNgB5T2KwfXG3g@mail.gmail.com>
References: <20190515210202.21169-1-richard@nod.at>
 <CAO1O6sdU=kAYS2sTKwiagxrbg+fMer9nvbwA9C4LoFMgH7e1dQ@mail.gmail.com>
 <1644731533.84685.1559938164477.JavaMail.zimbra@nod.at>
 <CAO1O6scuNXfgtaex_Ty4-5=DmBV43Sg28ntkzNgB5T2KwfXG3g@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add support for zstd compression.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: ubifs: Add support for zstd compression.
Thread-Index: i0naAnpf5ado1iIuaToqoo7bNUnLng==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_134955_045287_A37D0ABD 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Michele Dionisio <michele.dionisio@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkVtaWwgTGVubmdyZW4iIDxl
bWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4K
PiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgIlNlYmFz
dGlhbiBBbmRyemVqIFNpZXdpb3IiIDxzZWJhc3RpYW5AYnJlYWtwb2ludC5jYz4sICJsaW51eC1r
ZXJuZWwiCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAiTWljaGVsZSBEaW9uaXNp
byIgPG1pY2hlbGUuZGlvbmlzaW9AZ21haWwuY29tPgo+IEdlc2VuZGV0OiBGcmVpdGFnLCA3LiBK
dW5pIDIwMTkgMjI6Mjc6MDkKPiBCZXRyZWZmOiBSZTogW1BBVENIXSB1YmlmczogQWRkIHN1cHBv
cnQgZm9yIHpzdGQgY29tcHJlc3Npb24uCj4+IFNvIEknbSBub3Qgc3VyZSB3aGF0IGlzIHRoZSBi
ZXN0IGNob2ljZSBmb3IgdGhlIGRlZmF1bHQgZmlsZXN5c3RlbS4KPiAKPiBNeSBpZGVhIHdhcyBh
dCB0aGUgZW5kLCBpLmUuIGl0IHdpbGwgb25seSBiZSB1c2VkIHdoZW4gTFpPIGFuZCBaTElCCj4g
YXJlIG5vdCBzZWxlY3RlZCB0byBiZSBpbmNsdWRlZCBmb3IgVUJJRlMsIGZvciBleGFtcGxlIHdo
ZW4gc29tZW9uZQo+IGNvbXBpbGVzIGEgbWluaW1hbCBrZXJuZWwgd2hvIGtub3dzIGV4YWN0bHkg
d2hpY2ggY29tcHJlc3Npb24KPiBhbGdvcml0aG1zIHdpbGwgYmUgdXNlZCBvbiB0aGF0IHN5c3Rl
bS4KCkJUVzogeW91IGNhbiBhbHdheXMgc2VsZWN0IHRoZSBjb21wcmVzc29yIHVzaW5nIHRoZSBj
b21wcj0gbW91bnQgb3B0aW9uLgpBbHNvIGZvciB0aGUgZGVmYXVsdCBmaWxlc3lzdGVtLgoKUHV0
dGluZyBpdCBhdCB0aGUgZW5kIGRvZXMgbm90IGhhcm0gYnV0IElNSE8gdGhlIHVzZSBpcyBsaXR0
bGUuCkJ1dCBmb3IgdGhlIHNha2Ugb2YgY29tcGxldGVzLCBJIGFncmVlIHdpdGggeW91LiBDYW4g
eW91IHNlbmQgYSBmb2xsb3ctdXAKcGF0Y2g/IAoKPiBJIGRpZCBhIHNpbmdsZSB0ZXN0IHRvZGF5
IGFuZCBjb21wYXJlZCBsem8gYW5kIHpzdGQgYW5kIG9uIHRoYXQgdGVzdAo+IGx6byBoYWQgZmFz
dGVyIGRlY29tcHJlc3Npb24gc3BlZWQgYnV0IHJlc3VsdGVkIGluIGxhcmdlciBzcGFjZS4gSSds
bAo+IGRvIG1vcmUgdGVzdHMgbGF0ZXIuCgpDYW4geW91IHBsZWFzZSBzaGFyZSBtb3JlIGRldGFp
bHM/IEknbSBpbnRlcmVzdGVkIHdoYXQgQ1BVIHRoaXMgd2FzLgoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
