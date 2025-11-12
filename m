Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB667CCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9qLnFhjaEKwn1vinaoLJdFjvRmNF8Crvt1J3ZnDkQ0=; b=14ZarrGqClZkRy
	3hgGFLLD3fTM8V1e+M88Q57QKLXxls4tcOty+xsRSpZg58nb6BHQZr6e1uihGpTjiUnnEXFWnx30P
	D8zlgSCjA3fZCNDDtFnsIhrRWSvk8vf+A4QLyjSLL4ScGXSt5/ROa+HFasnVsTeza0qvXeSVb/Jq3
	n4gHElTT4O52CIkKO8PBUXC7l2KUC+RoMS88tJKkt4mG/vNkiLmDq1+g+qES2pr0rg4Cxvygx0wNy
	7RXp9A1O0JommTie27x/V7g2ILSEQ2XDc4v141iGT69lN263Fi0VUWvqvjm0Rbro3Xm7VrjfVZSM8
	jqHTCc9g4NRVvvevHDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAlx-00000008poh-0fUd;
	Wed, 12 Nov 2025 13:20:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAlt-00000008pn9-2VuB
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 13:20:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3A03F4E41667
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 13:20:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 022906070B;
	Wed, 12 Nov 2025 13:20:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 533E2102F17ED;
	Wed, 12 Nov 2025 14:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762953622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J3GPCyka1JrH8xTfmJa7EWc+LLH2H9CUm6CgICF/k0Y=;
	b=tKjdv4xa+/xNCd9tfVthaZ4rJSsc8mIjhW/2SSt7MHd8w/R2sCLLL3YRhm50gLxkKzI2FX
	1rU6LA8Z/l6GpofcGTlyRcUlUQMBtAghoD1uOk40pWZ/dFtF9CjUgBGZZbnoLy13+8+KHv
	xKYm/L2LP8h5GAP/FrIPRcUuwA6RokE1+FKkjN6NGEgMGqBYs5QVkii6LBtUtPPE85e5FQ
	MX2ksmC2dpoYez0F935LGdKKFGUSAB3H+/gnHPU026iDtFwzRjXWvoCDrp1wzQhs/7jIQn
	OKoO2oJGFabYh4YrMeCbd5r5BQ2UBUL8ziafg8A7eNlLNDnE4ZQ2+jUqQU7oaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <871pm3iegf.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 12
	Nov 2025 14:10:40 +0100")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
	<mafs0ecreontu.fsf@kernel.org>
	<4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
	<mafs05xcpo9sz.fsf@kernel.org>
	<26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
	<mafs0ikgnn07u.fsf@kernel.org>
	<d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
	<33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
	<92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
	<871pm3iegf.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 12 Nov 2025 14:20:19 +0100
Message-ID: <87v7jfgzfw.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_052025_776270_FC380D99 
X-CRM114-Status: GOOD (  12.88  )
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

PiBXaGVuIHlvdSBydW4gIiMgZmxhc2hfbG9jayAtaSAvZGV2L210ZC9ieS1uYW1lL3NwaTAuMSIs
IHlvdSBwcml2aWRlIG5vCj4gc3RhcnQvbGVuZ3RoIHZhbHVlcyB0byB0aGUgY29tbWFuZC4gSGVu
Y2UsIHRoZSBkZWZhdWx0cyBhcmUgcGlja2VkOiB0aGUKPiBlbnRpcmUgZGV2aWNlIGlzIGNvbnNp
ZGVyZWQgZm9yIHRoZSBjaGVjay4gVGhlIHRvb2wgYXNrcyB0aGUga2VybmVsCj4gd2hldGhlciB0
aGUgcmFuZ2UgMC0weDdmZmZmZmYgaXMgKmZ1bGx5KiBsb2NrZWQuIEFuc3dlciBpcyBubywgaXQg
aXMgbm90Cj4gZnVsbHkgbG9ja2VkLgo+Cj4gSW4gdGhlIGtlcm5lbCB0aGVyZSBhcmUgdHdvIGhl
bHBlcnMgZm9yIHRoYXQsIGFuZCB0aGV5IHdvbid0IGdpdmUgeW91Cj4gb3Bwb3NpdGUgcmVzdWx0
cyBhbGwgdGhlIHRpbWU6Cj4gLSBpcyBsb2NrZWQ6Cj4gICAgIC0gcmV0dXJucyB0cnVlIGlmIHRo
ZSBnaXZlbiByYW5nZSBpcyBmdWxseSBsb2NrZWQKPiAgICAgLSByZXR1cm5zIGZhbHNlIG90aGVy
d2lzZQo+IC0gaXMgdW5sb2NrZWQ6Cj4gICAgIC0gcmV0dXJucyB5ZXMgaWYgdGhlIGdpdmVuIHJh
bmdlIGlzIGZ1bGx5IHVubG9ja2VkCj4gICAgIC0gcmV0dXJucyBmYWxzZSBvdGhlcndpc2UKPgo+
IFNvIGlmIHlvdSB3YW50IHRoZSB0b29sIHRvIHRlbGwgeW91ICJ5ZXMiLCB5b3Ugc2hvdWxkIGlu
c3RlYWQgdXNlIHRoZQo+IGV4YWN0IHJhbmdlIHlvdSBsb2NrZWQgKDEwMjQtMjA0Nykgb3IgYW55
IHN1YnNldCBvZiBpdC4KCkkgZm9yZ290IHRvIG1lbnRpb246IEkgZG9uJ3QgbGlrZSB0aGlzIGlu
dGVyZmFjZSBiZWNhdXNlIGl0IGlzIG5vdCB2ZXJ5CnVzZXIgZnJpZW5kbHksIGJ1dCB0aGlzIGlz
IHVBUEksIHNvIHNldCBpbiBzdG9uZS4gQXMgcGFydCBvZiBteSBqb3VybmV5CmluIHRoZSBTUEkg
Tk9SIHN3cC5jIGZpbGUsIEkgd3JvdGUgYSBkZWJ1Z2ZzIGludGVyZmFjZSB0byBoZWxwCnZpc3Vh
bGl6aW5nIHdoYXQgaXMgYWN0dWFsbHkgbG9ja2VkLiBJdCBpcyBhYnNvbHV0ZWx5IHRyaXZpYWwg
dG8gZG8gYW5kCmhlbHBzIGEgbG90LiBXZSBtaWdodCB3YW50IHRvIHVzZSB0aGF0IGZvciB3cml0
aW5nIHNvbWUga2luZCBvZiB0ZXN0aW5nCnByb2NlZHVyZSDigJQgSSB3aWxsIHNoYXJlIGl0IHNv
b24uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
