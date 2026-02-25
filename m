Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B88EFD3764
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U29iXetP/7Qr6Tr76peMCiHjzqxS8kNulQzX2ptRMQA=; b=yiXkFgCVR6i3+g
	usWiEEjjqBtWscO3Z8aVoSe+3jRg20az/wt5+bbAOLKGB2Yr9nRTP/MJ4tHF15hLnqiTO0VPQwGsl
	56A8g8lOdgmlVvutObuXeLaBUybqtBEdIcdcV2qr3ifv+Lb+8RotEW36Dho6RcZjVuSIxHEBUNcGt
	w5vTwPYqVopft8PVUarrsi8UBXO0WXTSSf6s9mEUvuJObTsntJRfhEQu4oN+W/3GM/t2+cpzu2/DF
	xh4AX1LOMQpP08hsvtVIUF9sL/9Y9/tFZlUff/TMUV5sP2dl0NhJb/vz2nVTAVPL1fsTxIfKccQCH
	0lReIfjKo4wZ8Eei1Xiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGWX-00000004Fau-01uC;
	Wed, 25 Feb 2026 15:10:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGWT-00000004FaE-02Cu
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 15:09:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 51DDD4E410F8;
	Wed, 25 Feb 2026 15:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BFEB5FDE6;
	Wed, 25 Feb 2026 15:09:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 334D410369260;
	Wed, 25 Feb 2026 16:09:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772032191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HgUlI7q2fA9MZdaUIYY0d5mtoXIeH07oXQLHKae4E8E=;
	b=gKss4o40gnoZRYfhulIOZSS3nn8HKYV+6mmPlIuaHhJE9kk46pLruEtjnzlFW8jyb2Nz7A
	bx2nHBEKr5Kyqg7Gra1uTvM7H6LpcP0MJBCLwaKatyM4l5D6mYAOzepRsJ3GDyDm7dcbPR
	bDuKQuchs4d9PqXCjsN9AtV+OIhtFNxXH8LBkSXqFWDlaLapzamBjDJETt1FYEr+myyMC1
	ENUKo+b2pKQDFTiLyD+V8J9IvuK0qI6KhSur1m9pdxSMs5jdTD4BbtzssA6SmIGX+0S6wd
	TjcJWumXbBLQ42yDL1nd8QxDMqpA0C8GJWhGaDuzZtANnhET6hz+5UNtYCJeEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>,  Pablo Martin-Gomez
 <pmartin-gomez@freebox.fr>,  Tianling Shen <cnsztl@gmail.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: spinand: Add randomizer
 enable/disable properties
In-Reply-To: <20260225015705.1113199-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 25 Feb 2026 09:57:03 +0800")
References: <20260225015705.1113199-1-linchengming884@gmail.com>
	<20260225015705.1113199-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 25 Feb 2026 16:09:45 +0100
Message-ID: <87o6lcq2py.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_070957_203394_74719858 
X-CRM114-Status: GOOD (  16.36  )
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

