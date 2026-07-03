Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807C5C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+DHYpVG+PQh9nWur/tHJCluXq1tKJRkf22fNCmx95U=; b=qA93gg1n68rrpl
	fnf9vp51u3uxK2Jc49pR6gG5z6WFxchjUp9b4bMUq8AwbJUOc0hjWhMcNM+KnvcTrbSRzNOvc7oDd
	YlMQfzGlXVs4vDGAV9x2baKbNJKYR69Gf90viinYC6VEu+pgbA3/xOcRzvdiFxsmTbzsJIz6rFXLN
	JjP+tIF0f30bOqJ9khrOBV8nfIjRztV5ErsK7b7xsxKJbJWUg6hCOvtwkL1o2ZPbjoEIfxifWMStU
	M0EF7Zct7lQjnNPhT1dOswITILldyg8JAaJ9L/IdlcxmQA6Sk2MmDz9CP9xR5IjY0VIvoQWap8LFU
	bAiY0xf1C33VtLBq91Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfawI-00000006ZaM-2wkn;
	Fri, 03 Jul 2026 10:16:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfawE-00000006ZZp-3AF6
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 10:16:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 851A04E40C57;
	Fri,  3 Jul 2026 10:16:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 440AB60300;
	Fri,  3 Jul 2026 10:16:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65DC2104C8399;
	Fri,  3 Jul 2026 12:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783073759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LqH3H+C4q9HYnTsw0EDWHMQnX/Mq8IYtzP3WOkNlfG0=;
	b=obzf9WEjWxoGnLgP5gdDIFUep9YV0q6uKwxCVrDG2ikDRkIS039UTqqCKf19nZv+S+SR6a
	r6cHB5EKUp4xt+aZQQllqq0ZbUH9HBM9jHqrCnmWkwQjVzPqB3sDN9yg2U9uu9nPdPkqZi
	ChGsp9VsoxZirGpaeSnsU6/Gkt/+r5Yf/sM/HhIB5Iu5E1k4VZ3eNhFaMjxiTTMkBuzQc1
	MFvD6AvXkQ8oK6XXF+m2BCCIb1cnbeT/wLw/f9QO+le8oiU5DPmYZTOQcUh4eBey0s8YbD
	/G5LfqrSZ8Gg//RdcAQbspc+KOA+41OUE05B5mI2kdXNFOrId0m1VLeC/00+pA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>,  Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  pratyush <pratyush@kernel.org>,
  linux-kernel <linux-kernel@vger.kernel.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd <linux-mtd@lists.infradead.org>,  Aryan
 Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>,  Michael Walle
 <mwalle@kernel.org>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
