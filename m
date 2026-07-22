Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D02BC44539
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wWQmzZRuy49g8lCMi6y45iTA3Z93sBD7lW/qcThTO8=; b=D3dLw+GOSC0HAp
	L38g5ryZ+zQaCwV9WMl5ctHiN6zYfrd45eb3nJJ42xnyKNT2aBvwEqw39eN4D0RpoT16xE24yifAA
	gOINsQQ10DKjArLKOXmtxnsx1o44Tv0WErR1iMIZX0sru1tle16/+va/zyuUktWI2UPZjAP/rs1pn
	/cGP93aM236xCmncFTSQQivC8wVTcrgBP7+r7jSzgBjDmKvOY0/QNZPemDSKkh0nXhhQUOwJYSB4Y
	tHIDqaEERGaE8XqRarsNOWWWEfx+pja9OCVu99mCpT7yjvoY5u9wUFtGbR6XLkU6nV5WFQkdMwNsx
	bpgArPKYr5sqsqL6N0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWKw-0000000BnH5-3gJx;
	Wed, 22 Jul 2026 12:46:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWKt-0000000BnG7-3EAC
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 12:46:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 154954E40ECD;
	Wed, 22 Jul 2026 12:46:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCC4B60388;
	Wed, 22 Jul 2026 12:46:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFE0B11BD0B36;
	Wed, 22 Jul 2026 14:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784724361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FWmFCXxb0VCIramQ60LckGixY+99Du+RKyjxy2l3nWY=;
	b=um19THySolfKr1WxCq+CNfFUP/IQPWUv4+tws2zEVbKbm28be3BWi1O5b0j5uyGH0Orw2B
	YanB/FZXDjjr9+a0IGoj+/R/MPTO1ChdOj/twVSoawQ8X9gVYCf5ZvxC6csZeze8B5AK5B
	ob7pSyHnOCL1yyjem5Fb7G5ZdSYUDfN4BqrUOll0G2qd3P7lTHn8Xt/uqpbCm6KgRhmfZM
	Wzug+V9FEZbt2SyGST3Xka3UReu/51tosIx+XRQKN5RJgqACxK86U6iuzfaFF11Jdo/9T7
	REopNC61vK7v1WYZDg1G0FJWLD+qKncsxZSvuGYkqvOn4h8nqWE/MT+xhbsz7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/30] mtd: spi-nor: Clean Winbond W25QxxJV family
In-Reply-To: <DJRK4HNYJ2LP.KDV5AMR7FCE4@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 16:27:33 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<DJRK4HNYJ2LP.KDV5AMR7FCE4@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 14:45:58 +0200
Message-ID: <87ecgvjipl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_054608_015376_D694BBB5 
X-CRM114-Status: GOOD (  18.64  )
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

