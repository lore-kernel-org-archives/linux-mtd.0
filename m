Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B73C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 14:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2557E20857
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 14:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qyAUzxH9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=guifi.net header.i=@guifi.net header.b="W3Qdd+H7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2557E20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=guifi.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W6Ee/VEN6xqxx7gQePyl9orRraY7pjY1QI3IoJ3Lz38=; b=qyAUzxH9T7FUiMJwyIRgPUJzw
	f4+h8/OcDUqsj7+eG286CG5LNCz4RB/3UdGEM6moA7muJpdbrQu3/hWAv/SD0rsI9oYEaoHJmsdmp
	Y6d4naSVk27ffDyfG3MtOoUpq9C6yifN5aap3N3rgchdbgeYA3HO4cB8wz2h9iAmzrsE+XaocFuyV
	yQOt//l0u4Udw+hroUnUA6OcLwFhKQcvpm7JqRsv25yseBH453NCqn+gFxP8eSuzw0b665QGbBYDs
	vQ5vB+AAOZicbssGtQ30P2lckg0t0v8j+OWiyuo35s2bHHbEaamxPXUKqRNTRlkE9eedsiS8n0BvO
	XSgwlWkng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gor0Q-0003Mv-QA; Wed, 30 Jan 2019 14:38:22 +0000
