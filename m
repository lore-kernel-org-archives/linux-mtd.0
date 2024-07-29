Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC541C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2024 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn+bKlKLlr1DPHw1iKuPGhhay1Euhgekbuh+JG74viQ=; b=GAB4Hu91uC+FcD
	v8iJOUohdwwFhM6jkdDBVE4o7IQkbrEk+S9L0FRKEnVrkZqcMxMZMRdPsD0cDKWEjyqvJq3BkEYKc
	4T0hfN52ZTZYiLsdAfvX4zIfkBJ3ItPiRRucX+5AiAnImL6I8uKbMLcBAKv2k8XESBtrDDKNf6HVX
	nRkQnTfR7O7+Ql0iNXYtzv3wlYPcvSD2TkVjyY8d/WBmpvb0zfZf6lfRs8HZLw8xM1MAc5RDT63vC
	ZZkYNnaiDb7yNw8NbhZ73G0DTDy2Pg2twjEkeIf1i/43ytdFAW0X9JShR/V4iLuk7qmpwVMoENmVK
	8az7Gmct0v59D8MATr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLQo-0000000AU45-46Mt;
	Mon, 29 Jul 2024 08:08:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLQJ-0000000ATqk-03IR;
	Mon, 29 Jul 2024 08:08:04 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34431so2690783a12.0;
        Mon, 29 Jul 2024 01:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722240481; x=1722845281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl8HdNLgtv5Fxv2Nk9Of+lDPOeD8hPV7F8FWHfhtTmU=;
        b=L1zem4BRaDof0M7gyu4UiTqZv3uVDmr3EokSpkPM+1XKfpSkzuRb8Y84+V+eg1301R
         yIxEiiAJgMaA8b7MQlI6+Vj1rp6qTQWO5GUmCVR/v3GqO2LeRuZWSrL3i873BrHEIYcm
         jLKzsbEajze06mT5GEDgBtd1qW1UNKYcsOeSvLqw47Yge6IAbCWGtVIm81MDLfsMCi9P
         pKWaYjuoLBYEG84BUj+9lLEQms6ywdH7XpuQInMzmBsCrHxJsKf/nmFE9fPAwNRkaBFY
         TwDQwyL+p7QCfW9AIlOWQ/9QKx8eOGcT8dikaZNCRwsQias+x/8GfgsHQfItunoCNubj
         aMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240481; x=1722845281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl8HdNLgtv5Fxv2Nk9Of+lDPOeD8hPV7F8FWHfhtTmU=;
        b=HHVzAAPih7VIqfC+HWSWad+icdgVq1p5oBn/Zl8XykhHCjTA0dKwHAnH93qdQ+5Ve0
         GB4xrKmliy0gVG6H7L68IfmrVVxXzkL4lgKSgb5AxiVxY8xYl4muxivgB5Rlo/FoVVKO
         mj7pYQngkU+OSCuoQxh+FdvaPTm4LMkSEI8qILBVKgTfpGVjKf5p4aI2hCpGtE7n4gr/
         EWTr20vcKkyKOVv3HiTx4NudEqeYiTNsSV13XUGc3Nq/X51ONJVB+ugulqKWr/gnP7hG
         D7UcwuFCs0Cc/qXTd3P89Jn/u4oakAxuAQtOrm846LoF9fDqfKfOy531uQn0CFsIz5sh
         BMKA==
X-Forwarded-Encrypted: i=1; AJvYcCWAMFsE0D8bfpEWEJFlw5Y0wr4dtT4E9wsIdp+K6xBuUHB7+BjHVtcU7VurOIbvlKyFj5lTgylYos56hYz2oOAKsnMrWhNEV/Fgbaxj6U4viDsmcBYgE5+voap2CTTslvzjXXFTMYMoebhLFI1S7HlABozY
X-Gm-Message-State: AOJu0YyXOhMa9fNRF2LZ4tGfRhTA1uHPCOP+JVZtfMzyCERbCqOIaans
	ydxo3xClqTDYZfrNQ9rHlvHdP/8nsTLAHgg+3bQsGMqe9oHR+Aik
