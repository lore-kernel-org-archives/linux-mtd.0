Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1362105F79F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8CjOL8IBboOgdhQGFpxPvs+0X0e53awJPurY7QkstY=; b=v9mtFcMzXrE9YM
	BesBstFCUROfbiqrucUvpNvRQPR9wYXoHUISS8nLq9Wqbia6OP42v0YMAeL8wYRtjWJLAwIyoGvEo
	Ql/Ir6T9lEtQt9m/5TY06dmKoG7yqqs3M0cpGZZS8WSp7Tuu7dEXlu4cF3FSpscgQYiWAKMaf+r0a
	DQSitYGsyXeHOF1S9MspknYHJn/3Nyic+umSVUfJu42uvacd3NTrYNxmEcsGvE5Rf9xagCmheAKU3
	vHDr4xYrwrDtCSFphpD8hdjDfUt7SUu9fgO6YcT2SuA6rc4Nnli90r/tB7zj4cSeVkS4gsQCrBvrm
	lu/bPu0OxqHLr2MTYrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w117O-000000004MI-2nl1;
	Fri, 13 Mar 2026 11:55:50 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w117K-000000004LW-1gum
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 11:55:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so1164710a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2026 04:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773402945; x=1774007745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fd6/LNMvocG+SgKxo6Jqn7P7IJDVInHSSSITVl5yXDs=;
        b=T2mPB+UNzEMPe2591gdyyQYRKWDwjI2kJikDO/veTpU2OWrL7+pdeKjnzzvtFkqrCu
         upZdehZoB/Q3+qxCSm+rOcNigvWif/VcMc5u3M0ogsPpEsmfkoVuAVeHgaIOL2DUzSad
         yIV4VcfP1UHNj+3F+HjOPtDUD72/iag5wobrZSKdmhb9UynDrWXbuSW+3mweuy9kSF+j
         3JGTKwHYhMkuvZE+Jl6SCORtg1MNwEjHt7V1YKtry5ey6Wya/fwf6Mag4BfA2KhxjmvN
         Q2AAHAydEJQlnlAopB+IW2VdmQ7JWl1X8ceWLzAv6AP/gFNVbiQlmeREQ5VM7DmJw+OF
         ckzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773402945; x=1774007745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fd6/LNMvocG+SgKxo6Jqn7P7IJDVInHSSSITVl5yXDs=;
        b=C9rJNo69u2xj8bR1T5LFRw9PqO+pTnc0ouX36d8J6Ajm38HpdVVr7hQmd0lZS0kuiK
         diSI7JmhvWP6HCL34YRttANDdvvAdq0GddcC5tbaQBlxSTik5MFlqH286tCBamo8GlPr
         ZhcqNptLCm1PscxASspu2DfkJ7DH4twe8rssNst+WK5P54HSXnD0xuoBkcSbHw3LKxvA
         jS0QrCLYDIcgcSUK6h7r058Qk/cHx/Rsm3xTITotkOWSOaS0kvHiK+f1nNO9ZBAJOn1r
         b8R7cEEibpl2zazd5QSxU2NVJsYBfGvKi2eOEfQ1wNtdNQPOz5UACH7/UDVANAbxHjWm
         JZPA==
X-Forwarded-Encrypted: i=1; AJvYcCXpGFg8sZFyhrImsVjFhd5tvWUuDxusCslm/296mpLEsRKuimLLa8xsp1ap0UCOjCurSSp9Xt+jO1s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3HqCmsvbu694XEjgXeDCz811IR+WGnforCAYR+0nwZ97VqlGT
	z/j2liy7UK5dEZj0Yy8KX61LUiSWSSw8AK8V2A+8+yTS4Mi9teZH6Izf
X-Gm-Gg: ATEYQzwu5glFP8/4mzuTAyz1dHuHbzurZzNxMDhgtfShAzrxZBcVWuEjVTps0/N26eA
	KkkUsegehQGV2wdUeIe8iDUitR5ueUAC2CuqiIgSIJ9gQ3l5MS4ThEBA4L0TasgLmvpTfCAfILj
	B52oPaBnIOzmkyb78RZ+IWrbL/kkua2cByw1tr/l8vvJUX5Ghv+amprbooIvMIaAMI8h998Hu2X
	uUr2J8I/h0ColLuNVwkAJlVgA8P+gdMC0m4MkF+QZvKCh+vaFmjdd2KQIYKP10BhlScKA/RBfzE
	rOMnBUzuD8v1Wji8nJhada8DYTOt+heb2VXW5EEX4ZdbPlLSkm8gvZYHlwpcWm9+z2dVCrxtwJa
	wR+iHG07YHforbmZW7FDElNJN8q67rNadpQUIMHUbARWgw9Ca6PltgJ1uz8NTNSCL5QJ5lvt1Lr
	Ncu55gVpf3x4Jwykvfij9z1cLxSvGGLgcJ8DZG2CkwuCygxeeSjvWaR1nMXIvl5BaHNBzyKXp6M
	YTZYttvzj0cs5hyZlQ=
