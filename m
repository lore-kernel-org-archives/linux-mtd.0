Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA34C5B543
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 05:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75iLLePcyeTCjbIl4PAWQ83iqDhIQWYLB3aTdLBtnhQ=; b=OVivsiQbt05j93zjB+8DYTmaHk
	Pu79mnq7YKglm3QbNkNrU23LzxZkqs6b76QVeQXcLqnrM3+bZIoHJFsgW8HuMiex7I/uCcqQTYjZ0
	wR1TYiE/iyhB3TjNpttsYYL6QW9z/+XwxNVoB8QaVjD4sVXv20XJrz4Ikdh46Q2kqUY/29QxjUPeu
	IpTUWp/PPLSnuz0fylnetg5CIW3BrV53AxYCZ/nlkAxdPblqoCYYPxulmcGe9iamsWxzXTa5GZXmf
	UMYkdtd0TnaxKnyMkW9ewRNCjQVZk1q54PhbhAbnVS3jaa+FBox1VcfG/GN8UBAZqUvXji1PUMkoK
	47Z1cCYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrOS-00000005pT7-392F;
	Tue, 10 Jun 2025 05:19:28 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrOQ-00000005pSl-2CQi
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 05:19:27 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b2f0faeb994so4892569a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749532765; x=1750137565; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0NxeqBzTrHIiibg6SzYXXg8dwKYkUHKIPb5urhPa7s=;
        b=L8JzPs4OAbztJcHJCJ2R8p2qgi1dwtwib5qAW9pz/FXUfNlhksUfVH1d/Ce7VRKqhb
         YLdgNnmtCmdFWs2X8UJLCb4Yrg6PZI6gTjMNDqfJ0rwfhDNv2nOkqOHExhC0jAOuup0a
         VJFEixm1lx6qvhJ8Q2353G6KoTv7omdhBceiTXQpCDHPwH+TmULHgo+Av8OecSA52Azq
         JVzG0FoIhzey9dOB9d3r0XH/vIhSlAtIzu/BSVe6Hf9Ri21aLSjlt9KX56ezh8sXW5ps
         OKgnC8mbVnEL+pThO9+mHFzs1vmu9eXnjKk+kzITm71jbZ1Bfm2Isb9+DcBNTgW+UFKf
         i8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749532765; x=1750137565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0NxeqBzTrHIiibg6SzYXXg8dwKYkUHKIPb5urhPa7s=;
        b=rCHOIkCxyuLNbQUy8NwMwIV6lcm4mWh6jAabMTBgDOYLPeKWnW+uhBfDh0eAW4zT0+
         WNyv8ss4nnRhKiRdhOaofRCoLcx3tTfeQK78DPNrwFmO0GTv1Uqy9Ghi/9Mk8KSLeJHV
         UafZ8mvvPDawVXYxvix8si8b9Gd8L7zl3tUV8uOXVDC3X8J0Q8taX862OErGI63DlD3j
         JH9jGGfhLEWzalVyLLT85kJfaXQcUr3tTjWYfrvhE5oAYSOQAZ2ldhPRXV+OKC/Kaxmw
         E0Ny3avJxlL16tB/i3ZNmUCfHmZDNIl9o/ntsFON6ErGSfcHGK3nOH7MG4zrB/7mHDRP
         VMkg==
X-Forwarded-Encrypted: i=1; AJvYcCVRSzOn2S1nbAXuI/TeOv9uTSWm7CjeQyutrwqAS4bDzfMnw6aN3r8keBVNyrX6ZruRZOI1hGyBCiY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj0jCZYSjw5YaEqKrMcsatnind7Qu+amOGu74mCSIurZMc95TV
	YPrzL12pEbSlimCbnjKW1ET9sapt3UiIReSfvaRx1xXSVETwIIlS/NNA9cdf2Q==
X-Gm-Gg: ASbGncsDwJiULaaeNXJjCj8biQVRshI0bLcak8Lkkz8ZSStQ2UFXcLHzwLAW8TXD2lx
	F5EcPU/VnfcT6P5pWT8aVy5eopJBQm0QwxRzJ0+lPlXDbdTzt5oPnELTUf49UMp+sZWpttoJp47
	yjBci9aWZhCGkMgUxBRwkw1b9Y3KdofJ9Yd6bnLGfdpSLs6pF6tI0q7E9V0ar80TzlwYzoM6w2C
	O+SGdnzgBORN317YZb2ZqJpO8cWf0rV1SArcI9LlvOYOaEDt/OfRYNklDxHPuor6yXJT529T+32
	d8uW3vGird/Hx8+XsqTFHrJjA1Lm50pP22vUtPw7nQHVJg9gCjdFJk8YMYbxrg==
X-Google-Smtp-Source: AGHT+IGcxTZADBmswIUy9YiqY0nHgn9vquMQSo6k5gR+VwzTv7U9aLsJKEqlkJLpFzw1nNxqG616xQ==
X-Received: by 2002:a05:6a21:3399:b0:1f5:64fd:68ea with SMTP id adf61e73a8af0-21ee2587a80mr23620658637.4.1749532765138;
        Mon, 09 Jun 2025 22:19:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7825c8sm6099340a12.52.2025.06.09.22.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 22:19:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8D3954209E8C; Tue, 10 Jun 2025 12:19:22 +0700 (WIB)
Date: Tue, 10 Jun 2025 12:19:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: TheComputerGuy <rosscomputerguy@proton.me>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: PROBLEM: VMU driver fails to compile in 6.12.32
Message-ID: <aEfAWt96eyeWIK6X@archie.me>
References: <zuZBGnW2fdIaA_VWDHq0rHzzxfyAt-imVmN8LoVry5hU1U_Yr41geYn7f2Edk8jB6cAUDsUknMjbnXUFPdcykyG_QVezsIriBeN5NO5drlo=@proton.me>
MIME-Version: 1.0
In-Reply-To: <zuZBGnW2fdIaA_VWDHq0rHzzxfyAt-imVmN8LoVry5hU1U_Yr41geYn7f2Edk8jB6cAUDsUknMjbnXUFPdcykyG_QVezsIriBeN5NO5drlo=@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_221926_564293_B233D7F0 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Type: multipart/mixed; boundary="===============1821815726694247958=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1821815726694247958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBitZsuAkr6o0kKn"
Content-Disposition: inline


--gBitZsuAkr6o0kKn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 03:38:39AM +0000, TheComputerGuy wrote:
> When compiling kernel 6.12.32 with GCC 14 and utilizing the "dreamcast_de=
fconfig", I noticed the "drivers/mtd/maps/vmu-flash.c" file fails to compil=
e. The error is:

Can you post the full config? Or can you reproduce with minimum config that
triggers it?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--gBitZsuAkr6o0kKn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEfAVQAKCRD2uYlJVVFO
o7t8AP0e2NhaBn0pW9pzs12U4QO8QhmKozeXHC3CiXwWKhfuZgD+PL9xv19PaHMO
QuLL46OBojPTw4sw4vNnsoMKqHAl7wY=
=9Ofd
-----END PGP SIGNATURE-----

--gBitZsuAkr6o0kKn--


--===============1821815726694247958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1821815726694247958==--

