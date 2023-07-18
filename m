Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F92EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kFJEHDkPjRMSkpVkWQuM0tnfiykea4b9rDGcixp7cc=; b=m9bHBiCpOYi2e3
	8+IOjTbBLEjvnNG36BninBY/vEqXsrGwJvetnOXZqbw/hjmrRQ+nJOxhnt2Dkh6AuR3IpAN89bffr
	oq5qgoh/xlncdySmnX2P4Bcbrkgvr7szTgI7QxvxGiNePiCt8jDHZt3R3wYCp6BHd8NpgQQG8qqem
	MNjrDvXTv2IFO5B5NgqqSVM+cbj/OV/ou+fpbQ0E185pKF8VBIdhzdgLHbeIftq4WDInmYwWyatEz
	H9vC2ID/ShzL9+c2z6/HpzuQG21Sx4PssYOzeoqg6uhnJzjbyA2c0MQdfALhUlK2RPuuvKU+KtpWP
	3NfVFNfUGePC+Fr/vvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0IJ-005X8Y-2z;
	Wed, 19 Jul 2023 06:04:16 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0IH-005X7d-2n
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=59ojG0gIJMBH787QYkyMNNJwFmMukWGw4ED2w5fU/lw=; b=laEKF5seoDpAI/6G8sncV186fK
	510uQikfwfKp6KiI2OSoeuZGZwBCJkwSm6IU1mcBHNrOrB91kHLN19one2McPDgJLMd9KL4piVHKi
	FzbjgzWkkAw2WvNUQGzNjK8OEUYXUj1pmzRwLQyny/CaxvWfiPECa8Tr4J514SNplZHn/RoJ4i1OA
	76LoBdnjc5mOtypiGWeLPkjrq56wXdrcNlyEKD9HJFG2cCxQVsLIgLjKPb9KaLl69v8y7Uv4QKZ2N
	K6cP5fi3j9ljCo4grSr6aZs6t1ZxkUzCQLRAeRSGpGtEDCIPNZlm4gEFPG/9WIpsPykJLjbylHgml
	1MuGcqPQ==;
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjMq-00BVTi-36
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 11:59:50 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5704fce0f23so58971867b3.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689681493; x=1690286293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59ojG0gIJMBH787QYkyMNNJwFmMukWGw4ED2w5fU/lw=;
        b=uVHPntbViJbo4FXUJwPfzVmJ/yERr5p349TtlmHMxs3snOTfUAUq4P7O6zQn0tAJMH
         e0J6puyQbNPjrvu2ZalcoW+qRx3WyWbS4h5nvKjkbLqKmthGRBp0ioafrKE3lUIBxPKr
         hu7AQzOPk7e85nbuQEL666+eBjqPghmCIeR9txiR6w0HMuGMF+TCulfUnpnCOh7tsLzE
         9HFd3oHCTCyQ9fUfjMwC7VDQIQR865BA6XbJYY963/YjiedLGqD+Ho2gLjie6K7kDtTc
         1fBYRsHmoEFO/cwKBhmDJwLAqmoQX8mCrPTgFs6JbX2DOTERftyRBv+UHAOXxU1lxrrV
         HfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689681493; x=1690286293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59ojG0gIJMBH787QYkyMNNJwFmMukWGw4ED2w5fU/lw=;
        b=koQBLYM/MRBGmfAKxKsd1HV9y7BD45FpsTjZmB2yFd9YuF7vfwtwVV/jd9iVcryZpl
         khRxFTCNI7Az262WARMOlS/Lx1Kzm7EkdJH2rOUXX53otrfNDsRkkxzbth3vbdA+Yq7U
         2Om9eW5Q3B9/DMSUg448Xbx8j9fHboXBRk/9nzuYsvRYfoWIOPPoc+llnTU0HeQUsaoC
         1A5EvbU69C4XX+T2Y8Ixm2ctmlXcIP/6jgc5kyGuSps6Ntjl3NuaiMnsyT1mcJRtlbaG
         wAoC3BRbTeh6GAiEPBFQ0iMSsG49W4oEXoeDVFy0r5X1vqmdvHgd46YX1nVfKcRCn7Qb
         RuLA==
