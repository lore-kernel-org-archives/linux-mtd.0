Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C395CE7CFD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lejyCUmGC7HcBeQBkPI5Ccm3xKcsBsBDCFA2JA9+2c0=; b=s3VjlUOVy703zW
	gwTCyJRJWcBHXLLjF82833vEMb+HQBWEW+ck7rZzsJyKBrCQ80DPR+dHEtk24XtfhmWPxptsk95lO
	cmS8kclhSYAXGCFyZaKXLg7gz3yQIwXzvD4hGYArvPrGNH5uElPIIDIJp9N7nxKn/FV0Ezzw6i1Jv
	btmrmqDVQYPx/XEc4yhEPUaxNhzFpMzG+Njfqktg/4ZY7IEv88AR6YASFnvAjF0mqMnxbUYwUzbS2
	w24j/wWAoanQDLznwGb47jhySQDW5bUchuORFwqc9WvslCFqf4XOY3jtdCE0q1MZ9X87Oqm0P7eo/
	9MEdcepmFJAtzcXRgzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZEv-00000002El0-48up;
	Tue, 01 Oct 2024 09:32:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZEs-00000002Eiv-3GC9
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 09:32:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25A25E0004;
	Tue,  1 Oct 2024 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727775132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2VQWjCZzBixHiG6aR4P+UDOCoeCcMrq4XaxHaqteh4=;
	b=lrLvu/SHVU3hhgKiXxZdDx59akLuAM0v2CGkjIdj79RUC9RBkM3jB1GhRDQ3uIFpQQTshx
	4TozDTZWDs4lXWxzKHLOw/AUSrUYfRbKopbw0AfR3T/QWmwFcR2/+qjXmzFnYL/0M6Eaga
	fCn7rlkXPAJm6UqRQJRe6vuPNSfistk6MG7bFlg03ybcHiVU8C7tvpOedobkBgXSxksHxw
	/7rgnH/vgO9UHotE4jRC6bDF0Cj5yaNI8PWeUm6yMPaL89eAE/UVQaWFHjPZD3rkcEVD+Q
	P8FfcnU1gh3+Gp9GjjhL741HyOn6W+I7CBbqinwG4ocf2JWJXQiGDE+sQ3Rkyw==
Date: Tue, 1 Oct 2024 11:32:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Michael Walle <michael@walle.cc>, "Mark Brown" <broonie@kernel.org>,
 Chia-Lin Kao <acelan.kao@canonical.com>, "Md Sadre Alam"
 <quic_mdalam@quicinc.com>, Ezra Buehler <ezra.buehler@husqvarnagroup.com>,
 Sridharan S N <quic_sridsn@quicinc.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Alexey Romanov
 <avromanov@salutedevices.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@salutedevices.com>
Subject: Re: [PATCH v2 5/5] mtd: spinand: esmt: OTP access for
 F50{L,D}1G41LB
Message-ID: <20241001113210.3fcab87d@xps-13>
In-Reply-To: <20240827174920.316756-6-mmkurbanov@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
	<20240827174920.316756-6-mmkurbanov@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_023214_974450_DFE3C7E2 
X-CRM114-Status: UNSURE (   6.04  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUdWUsIDI3
IEF1ZyAyMDI0IDIwOjQ5OjAzICswMzAwOgoKPiBTdXBwb3J0IGZvciBPVFAgYXJlYSBhY2Nlc3Mg
b24gRVNNVCBGNTBMMUc0MUxCIGFuZCBGNTBEMUc0MUxCIGNoaXBzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hcnRpbiBLdXJiYW5vdiA8bW1rdXJiYW5vdkBzYWx1dGVkZXZpY2VzLmNvbT4KCkFsbCBt
eSBjb21tZW50cyBpbiA0LzUgYXBwbHkgaGVyZSBhcyB3ZWxsLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
