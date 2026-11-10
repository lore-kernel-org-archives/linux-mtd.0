Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE9606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXJWlnnm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIsaZtjJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gIOXEnMTspMtPmMNE1JzKJHrav92ZLSt878rmCTzj+g=; b=FXJWlnnmChZ5GuKOD8+zYVs1zc
	8CPSnl9q88wAUZoFR7p8vb++8Zb1qKhikD+sgZR2BjscaB8h/E1e/Oh1DfG2jJHS9rkKSNeGPeYUd
	g5rOEjmNaxA6i7/l4ek+7XZrNL74QpOnvGIxtp/Xjpk9cDlySYWaG42nXtmZigpCKFwU5FGvify4w
	qa/SxQnCWbMS3T3I36I83z0DwsmCf5Uwwt+qYJYORY8Tlo1lLPtGt/jKp5ImX4+/ZPYuTWATeDc0+
	QsEAoVXBR1EaADuve4D7TTKUj8SGAx23yyqCwhNIdEOcokmsgvQDKsSTacKNactTZIXSM0krRgWK7
	oOb6nzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtEQ-000000052gN-2Nw4;
	Tue, 10 Nov 2026 21:18:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtEN-000000052g3-21pm
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 21:18:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so27025875e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2026 13:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794345493; x=1794950293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhS5MxHt8T8zhDgGML2bIOGXpz4OhhZ+txf4npSt+gk=;
        b=MIsaZtjJt+a+1SHhSqWSS3aSqVsOTWkHvRTQf069KS8K1WgUgfNI3ZwiGOkjp0ifTW
         XjRIwCsmldODOqAh/g81XP39GOkRtIXcTz+U0SLCBUcLukw1KfxUftQkdHyy10XEyaB8
         oM/SfdinCw18NzwLMhhTD60C+6EzaKi0q7vTv42VuP5uYgU9uHQk95fOmHOk8PRqYP18
         U/QB1l8kmAf7hGY+WHhJ8h2JZkFBoIcVklTuXpHB/JATIeyORos10mvhgEFYocI6mrD8
         IE2U5rKw6T8X1wMe9C6oW+HGt5FO+tIYmfPHLBshdbU1jjNK5/gq+xHqwAGbqZeb+auW
         Vp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345493; x=1794950293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhS5MxHt8T8zhDgGML2bIOGXpz4OhhZ+txf4npSt+gk=;
        b=dzt+tnAOGoHWYQLbSILj+4sjtW4YI4eDnFMQ5Ix+j3zpDnkRM/KDgkIPmO9He6inU7
         +Pc/HimH3jB3CoTJwEMdkQZeeC0B7aCLX0qsOyOGgiddwuZPV+R6T2Duo/t7bnDuxWR1
         SLPHsuwPXt0Ozx68TigVu+EhkHzWqVTV6J/umS6qU080G5q43JDpZwCX4mQf3H8KsC9V
         XtHNcZKl+5Br8lXa7dXhH+RQUICtyfDz2hGYciiVMMc1qyADzQ7Rzrf+swYiFMWfDDaW
         u4L87dC9o+51We8IsY4QiXsPjBFxzP1wWZM/m3j5MPmwA0/pPHngNb+pgM+qYroXsBn+
         L38g==
X-Forwarded-Encrypted: i=1; AL+hErE/AnRYnfdIo0CTcoawS1gnMkbeuQLvx5ytvQ9tP6ACVpgotku03bOz+FDzjJWexbvf/9DJSTodaOU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Ut/34UO4On96CwqAhmdt1T/UxcEQeGWBobbuED8f+RKoQaORh
	wdoIEaqtiOzkH7ZuAA/C1+avv0+Srrj79YM/fXkjNwk2v25qIkonklZQ
