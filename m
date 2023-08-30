Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15537C83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=c112lXU+7IKN+LUILjCZuc8CThGYIPiU/O+I+Hj6Myc=; b=GpV
	8ZDonaKS5TMp8WKojgAhEg/wfU4JMhYbmTREogSwv5SrbJDTxBGldcys29tY1tzb1p+O0owJMsZWr
	CFNqc7quOB2EAzdnAwWGq+HiPpo0oSjlLh1Y68eh2z21klfU5fjFw1/Zay3NK+0OxaHaHY+SuUIyz
	yofLd4Kh2WyDyqGnq6AzErYRTpqzmaOClywsNwXYhHSTTo7GmVqewa+jOe+5jD8Lkrv1z7u6ReZ8Y
	5h/DLnhrw3q+JcE4IVP5PkOarklfvQVBnWKAhGsbt/qZLfEE8WD98oubSjS2wr9TIRdYFOu4DaNqv
	pVK+TWgD+S57TgWsBojLjTfYU43LLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFeB-00D0CT-20;
	Wed, 30 Aug 2023 07:29:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFe8-00D0Ax-0i
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 07:29:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99357737980so682205666b.2
        for <linux-mtd@lists.infradead.org>; Wed, 30 Aug 2023 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1693380585; x=1693985385; darn=lists.infradead.org;
        h=subject:autocrypt:from:to:content-language:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ioyusg4dyVKIOL4RYe+wSidN65awlhoSRDTgc1PSRko=;
        b=tigtWWTmovM+zRp+LblHc7btS/RLs2/zyknZVAS1URFVtgOvMn1QysdyipyEwx2PG8
         uNBWbOwLd8ZfYFPGu24OJmz77tjGG75zoDQU/qbLMNhlN5+D2UgYmUIHGbWrZvLUX9r4
         Wc8OT5YrPjbCxji2bDUDk/eyeIcm+Ng29rEpSqHGNnkDQZl3RAMPMI8jKL7IKlaejdI1
         WgLfgUWygun/is4mAwFeQFevNeNeHos/xN6sUY7LVzHQPv7NHwcbTN5eiTM6XptQ71FC
         UcwNk1xL43rk4NEYP4EG0GobkuR3ht/xmLrVmLZ0608sMBGs3RpJF9MyW1ehcty83pc8
         +o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380585; x=1693985385;
        h=subject:autocrypt:from:to:content-language:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ioyusg4dyVKIOL4RYe+wSidN65awlhoSRDTgc1PSRko=;
        b=MN9CU8qjAIVU1hck15lehqjiq5rlJwPqLisOYOYhYANa8CkhD4+SfgmbCNpOKG/Mcg
         Z/xSn7w1WyiqbOmxjhSoK9aBZA6nj2TEh3pF9hcqmU+sInfH3m60Y1xgV00G74uUAoUv
         8EfUM/8hQXTfLMIqzOnEj6X6zVQXqTHNkbz13W154mLxhxDuNWmSteyTAUoBplm0eQ68
         vQsxDgCwWMP8JaNwdVnRup1OQBgZdop7FdpzjvJpWsZQqZvOVA1tx9tjza0vcuo8exFZ
         xfNIfCUdwOe0AzfsPg2qnnSa7biwU8CbrKyn7f+SueDcsPVsi7WG5deftGYXRM7+UgZX
         if7Q==
X-Gm-Message-State: AOJu0Yz9nvNvFEAsp/NJgMG5D+U8htbznUjPjiNkpeVkA5uDLzwhnwvf
	53dkAbEQsHNSPKQtdzUh4m0dxiShPjfykqs8hz7A9w==
X-Google-Smtp-Source: AGHT+IFylkZX57Jal/Qk9HBlJBnY2n+xD5edruG8rTO5zS34dV7LbLzEDRmOvmgjZddFY5TkWgXQ0g==
X-Received: by 2002:a17:906:311a:b0:9a5:821e:1655 with SMTP id 26-20020a170906311a00b009a5821e1655mr947520ejx.71.1693380584709;
        Wed, 30 Aug 2023 00:29:44 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id bn24-20020a170906c0d800b00997d7aa59fasm7004694ejb.14.2023.08.30.00.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 00:29:44 -0700 (PDT)