T24gMjUvMDIvMjAyNiBhdCAwOTo1NzowMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21p
bmc4ODRAZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWlu
Z2xpbkBteGljLmNvbS50dz4KPgo+IEFkZCAibmFuZC1yYW5kb21pemVyLWVuYWJsZSIgYW5kICJu
YW5kLXJhbmRvbWl6ZXItZGlzYWJsZSIgYm9vbGVhbgo+IHByb3BlcnRpZXMuCj4KPiBUaGVzZSBw
cm9wZXJ0aWVzIGFsbG93IGVuYWJsaW5nIG9yIGRpc2FibGluZyB0aGUgcmFuZG9taXplciBmZWF0
dXJlCj4gdmlhIHRoZSBkZXZpY2UgdHJlZS4KPgo+IEFjY29yZGluZyB0byBKRURFQyBzdGFuZGFy
ZCBKRVNEMjItQTExN0UsIG5vIHNpbmdsZSBkYXRhIHBhdHRlcm4KPiByZXByZXNlbnRzIGEgdW5p
dmVyc2FsIHdvcnN0LWNhc2UgZm9yIGFsbCBOQU5EIGZsYXNoIGZhaWx1cmUgbWVjaGFuaXNtcy4K
PiBEaWZmZXJlbnQgcGF0dGVybnMsIHN1Y2ggYXMgZnVsbHkgcHJvZ3JhbW1lZCwgY2hlY2tlcmJv
YXJkLCBvciBtb3N0bHkKPiBlcmFzZWQsIGNhbiBkaXNwcm9wb3J0aW9uYXRlbHkgc3RyZXNzIHNw
ZWNpZmljIGNlbGxzIChlLmcuLCBwcm9ncmFtbWVkLAo+IGVyYXNlZCwgb3IgdGhvc2UgaW5mbHVl
bmNlZCBieSBhZGphY2VudCBzdGF0ZXMpLgo+Cj4gR2l2ZW4gdGhhdCBubyBmaXhlZCBwYXR0ZXJu
IGNhbiBjb3ZlciBhbGwgc2NlbmFyaW9zLCB0aGUgdXNlIG9mIGEKPiByYW5kb21pemVkIGRhdGEg
cGF0dGVybiBpcyBhIHByYWN0aWNhbCBhbmQgZWZmZWN0aXZlIG1pdGlnYXRpb24gc3RyYXRlZ3ku
Cj4gT3VyIGhhcmR3YXJlIGltcGxlbWVudHMgYSByYW5kb21pemVyIGZlYXR1cmUgdGhhdCBzY3Jh
bWJsZXMgdXNlciBkYXRhCj4gYmVmb3JlIGl0IGlzIHdyaXR0ZW4gdG8gdGhlIGZsYXNoIGFuZCBy
ZXN0b3JlcyB0aGUgb3JpZ2luYWwgZGF0YSB1cG9uIHJlYWQuCj4KPiBUaGlzIGVuc3VyZXMgdGhl
IGRhdGEgc3RvcmVkIG9uIHRoZSBtZWRpYSBpcyBtb3JlIGV2ZW5seSBkaXN0cmlidXRlZCwKPiB0
aHVzIHJlZHVjaW5nIHBhdHRlcm4tZGVwZW5kZW50IGRlZ3JhZGF0aW9uLiBUaGlzIGlzIGVzcGVj
aWFsbHkgY3J1Y2lhbAo+IGZvciBwcmV2ZW50aW5nIGVycm9ycyBjYXVzZWQgYnkgdW5iYWxhbmNl
ZCBkYXRhIChlLmcuLCBhbGwgemVyb3Mgb3IKPiBhbGwgb25lcykgaW4gYmxvY2tzIHdpdGggaGln
aCBwcm9ncmFtL2VyYXNlIChQL0UpIGN5Y2xlIGNvdW50cy4KPiBVbHRpbWF0ZWx5LCB0aGUgcmFu
ZG9taXplciBpbXByb3ZlcyB0aGUgbG9uZy10ZXJtIHJlbGlhYmlsaXR5IGFuZAo+IGVuZHVyYW5j
ZSBvZiB0aGUgZmxhc2ggZGV2aWNlLgo+Cj4gUGxlYXNlIHJlZmVyIHRvIHRoZSBmb2xsb3dpbmcg
bGluayBmb3IgcmFuZG9taXplciBmZWF0dXJlOgo+IExpbms6Cj4gaHR0cHM6Ly93d3cubXhpYy5j
b20udHcvTGlzdHMvQXBwbGljYXRpb25Ob3RlL0F0dGFjaG1lbnRzLzIxNTEvQU4xMDUxVjEtVGhl
JTIwSW50cm9kdWN0aW9uJTIwb2YlMjBSYW5kb21pemVyJTIwRmVhdHVyZSUyMG9uJTIwTVgzMHhG
eEcyOEFEX01YMzV4RnhHMjRBRC4KClRoaXMgbGluayBicmluZ3MgbWUgdG8gYSAiV2UgaGF2ZSBt
b3ZlZCB0byBvdXIgbmV3IGhvbWUiIHBhZ2UuCgpBbnlob3csIHRoaXMgTGlua3MgZG9lcyBub3Qg
bWFrZSBtdWNoIHNlbnNlIGluIHRoZSBiaW5kaW5nLiBJZiB0aGlzIGlzIGEKdmVyeSBnZW5lcmlj
IEFOLCB3aHkgbm90LCBidXQgbWF5YmUgSSdkIG1vdmUgaXQgdG8gdGhlIFNQSSBOQU5EIHBhdGNo
ZXMsCmFzIHRoZSBuYW1lIGltcGxpZXMgdGhhdCBpdCBpcyBhIGJpdCBzcGVjaWZpYyB0byBNYWNy
b25peCBjaGlwcy4KCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xp
bkBteGljLmNvbS50dz4KCk90aGVyd2lzZSBib3RoIHRoZSBiaW5kaW5nIGFuZCBjb2RlIGxvb2sg
b2sgZnJvbSBteSBQb1YuIFNvIGJlc2lkZXMgdGhlCkxpbmsgdGhhdCBtdXN0IGJlIG1vdmVkIGFu
ZCBmaXhlZCwgSSdsbCB3YWl0IGZvciBiaW5kaW5nIGFwcHJvdmFsLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