X-Gm-Gg: AYBFou1IJqp1Kbe13fzHHDQyOQil6WVYGaa+VYsrRlL3CUE4Udkbi3qeWapzjwYn1GM
	1MPKDUkwUOniFahZydQoy6aXf4atzz2v2StItb+kUGBWVWtvTqSwbrF5yYbhM3SmTiuGVMa1sIe
	lTeH98xyz7TKCduMEABr3AGLv+rDuWsb6oefwZVL8SrY04EuN3Mw/5cytwkFIGXiTmp88YU8WU1
	S0JU2sodDpOXrGlemkFicqrwlku1iqXC4xTEws9ZGoD03irL93gE1PF7OsVG8F70wf+8Xp5rZyh
	yBNiyTIOqiP7MwuO8osNybqM1iYIV0NYMNzqTcqLFVakM9X1L3Z+wtpx9E+zmMn4T/bpIEPrcSZ
	dUkmEXAhC8A/AFHAIMpl3LkUkLeF73oW2gjNuYOmnQEgUS8gfMXmjiYr2yqEnbsrkCbzwxperYO
	M7phHkGrdGnMFQHAeXA9KoK+CaEgW1hbn0nFrWIWRNXuoAw9YecqoKYFB71N22PPj931eI+8b3S
	AQNRCVDiA8z6oqdAK9/Az5pmy4UeFBiJ/HlVvtUGLTndEzvC6WV1KKwZQs98LiLwEqrKrXCYxXt
	O0u50+Sly+9pjXhTvCvwimhDvn5LqNQLPcSF3Qtb5jX5DLmROJwDGlOdgL1UBJBl798w
X-Received: by 2002:a05:600c:4455:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ba0931f006mr4996055e9.3.1794345492930;
        Tue, 10 Nov 2026 13:18:12 -0800 (PST)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm141664205e9.11.2026.11.10.13.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:18:12 -0800 (PST)
Message-ID: <f75c615e-0a92-4775-803a-8bc2aa3b4261@gmail.com>
Date: Tue, 10 Nov 2026 22:18:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] spi: spi-qpic-snand: use generic code from the
 'qpic_common' module
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
 <25dfb787-27ce-4d47-a619-e9600f4f7902@sirena.org.uk>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <25dfb787-27ce-4d47-a619-e9600f4f7902@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_131815_551378_1905CBFF 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MjAyNi4gMTEuIDEwLiAxOTo0NiBrZWx0ZXrDqXNzZWwsIE1hcmsgQnJvd24gw61ydGE6Cj4gT24g
TW9uLCBOb3YgMDksIDIwMjYgYXQgMDg6NDE6MDFQTSArMDEwMCwgR2Fib3IgSnVob3Mgd3JvdGU6
Cj4gCj4+IGJhc2UtY29tbWl0OiA0YThmYWFlYTk3NWJlMTVjYjYzNjY0NmMwZDRjNmZmMWMyMTEw
YmFhCj4+IGNoYW5nZS1pZDogMjAyNjEwMjgtcXBpYy1zbmFuZC11c2UtY29tbW9uLWZ1bmN0aW9u
cy0xMmIxOGZjN2ExZTUKPj4gcHJlcmVxdWlzaXRlLWNoYW5nZS1pZDogMjAyNjA5MjItcXBpYy1z
bmFuZC1maXgtc2luZ2xlY3ctcmVhZGxvYy1jNGM4OWI0MzY5ZjU6djIKPj4gcHJlcmVxdWlzaXRl
LXBhdGNoLWlkOiA3ZjhhNDhiY2NiMmUzYzhkZTk1MGJiZGRhY2ZlZmUwNTJjZWE1MGI4Cj4gCj4g
SSBjYW4ndCBhcHBseSB0aGlzIHRvIGFueXRoaW5nLCBwbGVhc2UgcmVzZW5kIHdoZW4gaXQgY2Fu
IGJlIGFwcGxpZWQuCgpTb3JyeSBmb3IgdGhlIHRyb3VibGUsIGl0IGRlcGVuZHMgb24gdGhlIGZv
bGxvd2luZyBwYXRjaDoKCkxpbms6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjExMDYt
cXBpYy1zbmFuZC1maXgtc2luZ2xlY3ctcmVhZGxvYy12Mi0xLTE4ZGU4MjI2ZmUxNUBnbWFpbC5j
b20KSSB3aWxsIHJlc2VuZCB0aGUgc2VyaWVzIG9uY2UgdGhhdCBvbmUgZ2V0cyBhcHBsaWVkLgoK
SSBhc3N1bWVkIHRoYXQgYWRkaW5nIHRoZSBwcmVyZXF1aXNpdGUtY2hhbmdlLWlkIGlzIGVub3Vn
aCB0byBjbGFpbSB0aGUKZGVwZW5kZW5jeS4gSSB3aWxsIHN0YXRlIHRoZSBkZXBlbmRlbmNpZXMg
ZXhwbGljaXRseSBuZXh0IHRpbWUuCgpSZWdhcmRzLApHYWJvcgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