Message-ID: <ad5cc151-04ba-7877-a24e-b6a832371302@sigma-star.at>
Date: Wed, 30 Aug 2023 09:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?UTF-8?Q?Llu=c3=ads_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Autocrypt: addr=david.oberhollenzer@sigma-star.at; keydata=
 xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d/nSCZ+FG
 FX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N8aL7YNF7VfjTRntB
 tKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6/N7b/cFH9+fx8kwi4pNFuJwr
 BkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258jnN65jBO7ElqU2CCuGRPg6uryAHV3RVCB
 9j9AE3HLacQReFtt5ylyydSQbaK4K9asnd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEB
 AAHNN0RhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rh
 ci5hdD7CwHcEEwEIACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXc
 PHQaAtFuEAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
 5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQbxkP1YWzo
 Vwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU/o3dT23NDeQ20jXg
 quJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+hPK/Dmdsqgns+Z+SrQcOvRa3
 GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRW
 cn9GAQgAvugF8cFjv2Zs4BBb44SnxGawBySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr
 +TRnXIzcb5xI8SxitBDU5MLvwsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGP
 ak8JmjMMtOoOBh4meOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUa
 h7wajcojYSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
 FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawARAQABwsBf
 BBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt3ao3Abpu2fqYfwbI
 yPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEjviKMpfI7ppTUBuGKrpgc5xsi
 UpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8rBKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fm
 qoVHaw8PhLAtez+B7HS7Hv7iJPDtX85kFYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR
 7In6ift5SNySojCOfAV0iKZb8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDT
 qyUpot0oG03vtSG4LIRCdxI=
Subject: [ANNOUNCE] mtd-utils-2.1.6 is released
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_002948_586497_DD3FFF57 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Type: multipart/mixed; boundary="===============0221431910187496932=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0221431910187496932==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w7qnuR56pJEBmSjicyoAqoOv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w7qnuR56pJEBmSjicyoAqoOv
Content-Type: multipart/mixed; boundary="------------mohYc7hW4Fnhf4nfv320FfUV";
 protected-headers="v1"
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?UTF-8?Q?Llu=c3=ads_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
Message-ID: <ad5cc151-04ba-7877-a24e-b6a832371302@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.6 is released

--------------mohYc7hW4Fnhf4nfv320FfUV
Content-Type: multipart/mixed; boundary="------------NOAJ9cR1fR11DQ98ZSkqNoTu"

