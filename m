Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B33C07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDBaJJ9NNzMGcHFvqBEypU6C+7on4fq3brjySmjkSRQ=; b=nitpnuaH6B8lFL
	B7AH/QiCWpAJOgkqwZFjB8muaj95roDphqOoqaYc87YY2/ZMDQGCZoUiN5safHzshAWWORNLLrc3u
	cjvZL2an4z6YR4bkF8h7GLNOdR09EhYIfC+DMYq9syqS6fBBRVDE6tBEgqcqUrEMXGbyGUHN3R1U2
	+VV34dB8PABuDteYvd7qjAK9/8WRXIp9EnDykcfug+W5vu+QvXDpkNpiAMVT09jsvLLhawmvXlNtD
	ogmiX+M/UySeBGjWOIxjIZ1ffv5pvo2SOVF7f83SBdzG5HAQlcC+q/vRM0qjk33RRU4F6oW5HK8dl
	V238IayT5r9+tOSGRGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKVU-00AXT0-2N;
	Tue, 24 Oct 2023 16:43:52 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKVS-00AXRj-1I
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 16:43:51 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so336869a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698165827; x=1698770627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW6A4psTptQoPBAdc8NsysnCDMSgHUTA2YAeEjCHjak=;
        b=KUJoGH9nnjwYMC8mVu9FPfKREf7uIZYQn1jvcRPj/7ou9Vn1LHxlhYlTfbIoznuR2A
         ysRtdv3mdNXsBmGb70oGcy5Zr0JF24i4tl5rACim+gGiQiWPuBD4o4XJlbjDxQ0rwVcc
         ky/hWdmNIqcE0zOu4/jQk4ulPY0fJ73QlOsnpgGbkfmkMNvCAzmRj0kadHrFBzUVZmvn
         INt3nvcfy5LubHOP31WX0R1NEFVQcdBgGh66xfkr2fvTefdMcKtWQ6UPE9D3sf5sq5At
         xEW8QgdC0ZNvpjt1+VuqqBM/J3vFA3ovToS2BvQHxfk4ADXWFHzUSPTY0+2h6hrkY/WW
         QiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698165827; x=1698770627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yW6A4psTptQoPBAdc8NsysnCDMSgHUTA2YAeEjCHjak=;
        b=lggbjrzakKrcjsPVkmtIwjNVylVEeKKezGdBmSrfpzrb17Pl6j8moG4UMcrTJ4e2db
         PGUIL/ESMATg+zeTom7ycldzBk+IFs84mOEAJY1AiN21OKCvNpOOOtlo2NDfRIHzmqT4
         z5aNvCC6s4LUDHEkfOiTNdIXDyvz6IGHQKxcNIAn4/pF1+6zM0pQBLpdxp+w0qw+Cwn1
         MdDHBUDmYsNKIRMrITNIFrgOyEMpA78uymK2N2rI1tt41laEdovfudCzKUs49I/WAZFO
         N54+Jiid4MjUA/Arx04briTXWt8bUyqnjKEN206kLgKHHSf/9GCMd2u8zo5rm5N8suab
         13Bg==
X-Gm-Message-State: AOJu0YxR8EoUrt2gL30J56Fy1+ymLxArgpqckSRv4sZZPHPlzQWW0ECz
	FJBYCwRDxZsk9N0r8t56IHcHatK8YsDaz/uxvuc=
X-Google-Smtp-Source: AGHT+IG+4r1NYlXOozDO18fxQKITHWOXqh22Fpg6GXnUmrq/yt3GkOAOdsDeVXzAGL0xPdYB+q2dhp+4oNx5MH5Hr2Y=
X-Received: by 2002:a05:6a20:4420:b0:163:f945:42c4 with SMTP id
 ce32-20020a056a20442000b00163f94542c4mr17898491pzb.1.1698165827162; Tue, 24
 Oct 2023 09:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc> <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
 <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org> <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
 <4e2de38da5a3e492eac522b9a68141c7@walle.cc>
