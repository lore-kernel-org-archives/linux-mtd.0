Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C4C19F2D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kuz9wBEkDZf+GEVO58y7y5sGFJtQVgQL1sbeQG1jOHY=; b=RoM1GTw+ahdii7
	OcLIy0sFx9rMupA4Idbz1zWiTaBXDbMEdFPHxJ6OJcWTGsjXyAnX67c+9CP+DccsCtWhvYdhPhY9S
	OcfUSy252X/5BzZXKCmlPprbmaq1hr1jCbdhtr5qr7ojjnkf0dwC1GaCMUvzSao/Oi1omOirK+X51
	Rd6BXk/RBJsWpehI7zSbpA/hSuDEHf+kDRekBAE8yLPdFwtEfpdaMkwQqYhHE/LJ/hD3r2zxTxKAE
	d4RCnUl+u+TMRMZjT769kYpVEyEq87fw7dHF9oF9U0WDe71+gnaRQ6lKjlV3x6Ad5k/mLi9xO/LLz
	on4kMirdZY5hxMq5nGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLKoo-002ow8-9p; Tue, 09 Aug 2022 08:42:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLKol-002ov0-5a
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 08:42:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C714161315;
	Tue,  9 Aug 2022 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398D8C433C1;
	Tue,  9 Aug 2022 08:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660034545;
	bh=zYaOTja4AIBD/WAKQ57pm5wPsgAuCtuZjUduy4rsppI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NEE2o3kJElgOO5kP4ieMEncdEyYu2gZlpT66wmKLnQurYorKcfwC+SnRfrkLvsp6C
	 mjWZScnGZLtaeCkDKx5lF5+UVSMKhpyM6Tywx5lv1CsbFacpEMpyCa+ubQoUkhKwMH
	 Ls/kWVR9bfp4TKXcR7kViO9tgYjud+TSul5DjVfbfXWWXvuog1+Lnh1vTtiLA3IKSN
	 ap/FaqWE/myBrcf3iFhpyaD0myrWJHm4VlefQ9yWSuQy8hjVcwdhJcp5i4VCKWHQi+
	 Y3q/z0QVYeqHNuE85g6LyqTL4AKQ1c3K+NfrtNJxJmvbCHy+J9zscleS1Aj2HYbwxR
	 FimJxna+angiA==
Date: Tue, 9 Aug 2022 10:42:00 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsl_elbc: Fix none ECC mode
Message-ID: <20220809104200.3dca43ef@thinkpad>
In-Reply-To: <20220707184328.3845-1-pali@kernel.org>
References: <20220707184328.3845-1-pali@kernel.org>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_014227_295409_07BB3AF6 
X-CRM114-Status: GOOD (  12.60  )
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

T24gVGh1LCAgNyBKdWwgMjAyMiAyMDo0MzoyOCArMDIwMApQYWxpIFJvaMOhciA8cGFsaUBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQ29tbWl0IGY2NDI0YzIyYWEzNiAoIm10ZDogcmF3bmFuZDogZnNs
X2VsYmM6IE1ha2UgU1cgRUNDIHdvcmsiKSBhZGRlZAo+IHN1cHBvcnQgZm9yIHNwZWNpZnlpbmcg
RUNDIG1vZGUgdmlhIERUUyBhbmQgc2tpcHBpbmcgYXV0b2RldGVjdGlvbi4KPiAKPiBCdXQgaXQg
YnJva2UgZXhwbGljaXQgc3BlY2lmaWNhdGlvbiBvZiBIVyBFQ0MgbW9kZSBpbiBEVFMgYXMgY29y
cmVjdAo+IHNldHRpbmdzIGZvciBIVyBFQ0MgbW9kZSBhcmUgYXBwbGllZCBvbmx5IHdoZW4gTk9O
RSBtb2RlIG9yIG5vdGhpbmcgd2FzCj4gc3BlY2lmaWVkIGluIERUUyBmaWxlLgo+IAo+IEFsc28g
aXQgc3RhcnRlZCBhbGlhc2luZyBOT05FIG1vZGUgdG8gYmUgc2FtZSBhcyB3aGVuIEVDQyBtb2Rl
IHdhcyBub3QKPiBzcGVjaWZpZWQgYW5kIGRpc2FsbG93ZWQgdXNhZ2Ugb2YgT05fRElFIG1vZGUu
Cj4gCj4gRml4IGFsbCB0aGVzZSBpc3N1ZXMuIFVzZSBhdXRvZGV0ZWN0aW9uIG9mIEVDQyBtb2Rl
IG9ubHkgaW4gY2FzZSB3aGVuIG1vZGUKPiB3YXMgcmVhbGx5IG5vdCBzcGVjaWZpZWQgaW4gRFRT
IGZpbGUgYnkgY2hlY2tpbmcgdGhhdCBlY2MgdmFsdWUgaXMgaW52YWxpZC4KPiBTZXQgSFcgRUND
IHNldHRpbmdzIGVpdGhlciB3aGVuIEhXIEVDQyB3YXMgc3BlY2lmaWVkIGluIERUUyBvciBpdCB3
YXMKPiBhdXRvZGV0ZWN0ZWQuIEFuZCBkbyBub3QgZmFpbCB3aGVuIE9OX0RJRSBtb2RlIGlzIHNl
dC4KPiAKPiBGaXhlczogZjY0MjRjMjJhYTM2ICgibXRkOiByYXduYW5kOiBmc2xfZWxiYzogTWFr
ZSBTVyBFQ0Mgd29yayIpCj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVs
Lm9yZz4KClJldmlld2VkLWJ5OiBNYXJlayBCZWjDum4gPGthYmVsQGtlcm5lbC5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