--------------NOAJ9cR1fR11DQ98ZSkqNoTu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm10ZC11dGlscy0yLjEuNiBpcyByZWxlYXNlZC4NCg0KVGFyYmFsbDogICAgICAg
ICAgICAgICBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIvbXRkLXV0aWxzL210ZC11dGls
cy0yLjEuNi50YXIuYnoyDQpUYXJiYWxsIGdwZyBzaWduYXR1cmU6IGZ0cDovL2Z0cC5pbmZy
YWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMS42LnRhci5iejIuYXNjDQpT
aWduZWQgZ2l0IHRhZzogICAgICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGls
cy5naXQgdjIuMS42DQoNCkFsdGVybmF0aXZlbHkgYWxzbyBtaXJyb3JlZCBoZXJlOg0KDQpU
YXJiYWxsOiAgICAgICAgICAgICAgIGh0dHBzOi8vaW5mcmFyb290LmF0L3B1Yi9tdGQvbXRk
LXV0aWxzLTIuMS42LnRhci5iejINClRhcmJhbGwgZ3BnIHNpZ25hdHVyZTogaHR0cHM6Ly9p
bmZyYXJvb3QuYXQvcHViL210ZC9tdGQtdXRpbHMtMi4xLjYudGFyLmJ6Mi5hc2MNClNpZ25l
ZCBnaXQgdGFnOiAgICAgICAgaHR0cHM6Ly9naXQuaW5mcmFyb290LmF0L210ZC11dGlscy5n
aXQgdjIuMS42DQoNCg0KVGhpcyBpcyBhIHNtYWxsZXIsIHBhdGNoIGxldmVsIHJlbGVhc2Ug
bWFpbmx5IGNvbnNpc3Rpbmcgb2YgZml4ZXMNCnRoYXQgaGF2ZSBhY2N1bXVsYXRlZCBpbiBt
dGQtdXRpbHMuZ2l0IG1hc3RlciBzaW5jZSB0aGUgbGFzdCByZWxlYXNlLA0KYWxtb3N0IGEg
eWVhciBhZ28uDQoNCg0KQ2hhbmdlcyBmcm9tIDIuMS41IHRvIDIuMS42Og0KDQpGZWF0dXJl
czoNCiAgICAgICBmbGFzaF9zcGVlZDogTWVhc3VyZSByZWFkIHdoaWxlIHdyaXRlIGxhdGVu
Y3kNCiAgICAgICBTdXBwb3J0IG10ZDo8bnVtPiBzeW50YXggZm9yIHNldmVyYWwgdG9vbHMN
Cg0KRml4ZXM6DQogICAgICAgZmxhc2hjcDogY2hlY2sgZm9yIGxzZWVrIGVycm9ycw0KICAg
ICAgIGZsYXNoY3A6IGZpeCBidWZmZXIgb3ZlcmZsb3cNCiAgICAgICBmbGFzaGNwOiB2ZXJp
ZnkgZGF0YSBpbiAtLXBhcnRpdGlvbg0KICAgICAgIGZsYXNoY3A6IGFib3J0IG9uIC0tcGFy
dGl0aW9uIGFuZCAtLWVyYXNlLWFsbA0KICAgICAgIGZsYXNoY3A6IGNvcnJlY3QgY2FzdGlu
ZyBmb3IgcGVyY2VudCBkaXNwbGF5DQogICAgICAgbXRkcGFydDogZG9jdW1lbnQgcGFydGl0
aW9uIG9mIHNpemUgMA0KICAgICAgIG1rZnMudWJpZnM6IE5vbi10ZXJtaW5hdGVkIHN0cmlu
ZyByZWxhdGVkIGZhaWx1cmUgd2l0aCBvcHRpb24gc2VsaW51eA0KICAgICAgIG5hbmR0ZXN0
OiBoYW5kbGUgbmFuZCBkZXZpY2VzIGxhcmdlciB0aGFuIDRHDQogICAgICAgRml4IHByaW50
ZiBmb3JtYXQgc3BlY2lmaWVycyBmb3IgNjQgYml0IGludGVnZXIgdHlwZXMNCg0KQ2hhbmdl
czoNCiAgICAgICBmbGFzaGNwOiBtZXJnZSBkdXBsaWNhdGUgd3JpdGUgY29kZSBwYXRocw0K
ICAgICAgIGZsYXNoY3A6IG1lcmdlIGR1cGxpY2F0ZSBNRU1FUkFTRSBjb2RlIHBhdGhzDQog
ICAgICAgZmxhc2hjcDogc2ltcGxpZnkgbG9nZ2luZw0KDQoNClJhdyBzaG9ydCBsb2cgc2lu
Y2UgdGhlIDIuMS41IHJlbGVhc2U6DQoNCkJyYW5kb24gTWFpZXIgKDEwKToNCiAgICAgICBt
aXNjLXV0aWxzOiBmbGFzaGNwOiBhZGQgc2FmZV93cml0ZQ0KICAgICAgIG1pc2MtdXRpbHM6
IGZsYXNoY3A6IGNoZWNrIGZvciBsc2VlayBlcnJvcnMNCiAgICAgICBtaXNjLXV0aWxzOiBm
bGFzaGNwOiBhZGQgc2FmZV9tZW1lcmFzZQ0KICAgICAgIG1pc2MtdXRpbHM6IGZsYXNoY3A6
IHNpbXBsaWZ5IGxvZ2dpbmcNCiAgICAgICBtaXNjLXV0aWxzOiBmbGFzaGNwOiBmaXggYnVm
ZmVyIG92ZXJmbG93DQogICAgICAgbWlzYy11dGlsczogZmxhc2hjcDogdmVyaWZ5IGRhdGEg
aW4gLS1wYXJ0aXRpb24NCiAgICAgICBtaXNjLXV0aWxzOiBmbGFzaGNwOiBhYm9ydCBvbiAt
LXBhcnRpdGlvbiBhbmQgLS1lcmFzZS1hbGwNCiAgICAgICBtaXNjLXV0aWxzOiBtdGRwYXJ0
OiBkb2N1bWVudCBwYXJ0aXRpb24gb2Ygc2l6ZSAwDQogICAgICAgbGlibXRkOiBBZGQgZnVu
Y3Rpb24gdG8gZ2V0IE1URCBpbmZvIGJ5IGRldmljZSBuYW1lDQogICAgICAgbXRkLXV0aWxz
OiBBZGQgbmV3IHN5bnRheCB0byBnZXQgZGV2aWNlcyBieSBuYW1lDQoNCkNocmlzdGlhbiBX
ZW5kdCBoZS9oaW0gKDEpOg0KICAgICAgIG10ZC11dGlsczogbmFuZHRlc3Q6IGhhbmRsZSBs
YXJnZSBuYW5kIGRldmljZXMNCg0KRGF2aWQgT2JlcmhvbGxlbnplciAoNik6DQogICAgICAg
UmVtb3ZlIGxpYnRvb2wgdXNhZ2UgZnJvbSBjb25maWd1cmUuYWMNCiAgICAgICBVcGRhdGUg
YXhfcHRocmVhZA0KICAgICAgIFJlbW92ZSB1bnVzZWQgc3ltYm9scw0KICAgICAgIE1ha2Ug
c3VyZSB1YmktbWVkaWEgc3RydWN0dXJlcyBhcmUgdmlzaWJsZSBmb3IgbGlidWJpZ2VuDQog
ICAgICAgRml4IHByaW50ZiBmb3JtYXQgc3BlY2lmaWVycyBmb3IgNjQgYml0IGludGVnZXIg
dHlwZXMNCiAgICAgICBSZWxlYXNlIG10ZC11dGlscy0yLjEuNg0KDQpNaXF1ZWwgUmF5bmFs
ICgyKToNCiAgICAgICBtdGQtdXRpbHM6IGZsYXNoX3NwZWVkOiBSZXdvcmsgdGhlIHRpbWUg
Y291bnRpbmcgaGVscGVycw0KICAgICAgIG10ZC11dGlsczogZmxhc2hfc3BlZWQ6IE1lYXN1
cmUgcmVhZCB3aGlsZSB3cml0ZSBsYXRlbmN5DQoNClppanVuIEh1ICgxKToNCiAgICAgICBt
a2ZzLnViaWZzOiBGaXggbWtmcy51YmlmcyBmYWlsdXJlIHdpdGggb3B0aW9uIHNlbGludXgN
Cg0KY2Nob3V4ICgxKToNCiAgICAgICBtaXNjLXV0aWxzOiBmbGFzaGNwOiBjb3JyZWN0IGNh
c3RpbmcgZm9yIHBlcmNlbnQgZGlzcGxheQ0KDQoNClJlZ2FyZHMsDQoNCkRhdmlkDQo=
--------------NOAJ9cR1fR11DQ98ZSkqNoTu
Content-Type: application/pgp-keys; name="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d
/nSCZ+FGFX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N
8aL7YNF7VfjTRntBtKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6
/N7b/cFH9+fx8kwi4pNFuJwrBkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258j
nN65jBO7ElqU2CCuGRPg6uryAHV3RVCB9j9AE3HLacQReFtt5ylyydSQbaK4K9as
nd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEBAAHNN0RhdmlkIE9iZXJob2xs
ZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rhci5hdD7CwHcEEwEI
ACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXcPHQaAtFu
EAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQb
xkP1YWzoVwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU
/o3dT23NDeQ20jXgquJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+
hPK/Dmdsqgns+Z+SrQcOvRa3GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8
XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRWcn9GAQgAvugF8cFjv2Zs4BBb44SnxGaw
BySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr+TRnXIzcb5xI8SxitBDU5MLv
wsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGPak8JmjMMtOoOBh4m
eOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUah7wajcoj
YSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawAR
AQABwsBfBBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt
3ao3Abpu2fqYfwbIyPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEj
viKMpfI7ppTUBuGKrpgc5xsiUpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8r
BKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fmqoVHaw8PhLAtez+B7HS7Hv7iJPDtX85k
FYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR7In6ift5SNySojCOfAV0iKZb
8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDTqyUpot0oG03vtSG4
LIRCdxI=3D
=3DjujX
-----END PGP PUBLIC KEY BLOCK-----

