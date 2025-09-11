Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433DFCAC587
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wa1qNi3pjN8JqIHSOi7LK0gYw0p0ZAZgqmpzRBxOYHQ=; b=zWB/I2IpiF2uc/
	egduTdBCN3pHd0XWRt+jdFKqbylmFAZASOZYe9BfA50oDU2u3M3kNBIgfG8rXDJovSPu2WwB8mF+m
	LVZWSi6qFnMUqTpGaYh7ERjzVWQfvi4Z4TwziocnVhF9jXikHZfyMSRFuvcIZmYWD9+45P4fRC25X
	eyTqIW3PWMXnFFU3mWJyUB77UpWGX5WDotCzHEUnzVMaxJhMVto+Q0Alnkh8rDsNPE2L4vGsU0naL
	61CzQN0T5KynlyKMHN7a6xgPE3H8qt5KMecNcNzGjyEe+IyXPkaxwbBf1p0LOsK/Cz3xsgISOPdkn
	4dzPplZgYIZdvfIPVRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcEZ-00000001gYp-2lEU;
	Thu, 11 Sep 2025 08:00:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcEW-00000001gVi-3UGB
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 08:00:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 30DE14E40C6D;
	Thu, 11 Sep 2025 08:00:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3B30606BB;
	Thu, 11 Sep 2025 08:00:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19C18102F1CF1;
	Thu, 11 Sep 2025 10:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757577641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hr+BgcLInrDvy2HOmRqiItOPagbDlMwPRNd0wxjD3B8=;
	b=JyZAoI7jOjtoHkj24fpNvy8chFoP+TqIp+SBpZOyGl6Fkerue21JCjg/QEi1H4FMf+s3z/
	xQTjYB2xSD+HEaUncrRccM9kCBe2p4Y7+IWyX+q1bj0jCn7yqeXBkK6+xHlsk5zPjdhZeo
	CtNP6s6aEVakFLuhgW5dv0/Hd8usIyoSXlE4+AXXe//K1WHR2zcqMgX954ii5V+bGo8IgZ
	TRxYko9X+faMehAzza6sTUWkgkX27y/eQIj9QCYHxKIV0/vCING+oA9YbEFCcswTBsg24I
	Gqs4ZbXtZAt9F7zdHwsY9NlsY/Se5KA2wAv2wgreSo7B3vMnPL85RSneXy1+ZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Gabor Juhos <j4g8y7@gmail.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <stable@vger.kernel.org>,  Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
In-Reply-To: <454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com> (Santhosh Kumar
	K.'s message of "Thu, 11 Sep 2025 11:52:27 +0530")
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
	<175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
	<454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 10:00:39 +0200
Message-ID: <87348tbeqg.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_010045_004522_ED6B02E9 
X-CRM114-Status: GOOD (  10.17  )
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

SGVsbG8sCgpPbiAxMS8wOS8yMDI1IGF0IDExOjUyOjI3ICswNTMwLCBTYW50aG9zaCBLdW1hciBL
IDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+Cj4gT24gMDUvMDkvMjUgMjA6MjUsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIE1vbiwgMDEgU2VwIDIwMjUgMTY6MjQ6MzUgKzAyMDAs
IEdhYm9yIEp1aG9zIHdyb3RlOgo+Pj4gVXNpbmcgYW4gT09CIG9mZnNldCBwYXN0IGVuZCBvZiB0
aGUgYXZhaWxhYmxlIE9PQiBkYXRhIGlzIGludmFsaWQsCj4+PiBpcnJlZ2FyZGxlc3Mgb2Ygd2hl
dGhlciB0aGUgJ29vYmxlbicgaXMgc2V0IGluIHRoZSBvcHMgb3Igbm90LiBNb3ZlCj4+PiB0aGUg
cmVsZXZhbnQgY2hlY2sgb3V0IGZyb20gdGhlIGlmIHN0YXRlbWVudCB0byBhbHdheXMgdmVyaWZ5
IHRoYXQuCj4+Pgo+Pj4gVGhlICdvb2J0ZXN0JyBtb2R1bGUgZXhlY3V0ZXMgZm91ciB0ZXN0cyB0
byB2ZXJpZnkgaG93IHJlYWRpbmcvd3JpdGluZwo+Pj4gT09CIGRhdGEgcGFzdCBlbmQgb2YgdGhl
IGRldmljZXMgaXMgaGFuZGxlZC4gSXQgZXhwZWN0cyBlcnJvcnMgaW4gY2FzZQo+Pj4gb2YgdGhl
c2UgdGVzdHMsIGJ1dCB0aGlzIGV4cGVjdGF0aW9uIGZhaWxzIGluIHRoZSBsYXN0IHR3byB0ZXN0
cyBvbgo+Pj4gTVREIGRldmljZXMsIHdoaWNoIGhhdmUgbm8gT09CIGJ5dGVzIGF2YWlsYWJsZS4K
Pj4+Cj4+PiBbLi4uXQo+PiBBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCj4+IFsxLzFdIG10
ZDogY29yZTogYWx3YXlzIHZlcmlmeSBPT0Igb2Zmc2V0IGluIG10ZF9jaGVja19vb2Jfb3BzKCkK
Pj4gICAgICAgIGNvbW1pdDogYmY3ZDA1NDNiMjYwMmJlNWNiNDUwZDhlYzVhODcxMDc4NzgwNmY4
OAo+Cj4gSSdtIHNlZWluZyBhIGZhaWx1cmUgaW4gU1BJIE5PUiBmbGFzaGVzIGR1ZSB0byB0aGlz
IHBhdGNoOgo+IChUZXN0ZWQgb24gQU02MnggU0sgd2l0aCBTMjhIUzUxMlQgT1NQSSBOT1IgZmxh
c2gpCgpHYWJvciwgY2FuIHlvdSBjaGVjayB3aGF0IGhhcHBlbnMgd2l0aCBtdGRibG9jaz8gT3Ro
ZXJ3aXNlIHRoaXMgd2lsbApuZWVkIHRvIGJlIHJldmVydGVkLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
