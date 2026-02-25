Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DABFD3770
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVTsydXvkk1+L7WwmpUA9fDaTNXswLNs4KjKObu+NyM=; b=C8DiVdv8wz9rOM
	rdOBZVjMAIpZs+3mOnTiSswzNYkEn7QVvNAH5F6zmLakB3Gp89+RDLRX2upRsKyH3spTE44C2reCf
	iFy1BroVxHFzkAWRbV32yR/Q0VhE9CBQHilSN3ajmckEJOdRP4tzpYgPafJaI+6GXn5fg4CI+L6nZ
	3jisheyiPDdXTIT/d6E2sdwCxJ1TKoEhl0P8fvBd7RjgWKJAJoflC75hnAyIhcRoFZ6UOmqUks0qM
	tf02bELReuXiJRA1xTcfCY8Dfi16rOUjrC1VKZsN0Ecaev9uwuovC12HSq0u0CmcFCWuJGcwdQ69H
	bjupRRkyYhbSobZpfJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHkU-00000004WKV-0ESb;
	Wed, 25 Feb 2026 16:28:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHkR-00000004WK6-1Une
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:28:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF7074E4111B;
	Wed, 25 Feb 2026 16:28:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 977B85FDE6;
	Wed, 25 Feb 2026 16:28:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D09210369259;
	Wed, 25 Feb 2026 17:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772036905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=unylvViDZIZMB6gJn+HBSaPDT/t03+zotSysy379arM=;
	b=Ck6e7PuqiGvKeW6g8T2Xf4D3O2Om5KOMpuXCNoCEhyqQ4jEluUcXQVaBAbSCGjqgWRofZx
	MkBTFgeaFZSQ8kA7RyC0/LnXFc5rfZB2t9Rrdh+ThIIsZ+0E2eD4ouzOiS5JugbhVGEQnz
	sIohrQiAt6J+D3zwOJouL7eGBzPYKfupkmrL3yDuTsw2CfVZeKdE40UmqN0yUxPmYODSvR
	FyHxG9DIIJMdnAbFOL890LkgE2qKi33T2Dt/ALeoseAOwFG2l0DEe3XjcdTqUK5mLQtZtN
	n+vUqPyVJIKEI3RsNVr3jcDFw7JOfVrlhPYd+K0TqLh/C2JiBOyxebb9RgRn8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Akhila YS <akhilayalmati@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT schema
In-Reply-To: <CAL_JsqKSpsj1BQB1q_s1+j1FT+XLORgWRijMTNc4wTawKDZxQw@mail.gmail.com>
	(Rob Herring's message of "Mon, 23 Feb 2026 09:00:45 -0600")
References: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
	<CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
	<CAL_JsqKSpsj1BQB1q_s1+j1FT+XLORgWRijMTNc4wTawKDZxQw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 25 Feb 2026 17:28:22 +0100
Message-ID: <87fr6opz2x.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_082827_529556_49EE65F7 
X-CRM114-Status: UNSURE (   9.03  )
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

SGVsbG8gUm9iLAoKPj4gPiArICAgIGZsYXNoQGZjMDAwMDAwIHsKPj4gPiArICAgICAgICBjb21w
YXRpYmxlID0gInN0LHNwZWFyNjAwLXNtaSI7Cj4+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4+ID4gKyAgICAgICAgcmVn
ID0gPDB4ZmMwMDAwMDAgMHgxMDAwPjsKPj4gPiArICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0g
PCZ2aWMxPjsKPj4gPiArICAgICAgICBpbnRlcnJ1cHRzID0gPDEyPjsKPj4gPiArICAgICAgICBj
bG9jay1yYXRlID0gPDUwMDAwMDAwPjsgIC8qIDUwIE1IeiAqLwo+PiA+ICsKPj4gPiArICAgICAg
ICBmbGFzaEBmODAwMDAwMCB7Cj4+Cj4+IFRoaXMgaXMgbm93IGEgd2FybmluZyBpbiBsaW51eC1u
ZXh0Ogo+Cj4gTm93IHRoaXMgaXMgYSB3YXJuaW5nIGluIHY3LjAtcmMxLiBNaXF1ZWwsIHBsZWFz
ZSByZXZlcnQgdGhpcyBhcyB0aGVyZQo+IGhhcyBiZWVuIG5vIHJlc3BvbnNlLgoKQWtoaWxhIHN0
YXlpbmcgc2lsZW50LCBsZXQncyB0cnkgdG8gaGVscCB3aXRoIHRoZSBZQU1MIGNvbnZlcnNpb24g
ZWZmb3J0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlLzIwMjYwMjI1
LXBlcnNvLWZpeC1zcGVhcjYwMC1zbWkteWFtbC12MS0wLThlZjNkMjA1YWIzYUBib290bGluLmNv
bS9ULyNtOTA4YmY1OTUyNzg0NzI4NWMwNDQ3ZGQwMzc5YjNjODhjZmQ3MTg1NwoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