--------------NOAJ9cR1fR11DQ98ZSkqNoTu--

--------------mohYc7hW4Fnhf4nfv320FfUV--

--------------w7qnuR56pJEBmSjicyoAqoOv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAmTu7+cFAwAAAAAACgkQvOXcPHQaAtGZ
lwf+OD7Fit38rjswkg8/rMulbHbEYppl3RP3BI7YtdXP/zMXW+CiARW5GZht2pvPfmPpk9KCJnEK
VPUNiQKWZ7lcrtp9hy5m2GfZvx2b3YeeOTit3u1w9nVnD9yvT8wu8g4dv+ZI6GKCv1GaOBoQQ1iJ
hJ8JNRcqtXC5anXyrMOqGMl/CW3Ht7uXZ0HlzOeKavLNo0EpBF5gbbx0s7s63FUmJfXg5+0bhEgT
Hv2vx7P1h1ikkyTu8w23uQI20IkZJkV74grVT/9X/Nw9LFtswKR4BRd2/zW3BJw3I99bB/IHNv2E
R3ShJ2oHMLBcu9Y1yuvlRv/YlAWrHdeoypBrCuT5mQ==
=cRI0
-----END PGP SIGNATURE-----

--------------w7qnuR56pJEBmSjicyoAqoOv--


--===============0221431910187496932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0221431910187496932==--

