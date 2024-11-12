Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867AFD41D6F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmgkIGLBdxqxIRtyE4kjux/BrYmqMTdrRODjFDSipeM=; b=q4dl+vqtmkmlqs
	/lD/8c33gH/7i6BQrJWJuORtc27RgE8krxmBD4PtI3G5417VrWAcxB5L1kvANfKtRlB1psaBjf5rD
	0kvPLsSdf263ctkpGqH61F2PC4Nk/y9SCR47zThW08/7DXVySX3s2IoLHDsGgPCFBAVbi+UJtJFvM
	1kuOurYtO2kz321gBTbgE7cwsOUV/hP1sS0gd+0W5eGel2eEUrxqNArQbE5wY+E+xDuy61g9QPlLb
	aWPEQ+M9xilt88ARCYXajrABkG4nBHdw9tP2PoRqzl5JKGFf+uzEmveyAS1JxadvmI5oOcyMGSMPJ
	wdpKwliP9G69HeKntxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmWL-00000002gca-1TcI;
	Tue, 12 Nov 2024 08:45:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmOA-00000002epd-18WH
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 08:36:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d4fd00574so2957728f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2024 00:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731400601; x=1732005401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkF//j2lyFiMSsO2mZwpCdvFZLUTEGIV2xOA7nXV6ZY=;
        b=vepapBhEpilV4/kX6etuqjF5ecKual7G+DUKM+8yNBn73HgUuLL9+WT4ZxNuLZo1P+
         HQo83T91zKVjkI+2zoGrM+zD9KckTGq8WenYQ0Rcou3hZ/o0fhMsXQp6UbH+nBDJG+kP
         YwzjDGKF6sek+sMTUnVcKuDPMNWOr0fUN/dfZqm9V8G+UAvpfSElCpgWL6lYTMNVDkhS
         j/ab1coXp9vqZqlYmDs9SEyj/uILoFmEDT34zo0lu6GCZb6YBaSMJ0NRZ+cotAJUaAtn
         D1r4zhdyIsc4eucBJLFulyY/b1w5HsSP+1W8EU9cP3T2NQ6NImLSFyuMj4eFrPlsQQR5
         LfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400601; x=1732005401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkF//j2lyFiMSsO2mZwpCdvFZLUTEGIV2xOA7nXV6ZY=;
        b=nHD9Yy87oI/r/V4JQ4cFudX0pjtj4rFyZyr5EO2xdWJb6ZmUIjNVUfGpo1MoNV+cWl
         J67V0ybKoJou0RdvLvZeyISGQKJ9LQhCKoMR5dvHF/TDZwVA7deOAQjUekQRqmJv+Yf6
         xqG0OzCiI+NPGbLvxgCo30yPOWI9kn+eqJYsx5tpLUnuANwAXhY+o+os3U3ZOcpa4NPK
         ilIHCijk/FCT4boA+GLFVhGFNcuDtkHnDWgEKQlP84rQqd3sFfqQv66GmJQQ5DqkPnQj
         od5++p+dI0zruLmwd7esFYPMcvqifc0V49e3iuOHYTQ79M1lSyktsrEyZj36GEf7fQNL
         gRlw==
X-Forwarded-Encrypted: i=1; AJvYcCVIOSjmwNB6XlTVYpNms7cOL8jC21q/68zFv2UAA25aH6kJ4nUoImDYOY/qBzGcqR598fZszSfi1pU=@lists.infradead.org
X-Gm-Message-State: AOJu0YywQRgcWrcAzmJtqgYDsKvYTuJ7vYv2CUnw2QRYh9jdMCXthCE7
	gHjvfX8END5yjuCWgUL+5XSChv2Q8MIw8yi+viHNU/5pXP+ccdmz42Iy7Vsat2A=
X-Google-Smtp-Source: AGHT+IGMqfX/H5pdDKyvAVJcF4DgjN4iAMagrtLPcRu2CX11loCBxf1pGfhSsH4z13A1w54+Oo3HoA==
X-Received: by 2002:a5d:6da8:0:b0:381:eba9:12c7 with SMTP id ffacd0b85a97d-381f0f871fcmr15140698f8f.27.1731400600525;
        Tue, 12 Nov 2024 00:36:40 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6c11f8sm234562515e9.25.2024.11.12.00.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:36:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <linchengming884@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 0/1] mtd: spi-nor: core: replace dummy buswidth from addr to data
Date: Tue, 12 Nov 2024 10:36:37 +0200
Message-Id: <173140050742.5304.12768268448288985195.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112075242.174010-1-linchengming884@gmail.com>
References: <20241112075242.174010-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=zSXFW/oyFW9vE6iFtUr8ls9uKO/cy2uyRakjkwXxb04=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMxOTQiqpBhQmKEPwUCUncct3k614561DJda1y gnFg4Uxfa+JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzMTkwAKCRBLVU9HpY0U 6ea4B/wMqM79quNktN1UOacNKNdprDvPzW04PD7vlFaNYE7vClvp5DgDCVCAfrspaKY7PwqPSrC 5BlxnEg7Es/YqReZkX4CNalOorLLz3IerP4NtYnPXeuNtllXE9Qvg2P7w3/J4RZqb4Zw8b0Xe/4 vASoQqhlAdasKHJN+o2e8CNIlce6V5ACNOJWduT7YLRXNkxU79dEKJ07Jm0aM/Vu1eykvHJRLmV /oRpKLtzlw9ErV+5dqWuSIxO56XtkFDnjYTNgF4d2CWCnSud40XJmrpCWEx90Zu8gPvKe5qDLtc fDdWzVUimbLKwVGnVnBk3rEcAbohz/41Q9OtIrssgQBGy02R
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003642_342788_358F5C8E 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 12 Nov 2024 15:52:41 +0800, Cheng Ming Lin wrote:
> Set the dummy buswidth to match the data buswidth.
> 
> v2:
> * Add fixes tag and cc to stable.
> 
> Cheng Ming Lin (1):
>   mtd: spi-nor: core: replace dummy buswidth from addr to data
> 
> [...]

You had some warnings which I fixed while applying:
WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")'
#19: 
Fixes: 0e30f47232ab5 ("mtd: spi-nor: add support for DTR protocol")

WARNING: Non-standard signature: 'Reviewd-by:' - perhaps 'Reviewed-by:'?
#21: 
Reviewd-by: Pratyush Yadav <pratyush@kernel.org>

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: core: replace dummy buswidth from addr to data
      https://git.kernel.org/mtd/c/98d1fb94ce75

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
