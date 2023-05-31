Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F2BC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JW5FOGBrhVW4FAcNv5XkZfvzBksH4PmIkHOrE1p32A=; b=ESZl+77UD+SY5z
	TSJ87VrT09v8ywTFOcaqKErjQvUD7mQ/Wp+6VZfQ0T53jndhdMbBqrJTX8oXvMljH/640qZ3QUrA/
	xO9wmyFM4/RkQGvVatIyoTrP7fNPXpeKodYyFLgom8gsvmxxOAnmVArGitkgJ7LXGPcMRdZkCYwK4
	DcvnoQ3X2HY47k7US2z7yBPwxxMRGGfFhujsH0MkDvaBCTy+RKn9x2k6+9oC0CjaITF2Thw+qZSfd
	oX5aAY5cjXMcGClw+dASiEW8ZDa6uVHLEU4zbQRlt540VCUJdIZTkGRRPXcA+jTl/v2JgnLoJLnSS
	YOFN8d3l1gXJv6v9u2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MAc-0001Ry-0M;
	Wed, 31 May 2023 13:47:22 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MAZ-0001Pb-0Y
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 13:47:20 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6af7d6f6f41so2792179a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 31 May 2023 06:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685540835; x=1688132835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DfhG0Q3gMaGiz1oUZ1CUvT5qFw00+9M1pmtFYLj+RU=;
        b=dqLPwv5j2z3Vhho5MAppbyUqGkwMjNrvH0eDpCvGe5YfFetld+qUvgjGA5rG2cggyt
         UwmniPk8SlxEuuGOP0JPWw5fY2MgtrOUoft92JCeOSWoNPYxJVW4WTKxa+Cxg7K6voyF
         A79IkTgru1RviQ0Fl2+R8RrU97TwVSyhM97zwDyBzVX6n6Z0SxsPccKMEK/6KKCZ3jCS
         B3t14G2ooRcoKasdThYhX6ONpuImgd4rXjPC57AODFXeCyxWXRomgn9Mopd/uZEcqAGI
         y29OMa6LAFvVBdyEpPBJUqTlJGoRZ2NSiCBxFurknhpJb/CZL84dsuz9ur1PY/onyEoo
         Hwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685540835; x=1688132835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DfhG0Q3gMaGiz1oUZ1CUvT5qFw00+9M1pmtFYLj+RU=;
        b=G0ccHHBORgBXNfRzF9D/UFmaMHe3Biux2tHkCoowC0sJadBkfbFTzKy09JF0Yzs9br
         RPJDkMqO6Oa/RLPpYE6LAemPRDwOtmsgHPs22OsvmvoYTCbE2mEGAM//Oxd72CsZGd34
         wMHh5oajzyrQRiBQ4CkZQSsBFIRFnBswmOnPxzsdqgokbCzV8seRLipc9+rJs91K6yHI
         jLpNqkpOgID78KKzJHFTOHICYEHENM5ROdDNdnwjxqf8zMi+MDIId8hdjKBDhhY7+JEO
         jCPHOR5eDQ/5YTyN7DnfydffXKYy9Gp2k1THJzO9jeUatifhv9E5QAri30F1Xspbeusd
         5Iew==
X-Gm-Message-State: AC+VfDzeP676c6w95rmkLyg6CBWoixtKIz9TCgOE8/wMFpqoGhT9hq5Z
	9Fl0K6abc0XhoGKrjuTkc3KCILw38UfRd5tBgQxyFA==
X-Google-Smtp-Source: ACHHUZ4hKtpvj8p7/+n8MqTIwYbEZXevLkSDowazoFroPtu/fSh2pBZ5BHKsXMZN7OFAx4rIKvKyS4fqeWC+OnnhbFU=
X-Received: by 2002:a05:6358:9328:b0:123:3ec6:f99e with SMTP id
 x40-20020a056358932800b001233ec6f99emr855749rwa.1.1685540834294; Wed, 31 May
 2023 06:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230530205146.3200321-1-linus.walleij@linaro.org>
In-Reply-To: <20230530205146.3200321-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 May 2023 15:47:03 +0200
Message-ID: <CACRpkdY8WwUVW_kmVtBqytq5EbYH5P0ZWQKndegS-0NcP+z0=Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: Do not check for OTP outside device
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <npitre@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_064719_223081_D236B88B 
X-CRM114-Status: GOOD (  11.15  )
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTA6NTHigK9QTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBDdXJyZW50bHkgdGhlIG9mZnNldCBpbnRvIHRo
ZSBkZXZpY2Ugd2hlbiBsb29raW5nIGZvciBPVFAKPiBiaXRzIGNhbiBnbyBvdXRzaWRlIG9mIHRo
ZSBhZGRyZXNzIG9mIHRoZSBNVEQgTk9SIGRldmljZXMsCj4gYW5kIGlmIHRoYXQgbWVtb3J5IGlz
bid0IHJlYWRhYmxlLCBiYWQgdGhpbmdzIGhhcHBlbgo+IG9uIHRoZSBJWFA0eHggKGFkZGVkIHBy
aW50cyB0aGF0IGlsbHVzdHJhdGUgdGhlIHByb2JsZW0gYmVmb3JlCj4gdGhlIGNyYXNoKToKCkJU
VyBpZiB0aGlzIGZpeCBpcyBjb3JyZWN0LCB0aGlzIHNob3VsZCBwcm9iYWJseSBiZSB0YWdnZWQg
Zm9yCnN0YWJsZS4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCllvdXJzLApMaW51cyBXYWxs
ZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
