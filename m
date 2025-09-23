Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2722CAC5A5
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Sep 2025 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIjz2+ESNXJUgRvuhET7Nlo6XB0FS3hfwrusctfN0LA=; b=AuJshYehvkT/LE
	QeXCJAAirHjJ4Zs5fSYEuwEbcYh95q34p6nlRyRUwdO/ICQ7mmSgAR/iaMneDmsGqFv5UADnEEigN
	X9blKGgZgNPB28NGOqQrMWxyOlDAPXexasi4w7fOCbHnNeiAs5dtph5y20ouc0vsLpWs32HRb99vZ
	EFppbA0ntRgFqUdp4u3V4id+R0gEv4YkwBVlCFG7UkZ86VY1JqVcF/51HtvJfG3Fth5aLpjKVzNnj
	WpVi1sy2hh4ZNMbNJdfxFE7QgjVEI+TrhBo8599a6kDCn6duNetTjdlPldFKEYR71G9EpKN3p2CxI
	BitMJn8+FLfqkuvaMrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v16SX-0000000EL1H-3WNj;
	Tue, 23 Sep 2025 17:05:45 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v16SU-0000000EL0v-3VGV
	for linux-mtd@lists.infradead.org;
	Tue, 23 Sep 2025 17:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758647121; x=1759251921; i=markus.elfring@web.de;
	bh=gJrRQyS2st53DF02SP9J0cVN1Q+EovZ3G/MnQ9zxXp8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Av7wUKHHJfFEv/By+ux+Cc589LoMXKkX13auL6WpDfODSzbhBSJMyrAD1J/ZehlV
	 RI5aHnlN6fHwzLB9UykzvAestp4fh56pizBXytRIRTKQizwjNo+PrMccmDSv+5+5+
	 mJX/7u+JW2LDBHMWQRwSXF/gjpATC8z5mUbsOaEKOn+I0G/WKoJ8XLmrj79UbtNlG
	 ltbcQpvQ4Hbk/omAm9UdGqXnKWD2waJ16I9tcBueHQ2Ot4FO5ad8FVQwG1Eg5REmh
	 hwySjCXcb+zkq19F6xCBTgXJb/GaBW8irKh4mjENQSOq1yLDzLJ+Wqq8nXQm7lTYG
	 gHqIu6hf6z7zQObatg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZSBQ-1uoP830wR4-00IvSg; Tue, 23
 Sep 2025 19:05:21 +0200
Message-ID: <1341dc6b-49da-44f9-8b57-6828a64114fe@web.de>
Date: Tue, 23 Sep 2025 19:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, linux-mtd@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250922152204.15702-1-johan@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: omap2: fix device leak on probe failure
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250922152204.15702-1-johan@kernel.org>
X-Provags-ID: V03:K1:2nlxYJH0jsZJHKoqIG3f6BypV9k21APUf2if5AcgM4Lb6sIN9a4
 zdzOG0D3XJVBJZbW0kw1ZIX8hilPyeutNtHPgOaerXiMT31WOL3oBMau/Z0QlMMiHZrcgHS
 DmRixXAuW5s2EJuSB++hs+CB+5Gn2COrqo5YKokQp1TCTrWfIWrvOQHx/LvRdY0PmU2e5Lm
 0/T/krr75A8oh6wkQyCcA==
UI-OutboundReport: notjunk:1;M01:P0:fHhFcUEn/NU=;7SB4XwAjbnv7wGEmkA+aEi/nCKy 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_100543_248342_7FFB5C34 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

4oCmCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYwrigKYKPiBAQCAtMjA1NCw3
ICsyMDU0LDggQEAgc3RhdGljIGludCBvbWFwX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCkKPiAgCQlicmVhazsKPiAgCWRlZmF1bHQ6Cj4gIAkJZGV2X2VycihkZXYsICJJ
bnZhbGlkIG9yIHVuc3VwcG9ydGVkIEVDQyBzY2hlbWVcbiIpOwo+IC0JCXJldHVybiAtRUlOVkFM
Owo+ICsJCWVyciA9IC1FSU5WQUw7Cj4gKwkJZ290byBlcnJfcHV0X2VsbV9kZXY7Cj4gIAl9Cj4g
IAo+ICAJaWYgKGVsbV9iY2hfc3RyZW5ndGggPj0gMCkgewrigKYKPiBAQCAtMjA4MywxMCArMjA4
NCwyNCBAQCBzdGF0aWMgaW50IG9tYXBfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwKQo+ICAJCWRldl9lcnIoZGV2LAo+ICAJCQkiTm90IGVub3VnaCBPT0IgYnl0ZXM6IHJl
cXVpcmVkID0gJWQsIGF2YWlsYWJsZT0lZFxuIiwKPiAgCQkJbWluX29vYmJ5dGVzLCBtdGQtPm9v
YnNpemUpOwo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJCWVyciA9IC1FSU5WQUw7Cj4gKwkJZ290
byBlcnJfcHV0X2VsbV9kZXY7Cj4gIAl9CuKApgoKTWF5IHN1Y2ggYW4gZXJyb3IgY29kZSBhc3Np
Z25tZW50IGJlIG1vdmVkIGJlaGluZCBhbiBhZGRpdGlvbmFsIGxhYmVsPwoKUmVnYXJkcywKTWFy
a3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