X-Gm-Message-State: ABy/qLZ6tc6xxZ5oHiQIsyMH4G0HLqf3wwu7fm+E7z64deS+4O8pGS+W
	AH2R1WJxAb9HEEfkB+w58TwHHCevhaoZnjwltvBNDQ==
X-Google-Smtp-Source: APBJJlG4qHhUdXHN3k0Odt/kIDusXhPoRU4F4Y7yU9rMcm8SVfcidsaPlWaChO7XfVB9BAR4jvh6BOmTHOxKGY0eKKc=
X-Received: by 2002:a0d:dd45:0:b0:576:98e0:32a6 with SMTP id
 g66-20020a0ddd45000000b0057698e032a6mr15306374ywe.14.1689681493112; Tue, 18
 Jul 2023 04:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
 <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org> <0525440a652854a2a575256cd07d3559@walle.cc>
 <d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org> <e642ff27fd0bc0f1f0e293972145f680@walle.cc>
 <2d71326c-023e-69af-9337-62672f50fed9@linaro.org> <62083227d40d7b631c2eeac1e40c6b56@walle.cc>
 <ef557792-144e-12ef-ce14-f98982b608dc@linaro.org>
In-Reply-To: <ef557792-144e-12ef-ce14-f98982b608dc@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jul 2023 13:58:01 +0200
Message-ID: <CACRpkdY_3Ecw06ECVx3=xB9G1zUBDqmjuhwbaS8k3+RKNErwnA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_125949_148950_495C8D99 
X-CRM114-Status: GOOD (  13.85  )
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

T24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTE6NDfigK9BTSBUdWRvciBBbWJhcnVzIDx0dWRvci5h
bWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBIaSwgTGludXMsCj4KPiBPbiA3LzE4LzIzIDA5
OjMyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+ID4gRldJVywgSSdtIGZpbmUgd2l0aCB0aGUgcmVt
b3ZlZCBub19zZmRwX2ZsYWdzIGlmIElORk8oLCAwLCAwLCAwKS4KPgo+IFdlJ2xsIG5lZWQgYSB2
NSB3aGVyZSB5b3UgdGVzdCBhZ2FpbiB0aGUgZmxhc2ggd2l0aCBtdGRfdXRpbHMsCj4gYXMgd2Ug
d2FudCB0byBnZXQgcmlkIG9mIG5fc2VjdG9ycyBhbmQgc2VjdG9yc19zaXplIGFuZCBpbnN0ZWFk
Cj4gZGV0ZXJtaW5lIHRoZW0gZnJvbSBTRkRQLiBXZSBhZ3JlZWQgdGhhdCB0aGUgZmxhc2ggZW50
cnkgc2hvdWxkCj4gYmUgZGVmaW5lZCB3aXRoIHRoZSBmb2xsb3dpbmcgcGFyYW1zOgo+Cj4gICAg
ICAgICB7ICJ3MjVxMTI4IiwgSU5GTygweGVmNDAxOCwgMCwgMCwgMCkKPiAgICAgICAgICAgICAg
ICAgUEFSU0VfU0ZEUAo+ICAgICAgICAgICAgICAgICBGTEFHUyhTUElfTk9SX0hBU19MT0NLIHwg
U1BJX05PUl9IQVNfVEIpCj4gICAgICAgICB9LAoKUm9nZXIgdGhhdCEKCkkgc2VudCBhIHY1IHdo
aWNoIGRvZXMgdGhpcywgdGVzdGVkIGJ5IHRha2luZyB0aGUgcmVwb3J0ZWQKc2l6ZSBpbiBkbWVz
ZyBhbmQgZGl2aWRlIGJ5IHJlcG9ydGVkIChjb3JyZWN0KSBlcmFzZWJsb2NrIHNpemUgYW5kCml0
IHJlc3VsdHMgaW4gdGhlIHNhbWUgbnVtYmVyIG9mIHNlY3RvcnMgYXMgd2VsbC4KCkkgcHV0IHRo
ZSBkZXRhaWxzIGludG8gdGhlIGNvbW1pdCBtZXNzYWdlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
