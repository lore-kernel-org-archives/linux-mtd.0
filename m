Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4D2C3ABDA
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 01:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	Subject:Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRcZtepIfa0B1mHO/mW1+eYhdtWojYOcyekv7e6ThvM=; b=nVcfVNxgcNzLM9q24XqbvyAbYU
	6mySUTv2eRBF1Yle9KYjSHSGqce4SCgoftNGxTgSslT+Cluq96fYe1IBH0RB2XcqT1FaOGTbpET5u
	3q5Z0Ch5SlWPT2p6Dox/WogOurVWbAPrV75DbZuGtuVJxBz7WOznmrPzTDmyM0jnoW4BlLOHaw+Ro
	zDuUKzm7dfhC3RL2ot6qnWpEn8B+PA+rEWByObTkY0BYcaSoSTXCU/vdf3DEdQX4B4mPBQRFm+yhK
	rMBB3s6D/dufxHdAbgPtNowIA6S4qXUMdkKObRjrVxJJ/FA+N1oLXJIHFb1Dc60zO3RTKipF+7Q8U
	yYcWDcCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFNdB-0000000GmwC-3RSV;
	Thu, 15 May 2025 01:43:29 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFNd8-0000000GmvE-3vSg
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 01:43:28 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-87be16f1b9eso2908241.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 May 2025 18:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747273406; x=1747878206; darn=lists.infradead.org;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCm4O5p80Bct/vk0b9SOM6AFke/AP+NBDzf0zgNqowY=;
        b=auDakD8fSheyZwMcGMXXQKEMq6yXIt0xBUvOQJh/9butuSNrB+WvFK5XWafpXGhsiW
         LZzW+1f1nnjnJKGW8xOpR8l5kZ7iBB6itI9tmmT4u7np0M1o5kdcaANN4xUJ+eDgL0jn
         CSTtUjAJxX8MSCd4J1FnoToO4aAAQHJObyo88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747273406; x=1747878206;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCm4O5p80Bct/vk0b9SOM6AFke/AP+NBDzf0zgNqowY=;
        b=XQleVZlklv+LzH05uFF+vPkUV8psq9MyCywxIZYaYk7f9ZXT05yPA7OU/oJHI51KbY
         4c4IcvwinGxeHQRyrYYzVzcb5lcHc8/amPXL0IoEGoUa+XpFPNlY0E1PkIe3x2gYpCE6
         SZxWO7ZQvDCkqYjRBOFBgBZ0Du+mzclQoqLJW15jzJ1Xm91gbcv152OQ2aMJzTPSyw8y
         zX7QBgbEXZq75d+J8kQUaTwdags9oUUuyAZFs7uvTY3tTWfE6XjYov3fQ7VjALn/yXni
         pRrMFYT4IBdfOgy+utwHvor181zc7kK6Eg9XweyjR9QUh8G91x5vdjRdrS4tOuZLuR40
         bugg==
X-Forwarded-Encrypted: i=1; AJvYcCXhR/fwiAnmYbFlHxxAJ/ZwXGaAQ8stHG8pDOb5R3Kz4LbunPOXvAhq+evk+PDaifSTVyuyTDB+ltQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YysTQ/shH1zCcxqiZ8y60kqbOCee/Gqol8ZiRPG9wix6E7TK2rx
	i1IquK83G6AT8W7PBhoaTyoVQo/UUzPf6CdSSWb530L9A7zRe43aK1g4PRBXfcRCCiGudKemNDf
	TBFxSgFmv1KaeDD63RKXUD40FTbo0fy4Dce2P
X-Gm-Gg: ASbGncs59Rb8z22kAhNHI/mY3dlWGvUL6XZ8aRXLTnGZBlH7wvA4FhlvWvUMZGGGZRL
	Jk+IootkoiwJZUWsk1InBUZSQZrTlvdwtZr1KLJ4Hzn9kV7F0EVwdiQg/ZXrJp02tuDGrT/Rbd4
	itxOveKHC7rjWhzSAgevWRtTq4Bih16ij+i29YvikHv0O8
X-Google-Smtp-Source: AGHT+IGzCb7rGrVAvnUO3VzK6QMFGPAruJiBQPAGg8I+RNAAeyZ9DMna5WPJcxLRiYZ1u2Hpjca4WXDje1ifrGV+Rq8=
X-Received: by 2002:a05:6102:3e0c:b0:4df:84d5:543e with SMTP id
 ada2fe7eead31-4df9541ae27mr564446137.7.1747273405750; Wed, 14 May 2025
 18:43:25 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250514061454.772340-1-noltari@gmail.com>
In-Reply-To: <20250514061454.772340-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJo9WPXIWpdZdfQwHBIXdGSWtFI9LK4ipkQ
Date: Wed, 14 May 2025 18:43:24 -0700
X-Gm-Features: AX0GCFssGc7GWQqWAtRjeTKy_bAXfWhR19KpFEGbhWzPMKjHuHiM951JmRwIJrQ
Message-ID: <3f72afed2f7843b2d6c8f0346ee0a8ae@mail.gmail.com>
Subject: RE: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	dregan@broadcom.com, Florian Fainelli <florian.fainelli@broadcom.com>, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com, dgcbueu@gmail.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_184327_009011_176BC82A 
X-CRM114-Status: GOOD (  16.73  )
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
Content-Type: multipart/mixed; boundary="===============7550720958713971264=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7550720958713971264==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b1c9f4063522ca3d"