In-Reply-To: <183302295.10735.1783057556804.JavaMail.zimbra@nod.at> (Richard
	Weinberger's message of "Fri, 3 Jul 2026 07:45:56 +0200 (CEST)")
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
	<20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
	<490fc98b2996487fba3abd62176bb1dd@infineon.com>
	<8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz>
	<99731a393e5649e692afe57f59d5926b@infineon.com>
	<e946b3c6-304a-4015-a144-285e7f2f4e6a@alliedtelesis.co.nz>
	<490633873.5619.1782970758317.JavaMail.zimbra@nod.at>
	<a86e2233c6ea01b1dcefb8c7f7f582725a25b5e5.camel@alliedtelesis.co.nz>
	<183302295.10735.1783057556804.JavaMail.zimbra@nod.at>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Jul 2026 12:15:54 +0200
Message-ID: <87wlvcnztx.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_031602_958612_22109F20 
X-CRM114-Status: GOOD (  14.53  )
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

T24gMDMvMDcvMjAyNiBhdCAwNzo0NTo1NiArMDIsIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+IHdyb3RlOgoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZv
bjogIlJvbmFuIERhbHRvbiIgPFJvbmFuLkRhbHRvbkBhbGxpZWR0ZWxlc2lzLmNvLm56Pgo+PiBP
biBUaHUsIDIwMjYtMDctMDIgYXQgMDc6MzkgKzAyMDAsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90
ZToKPj4+IERvIHlvdSByZWFsbHkgbmVlZCAoUE9TSVgpIGZpbGUgc3lzdGVtIHNlbWFudGljcz8K
Pj4+IFlvdSBjb3VsZCBwYXJ0aXRpb24gdGhlIEZSQU0gaW50byBjZWxscyBhbmQgdGhlbiB3b3Jr
IHdpdGggdGhlbS4KPj4+IGUuZy4gSnVzdCBkZCBpbnRvIGl0IGFuZCBlcmFzZSBpdCB3aGVuIG5l
ZWRlZC4uLgo+Pj4gTWF5YmUgdGhlIE5WTUVNIGNlbGxzIG1lY2hhbmlzbSBuZWVkcyBzb21lIHBv
bGlzaGluZyBidXQgdGhpcyBzb3VuZHMKPj4+IHJlYXNvbmFibGUgdG8gbWUuCj4+IAo+PiBZZXMs
IHRoYXQgY291bGQgd29yayBmb3Igc2VjcmV0cyBzdG9yYWdlLiBIb3dldmVyIHdlIGFsc28gc3Rv
cmUKPj4gcGVyc2lzdGVudCBsb2dzIGFuZCBESENQIGxlYXNlcyBvbiB0aGlzIGZsYXNoIHRvIG1p
bmltaXplIHJlYWQvd3JpdGVzCj4+IG9uIHRoZSBtYWluIGZsYXNoLCBhbmQgdGhpcyBkYXRhIGlz
IHN0b3JlZCBhcyBmaWxlcyBvZiB2YXJ5aW5nIGxlbmd0aHMuCj4+IEEgZmlsZXN5c3RlbSBwcm92
aWRlcyB0aGUgbW9zdCBzdHJhaWdodGZvcndhcmQgd2F5IG9mIHN0b3JpbmcgdGhpcyBkYXRhCj4+
IGZvciB1cy4KPgo+IEJ1dCB0aGUgc3RvcmFnZSAoRlJBTSkgeW91IGNob3NlIGlzIG5vdCBzdWl0
YWJsZSBmb3IgYW55IHJlYWwgZmlsZXN5c3RlbS4KPiBJbiBhIHByZXZpb3VzIG1haWwgeW91IHNh
aWQgeW91IHVzZSBleHQyIG9uIGl0Lgo+IEkgaGF2ZSBhIGhhcmQgdGltZSB0byBzZWUgaG93IHVz
aW5nIGV4dDIgb24gdG9wIG9mIG10ZGJsb2NrIG9uIGFuIEZSQU0KPiBkb2VzIG5vdCBlbmQgaW4g
YSBkaXNhc3Rlci4KPgo+PiBUaGF0J3Mgbm90IHRvIHNheSB3ZSBjb3VsZG4ndCBkZXZlbG9wIHNv
bWUgc3lzdGVtIG9mIHVzaW5nIHRoZSBudm1lbQo+PiBkZXZpY2UgYXMgYSBiYWNrZW5kIGZvciB0
aGlzIGRhdGEuIFRoaXMgbWF5IGJlIHNvbWV0aGluZyB3ZSBsb29rIGF0IGluCj4+IHRoZSBmdXR1
cmUuCj4KPiBNYXliZSBGVVNFIGNhbiBoZWxwIHdpdGggYnVpbGRpbmcgYSBzdXBlciBzaW1wbGUg
ZmlsZXN5c3RlbSB3aGljaCBwcm92aWRlcwo+IGp1c3QgZW5vdWdoIHRvIGZ1bGZpbGwgeW91ciB1
c2UgY2FzZS4KClRoZSBOVk1FTSBjZWxscyBtZWNoYW5pc20gaXMgdmVyeSBmbGV4aWJsZSBub3cg
d2l0aCBsYXlvdXRzLiBXZSBkbyBoYXZlCnN1cHBvcnQgZm9yIE9OSUUgVHlwZS1MZW5ndGgtVmFy
aWFibGUgdGFibGVzIGFzIHdlbGwgYXMgYW4gZXhhbXBsZSBvZgpzdXBwb3J0IGZvciB0aGUgZW52
aXJvbm1lbnQgdmFyaWFibGVzIGluIFUtQm9vdC4gSWYgeW91IGZvcm1hdCB2ZXJ5CnNsaWdodGx5
IHlvdXIgZGF0YSB5b3UgY2FuIHZlcnkgZWFzaWx5IGV4cG9zZSBhdXRvbWF0aWNhbGx5IG9uZSBj
ZWxsIHBlcgppbmZvcm1hdGlvbiB3aXRoIGEgcmF0aGVyIHNpbXBsZSBOVk1FTSBsYXlvdXQgZHJp
dmVyIGFuZCBjb25zdW1lIGl0IHRoaXMKd2F5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
