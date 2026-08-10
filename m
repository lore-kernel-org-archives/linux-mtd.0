Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F230C5AC82
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHKP/GcinwXsM/aLh/TFqXtCcIAx45YDpx37S6oOYQw=; b=G/1X1/8kEQB+g8
	KVjSOfZN9vk62v/URBezbjYv8fm/4BKxiv6SKS5i+eL6R66wj9oafs1XoFIzS9894rGGehOlbbloe
	2EYe6OiaL6rAV/Hi3MeqMt/fluDggWAW2nOdyE6r/kt0y8EVbKoODneqciqJEnyB5VCaSvHgA4/mo
	z/YzZPAl2GMADfKk+eVojleIfmxyoEKmmiLHsf3H0m/eTI39Ql57cqBiiij8JCc3PF+vxZA6JYf9a
	+diBAWizCPs/+Uo78vzmo0o3F1C0tM8J1YNsm8z94teBjgF+JI2GUZPCXjVovEfWw/vxLsfYIwwoh
	jDd4vFo9f/4AvCfFV+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKu5-0000000BEDv-4Bcv;
	Mon, 10 Aug 2026 07:58:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKu2-0000000BECd-0t0j
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 07:58:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 511F04E4119C;
	Mon, 10 Aug 2026 07:58:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1040E6033B;
	Mon, 10 Aug 2026 07:58:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE47C11C49CA4;
	Mon, 10 Aug 2026 09:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786348704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AgtKz8mbEXrrynBzyJW+mHxmZTV0nQNNdf/m3uMU3oM=;
	b=fVk62MPi/+BWpwsj8e/pI4iiIYIE7W81BsStg9ymkbagMoWXmjTrxTZEiXl8Y/pAMjo1Ja
	hLOhlyW+wi3i4QsATMYZw4YNmn+vJQj5fUxxfIlnsrJbxAG8BTtrVtd3rwqVXAISwALi4I
	uhGf6F11a30bOWzstKDwJeeLWFOO0yW+R4cwi8GflHYOLFdAwAQ+lWIPLtD9i72y3xExNX
	44TNfAmMvnZgfsfbbKET6Rx8UpmtLzq2Aiz1J3O8O/QDENdDEWxt8eURxG/5l/PFO2MZXj
	T4XArYNrS7Lsb4FKbmp9XkeLAQ+HLPgjRNcguhhZOOtij8j/QGGGXcTch/0n6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: han.xu@oss.nxp.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Peter Pan <peterpandong@micron.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: spinand: Enable QE on all dies
In-Reply-To: <20260807-spinand_qe-v1-1-c102c79834a3@nxp.com> (han xu's message
	of "Fri, 07 Aug 2026 18:11:27 -0500")
References: <20260807-spinand_qe-v1-1-c102c79834a3@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 09:58:20 +0200
Message-ID: <87qzk6s8yr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_005834_411703_1513A0A2 
X-CRM114-Status: GOOD (  19.82  )
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

