Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56593E77188
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2025 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVU8veHgZSuzv3RaY0S/sR1lUjTpJCfqe3w3LKy/1ak=; b=Jccaqli4/Q25ca
	Jq7kHUdZu8mS6fUgooOU1RvL9xTzvDg2k02riYFhsv8XyWPvozJEEfIHvaKuedLq5V8ScgFtT2SdF
	G5TOEz+g20+uBR/+Oc84Kh2GqtJZtkWdwwiq0nBUIwgajDbRyHNfmAOKL4vORTjfFeFqB0BkutZBv
	XNlamSGPQsbOqKMfGWLVWWgyHSyky+XzX8gOATcAGajXO+a6RMA+wNhynptPBMqObWgM6qghTp1Rg
	fYpwPuu9LsVbEELOeQwFpkcd2dRgPbhSWcWXx3zbkQoF00yoxskbIRMpHpdnMfZ4wHX6xiQncWfHV
	GjUD7Oeaj7kz7jltBCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVan4-00000009Wmt-3DaQ;
	Wed, 08 Jan 2025 18:28:26 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVan1-00000009Wm4-2aOO
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jan 2025 18:28:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D005BC0003;
	Wed,  8 Jan 2025 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736360901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j05pPMQy2e1Sgevc6wgLUtau/lL5pO+SWHJYMihiHlY=;
	b=oj/V4FyCKzvPffbGpe7nUO/mtEcPKZdV7cNtwp5tgYpx4c9XlVZhf/pEnkUI8xeAXf09ml
	ayAxVWdVwcFwBsQAqfG55CAX3vwhQFt5/kZl2jCzLbMTBQ5sKZDL8bNv59TaoN6drRmo6w
	cyvgzoZUAu53U1eMhK8aebE8JXcBovfgPEwz2YQmvrJkEHjblx3NIdLRAoIndFHdllHEzg
	BzhEeznOuEp2AfWn0SyQfbYipuIgpfw05xD1EE2AsSTtbsqtK3ylbYndsK2Mma0NaG32W5
	v7zSBUQKC/Zg4vgvocL4wcd/y300sQrS66dUdEnc4lQSM2uBYZ7JiVZYcDTG9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Christopher Cordahi <christophercordahi@nanometrics.ca>
In-Reply-To: <20250103-patch-nand-poll-v3-1-c85ca7bc54bd@bootlin.com>
References: <20250103-patch-nand-poll-v3-1-c85ca7bc54bd@bootlin.com>
Subject: Re: [PATCH v3] mtd: rawnand: davinci: Reduce polling interval in
 NAND_OP_WAITRDY_INSTR
Message-Id: <173636090079.2572698.13439803731709911552.b4-ty@bootlin.com>
Date: Wed, 08 Jan 2025 19:28:20 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_102823_796212_858C2D4E 
X-CRM114-Status: UNSURE (   7.14  )
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

T24gRnJpLCAwMyBKYW4gMjAyNSAwOToxMzo0OSArMDEwMCwgQmFzdGllbiBDdXJ1dGNoZXQgd3Jv
dGU6Cj4gRm9yIGVhY2ggTkFORF9PUF9XQUlUUkRZX0lOU1RSIG9wZXJhdGlvbiwgdGhlIE5BTkRG
U1IgcmVnaXN0ZXIgaXMKPiBwb2xsZWQgb25seSBvbmNlIGV2ZXJ5IDEwMCB1cyB0byBjaGVjayBm
b3IgdGhlIEVNQV9XQUlUIHBpbi4gVGhpcwo+IGlzbid0IGZyZXF1ZW50IGVub3VnaCBhbmQgY2F1
c2VzIGRlbGF5cyBpbiBOQU5EIGFjY2Vzc2VzLgo+IAo+IFNldCB0aGUgcG9sbGluZyBpbnRlcnZh
bCB0byA1IHVzLiBJdCBpbmNyZWFzZXMgdGhlIHBhZ2UgcmVhZCBzcGVlZAo+IHJlcG9ydGVkIGJ5
IGZsYXNoX3NwZWVkIGJ5IH4zMCUgKH4xMCUgb24gcGFnZSB3cml0ZXMpLgo+IAo+IFsuLi5dCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBkYXZpbmNp
OiBSZWR1Y2UgcG9sbGluZyBpbnRlcnZhbCBpbiBOQU5EX09QX1dBSVRSRFlfSU5TVFIKICAgICAg
Y29tbWl0OiA2ZGYyZDk1NTNlMTY4ZmUzMmRkNDk4NzNkZDI1NGE2M2NhOTEzMzA3CgpQYXRjaGUo
cykgd2lsbCBiZSBhdmFpbGFibGUgd2l0aGluIGhvdXJzIG9uOgptdGQvbGludXguZ2l0CgpLaW5k
IHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
