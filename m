Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589C3C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 19:36:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 024B120773
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 19:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QywN0WZ9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr0+InlG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 024B120773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UgmfFCFT16AubEVTFgNvp4+I7goieNUOiJceQCVz4Ss=; b=QywN0WZ9aCbSpW01vQr9XHnYS
	KaiNOQIlW0YL2WljO/NQomVEn+XKYJuYlLySQgzPcl++FrOagpOAUeVRpAIx3SP/n36RXdlW0KjD8
	Ca8nIAUGXitNr3eybMld7EeJ+FXiZo4p8alqDtdlFzLP1pwO9xJYFsaSRXAAVvO8nK/FLCtN1mq8p
	MM8EDfkiX6e+Gja5c+TnjVLyWlSjt5/+WLNvOxdUX955NIyOOWBnmK4Io/bMVDen2u1NNJrZIjXmb
	rgdrTPkAZAQlrjodc3FiW1I37nh+d0awJJyuueEMDecej9JceaA+0oylkEHy+fKSaabx96e87iP92
	nBqe+vghQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMyvd-0006DN-1G; Mon, 28 Sep 2020 19:35:17 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMyvZ-0006CY-CT; Mon, 28 Sep 2020 19:35:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id x123so2026889pfc.7;
 Mon, 28 Sep 2020 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7KnjkBBnLzAr5go3fTJ+1FzXKfDtdVLomQPQFEtg6Rw=;
 b=Nr0+InlGarDCYgx5luJOcGubABdXl2JDEAuNjpot+p8CW+PxEa/NUy22QQmi2hdu5W
 GeXCS9dTpfTjINDBTWxuywLNuSGCeyEhLjIQKnCXJRfIkkRGvgaWRhAxcjpGD61prrIV
 0POstsiTWPlvPpQdYE1YjcmgMetgQUKH16/WKv2SQ6b7yNxKjDIQDT/t4lyNZGey2Upu
 dVEKmIVaro2mcHu8nf+iKLVhajrvgJDu80QnSe1ylmNI2s5Wqmbh2C/d+u5fnE6nf2Ra
 zZ3h2q/DQMZ4NOJuSwuoDUXIWBPeC5p83qM6kiI/xF21Oq3LRCRpIekLtpWJstVr3z8B
 MiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7KnjkBBnLzAr5go3fTJ+1FzXKfDtdVLomQPQFEtg6Rw=;
 b=h4RVqn0xIk+0BSfFpTTcQsLJKkFG6sIWWImExxvV1S57h7klnN7xUnPuOkNB8x2FFJ
 sxcWC/LQeUklf/RA8FElH6UydBJCPVwZcDL8Rc4gFimcrDwt1wDmi8xxISlPvYaIx6jo
 NSx+PsfwB9y2eMJG+ar3h6g6Ahyp4AfMZ0WAHmvmPP8+ImXuicjwTGEBoJ/iLmamhBm/
 UYiBS4TryDw67qrgaFCfpgtK1Lwm0nSs8erskE4TMPQQCchTaOUe1S+kAie0LywDkz2b
 AhPXkTzM9s7iFriayw+OK9y9H9ph5BwKPd/xRwxyA+cT+HgVcyeg4QC4CD0n6/1a+CdZ
 vRbg==
X-Gm-Message-State: AOAM533ferlj8BK/8Q6cmPjsYN5VuBUSXtJXikNQ8W3EK8NyLe373uPP
 ZZuTQnpVoNUz90wCe5YEC+g=
X-Google-Smtp-Source: ABdhPJzpoUu1RBJssvdhZgvuLF4TelxVTyHauOaQ6CAityrII9lxrdh/u+rh7TZKHPANPGdDQmUrcw==
X-Received: by 2002:a63:c74f:: with SMTP id v15mr459413pgg.143.1601321711017; 
 Mon, 28 Sep 2020 12:35:11 -0700 (PDT)