SGVsbG8gSGFuLAoKT24gMDcvMDgvMjAyNiBhdCAxODoxMToyNyAtMDUsIGhhbi54dUBvc3Mubnhw
LmNvbSB3cm90ZToKCj4gRnJvbTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KPgo+IFRoZSBRVUFE
IEVOQUJMRSAoUUUpIGJpdCBpcyBzdG9yZWQgaW4gYSBwZXItZGllIGNvbmZpZ3VyYXRpb24KPiBy
ZWdpc3RlciBvbiBzb21lIFNQSS1OQU5EIGRldmljZXMuIFdoZW4gYSBkZXZpY2UgY29udGFpbnMg
bXVsdGlwbGUKPiBkaWVzLCB1cGRhdGluZyB0aGUgUUUgYml0IG9ubHkgb24gdGhlIGN1cnJlbnRs
eSBzZWxlY3RlZCBkaWUgY2FuCj4gbGVhdmUgdGhlIHJlbWFpbmluZyBkaWVzIG9wZXJhdGluZyBp
biBub24tcXVhZCBtb2RlLgo+IMKgCj4gSXRlcmF0ZSBvdmVyIGFsbCB0YXJnZXRzIGFuZCB1cGRh
dGUgdGhlIFFFIHNldHRpbmcgb24gZWFjaCBkaWUKPiBkdXJpbmcgaW5pdGlhbGl6YXRpb24gdG8g
ZW5zdXJlIGNvbnNpc3RlbnQgcXVhZCBJL08gb3BlcmF0aW9uCj4gYWNyb3NzIHRoZSBlbnRpcmUg
ZGV2aWNlLgo+Cj4gVGVzdGVkIG9uIElTU0kgSVMzOFNNVzA0RzhCLgo+Cj4gRml4ZXM6IDc1Mjlk
ZjQ2NTI0OCAoIm10ZDogbmFuZDogQWRkIGNvcmUgaW5mcmFzdHJ1Y3R1cmUgdG8gc3VwcG9ydAo+
IFNQSSBOQU5EcyIpCgpUaGVyZSB3YXMgbm8gSVNTSSBkZXZpY2UgYmFjayB0aGVuLCBidXQgSSBn
dWVzcyB0aGlzIGNhbiBiZSB1c2VmdWwgZm9yCm90aGVyIGRldmljZXMuIEhvd2V2ZXIgdGhpcyBz
aGFsbCBiZSBiYWNrcG9ydGVkLCBzbyBDYzogc3RhYmxlLgoKPiBTaWduZWQtb2ZmLWJ5OiBIYW4g
WHUgPGhhbi54dUBueHAuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMg
fCAyMiArKysrKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IGluZGV4IDM1MzY1YjY3
ZGQ4ZS4uNzQ0NjYyNTMzZjM3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IEBAIC0yODEsOCArMjgx
LDI2IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0X2NmZ19jYWNoZShzdHJ1Y3Qgc3BpbmFuZF9k
ZXZpY2UgKnNwaW5hbmQpCj4gIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0X3F1YWRfZW5hYmxlKHN0
cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCQkJCSAgICBib29sIGVuYWJsZSkKPiAg
ewo+IC0JcmV0dXJuIHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfUVVBRF9FTkFCTEUsCj4g
LQkJCSAgICAgICBlbmFibGUgPyBDRkdfUVVBRF9FTkFCTEUgOiAwKTsKPiArCXN0cnVjdCBuYW5k
X2RldmljZSAqbmFuZCA9IHNwaW5hbmRfdG9fbmFuZChzcGluYW5kKTsKPiArCXVuc2lnbmVkIGlu
dCB0YXJnZXQ7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCS8qCj4gKwkgKiBRRSBpcyBhIHBlci1kaWUg
c2V0dGluZyBvbiBzb21lIGRldmljZXMuIFByb2dyYW0gZWFjaCB0YXJnZXQKPiArCSAqIGluZGl2
aWR1YWxseSB3aGVuIGVuYWJsaW5nIG9yIGRpc2FibGluZyBxdWFkIEkvTyBtb2RlLgo+ICsJICov
Cj4gKwlmb3IgKHRhcmdldCA9IDA7IHRhcmdldCA8IG5hbmQtPm1lbW9yZy5udGFyZ2V0czsgdGFy
Z2V0KyspIHsKPiArCQlyZXQgPSBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3BpbmFuZCwgdGFyZ2V0
KTsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1cm4gcmV0Owo+ICsKPiArCQlyZXQgPSBzcGluYW5k
X3VwZF9jZmcoc3BpbmFuZCwgQ0ZHX1FVQURfRU5BQkxFLAo+ICsJCQkJICAgICAgZW5hYmxlID8g
Q0ZHX1FVQURfRU5BQkxFIDogMCk7Cj4gKwkJaWYgKHJldCkKPiArCQkJcmV0dXJuIHJldDsKCklm
IHRoZXJlIGlzIGFuIGlzc3VlIGluIHRoZSBtaWRkbGUgb2YgdGhlIGxvb3AsIHRoZSBjaGlwIHdp
bGwgYmVjb21lCnVudXNhYmxlLiBQZXJoYXBzIHdlIHNob3VsZCByZXNldCB0aGUgZGllcyB0byB0
aGUgIVFFIHN0YXRlIGFuZCByZXR1cm4KYW4gZXJyb3IgdG8gY29udGludWUgaW4gZGVncmFkZWQg
KHNpbmdsZSkgbW9kZSBpZiB0aGF0IGhhcHBlbnM/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
