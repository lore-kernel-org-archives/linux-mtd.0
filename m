Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9852C61DBE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pFLr5oEnCfAQ5FTbTg8vVjEdUBKeMgGxHxLT4Q1LFk=; b=AbpcSNs1bwgj7j
	2oL2BzTKUI0ed9C88VgYGldoV6SSfxJI4qeCeAguI6sNF9/XYEjrmXdqYSLkzFueHN62EcXJJF7mr
	UvVh2EL8Oq+M09VhcyzxQ+wHEfo0vS9JACh0G3O5YCThHI82rUkwSkc+x+f6N7ohGa9zlDVJ2Ccuw
	xA+4PyUmbfl4OJTAm4nnEWgG2AETMnXHEkaPBP73Z4xfVPkT2Fb8lypINXBrO3eYSPE1NLqCDFtym
	byNgDTpmeUrECCZXKa6tT6jGRryuy7korA0LgRyHZbWTIpW+VBJWvBVbXLJRCxEfH8ADfZB8ZxDM9
	Auv2OCGo5aFREj1YIf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqHC-00000000lb2-3h7M;
	Tue, 25 Aug 2026 12:29:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqHA-00000000laO-1uY6
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 12:29:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA30F4E4134D;
	Tue, 25 Aug 2026 12:29:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7EBD3604C4;
	Tue, 25 Aug 2026 12:29:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67A8A11C792BD;
	Tue, 25 Aug 2026 14:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787660945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n3Fwjdl5LogwA6IhpLkAzwbAmHDA3YfxfDN/3cyvB18=;
	b=ynKddJNib9Zf1ElcBIqZfAxmVj0rHKV2ZuyRgEHwalYwG24xQl7u8nXgU5zzQ7N/a+mt/j
	BSeKyNzAtThXdjPNG4HZ+JtPpOHhcDuPs3poKg4Vqi9YAhdVrRW054iut2z9PlvXuv+ltk
	OSbzym+Kao/WqufdKrjyU+sFOIfVGRsQfFb5+NzlWZhJjqA/Glyj2TBPXvEKN3ss5r+G8Q
	CdsWflyVcUc81vQj+XGylqlR+c7bcEi+apTCG/BUCVa3+UN7WAA7wAgMwtN4FJuk94MjQe
	w9FeVkkfhkwZYhNSztZg6XsW+JiLpPWmEoUoHsTCeV3BDA62DpbWuMprkGlFDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: core: Fix mutex leak in
 spi_nor_rww_start_exclusive()
In-Reply-To: <20260819140337.36775-2-runyu.xiao@seu.edu.cn> (Runyu Xiao's
	message of "Wed, 19 Aug 2026 22:03:36 +0800")
References: <0a15f6e8-f1ca-4945-9bd5-2b64a2802a58@linaro.org>
	<20260819140337.36775-1-runyu.xiao@seu.edu.cn>
	<20260819140337.36775-2-runyu.xiao@seu.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 14:29:02 +0200
Message-ID: <87tsoigz8x.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_052912_637677_D2D80932 
X-CRM114-Status: GOOD (  11.63  )
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

T24gMTkvMDgvMjAyNiBhdCAyMjowMzozNiArMDgsIFJ1bnl1IFhpYW8gPHJ1bnl1LnhpYW9Ac2V1
LmVkdS5jbj4gd3JvdGU6Cgo+IFRoZSBSV1cgd2FpdCBoZWxwZXJzIG11c3Qgbm90IGJsb2NrIHdo
aWxlIGV2YWx1YXRpbmcgdGhlIGNvbmRpdGlvbi4KPiBzcGlfbm9yX3J3d19zdGFydF9leGNsdXNp
dmUoKSB1c2VkIG11dGV4X2xvY2soKSBkaXJlY3RseSBhbmQgY291bGQgcmV0dXJuCj4gd2l0aCBu
b3ItPmxvY2sgc3RpbGwgaGVsZC4KPgo+IFN3aXRjaCB0aGUgZm91ciBSV1cgc3RhcnQgaGVscGVy
cyB0byBjb25kaXRpb25hbCBzY29wZWQgbXV0ZXggZ3VhcmRzIHNvCj4gdGhlIHdhaXQgY29uZGl0
aW9uIG5ldmVyIHNsZWVwcyBhbmQgbm9yLT5sb2NrIGlzIHJlbGVhc2VkIGJlZm9yZQo+IHJldHVy
bi4KCldoYXQ/IFdoeT8KClBsZWFzZS4KClByZXZpb3VzIHBhdGNoIHdhcyByaWdodCwgd2h5IGFy
ZSB5b3UgY29udmVydGluZyB0byBzY29wZSBndWFyZD8KCllvdSBkaWQgbm90IHBpY2sgdGhlIFJl
dmlld2VkLWJ5IHRhZ3MuCj4KPiBGaXhlczogNzRkZjQzYjNmNjI2ICgibXRkOiBzcGktbm9yOiBF
bmhhbmNlIGxvY2tpbmcgdG8gc3VwcG9ydCByZWFkcwo+IHdoaWxlIHdyaXRlcyIpCgpUaGlzIEZp
eGVzIGlzIHdyb25nLCB0aGUgb3JpZ2luYWwgb25lIHdhcyByaWdodCwgcGxlYXNlIGNoZWNrIHRo
ZSBlbnRpcmUKY29udmVyc2F0aW9uLgoKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IFJ1bnl1IFhpYW8gPHJ1bnl1LnhpYW9Ac2V1LmVkdS5jbj4KPgo+IENoYW5n
ZXMgaW4gdjQ6CgpDaGFuZ2Vsb2cgc2hvdWxkIG5vdCBiZSBoZXJlIGJ1dCBiZWxvdyB0aGUgLS0t
LgoKWW91IG1pc3MgY2hhbmdlcyBmcm9tIHYyIGFuZCB2My4KCj4gLSBVc2UgdGhlIG9yaWdpbmFs
IFJXVyBsb2NraW5nIGNvbW1pdCBpbiBGaXhlcyBhbmQgdXBkYXRlIHRoZSBzdWJqZWN0Lgo+IC0g
QXBwbHkgdGhlIGxvY2tpbmcgZml4IHRvIGFsbCBSV1cgc3RhcnQgaGVscGVycyB1c2VkIGFzIHdh
aXQgY29uZGl0aW9ucy4KPiAtIEtlZXAgY29tbWl0IDAzZTdiYjg2NGQ5YSAoIm10ZDogc3BpLW5v
cjogdXNlIHNjb3BlLWJhc2VkIG11dGV4Cj4gICBjbGVhbnVwIGhlbHBlcnMiKSBhcyBhIHN0YWJs
ZSBwcmVyZXF1aXNpdGUgYmVjYXVzZSBpdCBhZGRzCj4gY2xlYW51cC5oLgoKV2hlcmUgZGlkIHlv
dSBkbyB0aGF0PwoKSWYgeW91IHdhbnQgdG8gZml4IHRoZSByZW1haW5pbmcgU2FzaGlrbyBpc3N1
ZSAodGhlIHNsZWVwIGlzc3VlKSB5b3UKY2FuLCBidXQgcGxlYXNlIGRvIGl0IGluIGFub3RoZXIg
cGF0Y2guCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