Received: from smtp1.guifi.net ([2a00:1508:1000::6d45:935]
 helo=smtp1.elserrat.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goqys-0001eC-CO
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 14:37:31 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.elserrat.org (Postfix) with ESMTP id 43qQsq0c1dz3w6p;
 Wed, 30 Jan 2019 15:36:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=guifi.net; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=dkim; t=1548858990; x=1550673391;
 bh=VAbqUjgQibND4nQsd98Y4ArudfPAortv2iLZgnt/kK0=; b=W3Qdd+H76di8
 B65JIwgNlBXts/9jl87vHfBSKrJGKxM9b5TxUU+yvvdcLXqq+X/lChnZze00N6FT
 ewUJSUQtf4zrCWZjaXti1GNuepFbFz7FioPdSPeXmYGsygLe+9oH7PiKENr877sf
 ++3Oi8A5sa3kI9LUp0I8T3CxnykvdVnsGMWBwNj5PztjaH5etNt04C7YmJD4wS0/
 gYlQ6lnz4MlqffO5ls1mtxrdo38wI7q/JfLPMqd5+eVeLMl9XNS5OMldCZjUaVs1
 EHbfiU68l1qgyyMVn7u+ktlJUEgR/ZqrFaEm7VlNco7UAx3ZTkgH5tUlP1z9rZOx
 myBwONy0gA==
X-Amavis-Modified: Mail body modified (using disclaimer) - smtp1.elserrat.org
X-Virus-Scanned: Scrollout F1 at elserrat.org
Received: from smtp1.elserrat.org ([127.0.0.1])
 by localhost (smtp1.elserrat.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id JhTf7b_vC6tm; Wed, 30 Jan 2019 15:36:30 +0100 (CET)
Received: from mail.guifi.net (mail.guifi.net [109.69.9.9])
 by smtp1.elserrat.org (Postfix) with ESMTP id 43qQsm0810z3vw7;
 Wed, 30 Jan 2019 15:36:28 +0100 (CET)
Received: from [147.83.42.157] (dync-42-157.ac.upc.edu [147.83.42.157])
 by mail.guifi.net (Postfix) with ESMTPSA id CF3B26A7293;
 Wed, 30 Jan 2019 15:36:27 +0100 (CET)
Subject: Re: [PATCH] mtd: spi-nor: Add support for en25qh64
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
References: <20181227150348.12093-1-roger.pueyo@guifi.net>
 <2ecd524a-9ba7-aef0-0846-5db9ed2cef01@microchip.com>
From: "Roger Pueyo Centelles | Guifi.net" <roger.pueyo@guifi.net>
Openpgp: preference=signencrypt
Autocrypt: addr=roger.pueyo@guifi.net; prefer-encrypt=mutual; keydata=
 mQINBFZobbgBEADHmOhM2Qct8UPGKcdzXKlWxLcaDsgv/trVw08xpS+VbXtzLuHQ8JpD+t7Y
 OHRaersrfp0isxbtiZnMhInUACsvAomHHCWxKB9RKLQAQ0j/NxrGu10XGRhBPvu0lkD+3VXh
 WFpVa8+6h9WjH4c/NGp5fyPHIVzYRhYMQlQ36iB84KOzOc3Ul6llxrnCac3ZUI0TnXk6/1Xl
 magtx4mjTM23EBEof/FlksEqR0dFHeOseBinLN6E20DgVF9+zddRBSnLI01Ag7rqAtt+//F3
 Kp0yXVisoxa2ATAbd3pMLht8vhYwWdrY/VpKBiMIi8LcMKRWK31bAJF7esi9xBlrKXJ91FcJ
 vgC+zTXnZ9KNcTESG3HSTo0T6OYc58CAYKyxuz6IehKKknd6xVOFRWpA3DsW9b4TOxJO5Vyn
 f9efdnrLrqVu/Lo84UskxmVySbMDcPQVgvUvLPhgmXEo2/BhJxGG3TmeuQu7wCBFOK7sDqSC
 K1QaQjbCkb2zXUNdmMw4Ee+nNcU8gJVgDHjiAqy/Bazo2RCcbkYWlgDbcDi1l0JP7aVGB/Hy
 1KYZejhl+STL1Rs4wHE0zNUHXr+2XYTZ96QlC85TkkRYaAFndcuGAU+RxbyThMhGyRQcAofS
 l0wvXiE3KH3qs/URtqjmGeX3Y+kDdKzww38Xw3mxeZyFyso+ZQARAQABtDlSb2dlciBQdWV5
 byBDZW50ZWxsZXMgfCBHdWlmaS5uZXQgPHJvZ2VyLnB1ZXlvQGd1aWZpLm5ldD6JAj8EEwEI
 ACkFAlZobbgCGyMFCQlmAYAHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRBa9Io341dm
 sWbBEACK8yQWbZJxRDXvc1QnScZp2ExpbXNR7YPJvAQsnXirPuThQNiGkMKyK27uIYe+NVEG
 SnzsHSiJrur/4UMUthE70d2Cvjfui3SkqdZ4qqU2J/VcKoYySG1SIPRI93ElbEcYW9dIzcmq
 tmVo0uFDcCbujPpDelX5BBgIVyO2QqjlnoZqk7UPLovCjCNogKRsjW+L1OGvFiUoAYFXVjk6
 CiW3rlRPvCslS7+ayVlgGnz432jbEzVZVERb1wbVlb+LBTT5LRME9c9WHBfu9/rJiw9P6jyQ
 Ddpyd5uTWKj9G5nv9l0Eo+ZOw7+DZVhOdyiw3KVeoMtGrCRRKAkA8+jAWDk0SP49oWY23caD
 4vgn3+NYy332BH9iZZf7Fx/P274dNGxjW05duplfiYSwND2Ct1by45Qk8PHShQoJYBJJMGqr
 Ql33LWw5fnxvJhw6LlHoJ44s7jo5LJOblq9VahXAEO+DsEXAV4fKO54B1lXVKeuGYBMfW/ey
 gXhGC2DyTTuUztYX2NuOjjXtDTcLvb6unjRXafP0fzT37UxF4ig7616aLPoSdqWQZegamUKg
 WyANWZ7NhHHiOnfKOUGh6ahTfWJZIxYJqJMENSYiMrCImMR9aAhueoW+H7yMzeGXDv72otb4
 0VsVdrEoCsAHsAwaRtMRactQeAayMu7UcPcrG1FCdrkCDQRWaG24ARAAnV9RXE+6himweoHM
 U+BxfxkVFK57XxxIhxB3elRC87uluzJ7Ek30kLO2qzZMhC04IPbtOusWFy2Jm5EO/MXqceTY
 zJ7eFdkFE5dTPVtYm1JzIpEbNCXAqd08DwpTJqheSNoNdophqZx5bhZBUTwSL+cAx+hx1W/W
 1Mc2I/kZM+BVui03D2/nPR7Mfb1YBAEr4m4igD0ijwoXsZf4GpMJsW+526kqyIgOZwCvWmmD
 y31+oxS3IhHdOyLuOVgIvfCND+nhbVBpCWvKGt3zin086S+wtFT7ps+w96yWNCJz4RRJ5zv6
 OVIsouUgbA6J+BDNvcF8ueoYWhwo2EYpugQr357BFw4YAmeXQb2Y7PktZ3L9RJjvyAqmLyM9
 +IcohZ4LONlre0wq6LBLN+xk9ToKaO9zY3tNJQjm4emv3aphyQJ6OK5DAosFCpqRDEBnsEM7
 YouiyX8me6h1jbuN45iLvg3ILexPQyqHvQswPrLD7yHR61F5nW+J6CySfGzIYZbyInxp8r1b
 UBM3hfNln0bQFy7rjxDwcLpFsKQa3P74NqElxX5GrddWIq11g1sEPYW4FH3bGpYgd8TtVc1j
 LmZAQwKdpjjMoMYlV+kYVgNfFM2Bv9cqfoC42AVAu2uR8WwOtPPVvz6CBGWja1p5VsRfv1Qj
 POD7KD+OZjoeiNuzVQcAEQEAAYkCJQQYAQgADwUCVmhtuAIbDAUJCWYBgAAKCRBa9Io341dm
 scaCEAC+DidS6YCp8QKdqRUj3LUOQdQZl3ZxaElkg3u3RyIlyEkaCQyD4MuKHC+KSRdTFCx/
 hx6bWc13t7Uzl1PlmSdUJURpeZs6uohJP149ThrjNalkp/kylpHeIBIOnaThQNSOdiCQob0S
 0sZZW8yo9oXKxyNxhekhZreTKDeopVjpJDgwJ7JpV0CmavGW4Il4jfgswKQRn4QIvx4IY5z2
 eUBJ3QH8XE8Wmo1ahKybPzfIJytNv4GQE4IWkBm1UIw6pCGFv/Z4M1h4g0BQ+BwwcDKo78VH
 rawb8kLsFuBGyMMDs4bMUu5xapx5nyttq9Bq6xqe0bKaMjBctrfHcrw2EcJUq3kgJxxFf6xn
 4V3sKkx3IThZTmU/6DYumXAVaDi1eHfeEEjLGWymSeosQM2nrH/Ty4TpVVYxjI3PguMn/GeS
 3xlQcjclmVU4Agd1Gc04zYxC6rusW/mZ1u2AD14xVsHkkiBfTloH0oAP24kvpNsfWRawW6+/
 zkN9wXUrcQ3QCOVxyoWAe8cRLL/+cHUHpAytAU5FqHrS7s+94X9SiP5uWlnf+fmrzCboyqnl
 NU21+/v/2gaCdL37PogscBhyxpgRA3Od4WHB4IAMKWwAVRWJrHYrCb8Sycl03+lCATn8wpx6
 j8fJMgXCwO9ai/gMvX9Gz/qfy8CTIn8H2bXwzyNJeQ==
Message-ID: <3fae6459-66d2-363d-adc5-d3f3758dd82d@guifi.net>
Date: Wed, 30 Jan 2019 15:36:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2ecd524a-9ba7-aef0-0846-5db9ed2cef01@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_063647_649100_13ECE78F 
X-CRM114-Status: GOOD (  17.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com
Content-Type: multipart/mixed; boundary="===============3864689766801082245=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3864689766801082245==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="0etxnmVWiymWfwxMYD5GdoRdRNklmr5hb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0etxnmVWiymWfwxMYD5GdoRdRNklmr5hb
Content-Type: multipart/mixed; boundary="5Ln8Eg63c8BEHypdskSxlH0NUwmYshR4r";
 protected-headers="v1"
From: "Roger Pueyo Centelles | Guifi.net" <roger.pueyo@guifi.net>
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: marek.vasut@gmail.com
Message-ID: <3fae6459-66d2-363d-adc5-d3f3758dd82d@guifi.net>
Subject: Re: [PATCH] mtd: spi-nor: Add support for en25qh64
References: <20181227150348.12093-1-roger.pueyo@guifi.net>
 <2ecd524a-9ba7-aef0-0846-5db9ed2cef01@microchip.com>
In-Reply-To: <2ecd524a-9ba7-aef0-0846-5db9ed2cef01@microchip.com>

--5Ln8Eg63c8BEHypdskSxlH0NUwmYshR4r
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Tudor,

El 10/1/19 a les 18:21, Tudor.Ambarus@microchip.com ha escrit:
> Hi, Roger,
>
> On 12/27/2018 05:03 PM, Roger Pueyo Centelles wrote:
>> The Eon EN25QH64 is a 64 Mbit SPI NOR flash memory chip found
>> on recent wireless routers. Its 32, 128 and 256 Mbit siblings
>> are alredy supported.
> s/alredy/already
>
>> Tested on a COMFAST CF-E120A v3 board.
>>
>> Signed-off-by: Roger Pueyo Centelles <roger.pueyo@guifi.net>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-n=
or.c
>> index 6e13bbd1aaa5..4bb6f4d203dc 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1741,6 +1741,7 @@ static const struct flash_info spi_nor_ids[] =3D=
 {
>>  	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
>>  	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
>> +	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128, 0) },
> The flash supports 4KiB erase type, so you'll have to set SECT_4K. One =
can use
> larger sectors, when available, by disabling CONFIG_MTD_SPI_NOR_USE_4K_=
SECTORS.

You're right, I'm setting it.

>
> Also, the flash supports SPINOR_OP_READ_1_1_2, so it's better to set
> SPI_NOR_DUAL_READ in order to trigger the bfpt parsing. Note that at bf=
pt
> parsing, SPINOR_OP_PP_1_4_4 will be enabled and the reads should be don=
e with
> the ebh command. Please test if these assumptions are valid, and if cor=
rect,
> submit a new patch.

Do you mean that I just have to add SPI_NOR_DUAL_READ, and not
SPI_NOR_QUAD_READ also? The chip's datasheet [1] says it supports both
DUAL and QUAD modes; I tried setting both flags, and it works fine.

Cheers,

Roger

[1] http://www.bdtic.com/datasheet/EON/EN25QH64.pdf

>
> Cheers,
> ta


--5Ln8Eg63c8BEHypdskSxlH0NUwmYshR4r--

--0etxnmVWiymWfwxMYD5GdoRdRNklmr5hb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEwCTDpYvv87wDBo8fWvSKN+NXZrEFAlxRtmsACgkQWvSKN+NX
ZrFJCw//RLLLFEYyPbCYJZdVY6DSfK7Sx0fXe57DuDSM1qQsf3wPaGNA9VintuFw
X2q41djslj2tAViZ8nSM7+ShOsgHn9TQ3sNGlRpf2LTJ1IJgER5v7V7BHC+fYA5l
jyc1AK6D4NMIJLRAhfabK62C5RmR1XHrAnoiQ4SaoSlHrs4M0sPc+o5RLXF+38Hy
2wKKAKR3euRA77LZIVT+K3TNu7oCszbq9HDRiTUVdXWpBIvjeNu2uim95OnjMkTs
dcNfVuqJ+el0/TuXJyt38QJ69/5XWH6zdOoglNLhD5Lo1sl4k8+KbRp8/Ur3UXGa
qkvKaRGcmGayZww0jw+czYI/hFDGBUhSgIeV+AMMLdWMVA5YptdSdvx1l+hRUozX
thDyeWmrGE+nosmnem98Wid1UF0yO3hZXyixcYtgm72WBQ99njNcmxAG9j4twPPd
+5g84Aaw24V6Mxy7jwj5TXGUFNbPpqSW+5hntxzq9OKK2cIKrjkvIjftLHrb+mO/
BDWwOqnHpEURiB/QRzeFoaH87QwuGsHqM7zADr+889Rg/K37eOt0WE8kv6Ke0QuG
vLyAVXA2LMdMBZGHao4jXSOwCJNnNAmQuyq1zDH9Zq/cm9I7ELgOvB7zNDNUxN65
Kd0WSVJ3f1iErBKUDLS9hORHfMULzSYbyEQ4kYxS4Ro1SpoBA2Y=
=/wWH
-----END PGP SIGNATURE-----

--0etxnmVWiymWfwxMYD5GdoRdRNklmr5hb--


--===============3864689766801082245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3864689766801082245==--