--000000000000b1c9f4063522ca3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alvaro,

> -----Original Message-----
> From: bcm-kernel-feedback-list.pdl@broadcom.com <bcm-kernel-feedback-
> list.pdl@broadcom.com> On Behalf Of =C3=81lvaro Fern=C3=A1ndez Rojas
> Sent: Tuesday, May 13, 2025 11:15 PM
> To: dregan@broadcom.com; florian.fainelli@broadcom.com;
> computersforpeace@gmail.com; kamal.dasu@broadcom.com; bcm-kernel-
> feedback-list@broadcom.com; miquel.raynal@bootlin.com; richard@nod.at;
> vigneshr@ti.com; jonas.gorski@gmail.com; dgcbueu@gmail.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Subject: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
>
> last_cmd and last_byte are now unused brcmnand_host members.
> last_addr is only written and never read so we can remove it too.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>
>  v2: fix unused host variable warnings.
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 17f6d9723df9..299dd2bca5b4 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -310,9 +310,6 @@ struct brcmnand_host {
>  	struct platform_device	*pdev;
>  	int			cs;
>
> -	unsigned int		last_cmd;
> -	unsigned int		last_byte;
> -	u64			last_addr;
>  	struct brcmnand_cfg	hwcfg;
>  	struct brcmnand_controller *ctrl;
>  };
> @@ -2233,14 +2230,11 @@ static int brcmnand_read_page(struct nand_chip
> *chip, uint8_t *buf,
>  			      int oob_required, int page)
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> -	struct brcmnand_host *host =3D nand_get_controller_data(chip);
>  	u8 *oob =3D oob_required ? (u8 *)chip->oob_poi : NULL;
>  	u64 addr =3D (u64)page << chip->page_shift;
>
> -	host->last_addr =3D addr;
> -
> -	return brcmnand_read(mtd, chip, host->last_addr,
> -			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
> +	return brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
> +			     (u32 *)buf, oob);
>  }
>
>  static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
> @@ -2252,11 +2246,9 @@ static int brcmnand_read_page_raw(struct
> nand_chip *chip, uint8_t *buf,
>  	int ret;
>  	u64 addr =3D (u64)page << chip->page_shift;
>
> -	host->last_addr =3D addr;
> -
>  	brcmnand_set_ecc_enabled(host, 0);
> -	ret =3D brcmnand_read(mtd, chip, host->last_addr,
> -			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
> +	ret =3D brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
> +			    (u32 *)buf, oob);
>  	brcmnand_set_ecc_enabled(host, 1);
>  	return ret;
>  }
> @@ -2363,13 +2355,10 @@ static int brcmnand_write_page(struct nand_chip
> *chip, const uint8_t *buf,
>  			       int oob_required, int page)
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> -	struct brcmnand_host *host =3D nand_get_controller_data(chip);
>  	void *oob =3D oob_required ? chip->oob_poi : NULL;
>  	u64 addr =3D (u64)page << chip->page_shift;
>
> -	host->last_addr =3D addr;
> -
> -	return brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf,
> oob);
> +	return brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
>  }
>
>  static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t
> *buf,
> @@ -2381,9 +2370,8 @@ static int brcmnand_write_page_raw(struct
> nand_chip *chip, const uint8_t *buf,
>  	u64 addr =3D (u64)page << chip->page_shift;
>  	int ret =3D 0;
>
> -	host->last_addr =3D addr;
>  	brcmnand_set_ecc_enabled(host, 0);
> -	ret =3D brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oo=
b);
> +	ret =3D brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
>  	brcmnand_set_ecc_enabled(host, 1);
>
>  	return ret;
> --
> 2.39.5

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000b1c9f4063522ca3d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIPXHd/7L/vGXZ0aynk4qHK6LT4Ri
76aPhm1d47JuVtviMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDUxNTAxNDMyNlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAIUp+1HM/uNGxdZ1uKruHEZDDjOnuHvSqnUAOkjYDfKy/NRU58zcwGv7919tp9g4
A5fadEywri/cDoDaRT1R0xLO5JBg9RdOmOlCg4HOhPrrb9c8ivM1FjCKrj3VKrz9NDr3ZjRp5YBB
OKM4+83ReefjhSdHVFrH8Vsy7Utfd9V+cifbZD3oVu0nqh2cYmyUZ3QmFPQW7vW7gp/pqAFWSDHR
W04TRtAiQ83/9g1Y2S71NpU3Gb5i+R3wpsX+tMC/wENh9PM9PUElqQyhhFt9KfSXsHmTi5X7OSsH
70J9y6MiKl3jGKs00UU0cGF6J3eZUx4CwH5NTO70AMLT4ZWOCfM=
--000000000000b1c9f4063522ca3d--


--===============7550720958713971264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7550720958713971264==--

