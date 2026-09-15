Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D920CC88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLm6n/xoiLx+RD4n15LBoxVkIDih1sCY86NV4Xg/L6A=; b=2w9KeKH00gvc6d
	4Qlj3Qci1oxDthYgp2b22CoAvdSXLy6aYc/V+vzxoZTzfRLWB18JvLiJXryGzyoys8MqItI3O3TAe
	eCh9s2Jz/EIXb5Zx3XWpRTgeHCkEZaKDUXXAiSujOQ96siAyQfbUIwY6rdRFO9wuYTmLcgZHhVWkG
	iynfyVtzaDMAf2kqVm4JL5kBkkqsPsMgmYjkQDBPxGeB6nImWmzqlGpvXiLsQqblYkxO1Cbt/Woez
	luM54GSqguhMeOL0rmoFmOWOgkXODDF/mUuzDV0CreYan0UvQwrK7lN81uqwC8ls249P2CBFvRpnk
	QjsfK3CYNkoEIKf4rTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RNr-000000067El-0pD5;
	Tue, 15 Sep 2026 11:31:31 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RNn-000000067C6-03CT
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 11:31:28 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66d20e86cffso402792d50.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 04:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471886; cv=none;
        d=google.com; s=arc-20260327;
        b=VR3JNNcQCsCPblq0PFbLYt8fTS/4YX9VtkTbXERZ6hq88b4o8vwYm2z4R9m2JFc4Ro
         fmETTZoES34N61Z3urKOxuujMvNwfwrkg5Crvo7AokLbTxbgbY/GrSQcXuqP0cuRN62t
         1ywC3IrittC7gv2LZarheb7kjuzzkDKs6qeTGjq2+wFmh0hByOq7xpx8vSstB954KFsH
         vNvZzN7OO3B8yDHDrxsBv6VCEo8g8fniKbJ1NgiYICAmx0NnmXtdNl4Ml9Z+OYKX/U+v
         DDM+GhPqR++q3MWtc/iQN/Pkxw70yAzmFzqSZrEXpLUfr0NKrIzJLUtlnr6YqzuohdlH
         JWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zotJGPMivSABYb9yBTJZ2wsW5RJvx1JXioqJWY1D6+M=;
        fh=xR5UML4roMYELmnGJHXtCKD6VavLSIlseBJIbNPZKos=;
        b=i/ciwZ9P5520rAokhfl3cypQhQdjo0jAkVUzCuc6zxMe9/w33N7B97ZawDhNim4gFC
         HILLNS0G+nsPy6woibm5G/KQw+QOLGif7c57FaPkBytW3gOMatpYPRoRwERpDyvAKwRO
         NWU9dWuhJMpvd1f8tJnj2fexLpr7QRZpYp3n3Ke0N2pOAOzSAbyTpqwhu5t+Y4RD5efq
         cTfl2AAdHSx/QZQvEe/kPOxjU5bneUV6bKNHzak3juK3WOWQdP0WLfK4qBosVt0+rW1H
         tLMcGdS7NJo9YIrBnQt7gHVSEIyvw7qSL1eakhd1EQS+9Jukg83dZoojr2HupmP7J1SI
         wVrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471886; x=1790076686; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zotJGPMivSABYb9yBTJZ2wsW5RJvx1JXioqJWY1D6+M=;
        b=cY7YqiD0Ryk2i+teEI1SEbYK6M3PbU50RLD3ctcXE9BxrZLamZ3MYzTAzDB6mYXqbD
         lmDGuKYOyS6t5OkYyVR4D65a9ZDGsOSMbnDgjn/NQGDXqPyC1iruvhzIKctYoOpx3XrM
         Q2QP3CysBpfJ6ct1XQHvliQCGkmwUaAd6qRsFVZ1MyQO/BaTqJDn+Lfk2wCevYftiKmF
         zeuvyqwRoRJ2x0ddlP7nE7l7Dspw3XlcQxM/TLiMDTMzzf5pow45RFu+jU5a9EGuNO0Z
         VV1QflVFLOHaZ1F6eQTVkNWfEm1vYCAFrnbsGO/JGr98U2QeSZDAGBqGmfas1S3I2L1T
         ukjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471886; x=1790076686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zotJGPMivSABYb9yBTJZ2wsW5RJvx1JXioqJWY1D6+M=;
        b=nSeIsag1vPurnMT5I618wFwcA3D5hIh74bw/7cYWil5gUyjhL5ThswutmEuoqvWevz
         goqhq6vMW9d+3tQ7ssYuBUhewYCRIb67QjzrBS9faI2cxlyZfukcIZT1dhsLI/RK6/IW
         B2ySdSLPCyFVxj0LcZSUw2sEXDj2cHS106tjxvnIgxmEwIb7tUE6nHiR+ttqFssLO9o0
         4eM/j0tBQUCwhs/UuHMxSX+utI9RB4z1t3K7NVU/Lnp3sG6SFa3JMNPulyz0Kq4Ek7DB
         3lhzYvajXvtoZrB0MA+w7lNA4+VdcDmG8Za2NXjQrsX21AnUp0BpJXACu7VuNq7JLan7
         bKOw==