Received: from [10.230.29.112] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id u71sm2726381pfc.43.2020.09.28.12.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 12:35:10 -0700 (PDT)
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <linux@roeck-us.net>
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
 <20200814085617.GA129183@roeck-us.net>
 <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
 <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
 <20200928161617.2a1b2244@xps13>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8f25c3c8-f2c6-73a9-a9f5-cf244c53754a@gmail.com>
Date: Mon, 28 Sep 2020 12:35:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200928161617.2a1b2244@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_153513_480643_93B20308 
X-CRM114-Status: GOOD (  17.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, linux-mips@vger.kernel.org,
 lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>,
 tsbogend@alpha.franken.de, bcm-kernel-feedback-list@broadcom.com,
 jonas.gorski@gmail.com, linux-mtd@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzI4LzIwMjAgNzoxNiBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAK
PiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlIG9uIE1vbiwgMjEgU2Vw
IDIwMjAgMjA6MjY6MTkKPiAtMDcwMDoKPiAKPj4gT24gOS8yMS8yMCA4OjE4IFBNLCBOYXJlc2gg
S2FtYm9qdSB3cm90ZToKPj4+IE9uIEZyaSwgMTQgQXVnIDIwMjAgYXQgMTQ6MjYsIEd1ZW50ZXIg
Um9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiBNb24sIEp1biAx
NSwgMjAyMCBhdCAxMToxNzo0MEFNICswMjAwLCDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgd3Jv
dGU6Cj4+Pj4+IEluc3RlYWQgb2YgdHJ5aW5nIHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywg
d2hpY2ggaXMgY3VzdG9taXplZCBieSBzb21lCj4+Pj4+IHZlbmRvcnMsIGxldCdzIGp1c3QgY2hl
Y2sgdGhhdCAiQ0ZFMSIgd2FzIHBhc3NlZCBvbiBhcmd1bWVudCAzLgo+Pj4+Pgo+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBHb3Jza2kgPGpvbmFzLmdvcnNraUBnbWFpbC5jb20+
Cj4+Pj4+IFJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNv
bT4KPj4+PiAgIAo+Pj4KPj4+IFdlIHN0aWxsIHNlZSBtaXBzOiBhbGxtb2Rjb25maWcgYnVpbGQg
ZmFpbHVyZSBvbiBMaW51cyB0cmVlCj4+PiAgICAKPj4KPj4gWWVzLCBzYW1lIGhlcmUuCj4gCj4g
UGVyaGFwcyB0aGlzIGNoZWNrIHNob3VsZCBiZSBkb25lIGJ5IGFuIGV4cG9ydGVkIGhlbHBlciBz
byB0aGF0IHdlIGRvCj4gbm90IGJsaW5kbHkgZXhwb3J0IHRoZSB2YXJpYWJsZT8KPiAKPiBBbHZh
cm8sIEpvbmFzLCBjYW4gb25lIG9mIHlvdSB0cnkgdG8gYWRkcmVzcyB0aGlzIGlzc3VlIHBsZWFz
ZT8KCldlIHNob3VsZCBwcm9iYWJseSBqdXN0IG1ha2UgdGhlIHBhcnNlciAnYm9vbCcgdGhlcmUg
aXMgbm8gbXVjaCBwb2ludCAKYnVpbGRpbmcgdGhpcyBhcyBhIG1vZHVsZSwgaXQgd2lsbCBub3Qg
aW1wcm92ZSBjb21waWxlIHRpbWUgY292ZXJhZ2UsIAphbmQgaXQgd2lsbCBtb3N0IGxpa2VseSBu
b3QgaGVscCB3aXRoIHRoZSBrZXJuZWwgaW1hZ2Ugc2l6ZSBvbiB0aGUgCnBsYXRmb3JtcyB0aGF0
IHJlcXVpcmUgdGhlIHBhcnNlciB0byBiZSB0aGVyZSBhbnl3YXkuCi0tIApGbG9yaWFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
