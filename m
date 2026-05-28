Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9030CD5BD1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGEc7BzBz/RerL1xARRkWyUIm4yTMf00qh3rJAiiTJQ=; b=lcfdq0Tiz203YI
	b/zIYofATqBEYlqT3z6xVTTJG4vSh3yjLNW64mf0joxSscYFZJ+yLNGhWmXIMuVgJ5OARbtfiTF8K
	vNW2gc1MZVZXjHhn3m2s6E6AoihNNtt4JeJIUHF6YlwFpMRNMd2Jd+zaZ/POTz9Ek0T6SmYFrUcB0
	cZuhC1VT4GyWKMMK0CD1j5tOFf3n7lSl2RRHanpNDQ6MEm5tElI8RwwQnnzc5alJkzRlVK9V3B+Fm
	LnDoUwy/7/izvi8p7lA2vKQ6fh7r0hOfy8D/BFo4Ns3LgQb4vV4xR9kjBhP6H+Z9s4fnvEmHXaBGV
	/RjiBhzsz0YQxQ6P0YOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWFP-00000005PUN-0drz;
	Thu, 28 May 2026 08:37:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWFO-00000005PU8-246D
	for linux-mtd@bombadil.infradead.org;
	Thu, 28 May 2026 08:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XyhoOym185U8bM/2Sx/vYzZsdNn1dtBmX/QSmGBwvOM=; b=aQaKiKRyFTT40PNM1R+7dGMqqc
	XJQ0iBuhXZ8RxEIBTuXWtLuKrdzzV7lBVv1RmN9k8ZPPPAqTRB/B5gRPOOcVKUzERDtNr5S48jYxD
	ZAL7fO4J+VUYNBOpIJH9phwZLbdGWAV0pfbK8QQXajiELeBcSWD0PP2fMQ3rEMUvZM0rSfu/HuorX
	HYz/J6/VZmLLixXBr8l3zNLmeafBeJMeYtXOOAhKTNHNebf2cu/qrlRp8UaOzwJD6hStlCaGwhdLT
	soMRPB2av161qy5BV5fjj95CHPBHBtrmldlKQ7JgTpFZe5EqSXGVbfxdYZwBa9hVCDaMMXvN4xlAE
	HqFxz2rA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWFG-0000000Fr15-1coM
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 08:37:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BAE0C62447;
	Thu, 28 May 2026 08:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42FCF60495;
	Thu, 28 May 2026 08:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0822D10888C7A;
	Thu, 28 May 2026 10:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779957456; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XyhoOym185U8bM/2Sx/vYzZsdNn1dtBmX/QSmGBwvOM=;
	b=imtaRvqUKSRHQqYxUDFnvE0kGpIE8Kf9OzH/VWkVTDXaJwzC2vDmBdZQbLTq/iDibYFFYE
	G46ALjTa8MwyofgWN6heunt5UMx2M4aMFLSymBhKKH3dapjJ6oV2t19BkFPoyzcfWBRxW3
	IuI154IPDugGsngr0+tpZJMXAKG7inxtGh5gye6xhxXs7x2Q2BpcCY/tEE2C3LQmadgGwr
	48zyD6oPpaUaCsY1D7X/ji1OhrJhKJ99ZaKeFjgo/cRf3dPZgAPH6EtbNK7bGan+wlNGDQ
	Ss6TWhWGenjKPQsoVZYb8Xhl9lIeGIwat/ON0RMa8Eu/ZOr5h+j2uNL9fhBvAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 03/13] spi: parse two-element spi-max-frequency property
In-Reply-To: <20260527175527.2247679-4-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 27 May 2026 23:25:17 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-4-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 10:37:33 +0200
Message-ID: <87ldd4gcaa.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_093741_163331_B03624E6 
X-CRM114-Status: UNSURE (   6.03  )
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

Cj4gIAo+IC0JLyogRGV2aWNlIHNwZWVkICovCj4gLQlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5jLCAic3BpLW1heC1mcmVxdWVuY3kiLCAmdmFsdWUpKQo+ICsJLyoKPiArCSAqIERldmljZSBz
cGVlZDogYSBzaW5nbGUgdmFsdWUgc2V0cyBtYXhfc3BlZWRfaHo7IHR3byB2YWx1ZXMgc2V0Cj4g
KwkgKiBiYXNlX3NwZWVkX2h6IChjb25zZXJ2YXRpdmUpIGFuZCBtYXhfc3BlZWRfaHogKG1heGlt
dW0gYWZ0ZXIKPiArCSAqIGNvbnRyb2xsZXItc2lkZSBjb25maWd1cmF0aW9uKS4KPiArCSAqLwo+
ICsJbmZyZXEgPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMobmMsICJzcGktbWF4LWZyZXF1
ZW5jeSIpOwo+ICsJaWYgKG5mcmVxID09IDIpIHsKPiArCQlvZl9wcm9wZXJ0eV9yZWFkX3UzMl9p
bmRleChuYywgInNwaS1tYXgtZnJlcXVlbmN5IiwgMCwKPiArCQkJCQkgICAmc3BpLT5iYXNlX3Nw
ZWVkX2h6KTsKPiArCQlvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChuYywgInNwaS1tYXgtZnJl
cXVlbmN5IiwgMSwKPiArCQkJCQkgICAmc3BpLT5tYXhfc3BlZWRfaHopOwoKSSBkb24ndCBrbm93
IGhvdyB1c2VmdWwgdGhhdCBpcywgYnV0IEkgd291bGQgdXNlIGFuIGludGVybWVkaWF0ZQp2YXJp
YWJsZSBhbmQgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgb2ZfcHJvcGVydHlfKiBoZWxw
ZXIgYmVmb3JlCmZpbGxpbmcgc3BpLT5tYXh8YmFzZV9zcGVlZF9oei4KCldpdGggdGhpcyBmaXhl
ZCwKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