SGVsbG8gTWljaGFlbCwKCk9uIDA2LzA3LzIwMjYgYXQgMTY6Mjc6MzMgKzAyLCAiTWljaGFlbCBX
YWxsZSIgPG13YWxsZUBrZXJuZWwub3JnPiB3cm90ZToKCj4gT24gRnJpIE1heSAyOSwgMjAyNiBh
dCA1OjIyIFBNIENFU1QsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IFRoYW5rcyB0byBXaW5ib25k
IGNvbGxhYm9yYXRpb24sIEkgd2FzIGFibGUgdG8gdGVzdCBhbG1vc3QgdGhlIGVudGlyZSBKVgo+
PiBTUEkgTk9SIGZhbWlseS4gQSBmZXcgY2hpcHMgY291bGQgbm90IGJlIHNvdXJjZWQsIEkgZGVj
aWRlZCB0byBhcHBseSB0aGUKPj4gdmVyeSBzYW1lIGxvZ2ljIHRoYW4gdGhlIG90aGVyIGNoaXBz
LCBhbGwgb2YgdGhlbSBiZWhhdmUgaWRlbnRpY2FsbHkgYXMKPj4gc2hvd24gaW4gYWxsIHRoZSBs
b2dzIHRoYXQgSSBhbSBzaGFyaW5nIGluIGVhY2ggYW5kIGV2ZXJ5IGNvbW1pdC4KPj4KPj4gVGhp
cyBzZXJpZXMgaXMgcHJldHR5IHN0cmFpZ2h0Zm9yd2FyZCwgaXQgaXMgaGVyZSB0byBjbGVhbnVw
IHRoZSBKVgo+PiBlbnRyaWVzIGJ5Ogo+PiAtIFJlbW92aW5nIHRoZSB1c2VsZXNzIHBhcnQgbmFt
ZXMgKHdoaWNoIGFyZSBnb2luZyB0byBiZWNvbWUgYSBwcm9ibGVtKQo+PiAtIEFsaWduaW5nIHRo
ZSBjb21tZW50cyBhbmQgImZpeGluZyIgdGhlIGNoaXAgbmFtZXMgaW4gdGhlbQo+PiAtIFJlb3Jk
ZXJpbmcgdGhlIGNoaXBzIGJ5IGRlbnNpdHkgYW5kIGZhbWlseQo+PiAtIFRlc3RpbmcgYW5kIHNo
b3dpbmcgYWxsIHRoZSBTRkRQIGNvbnRlbnQgYW5kIHBhc3NpbmcgYWxsIHRoZSBTUEkgTk9SCj4+
ICAgdGVzdHMgdG8gZW5zdXJlIGEgZ29vZCBsZXZlbCBvZiBzdXBwb3J0Lgo+PiAtIERlc2NyaWJp
bmcgb25seSB3aGF0IG5lZWRzIHRvIGJlIGRlc2NyaWJlZCwgcGFyc2luZyB0aGUgU0ZEUCB0YWJs
ZXMKPj4gICBvdGhlcndpc2UuCj4+IC0gQWRkaW5nIGFsbCB0aGUgbG9ja2luZyBpbmZvcm1hdGlv
biB3aGVuIGl0IGlzIG1pc3NpbmcuCj4+Cj4+IFRoaXMgd29yayBpcyBuZWNlc3NhcnkgYmVjYXVz
ZSBJIGFtIGFib3V0IHRvIHByb3Bvc2UgdGhlIGFkZGl0aW9uIG9mIHRoZQo+PiBXMjVReHhSViBm
YW1pbHksIHdob3NlIElEcyBhY3R1YWxseSBjb2xsaWRlIHdpdGggdGhlIEpWIGNoaXBzLiBUaGUg
Y2hpcHMKPj4gYXJlIHNpbWlsYXIsIHRoZXkgaGF2ZSBiZWVuICJpbXByb3ZlZCIgKGVzcGVjaWFs
bHkgdGhlIHNpbGljb24vZW5ncmF2aW5nCj4+IHNtb290aG5lc3MpIGFuZCB3ZSBoYXZlIGEgd2F5
IHRvIGRpZmZlcmVudGlhdGUgdGhlbSBiYXNlZCBvbiB0aGVpciBTRkRQCj4+IGNvbnRlbnQsIGJ1
dCB0aGF0IHdpbGwgYmUgZm9yIGEgZm9sbG93aW5nIHNlcmllcy4KPgo+IFdoeSBkbyB5b3UgbmVl
ZCB0byByZW1vdmUgdGhlIG5vX3NmZHBfZmxhZ3M/IEkgaGF2ZSBvbmx5IGxvb2tlZCBhdAo+IHNv
bWUgb2YgdGhlIHBhdGNoZXMsIGJ1dCBvdmVyYWxsIGl0IHNlZW1zIHdlJ2QgYmUgZHJvcHBpbmcg
c3VwcG9ydAo+IGZvciBvbGRlciBjaGlwcyAtIHdoaWNoIHdlIGRvbid0IGtub3cgaWYgdGhleSBh
cmUgaW4gdXNlIG9yIG5vdC4KPgo+IFNvIGFsdGhvdWdoIHRoZSBjb21tZW50IG1pZ2h0IG9ubHkg
cG9pbnQgdG8gb25lIGNoaXAsIHRoZXJlIGNhbiBiZQo+IG1hbnkgbW9yZSB3aXRoIHRoYXQgdmVy
eSBzYW1lIGlkLiBBbmQgbm93Li4gd2l0aCB0aGUgUlYgZmFtaWx5IGV2ZW4KPiBtb3JlLiBVZ2gu
CgpJIHdhbnRlZCB0byBmb2xsb3cgdGhlIHNwaS1ub3IgZGlyZWN0aW9uIHdoaWNoLW5vciB3YXMg
dG8gbW92ZSBhd2F5IGZyb20KdGhlc2UsIHdoZW4gdGhleSB3ZXJlIHJlbGV2YW50LiBCdXQgeW91
IGFyZSByaWdodCwgSSBnYXRoZXJlZCBtb3JlCmluZm9ybWF0aW9uLCBXaW5ib25kIGhhcyB0cmFu
c2l0aW9uZWQgdG8gU0ZEUCBiZXR3ZWVuIDIwMTIgYW5kIDIwMTYsIG5vCmNoaXAgd2l0aG91dCBT
RkRQIGhhcyBiZWVuIG1hbnVmYWN0dXJlZCBmb3IgbW9yZSB0aGFuIGEgZGVjYWRlLiBJIGd1ZXNz
Cml0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGZpbmQgY2hpcHMgd2l0aCBubyBTRkRQIHN1cHBvcnQg
dGhlbi4KClNpbmNlIHJlbW92aW5nIHRoZSBub19zZmRwX2ZsYWdzIGZpZWxkIHdvdWxkIG1lYW4g
ZHJvcHBpbmcgc3VwcG9ydCBmb3IKdGhvc2Ugb2xkIGNoaXBzLCBJIGd1ZXNzIHdlIGFyZSBzdHVj
ayB3aXRoIHRoaXMgZGF0YS4gQXQgdGhpcyBwb2ludCwgSQpkbyBub3QgaWRlbnRpZnkgcHJvYmxl
bXMgd2l0aCBrZWVwaW5nIHRoZSBub19zZmRwIGRhdGEgYW5kIGFkZGluZwpzdXBwb3J0IGZvciB0
aGUgUlYgY2hpcHMuCgpIb3dldmVyIEkgd2lsbCBrZWVwIHJlbW92aW5nIHRoZSBuYW1lcywgd2hp
Y2ggZ2V0IHdyb25nLWVyIGFuZAp3cm9uZy1lci4uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