X-Forwarded-Encrypted: i=1; AKwUvBxB0kdDkzCINR1YRgzYdpmltuB3By+fYAdLhVo7QgwehEnHSQgmamIOf9iMoXQqL2ogUyjZbxXwTrY=@lists.infradead.org
X-Gm-Message-State: AFuF++k6LLmrG1KGz2SWMup1pKvPuNzg1qEDrFT3CYN0X7pT8+mC2ml7
	QsTipRGWud36vIKVz2lt1y2uRPuqUGoZagtwtNK4odgzY75o9mkAmAgvYlEYJqkfrcXGwHWauCz
	xip1fsZ18+9Vwzi2AmMgFkgc4Tj2n6II=
X-Gm-Gg: AYBFou28MN9GKs88BUNfZbbjMcDpMu/3W1Ok8kDKCPqVZy/sjRDOuTPB0cevB/GBu8Q
	WSyJYgEFzTVWnvK2uhBYeaCmF5rU/WZshROSLNdYvh0+TIsgas+laGRKXmb4NpkUExzdmMp4sYd
	k2lkkT83LY/guBaQLDM09adMHhwnPV2m7CXY7c1aIjAGqSaH18dvjchCivUe9WZp+KenXCOjrlP
	FwnRsM6v+IaXIHlg3ZEe0c75h+j2w3kV9VPCJwmNIHDMpcEkjMQqLuFQggbKuLQSl+xfuGXMy8y
	SqTTBPTxXxBqLWe7TQCgO0iNNcj9FLiiUlvhyH0YAJHo3m07RbowG1YN
X-Received: by 2002:a05:690e:2023:b0:671:2f8d:eaf3 with SMTP id
 956f58d0204a3-6714e30e48fmr1925549d50.4.1789471885894; Tue, 15 Sep 2026
 04:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com> <DLEWF5DGXYAE.179JK12YIHHID@kernel.org>
In-Reply-To: <DLEWF5DGXYAE.179JK12YIHHID@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 15 Sep 2026 14:31:14 +0300
X-Gm-Features: AcwNN1VkI9JiuP8HxEnMvUjQqUWGl_VDINTaR90A9g2N3vrw1FbIOy7K0eHiNm4
Message-ID: <CAFpOueQMUXkHRF8zL5USo1TVhrS1AY8j4Ff0dtF57PZy2GU7Bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in spi_nor_remove()
To: Michael Walle <mwalle@kernel.org>
Cc: pratyush@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, vigneshr@ti.com, richard@nod.at, 
	miquel.raynal@bootlin.com, takahiro.kuwano@infineon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_043127_072531_602F4F87 
X-CRM114-Status: UNSURE (   9.15  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTE6MzPigK9BTSBNaWNoYWVsIFdhbGxlIDxtd2FsbGVA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IFdoeSBhcmUgdGhlc2UgdHdvIGRpZmZlcmVudCBwYXRjaGVz
PyBUaGlzIHNob3VsZCBiZSBmb2xkZWQgaW50byB0aGUKPiBmb3JtZXIgb25lLgoKVW5kZXJzdG9v
ZCwgYW5kIGJvdGggYXJlIGFkZHJlc3NlZCBpbiB2MzogYSBzaW5nbGUgcGF0Y2gsIGEgbXVjaApz
aG9ydGVyIGNvbW1pdCBtZXNzYWdlLCBhbmQgYW4gQXNzaXN0ZWQtYnk6IHRhZy4gSSB3aWxsIG5v
dCByZXBseSB0bwp0aGUgYm90IGFnYWluLgoKVGhhbmtzLApJdGFpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