X-Google-Smtp-Source: AGHT+IGSPZPkd0loh76eNxSCbXh4tWMsSkZqipMIwMD0/JvF8wieYG1nkZYy/AvmyWaLsR5QnAao4Q==
X-Received: by 2002:a05:6402:51cc:b0:5a1:de88:a5ef with SMTP id 4fb4d7f45d1cf-5b02317f4c0mr5275599a12.27.1722240480627;
        Mon, 29 Jul 2024 01:08:00 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590cedsm5352868a12.29.2024.07.29.01.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 01:08:00 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	u-boot@lists.denx.de,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/3] dt-bindings: nvmem: convert U-Boot env to a layout
Date: Mon, 29 Jul 2024 10:07:32 +0200
Message-Id: <20240729080733.16839-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240729080733.16839-1-zajec5@gmail.com>
References: <20240729080733.16839-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_010803_088395_6256C6F7 
X-CRM114-Status: GOOD (  15.12  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVS1Cb290IGVudmlyb25t
ZW50IHZhcmlhYmxlcyBjYW4gYmUgc3RvcmVkIGluIHZhcmlvdXMgZGF0YSBzb3VyY2VzLiBNVEQK
aXMganVzdCBvbmUgb2YgYXZhaWxhYmxlIG9wdGlvbnMuIFJlZmFjdG9yIERUIGJpbmRpbmcgaW50
byBhIGxheW91dCBzbwppdCBjYW4gYmUgdXNlZCB3aXRoIFVCSSB2b2x1bWVzIGFuZCBvdGhlciBO
Vk1FTSBkZXZpY2VzLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMjIx
MTczNDIxLjEzNzM3LTEtemFqZWM1QGdtYWlsLmNvbS8KU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkg
PHJvYmhAa2VybmVsLm9yZz4KLS0tCiAuLi4vYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9udm1lbS1s
YXlvdXQueWFtbCAgfCAgMSArCiAuLi4vbnZtZW0veyA9PiBsYXlvdXRzfS91LWJvb3QsZW52Lnlh
bWwgICAgICAgfCAzOSArKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL252bWVtL3sgPT4gbGF5b3V0c30vdS1ib290LGVudi55YW1sICg3NSUpCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91
dHMvbnZtZW0tbGF5b3V0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bnZtZW0vbGF5b3V0cy9udm1lbS1sYXlvdXQueWFtbAppbmRleCAzYjQwZjc4ODA3NzQuLjM4MjUw
NzA2MDY1MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252
bWVtL2xheW91dHMvbnZtZW0tbGF5b3V0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvbnZtZW0tbGF5b3V0LnlhbWwKQEAgLTIxLDYgKzIx
LDcgQEAgb25lT2Y6CiAgIC0gJHJlZjogZml4ZWQtbGF5b3V0LnlhbWwKICAgLSAkcmVmOiBrb250
cm9uLHNsMjgtdnBkLnlhbWwKICAgLSAkcmVmOiBvbmllLHRsdi1sYXlvdXQueWFtbAorICAtICRy
ZWY6IHUtYm9vdCxlbnYueWFtbAogCiBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOiB0cnVlCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290
LGVudi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91
dHMvdS1ib290LGVudi55YW1sCnNpbWlsYXJpdHkgaW5kZXggNzUlCnJlbmFtZSBmcm9tIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKcmVuYW1l
IHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9v
dCxlbnYueWFtbAppbmRleCA5YzM2YWZjNzA4NGIuLjU2YThmNTVkNGEwOSAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy91LWJv
b3QsZW52LnlhbWwKQEAgLTEsMTAgKzEsMTAgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKICVZQU1MIDEuMgogLS0tCi0kaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252bWVtL3UtYm9vdCxlbnYueWFtbCMKKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LnlhbWwj
CiAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
IAotdGl0bGU6IFUtQm9vdCBlbnZpcm9ubWVudCB2YXJpYWJsZXMKK3RpdGxlOiBVLUJvb3QgZW52
aXJvbm1lbnQgdmFyaWFibGVzIGxheW91dAogCiBkZXNjcmlwdGlvbjogfAogICBVLUJvb3QgdXNl
cyBlbnZpcm9ubWVudCB2YXJpYWJsZXMgdG8gc3RvcmUgZGV2aWNlIHBhcmFtZXRlcnMgYW5kCkBA
IC0yMSw5ICsyMSw2IEBAIGRlc2NyaXB0aW9uOiB8CiAgIFRoaXMgYmluZGluZyBhbGxvd3MgbWFy
a2luZyBzdG9yYWdlIGRldmljZSAoYXMgY29udGFpbmluZyBlbnYgZGF0YSkgYW5kCiAgIHNwZWNp
ZnlpbmcgdXNlZCBmb3JtYXQuCiAKLSAgUmlnaHQgbm93IG9ubHkgZmxhc2ggcGFydGl0aW9uIGNh
c2UgaXMgY292ZXJlZCBidXQgaXQgbWF5IGJlIGV4dGVuZGVkIHRvIGUuZy4KLSAgVUJJIHZvbHVt
ZXMgaW4gdGhlIGZ1dHVyZS4KLQogICBWYXJpYWJsZXMgY2FuIGJlIGRlZmluZWQgYXMgTlZNRU0g
ZGV2aWNlIHN1Ym5vZGVzLgogCiBtYWludGFpbmVyczoKQEAgLTQyLDYgKzM5LDcgQEAgcHJvcGVy
dGllczoKICAgICAgICAgY29uc3Q6IGJyY20sZW52CiAKICAgcmVnOgorICAgIGRlc2NyaXB0aW9u
OiBQYXJ0aXRpb24gb2Zmc2V0IGFuZCBzaXplIGZvciBlbnYgb24gdG9wIG9mIE1URAogICAgIG1h
eEl0ZW1zOiAxCiAKICAgYm9vdGNtZDoKQEAgLTU4LDYgKzU2LDE3IEBAIHByb3BlcnRpZXM6CiAg
ICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgZmlyc3QgYXJndW1lbnQgaXMgYSBNQUMgYWRkcmVzcyBv
ZmZzZXQuCiAgICAgICAgIGNvbnN0OiAxCiAKK2FsbE9mOgorICAtIGlmOgorICAgICAgcHJvcGVy
dGllczoKKyAgICAgICAgJG5vZGVuYW1lOgorICAgICAgICAgIG5vdDoKKyAgICAgICAgICAgIGNv
bnRhaW5zOgorICAgICAgICAgICAgICBwYXR0ZXJuOiAiXnBhcnRpdGlvbkBbMC05YS1mXSskIgor
ICAgIHRoZW46CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICByZWc6IGZhbHNlCisKIGFkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQogCiBleGFtcGxlczoKQEAgLTEwMSwzICsxMTAsMjMgQEAg
ZXhhbXBsZXM6CiAgICAgICAgICAgICB9OwogICAgICAgICB9OwogICAgIH07CisgIC0gfAorICAg
IHBhcnRpdGlvbkAwIHsKKyAgICAgICAgcmVnID0gPDB4MCAweDEwMDAwMD47CisgICAgICAgIGxh
YmVsID0gInViaSI7CisgICAgICAgIGNvbXBhdGlibGUgPSAibGludXgsdWJpIjsKKworICAgICAg
ICB2b2x1bWVzIHsKKyAgICAgICAgICAgIHViaS12b2x1bWUtdS1ib290LWVudiB7CisgICAgICAg
ICAgICAgICAgdm9sbmFtZSA9ICJlbnYiOworCisgICAgICAgICAgICAgICAgbnZtZW0tbGF5b3V0
IHsKKyAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1LWJvb3QsZW52IjsKKworICAg
ICAgICAgICAgICAgICAgICBldGhhZGRyIHsKKyAgICAgICAgICAgICAgICAgICAgICAgICNudm1l
bS1jZWxsLWNlbGxzID0gPDE+OworICAgICAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAg
ICAgIH07CisgICAgICAgICAgICB9OworICAgICAgICB9OworICAgIH07Ci0tIAoyLjM1LjMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