X-Received: by 2002:a17:90b:3d8a:b0:359:8312:90a2 with SMTP id 98e67ed59e1d1-35a21ebedf7mr2902442a91.11.1773402945173;
        Fri, 13 Mar 2026 04:55:45 -0700 (PDT)
Received: from ?IPV6:2401:4900:88c9:edcc:4c31:2d5:c791:ca10? ([2401:4900:88c9:edcc:4c31:2d5:c791:ca10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a24a7dc1csm1103163a91.1.2026.03.13.04.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 04:55:44 -0700 (PDT)
Message-ID: <78aaacf3-9586-4c74-9648-698f15520eef@gmail.com>
Date: Fri, 13 Mar 2026 17:25:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: hisilicon,504-nfc: convert to DT schema
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260307-hisi504-1-v1-1-8bf9a186faf2@gmail.com>
 <20260312152851.GA3190071-robh@kernel.org> <87y0jwjeg6.fsf@bootlin.com>
 <87sea4jee2.fsf@bootlin.com>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <87sea4jee2.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_045546_443205_27114EBB 
X-CRM114-Status: GOOD (  10.10  )
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

Ck9uIDEzLTAzLTIwMjYgMTQ6MjcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gT24gMTMvMDMvMjAy
NiBhdCAwOTo1NTo1MyArMDEsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+Cj4+IEhlbGxvLAo+Pgo+Pj4+ICsgICIjYWRkcmVzcy1jZWxscyI6Cj4+Pj4g
KyAgICBjb25zdDogMQo+Pj4+ICsKPj4+PiArICAiI3NpemUtY2VsbHMiOgo+Pj4+ICsgICAgY29u
c3Q6IDAKPj4+IFRoZXNlIGNhbiBiZSBkcm9wcGVkIGFzIHRoZSBjaGlsZCAocGFydGl0aW9ucykg
ZG9lc24ndCBoYXZlIGFuCj4+PiBhZGRyZXNzLgo+PiBXZWxsLCB0aGUgY2hpbGQgc2hvdWxkLCBi
ZWNhdXNlIGl0IHNob3VsZCBiZSB0aGUgTkFORCBkZXZpY2UgKHdpdGgsIGFzCj4+IGFkZHJlc3Ms
IHRoZSBjaGlwIENTKSBpbnN0ZWFkIG9mICdwYXJ0aXRpb25zJy4gSWYgdGhlIGRyaXZlciBpbiBm
cm9udCBvZgo+PiB0aGF0IGJpbmRpbmcgZG9lcyBub3Qgc3VwcG9ydCB0aGF0LCBwbGVhc2Ugd2Fp
dCBmb3IgRnJhbmsgTGkncyB3b3JrIHRvCj4+IGNsZWFybHkgaWRlbnRpZnkgdGhlIGxlZ2FjeSBi
aW5kaW5ncyB0byBiZSBtZXJnZWQgYW5kIHJlZmVyZW5jZSBpdCBpbgo+PiB0aGUgdG9wIGxldmVs
IGFsbE9mLgo+IEkgZm9yZ290IHRvIHNoYXJlIHRoZSBsaW5rLCBoZXJlIGl0IGlzOgo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDI2MDMwOTIwMDM1MS4xNzkxMTYyLTEtRnJh
bmsuTGlAbnhwLmNvbS9ULyN0CgoKSGksIG1pcXVlbCB0aGFuayB5b3UgZm9yIHRoZSByZXZpZXcs
IHN1cmUgaSB3aWxsIGdvIHRocm91Z2ggdGhpcyBsaW5rLgoKPj4gVGhhbmtzLAo+PiBNaXF1w6hs
CgotLSAKQmVzdCBSZWdhcmRzLApBa2hpbGEuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