In-Reply-To: <4e2de38da5a3e492eac522b9a68141c7@walle.cc>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Oct 2023 13:43:31 -0300
Message-ID: <CAOMZO5A98YSykYr+ddJ=v93isw=4jK_KhBLadSDTuBmn_WbqOQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_094350_441137_5063A022 
X-CRM114-Status: GOOD (  13.80  )
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMTozNuKAr1BNIE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxA
d2FsbGUuY2M+IHdyb3RlOgoKPiBNaGgsIHRoYXQncyBhIHBpdHkuIEl0IHNlZW1zIHRoYXQgeW91
ciBTRkRQIGluIHRoZSBmbGFzaCBkb2Vzbid0Cj4gY29udGFpbiB0aGF0IHRhYmxlLiBJIGhhdmVu
J3QgY29uZmlybWVkIGl0IGJ5IGxvb2tpbmcgYXQgeW91ciBkdW1wCj4gYXMgSSdtIGFib3V0IHRv
IGdvIG9uIHZhY2F0aW9uIHRvbW9ycm93IGFuZCBwYWNraW5nIHJpZ2h0IG5vdy4KCkp1c3QgZGlk
IGEgaGFjayB0byBmb3JjZSBjYWxsaW5nICBzcGlfbm9yX3BhcnNlX3NjY3JfbWMoKToKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c2ZkcC5jCmluZGV4IGIzYjExZGZlZDc4OS4uZGM2MWJiNWM0ZjdmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL3NmZHAuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwpA
QCAtMTMyMCw3ICsxMzIwLDggQEAgc3RhdGljIGludCBzcGlfbm9yX3BhcnNlX3NjY3JfbWMoc3Ry
dWN0IHNwaV9ub3IgKm5vciwKICAgICAgICAgICAgICAgIHBhcmFtcy0+dnJlZ19vZmZzZXRbaV0g
PSBkd29yZHNbU0ZEUF9EV09SRChpKSAqIDJdOwoKICAgICAgICBwYXJhbXMtPm5fZGljZSA9IG5f
ZGljZTsKLQorCisgICAgICAgcHJfZXJyKCIqKioqKiBwYXJhbXMtPm5fZGljZSBpcyAlZFxuIiwg
cGFyYW1zLT5uX2RpY2UpOwogb3V0OgogICAgICAgIGtmcmVlKGR3b3Jkcyk7CiAgICAgICAgcmV0
dXJuIHJldDsKQEAgLTE1MzIsNiArMTUzMyw3IEBAIGludCBzcGlfbm9yX3BhcnNlX3NmZHAoc3Ry
dWN0IHNwaV9ub3IgKm5vcikKCiAgICAgICAgICAgICAgICBjYXNlIFNGRFBfNEJBSVRfSUQ6CiAg
ICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBzcGlfbm9yX3BhcnNlXzRiYWl0KG5vciwgcGFy
YW1faGVhZGVyKTsKKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gc3BpX25vcl9wYXJzZV9z
Y2NyX21jKG5vciwgcGFyYW1faGVhZGVyKTsKICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
CgogICAgICAgICAgICAgICAgY2FzZSBTRkRQX1BST0ZJTEUxX0lEOgoKV2hlbiBib290aW5nIHdp
dGggdGhpcyBjaGFuZ2UgSSBnZXQ6CgpbICAgIDEuODU1OTAzXSAqKioqKiBwYXJhbXMtPm5fZGlj
ZSBpcyAyClsgICAgMS44NTk2MjZdIHNwaS1ub3Igc3BpMC4wOiBtdDI1cXUwMWcgKDEzMTA3MiBL
Ynl0ZXMpCgpTbyBzcGlfbm9yX3BhcnNlX3NjY3JfbWMoKSB3YXMgYWJsZSB0byByZWFkIHRoZSBu
dW1iZXIgb2YgZGllcyBjb3JyZWN0bHkuCgo+IFdoYXQgZG8gd2UgZG8gaW4gdGhhdCBjYXNlLCBU
dWRvcj8gSSBwcmVzdW1lIGEgZml4dXAgd2hpY2ggc2V0cyBuX2RpY2UKPiAoYW55IG1heWJlIG90
aGVycykgdG8gdGhlIGNvcnJlY3QgdmFsdWU/CgpNYXliZSBJIGNhbiBhZGQgYSBmaXh1cCB0aGF0
IGNhbGxzIHNwaV9ub3JfcGFyc2Vfc2Njcl9tYygpPwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
